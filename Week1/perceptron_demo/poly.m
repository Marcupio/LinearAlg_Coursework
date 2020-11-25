% poly - Polynomial classifier trained using the perceptron learning rule.
%
% The discrimination function is a quadratic polynomial in two variables (x,y):
%      w1 + w2*x + w3*y + w4*x^2 + w5*y^2 + w6*x*y > 0

% Calculate and plot the training set.
NPATS = 100+floor(rand(1)*30);
Patterns = rand(2,NPATS)*2-1;
Inputs = [ones(1,NPATS); Patterns; Patterns.^2; Patterns(1,:).*Patterns(2,:)];

% Generate a set of weights that divides the training set roughly in half.
while 1
  W = rand(1,6)-0.5;
  Desired = (W*Inputs > 0)*2-1;
  if abs(sum(Desired)) < NPATS*(4/5), break, end
end

Weights = [0 0 0 0 0 0];

colordef none
figure(2), clf reset
make3view

for i = 1:150

  PlotPolyBoundary(Weights,Patterns,Desired)
  drawnow

  Result = ((Weights*Inputs)>0) * 2 - 1;
  TSS = sum((Result-Desired).^2);

  fprintf('%2d. TSS=%7.3f  Weights = ',i,TSS);
  fprintf('%6.3f ',Weights);
  fprintf('\n');

  if Result == Desired, break, end

  Weights = Weights + (1/NPATS)*(Desired-Result)*Inputs';

end
