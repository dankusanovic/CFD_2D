function A = ComputeElementMatrix(Coords, u0, v0, nu, rho)
    %TODO: Implement the element matrix (A) of dimension [20,20]. Define submatrices 
    %A1, A2, A3, A4, A5 which will help to construct the element matrix as 
    %A = [A1, 0, A2; 0, A1, A3; A4, A5, 0]. Implement this function following the 
    %comments from (c) to (h)
    
    %(a) Allocate memory for A1,...,A5
    A1 = zeros(8,8); 
    A2 = zeros(8,4); 
    A3 = zeros(8,4); 
    A4 = zeros(4,8); 
    A5 = zeros(4,8);

    %(b) Gauss quadrature using 3 points
    xp = [-0.7746, 0.0000, 0.7746];
    wp = [ 0.5556, 0.8889, 0.5556];

    %(c) Numerical integration using Gauss Quadrature
    for i = 1:length(wp)
        for j = 1:length(wp)
            %(d) Linear shape Function, Derivatives, and Jacobian at Gauss point in reference element
            %    Call the functions GetLinearShapeFunction (N4), GetLinearShapeFunctionDerivative (B4) 
            %    and compute the jacobian (J4) for the quadrilateral element of four node

            %(e) Quadratic Shape Function Derivatives at Gauss point in reference element
            %    Call the functions GetQuadraticShapeFunction (N8), GetQuadraticShapeFunctionDerivative (B8) 
            %    and compute the jacobian (J8) for the quadrilateral element of four node

            %(f) Compute the matrices with Linear Shape Function Derivatives in physical element
            %    This can be done as J^-1 B 

            %(g) Compute the average velocity ubar and vbar. This can be done by summing the contribution
            %    of the eight nodes as N8*u0 and N8*v0

            %(h) Evaluate the Sub-Stiffness Matrix for A1,...,A5
            A1 = A1 + ;
            A2 = A2 - ;
            A3 = A3 - ;
            A4 = A4 + ;
            A5 = A5 + ;
        end
    end

    %The Element Stiffness Matrix 
    A = [A1, zeros(8,8), A2;
         zeros(8,8), A1, A3;
         A4, A5, zeros(4,4)];
end
