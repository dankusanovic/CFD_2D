function A = AssembleMatrix(COORDS, QUADS, DOF, u, v, nu, rho, ns)
    %TODO: Implement the element matrix (A) of dimension [20,20]. Define submatrices 
    %A1, A2, A3, A4, A5 which will help to construct the element matrix as 
    %A = [A1, 0, A2; 0, A1, A3; A4, A5, 0]. Implement this function following the 
    %comments from (c) to (h)
    
    %Number of elements and degree-of-freedom
    ne = size(QUADS,1);
    ndof = max(max(DOF));

    %Memory allocation for sparse vector
    I = zeros(ns*ne,1);
    J = zeros(ns*ne,1);
    V = zeros(ns*ne,1);

    %Computes and assembly the stiffness matrix
    k = 0;
    for e = 1:ne
        %(a) Get the Element's connectivity array (conn)
        conn = ;

        %(b) Get the Degree-of freedom list (dof)
        dof = ;

        %(c) Get the Element's Node coordinates (coords)
        coords = ;

        %(d) Obtain the Element's velocity at each node (u0,v0) using the solution (v)
        u0 = ;
        v0 = ;

        %(e) Compute the Element Stiffness Matrix. Use the already implemented
        %    function ComputeElementMatrix
        Ae  = ;
        
        %Adds the Element Stiffness Matrix's contribution
        for i = 1:size(Ae,1)
            for j = 1:size(Ae,2)
                if Ae(i,j) ~= 0
                    k = k + 1;
                    I(k,1) = dof(i);
                    J(k,1) = dof(j);
                    V(k,1) = Ae(i,j);
                end
            end
        end
    end

    %Creates the sparse matrix 
    A = sparse(I(1:k,1), J(1:k,1), V(1:k,1), ndof, ndof);
end
