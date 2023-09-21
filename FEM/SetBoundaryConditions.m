function u = SetBoundaryConditions(BCOND, PCOND, DOF)
    %TODO: Impose using the specified velocity values in BCOND and presure in PCOND
    %in the solution vector (u). The position where such values are placed can be
    %obtained from DOF matrix. For example, DOF(BCOND(:,1),1) have the dof number
    %for the horizontal velocity (u) while DOF(BCOND(:,1),2) the vertical
end
