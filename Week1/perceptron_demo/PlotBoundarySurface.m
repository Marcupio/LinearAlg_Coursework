function PlotBoundarySurface(W,clipping)

if nargin < 2, clipping = 1; end

% delete previous patch and line, so we can reuse the rest of the figure
delete(findobj(gca,'Tag','boundary'))

pts = -1:0.2:1;
[xpts,ypts] = meshgrid(pts);

axdat = axis;
zpts = W(1) + W(2)*xpts + W(3)*ypts;

if clipping % half-baked clipping because Matlab's 3D clipping doesn't work:
  zpts(zpts<axdat(5) | zpts>axdat(6)) = NaN;
end

h = surf(xpts,ypts,zpts,zpts-0.5,'Tag','boundary');
if ~clipping, set(h,'Clipping','off'), caxis auto, end

mag =  -W(1) / (W(2)^2+W(3)^2+1);
plot3([0 mag*W(2)], [0 mag*W(3)], [0 -mag], 'g-','Tag','boundary')
drawnow
rotate3d on
