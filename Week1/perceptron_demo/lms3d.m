% 3D Perceptron demo with random training set.

% Calculate and plot the training set.
NPATS = 10+floor(rand(1)*30);
Patterns = rand(2,NPATS)*2-1;
slope = log(rand(1)*10);
yint = rand(1)*2-1;
Desired = Patterns(2,:) - Patterns(1,:)*slope - yint  > 0;

PlotPats3D(Patterns,Desired)

Inputs = [ones(1,NPATS); Patterns];
Weights = [0 0 0];
LearnRate = 0.05;
oldTSS=Inf;

for i = 1:50

  PlotBoundarySurface(Weights)

  Result = Weights * Inputs;
  TSS = sum((Desired -Result).^2);
  if abs(TSS-oldTSS) < .001, break, else oldTSS=TSS; end
  fprintf('%2d.  TSS=%7.4f,    Weights =',i,TSS);
  disp(Weights);

  Weights = Weights + LearnRate * (Desired-Result) * Inputs';
  pause(1)

end
