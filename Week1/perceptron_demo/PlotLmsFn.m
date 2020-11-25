function PlotLmsFn(W,color)
% PlotLmsFn   Plot mapping based on weight matrix W.

NUNITS = size(W,1);

colors = get(gca,'ColorOrder');
ncolors = size(colors,1);

temp = axis;
xrange = temp(1:2);

for i = 1:NUNITS
 if nargin==1
   color = colors(1+rem(i,ncolors),:);
   end
 plot(xrange,[[1;1],xrange',]*W(i,1:2)','Color',color);
 end
