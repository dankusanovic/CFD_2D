function PlotMesh(COORD, QUADS)
    %Gets the corner nodes
    ind = QUADS(:, [1,2,3,4]);
    ind4 = unique(ind(:));

    %Gets the mid-side nodes
    ind = QUADS(:, [5,6,7,8]);
    ind8 = unique(ind(:));

    %Plots the Mesh and the Nodes of each Element
    figure(1);
    hold on;
    patch('Vertices', COORD, 'Faces', QUADS(:,[1,2,3,4]), 'facecolor', [0.675 0.925 1]);
    plot(COORD(ind4,1), COORD(ind4,2), 'LineStyle', 'None', 'Marker', 'o', 'MarkerSize', 6, 'Color', 'k', 'MarkerEdgeColor', 'black', 'MarkerFaceColor',[0.5 0.5 0.5]);
    plot(COORD(ind8,1), COORD(ind8,2), 'LineStyle', 'None', 'Marker', 'square', 'MarkerSize', 6, 'Color', 'r', 'MarkerEdgeColor', 'red', 'MarkerFaceColor',[1 0.6 0.6]);
    axis equal;
    axis off;
    hold off
    drawnow;
end