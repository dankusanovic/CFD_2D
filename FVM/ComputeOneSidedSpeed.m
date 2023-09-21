function [a_out, a_in] = ComputeOneSidedSpeed(Hmj, umj, g, tol)
    %The one-sided local speeds of propagation
    a_out = max(umj(1,:) + sqrt(g*Hmj(1,:)), umj(2,:) + sqrt(g*Hmj(2,:)));
    a_in  = min(umj(1,:) - sqrt(g*Hmj(1,:)), umj(2,:) - sqrt(g*Hmj(2,:)));

    a_out = max(a_out, tol);
    a_in  = min(a_in,  tol);
end