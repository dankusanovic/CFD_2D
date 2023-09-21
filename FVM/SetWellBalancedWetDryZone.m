function [Wmj, Hmj] = SetWellBalancedWetDryZone(Wj, Wmj, Bmj, tol)
    %TODO: Compute the water surface (Wmj) and water height (Hmj) at the cell's sides
    %First, find the dry zones on the right nodes of the cell, and perform the reconstruction
    %for Wj+1/2 and Wj-1/2. Repeat the same process for the left nodes. Then correct the water
    %height values
end
