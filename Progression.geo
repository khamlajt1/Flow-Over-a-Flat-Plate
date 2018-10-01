//======================
Function Progression
For i In {1:24} 
fun = 0;
For k In {0:nbpts-1-1}
     fun = fun+StartCell*r^k; 
     fun2 = L-fun;
EndFor
fun4 = fun2;
//Printf("%g",fun4);
//======================
fun1 = 0;
For j In {0:nbpts-1-1}
     fun1 = fun1+StartCell*high^j; 
     fun3 = L-fun1;
EndFor
fun5 = fun3;
//Printf("%g",fun4);
//======================
If (fun4*fun5 < 0) 
    low = r;
EndIf
If (fun4*fun5 >= 0) 
    high = r;
EndIf
r = (low+high)/2;
//Printf("%g  %g",i,r);
EndFor
Return
//======================
Coherence;
//nbpts = 10;
//L = 0.002; 
StartCell = 0.000012;
low = 0; 
high = 100;
tol = 0.0000001;
r = (low+high)/2;
//Call Progression;
//Printf("%g",r);
