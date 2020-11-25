function PlotBoundary(W,iter,done)

colors = jet;

if ~done
   lstyle = '--';
   color = colors(1+rem(3*iter+9,size(colors,1)),:);
else
   lstyle = '-';
   color = [1 1 1];
end

d = W(3);
if abs(d) < 0.001, d = 0.001; end

plot([-2 2],(-W(2)*[-2 2]-W(1))/d,'LineStyle',lstyle,'Color',color);
drawnow
