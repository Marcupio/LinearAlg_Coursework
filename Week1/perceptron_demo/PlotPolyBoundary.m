function PlotPolyBoundary(W,P,D)

xpts = -1.5:0.002:1.5;

% For each x1 value, calculate the x2 coordinate of the decision
% boundary where the polynomial is zero.  This is the root of the
% quadratic a*x2^2 + b*x2 + c, where a, b, and c are polynomials in x1.

a = W(5) + (abs(W(5)<1e-6))*1e-6;
b = W(3) + W(6)*xpts;
c = W(1) + W(2)*xpts + W(4)*xpts.^2;

y1 = (-b + sqrt(b.^2-4*a*c)) / (2*a);
y2 = (-b - sqrt(b.^2-4*a*c)) / (2*a);

figure(1)
PlotPats(P,(D+1)/2)

axis equal
axis([-1.5 1.5 -1.5 1.5])
PlotPolyRealPart(xpts,y1,'c-')
PlotPolyRealPart(xpts,y2,'c-')
drawnow

% Now plot the error surface in figure 2

if W==0
    return
  else
    mpts = -1.5:0.25:1.5;
    [xm,ym] = meshgrid(mpts,mpts);
    z = W(1) + W(2)*xm + W(3)*ym + W(4)*xm.^2 + W(5)*ym.^2 + W(6)*xm.*ym;
    figure(2), cla
    axis([-1.5 1.5 -1.5 1.5 -2 2])
    z(z>2 | z<-2) = NaN;  % manual clipping because Matlab 3D clipping is broken
    surfc(xm,ym,z,'Clippin','on')
    set(gca,'CameraViewAngleMode','manual')
    xlabel x1, ylabel x2, zlabel Y
    caxis([-1 1])
    shading faceted
    colormap jet
    colorbar
    hold on
    plot3([-1.5 -1.5 1.5 1.5 -1.5],[-1.5 1.5 1.5 -1.5 -1.5],[0 0 0 0 0],'w--')
    wins = D > 0;
    plot3(P(1,wins),P(2,wins),0*1*ones(1,sum(wins)),'y+')
    plot3(P(1,~wins),P(2,~wins),0*-1*ones(1,sum(~wins)),'mo'),
    rotate3d on
    figure(1)
end
