L = 10.0;
h =  2.5;

lc = 0.100;
lm = 0.220;

Point(1) = {0.0, 0.0, 0.0, lc};
Point(2) = {  L, 0.0, 0.0, lc};
Point(3) = {  L,   L, 0.0, lc};
Point(4) = {0.0,   L, 0.0, lc};

Point(5) = {  h,   h, 0.0, lm};
Point(6) = {L-h,   h, 0.0, lm};
Point(7) = {L-h, L-h, 0.0, lm};
Point(8) = {  h, L-h, 0.0, lm};

Point( 9) = {  h, 0.0, 0.0, lc};
Point(10) = {L-h, 0.0, 0.0, lc};
Point(11) = {  L,   h, 0.0, lc};
Point(12) = {  L, L-h, 0.0, lc};

Point(13) = {L-h,   L, 0.0, lc};
Point(14) = {  h,   L, 0.0, lc};
Point(15) = {0.0, L-h, 0.0, lc};
Point(16) = {0.0,   h, 0.0, lc};

Point(17) = {    h, h/2, 0.0, lc};
Point(18) = {  h/2,   h, 0.0, lc};
Point(19) = {  L-h, h/2, 0.0, lc};
Point(20) = {L-h/2,   h, 0.0, lc};
Point(21) = {L-h/2, L-h, 0.0, lc};
Point(22) = {L-h, L-h/2, 0.0, lc};
Point(23) = {h, L-h/2, 0.0, lc};
Point(24) = {h/2,   L-h, 0.0, lc};

Line(1) = {1, 9};
Line(2) = {9, 10};
Line(3) = {10, 2};
Line(4) = {2, 11};
Line(5) = {11, 12};
Line(6) = {12, 3};
Line(7) = {3, 13};
Line(8) = {13, 14};
Line(9) = {14, 4};
Line(10) = {4, 15};
Line(11) = {15, 16};
Line(12) = {16, 1};
Line(13) = {5, 6};
Line(14) = {6, 7};
Line(15) = {7, 8};
Line(16) = {8, 5};
Line(17) = {9, 17};
Line(18) = {17, 5};
Line(19) = {5, 18};
Line(20) = {18, 16};
Line(21) = {10, 19};
Line(22) = {19, 6};
Line(23) = {6, 20};
Line(24) = {20, 11};
Line(25) = {13, 22};
Line(26) = {22, 7};
Line(27) = {7, 21};
Line(28) = {21, 12};
Line(29) = {14, 23};
Line(30) = {23, 8};
Line(31) = {8, 24};
Line(32) = {24, 15};


Curve Loop(1) = {1, 17, 18, 19, 20, 12};
Curve Loop(2) = {2, 21, 22, -13, -18, -17};
Curve Loop(3) = {3, 4, -24, -23, -22, -21};
Curve Loop(4) = {5, -28, -27, -14, 23, 24};
Curve Loop(5) = {28, 6, 7, 25, 26, 27};
Curve Loop(6) = {15, -30, -29, -8, 25, 26};
Curve Loop(7) = {31, 32, -10, -9, 29, 30};
Curve Loop(8) = {19, 20, -11, -32, -31, 16};
Curve Loop(9) = {13, 14, 15, 16};

Plane Surface(1) = {1};
Plane Surface(2) = {2};
Plane Surface(3) = {3};
Plane Surface(4) = {4};
Plane Surface(5) = {5};
Plane Surface(6) = {6};
Plane Surface(7) = {7};
Plane Surface(8) = {8};
Plane Surface(9) = {9};

Mesh.Algorithm=9; //5=Delaunay  1=MeshAdapt 2,4=Automatic 6=Frontal-Delaunay 8=Frontal-Delaunay-Quads 9=Packing of parallelograms
Mesh.RecombinationAlgorithm=1;//0=standard 1=Blossom 2=Simple Full-Quads 3=Blossom Full-Quads
Mesh.RecombineAll=1; //Recombine all triangular meshes 0=desactivado 1=activado
Mesh.SurfaceFaces=0;
Mesh.Points=0;
Mesh 2;
