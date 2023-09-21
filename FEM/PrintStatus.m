function PrintStatus(str, file, k, error, tol, rho, nu)
    if strcmp(str,'h')
        %Program's header
        disp('       FINITE ELEMENT ANALYSIS        ');
        disp(' Incompressible Navier-Stoke Equation ');
        disp('======================================');
        disp('                                      ');
        disp('Simulation Parameters:                ');
        disp([' * Simulation: ', file(6:end)    ]    );
        disp([' * Tolerance : ', num2str(tol)   ]    );
        disp([' * Re number : ', num2str(rho/nu)]    );
        disp('                                      ');
        disp('Solving Non-Linear System:            ');
    elseif strcmp(str,'s')
        %Prints criterion stop
        disp('                                        ');
        disp([' -> Picard iteration: ', num2str(k)    ]);
        disp([' -> Error estimate  : ', num2str(error)]);
    end
end