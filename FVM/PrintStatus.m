function PrintStatus(file, CFL, tol, t, dt)
    clc;
    disp('       FINITE VOLUME ANALYSIS          ');
    disp(' Incompressible Saint-Venant Equation  ');
    disp('=======================================');
    disp('                                       ');
    disp('Simulation Parameters:                 ');
    disp([' * Simulation: ', file(6:end)    ]     );
    disp([' * Tolerance : ', num2str(tol)   ]     );
    disp([' * CFL       : ', num2str(CFL)   ]     );
    disp('                                       ');
    disp('Solving Non-Linear System:             ');
    disp('                                       ');
    disp([' -> Simulation time    : ', num2str(t) ]);
    disp([' -> Computed time-step : ', num2str(dt)]);
end