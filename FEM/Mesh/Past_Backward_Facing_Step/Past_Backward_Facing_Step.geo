L = 10.0;
h =  2.5;
n =  20.0;

lc = 0.50;
lm = 1.00; 

Point( 1) = { 0.0,   L, 0.0, lc};
Point( 2) = { 4*L,   L, 0.0, lc};
Point( 3) = { 4*L, 0.0, 0.0, lc};
Point( 4) = {n*L, 0.0, 0.0, lc};
Point( 5) = {n*L, 3*L, 0.0, lc};
Point( 6) = { 0.0, 3*L, 0.0, lc};
Point( 7) = { 0.0,   2*L, 0.0, lm};
Point( 8) = { 4*L,   2*L, 0.0, lm};
Point( 9) = { 4*L,   3*L, 0.0, lc};
Point(10) = {n*L,    L, 0.0, lm};
Point(11) = {n*L,  2*L, 0.0, lm};
Point(12) = {8*L, 0.0, 0.0, lc};
Point(13) = {8*L,   L, 0.0, lm};
//Point(14) = {8*L,   2*L, 0.0, lm};
Point(15) = {8*L,   3*L, 0.0, lc};
Point(16) = {12*L, 0.0, 0.0, lc};
Point(17) = {12*L,   L, 0.0, lm};
//Point(18) = {12*L,   2*L, 0.0, lm};
Point(19) = {12*L,   3*L, 0.0, lc};



//+
Line(1) = {6, 7};
//+
Line(2) = {7, 8};
//+
Line(3) = {8, 13};
//+
Line(4) = {13, 17};
//+
Line(5) = {17, 10};
//+
Line(6) = {10, 11};
//+
Line(7) = {11, 5};
//+
Line(8) = {5, 19};
//+
Line(9) = {19, 15};
//+
Line(10) = {15, 9};
//+
Line(11) = {9, 6};
//+
Line(12) = {7, 1};
//+
Line(13) = {1, 2};
//+
Line(14) = {2, 3};
//+
Line(15) = {3, 12};
//+
Line(16) = {12, 16};
//+
Line(17) = {16, 4};
//+
Line(18) = {4, 10};
//+




//+
Curve Loop(1) = {15, 16, 17, 18, -5, -4, -3, -2, 12, 13, 14};
//+
Plane Surface(1) = {1};
//+
Curve Loop(2) = {5, 6, 7, 8, 9, 10, 11, 1, 2, 3, 4};
//+
Plane Surface(2) = {2};

Mesh.Algorithm=9; //5=Delaunay  1=MeshAdapt 2,4=Automatic 6=Frontal-Delaunay 8=Frontal-Delaunay-Quads 9=Packing of parallelograms
Mesh.RecombinationAlgorithm=2;//0=standard 1=Blossom 2=Simple Full-Quads 3=Blossom Full-Quads
Mesh.RecombineAll=1; //Recombine all triangular meshes 0=desactivado 1=activado
Mesh.SurfaceFaces=0;
Mesh.Points=0;
Mesh 2;
//+
Physical Curve("Border", 19) = {11, 10, 9, 8, 17, 16, 15, 14, 13};
//+
Physical Curve("Inflow", 20) = {1, 12};
//+
Physical Curve("Outflow", 21) = {7, 6, 18};
