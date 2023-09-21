clear;
close;
clc;

%Shallow-Water Parameters
g    = 9.8;
CFL  = 0.40;
tol  = 1E-8;
tsim = 5.0;
pind = [161,201,241];
filepath = 'Mesh/Soliton_At_Sloping_Beach'; %Lake_At_Rest  Lake_Landslide Well_Balanced_Dry_Zone Soliton_At_Sloping_Beach

%% PRE-PROCESS
% This step includes importing, defeaturing, and cleaning up geometry, 
% creating the finite volume mesh, and defining loads and boundary 
% conditions as well as solution parameters. 

%Load Mesh Information
values = load([filepath, '/Mesh.txt']);
xmj  = values(:,1)';
Bmj  = values(:,2)';
Wmj  = values(:,3)';
HUmj = values(:,4)';

%Discretization Parameters
dx = xmj(2) - xmj(1);

%Cell-Centered Initial Condition
Wj  = 1/2*(Wmj(2:end) + Wmj(1:end-1));
HUj = 1/2*(HUmj(2:end) + HUmj(1:end-1));
Uj  = [Wj; HUj];

%% RUN-ANALYSIS
% This step includes the employed solution algorithm to compute the 
% main field variables. The run-analysis is often the longest, most 
% time-consuming step in the simulation process.

t = 0.0;
sols = [];
while t < tsim
    %PIECE-WISE RECONSTRUCTION
    %Well Balanced Reconstruction
    Lx = minmod(Uj(1,:), dx);
    Wmj = SetMidPointValues(Uj(1,:), Lx, dx);

    Lx = minmod(Uj(2,:), dx);
    HUmj = SetMidPointValues(Uj(2,:), Lx, dx);

    %Well Balanced Reconstruction
    [Wmj, Hmj] = SetWellBalancedWetDryZone(Uj(1,:), Wmj, Bmj, tol);

    %Computation of the desingularizated velocities
    [HUmj, umj] = ComputeMidVelocity(Hmj, HUmj, tol);

    %Computes the one-sided propagation velocity
    [a_out, a_in] = ComputeOneSidedSpeed(Hmj, umj, g, tol);

    %Computes the maximum time step
    dt = ComputeMaximumTimeStep(a_in, a_out, dx, CFL);
    
    %NUMERICAL INTEGRATION TO NEXT TIME STEP
    %Source Term Values
    Sj = ComputeSourceTerm(Uj(1,:), Bmj, dx, g);

    %Central-Upwind Numerical Flux-Function 
    Hij = ComputeFluxFunction(Wmj, Hmj, HUmj, umj, a_in, a_out, g);

    %Integration Using Forward Euler
    Uj = Uj - dt/dx*(Hij(:,2:end) - Hij(:,1:end-1)) + dt*Sj;

    %Plots the Bathymetry and Water Surface
    PlotAnimation(Wmj, Bmj, xmj, tol);

    t = t + dt;
    sols = [sols;[t,Uj(1,pind),Uj(2,pind)]]; %#ok<AGROW> 
    PrintStatus(filepath, CFL, tol, t, dt);
end

%% POST-PROCESS
% This is a paradigm for transforming the often highly detailed and complex 
% outputs of Finite Element Method (FEM) calculations into a format that is 
% easily understood by the user.

PlotTimeSeries(sols, xmj, tsim, pind);
