clear;
close;
clc;

%Navier-Stokes Parameters
nu = 0.1;
rho = 1.0;
filepath = 'Mesh/Lid_Driven_Cavity'; %Past_Backward_Facing_Step Lid_Driven_Cavity Incompressible_Flow_Past_Sphere

%% PRE-PROCESS
% This steps include importing, defeaturing, and cleaning up geometry, 
% creating the finite element mesh, and defining loads and boundary 
% conditions as well as solution parameters. 

%Convergence and Storage Parameters
mem = 400;
tol = 0.001;
maxiter = 100;

%Load and Plots the Mesh 
COORD = load([filepath, '/Nodes']);
QUADS = load([filepath, '/Elems']);
BCOND = load([filepath, '/BCond']);
PCOND = load([filepath, '/PCond']);
PlotMesh(COORD, QUADS);

%Assign degree-of-freedom to each node
[DOF, FREE] = SetDegreeOfFreedom(QUADS, BCOND, PCOND);

%Picard's Iteration Variables for Solving the Non-Linear System
ndof = max(QUADS(:));
u0 = zeros(ndof,1);
v0 = zeros(ndof,1);

%% RUN-ANALYSIS
% This step includes the employed solution algorithm to compute the 
% main field variables. The run-analysis is often the longest, most 
% time-consuming step in the simulation process.

k = 0;
error = inf;
PrintStatus('h', filepath, k, error, tol, rho, nu);
while error > tol && k < maxiter
    k = k + 1;

    %Assembles left and right-hand side
    A = AssembleMatrix(COORD, QUADS, DOF, u0, v0, nu, rho, mem);
    b = AssembleVector(QUADS, DOF);
    
    %Apply Boundary Conditions
    U = SetBoundaryConditions(BCOND, PCOND, DOF);
    
    %Solves Linear System
    b = b - A*U;
    U(FREE,1) = A(FREE,FREE)\b(FREE,1);

    %Computes error and update mean velocities
    error = max(abs([U(DOF(:,1),1) - u0; U(DOF(:,2),1) - v0]));
    u0 = 1/2*(U(DOF(:,1),1) + u0);
    v0 = 1/2*(U(DOF(:,2),1) + v0);

    PrintStatus('s', filepath, k, error, tol, rho, nu);
end

%% POST-PROCESS
% This is a paradigm for transforming the often highly detailed and complex 
% outputs of Finite Element Method (FEM) calculations into a format that is 
% easily understood by the user.

PlotAnimation(COORD, QUADS, DOF, U);
