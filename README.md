# Flow-Over-a-Flat-Plate

The file FlatPlate.geo contains the source file of the grid. Furthermore, the file Progression.geo is a subroutine to solve for the roots using B-Section for the progression formulas. The idea of solving for the roots of the bias function or geometric progression into gmsh geo file motivated by;

http://onelab.info/pipermail/gmsh/2008/003639.html

https://cfd.ninja/bias-factor/

https://www.cfd-online.com/Forums/openfoam-meshing-blockmesh/61785-blockmesh-grading-calculator.html

http://openfoamwiki.net/index.php/Scripts/blockMesh_grading_calculation

To create the grid, open the FlatePalte.geo file and change the incoming velocity to 69.26m/s, distance that corresponds to any y+ e.g. 40. Then type in the terminal, gmsh FlatePalte.geo and create 3D mesh and then save the file to .msh.

Go to the directory where you saved the case file and Type gmshToFoam FlatePlate.msh in the terminal. Then ./Allprepare in the terminal to adjust the boundary conditions. Finally, on the same terminal type mpirun -np 24 simpleFoam -parallel > log.simpleFoam. Note the number 24 corresponds to the number of cores I have! You can also plot the residual on the fly by opening a new terminal and typing gnuplot Residual in the directory where you saved youe case file.
