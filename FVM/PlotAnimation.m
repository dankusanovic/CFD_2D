function PlotAnimation(Wmj, Bmj, xmj, tol)
    %Repeated coordinates for piece-wise linear reconstruction
    xp = repmat(xmj(2:end-1),2,1);
    x  = [xmj(1), xp(:)', xmj(end)];

    %Plots the water surface and bathymetry together
    h = plot(xmj, Bmj, x, Wmj(2:end-1)); 
    set(h(1), 'Color', 'k', 'LineWidth', 2)
    set(h(2), 'Color', 'b', 'LineWidth', 2, 'Marker', '.', 'MarkerSize', 16)
    xlim([0 25.0]); 
    ylim([-10 2.0]); 
    xlabel('x')
    ylabel('W_j')
    %legend('Bathymetry', 'Water Surface')
    grid on;
    drawnow;
end