Include "Progression.geo";
U = 69.26; // 8 m/s and Re = 5.4e+5 rho = 1.205, mu = 1.82e-5
diatance = 30;
x = 8;// 8 medium 11 Fine 6 Coarse
L1 = 2;//1.02;
thickness = 0.1;
//Printf("%g",r);
Point(1) = {-0.4, 0, 0, 0};
Point(2) = {0, 0, 0, 0};
Point(3) = {L1, 0, 0, 0};
Point(4) = {L1, L1, 0, 0};
Point(5) = {0, L1, 0, 0};
Point(6) = {-0.4, L1, 0, 0};
Line(1) = {6, 5};
Line(2) = {5, 4};
Line(3) = {4, 3};
Line(4) = {3, 2};
Line(5) = {2, 1};
Line(6) = {1, 6};
Line(7) = {5, 2};
Line Loop(8) = {1, 7, 5, 6};
Plane Surface(9) = {8};
Line Loop(10) = {2, 3, 4, -7};
Plane Surface(11) = {10};
//=====================================
If (U == 1)
If (diatance == 100)
         yPls = 1.1e-3;//
EndIf
If (diatance == 90)
         yPls = 9.7e-4;//
EndIf
If (diatance == 80)
         yPls = 8.6e-4;
EndIf
If (diatance == 70)
         yPls = 7.5e-4;
EndIf
If (diatance == 60)
         yPls = 6.4e-4;
EndIf
If (diatance == 50)
         yPls = 5.4e-4;
EndIf
If (diatance == 40)
         yPls = 4.2e-4;//4.3e-4;
EndIf
If (diatance == 30)
         yPls = 2.6e-3;//3.2e-4;
EndIf
If (diatance == 20)
         yPls = 5.6e-3;
EndIf
If (diatance == 5)
         yPls = 5.3e-5;//2.8e-4;
EndIf
If (diatance == 1)
         yPls = 5.6e-6;//2.8e-4;
EndIf
If (diatance == 0.5)
         yPls = 5.3e-6;//2.8e-4;
EndIf
EndIf
//=====================================
If (U == 8)
If (diatance == 20)
         yPls = 8.3e-4;
EndIf
If (diatance == 25)
         yPls = 1.0e-3;
EndIf
If (diatance == 30)
         yPls = 1.2e-3;
EndIf
If (diatance == 40)
         yPls = 1.7e-3;
EndIf
If (diatance == 50)
         yPls = 2.1e-3;
EndIf
If (diatance == 60)
         yPls = 2.5e-3;
EndIf
If (diatance == 70)
         yPls = 2.9e-3;
EndIf
If (diatance == 80)
         yPls = 3.3e-3;
EndIf
If (diatance == 90)
         yPls = 3.7e-3;
EndIf
If (diatance == 100)
         yPls = 4.1e-3;
EndIf
If (diatance == 200)
         yPls = 8.3e-3;
EndIf
If (diatance == 300)
         yPls = 1.2e-2;
EndIf
If (diatance == 0.5)
         yPls = 1.7e-4;
EndIf
EndIf
//=====================================
If (U == 3.65)
If (diatance == 1)
         yPls = 8.7e-5;
EndIf
If (diatance == 35)
         yPls = 3.0e-3;
EndIf
EndIf
//=====================================
If (U == 69.26)
If (diatance == 20)
         yPls = 1.1e-4;
EndIf
If (diatance == 30)
         yPls = 1.7e-4;
EndIf
If (diatance == 40)
         yPls = 2.2e-4;
EndIf
If (diatance == 50)
         yPls = 2.8e-4;
EndIf
If (diatance == 60)
         yPls = 3.3e-4;
EndIf
If (diatance == 70)
         yPls = 3.9e-4;
EndIf
If (diatance == 80)
         yPls = 4.5e-4;
EndIf
If (diatance == 90)
         yPls = 5.0e-4;
EndIf
If (diatance == 100)
         yPls = 5.6e-4;
EndIf
If (diatance == 200)
         yPls = 1.1e-3;
EndIf
If (diatance == 300)
         yPls = 1.7e-3;
EndIf
EndIf
//=====================================
n = 21*x;
nbpts = n;
L = L1;
StartCell = yPls;
low = 0;
high = 100;
tol = 0.0000001;
r = (low+high)/2;
Call Progression;
Transfinite Line {6, -7, -3} = n Using Progression r;
Delete n;
Delete r;
//Delete L;
n = 21*x;
nbpts = n;
L = L1;
StartCell = 0.01;//4.1e-3;//1.0e-3;//4.1e-3;//2.1e-5;//8.3e-4;//yPls;
low = 0;
high = 100;
tol = 0.0000001;
r = (low+high)/2;
Call Progression;
Transfinite Line {2, -4} = n Using Progression r;
Delete n;
Delete r;
Delete L;
n = 5*x;
nbpts = n;
L = 0.4;
StartCell = 0.01;//4.1e-3;//1.0e-3;//4.1e-3;//2.1e-5;//8.3e-4;//yPls;
low = 0;
high = 100;
tol = 0.0000001;
r = (low+high)/2;
Call Progression;
Transfinite Line {-1, 5} = n Using Progression r;
Delete n;
Delete r;
Delete L;
Transfinite Surface "*";
Recombine Surface "*";
Transfinite Volume "*";
Recombine Volume "*";
Coherence;
Extrude {0, 0, thickness} {
  Surface{9, 11};
  Layers{1};
  Recombine;
}
Physical Surface("inlet") = {32};
Physical Surface("outlet") = {46};
Physical Surface("top") = {20, 42};
Physical Surface("frontandback") = {33, 55, 11, 9};
Physical Surface("slipsurface") = {28};
Physical Surface("bottom") = {50};
Physical Volume("internal") = {1, 2};
Coherence;
Coherence;
Coherence;
