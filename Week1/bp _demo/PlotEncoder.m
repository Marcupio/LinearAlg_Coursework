function PlotEncoder(I2,W2)
%
% Plots patterns and decision boundaries for the encoder problem.
%

cla
axis equal; axis(1.5*[-1 1 -1 1])
xlabel('Hidden unit 1')
ylabel('Hidden unit 2')
set(gca,'NextPlot','add')

cmap1 = [1 1 0; 1 0 1; 0 1 1; 1 0 0; 0 1 0 ; 0 0 1];
cmap2 = [1 .5 .5; .5 .5 1; .5 0 .5; .5 .5 0; 0 .5 .5; .5 1 .5];
cmap = [cmap1; cmap2];
ncolors = size(cmap,1);
xrange = [-1.25 1.25];

for i=1:size(I2,2)

  color = cmap(1+rem(i,ncolors),:);

  plot(I2(2,i),I2(3,i),'o','Color',color)

  yboundary = -(W2(i,1) + (W2(i,2) * xrange)) / W2(i,3);

  plot(xrange,yboundary,'-','Color',color)

  end
