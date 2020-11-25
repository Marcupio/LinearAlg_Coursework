% LMS Learning

load LmsPat.dat;
load LmsAns.dat;

Patterns = LmsPat';
Desired = LmsAns';

NINPUTS = size(Patterns,1);
NPATS   = size(Patterns,2);
NUNITS  = size(Desired,1);

colordef none, clf reset
hold on
PlotLmsPats(Patterns,Desired);

Inputs = [ones(1,NPATS); Patterns];

InitWeights = rand(NUNITS,1+NINPUTS) - 0.5;
Weights = InitWeights;

LearnRate = 0.14;
TSS = Inf;

for i = 1:200,
  if rem(i-1,9) == 0
    PlotLmsFn(Weights), pause(1)
    end

  NetIn = Weights * Inputs;

  Result = NetIn;

  Error = Result - Desired;
  OldTSS = TSS;
  TSS = sum(sum(Error.^2));
  fprintf('Epoch %.0f:  ',i);
  fprintf('TSS = %6.5f\n',TSS);


  if abs(TSS-OldTSS) < 0.0001
     PlotLmsPats(Patterns,Desired,1);
     PlotLmsFn(Weights,[1 1 1]);
     break;
  end;

  dW = - (Error * Inputs');

  Weights = Weights + LearnRate * dW;
end
