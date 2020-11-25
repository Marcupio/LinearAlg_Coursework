% perceptron - Perceptron demo with random training set.

% Calculate and plot the training set.
NPATS = 10+floor(rand(1)*30);
Patterns = rand(2,NPATS)*2-1;
slope = log(rand(1)*10);
yint = rand(1)*2-1;
Desired = Patterns(2,:) - Patterns(1,:)*slope - yint  > 0;
PlotPats(Patterns,Desired);

Inputs = [ones(1,NPATS); Patterns];
 Weights = [0 0 0];

for i = 1:50

  Result = (Weights * Inputs) > 0;

  if Result == Desired, break, end

  Weights = Weights + (Desired-Result) * Inputs';
  fprintf('%2d.  Weights = ',i);
  disp(Weights);

  PlotBoundary(Weights,i,0)
  
  pause(1)

end

PlotBoundary(Weights,i,1)
