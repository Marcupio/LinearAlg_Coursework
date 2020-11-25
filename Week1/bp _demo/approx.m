function approx(NHIDDENS)
% approx.m
% Using backprop to approximate a continuous function.
% Set the variable NHIDDENS to the desired number of hidden units.
%
% This script initializes all the variables and then calls
% the approxhelper script to actually do the training.

if nargin==0, NHIDDENS = 5, end

Patterns = (-pi : 0.1 : pi);
Desired = approxfn(Patterns);

[NINPUTS, NPATS]  = size(Patterns);
[NOUTPUTS, NPATS] = size(Desired);
Inputs1 = [ones(1,NPATS); Patterns];

Momentum = 0.9;
DerivIncr = 0.1;
LearnSchedule = [100 .0001; 4000 .002];
sched_pointer = 1;
TSS_Limit = 0.1;

InitWeights1 = rand(NHIDDENS,1+NINPUTS)*2-1;
InitWeights2 = rand(NOUTPUTS,1+NHIDDENS)*2-1;
Weights1 = InitWeights1;
Weights2 = InitWeights2;
deltaW1 = 0;
deltaW2 = 0;

clf reset, whitebg(gcf,[0 0 0]), hold on, box on
xlabel('x'), ylabel('f(x)')

epoch = 0;

approxhelper
