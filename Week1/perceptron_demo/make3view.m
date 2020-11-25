function make3view


cla
axis([-1 1 -1 1 -1 1]), grid on, box on, hold on
xlabel('x1'), ylabel('x2'), zlabel('y')
set(gca,'CameraViewAngleMode','manual')
rotate3d on
colormap jet
caxis([-1 1])
