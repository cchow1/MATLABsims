function [] = animate1D(U)

U = U';
Umax = max(U(:));
Umin = min(U(:));
if Umin > 0
    Umin = 0;
end
L = length(U(1,:));

for i = 1:length(U(:,1))
    subplot(2,1,2);
    image(U(i,1:end),'CDataMapping','scaled');
    colormap jet; colorbar; axis off;
    title(['Temperature along length interval at time interval ', num2str(i)]);
    drawnow;
    subplot(2,1,1);
    plot(U(i,1:end))
    axis([0 L 1.1*Umin 1.1*Umax]);
    title(['Temperature along length interval at time interval ', num2str(i)]);
    xlabel('Length interval');
    ylabel('Temperature');
    drawnow;
end

end