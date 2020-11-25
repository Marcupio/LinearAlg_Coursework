function PlotLmsPats(P,D,nosetup)
% PLOTPATS   Plots the training patterns defined by Patterns and Desired.
%
%            P - MxN matrix containing N patterns of length M.
%		 The value in each pattern is used as the x coordinate
%		 of the point to be plotted.
%
%            D - QxN matrix with N desired output vectors of length Q.
%		 These values are the y coordinates of points to be plotted.

if nargin<2 | nargin>3
  error('Wrong number of arguments.');
  end

[N,M] = size(P);
Q = size(D,1);


if nargin < 3
  % Calculate the bounds for the plot and cause axes to be drawn.
  xmin = min(P(1,:)); xmax = max(P(1,:)); xb = (xmax-xmin)*0.2;
  ymin = min(min(D)); ymax = max(max(D)); yb = (ymax-ymin)*0.2;
  axis([xmin-xb, xmax+xb,ymin-yb ymax+yb]);
  title('X to Y Mapping');
  xlabel('x value'); ylabel('y value');
  end

colors = get(gca,'ColorOrder');
symbols = '+o*x';

for i=1:Q
  plot(P(1,:),D(i,:),symbols(i),'Color',colors(i,:));
end
