function PlotTimeSeries(sols, xmj, tsim, ind)
    n  = length(ind);
    xj = 1/2*(xmj(2:end)+xmj(1:end-1));
    figure(2);
    for k = 1:n
        subplot(2,3,k)
        plot(sols(:,1),sols(:,k+1));
        xlabel('time');
        ylabel(['W_j(x=',num2str(xj(ind(k))),')']);
        xlim([0, tsim])
        grid on;
    
        subplot(2,3,k+n)
        plot(sols(:,1),sols(:,k+n+1));
        xlabel('time');
        ylabel(['HU_j(x=',num2str(xj(ind(k))),')']);
        xlim([0, tsim])
        grid on;
    end
end