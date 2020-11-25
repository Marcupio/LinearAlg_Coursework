% Backpropagtion learning.  One hidden layer.
% Uses tanh as the transfer function

load XorPats.dat
load XorAns.dat

Patterns = XorPats';
Desired = XorAns';

[NINPUTS,NPATS] = size(Patterns);
NHIDDENS = 2;
[NOUTPUTS,NPATS] = size(Desired);

PlotBpPats(Patterns,Desired);

LearnRate = 0.08;
Momentum = 0;
DerivIncr = 0;
deltaW1 = 0;
deltaW2 = 0;

Inputs1 = [ones(1,NPATS); Patterns];

Weights1 = rand(NHIDDENS,1+NINPUTS)-0.5;
Weights2 = rand(NOUTPUTS,1+NHIDDENS)-0.5;

TSS_Limit = 0.02

for epoch = 1:1000

 bp_innerloop

  fprintf('Epoch %3d:  Error = %f\n',epoch,TSS);
  if TSS < TSS_Limit, break, end
  if rem(epoch-1,20)==0, PlotBpBoundary(Weights1,epoch,'--'), end

  end

PlotBpBoundary(Weights1,epoch,'-');
