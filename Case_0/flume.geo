
//Dimensions
l = 1.64;
hm = 0.59;
h = 0.25;
wt = 0.48;
H = 0.06;

lc = 0.05;

Point(1) = {0, 0, 0, lc};
Point(2) = {l, 0, 0, lc};
Point(3) = {0, hm, 0, lc};
Point(4) = {l, hm, 0, lc};

Line(1) = {1,2};
Line(2) = {2,4};
Line(3) = {4,3};
Line(4) = {3,1};

Curve Loop(1) = {1, 2, 3, 4};
Plane Surface(1) = {1};

Transfinite Surface {1};
Recombine Surface {1};

Extrude {0, 0, wt} {
    Surface{1}; Layers{5}; Recombine;
  }
Transfinite Volume {1};


Field[1] = Box;

Field[1].VIn = $lc;

Field[1].XMin = 0;

Field[1].XMax = l;

Field[1].YMin = h-H;

Field[1].YMax = h+H;

Field[1].ZMin = 0;

Field[1].ZMax = wt;

Background Field = 1;

Mesh 3
