function B = AssembleVector(QUADS, DOF)
    %Right-hand side is zero
    n = max(DOF(:));
    B = zeros(n,1);
end