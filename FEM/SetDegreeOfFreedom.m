function [DOF, free] = SetDegreeOfFreedom(QUADS, BCOND, PCOND)
    %Number of Nodes
    n = max(QUADS(:));

    %Nodes with two/three degrees of freedom
    dof3 = unique(QUADS(:, 1:4));
    dof2 = unique(QUADS(:, 5:8));

    %Assign the degree of freedom number
    DOF = zeros(n, 3);
    for k = dof3'
        DOF(k,:) = [k, k+n, k+2*n];
    end

    for k = dof2'
        DOF(k,:) = [k, k+n, 0.0];
    end

    %Free degree of freedom list
    free = setdiff(DOF(:),[DOF(BCOND(:,1),1); DOF(BCOND(:,1),2); DOF(PCOND(:,1),3)]); 
    free(1) = [];
end