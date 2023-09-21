function PlotAnimation(COORD, QUADS, DOF, U)
    %Gets the velocities
    u = U(DOF(:,1),1);
    v = U(DOF(:,2),1);

    %Computes the velocity norm
    uh = sqrt(u.^2 + v.^2);

    %Plots the animation
    figure(2);
    subplot(2,1,1)
    hold on;
    patch('Vertices', COORD, 'Faces', QUADS(:,[1,2,3,4]),'LineStyle','none', 'FaceColor', 'interp', 'FaceVertexCData', uh);
    quiver(COORD(:,1), COORD(:,2), u./uh, v./uh, 'r');
    hcb = colorbar;
    hcb.Title.String = "||v||";
    colormap jet;
    axis equal;
    axis off;
    drawnow;

    subplot(2,1,2)
    ndof = size(DOF,1);
    p = zeros(ndof,1);
    ind = unique(QUADS(:, 1:4));
    p(ind) = U(DOF(ind,3),1);
    patch('Vertices', COORD, 'Faces', QUADS(:,[1,2,3,4]),'LineStyle','none', 'FaceColor', 'interp', 'FaceVertexCData', p);
    hcb = colorbar;
    hcb.Title.String = "p";
    %clim([-1.5, 1.5])
    colormap jet;
    axis equal;
    axis off;
    drawnow;
end