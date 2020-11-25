% parabolas -- Display of Error Space in LMS Learning
%
% The learning rate (0.142) is very close to the maximum value for which
% the algorithm converges (0.143).  As a result, the system is taking
% steps that are almost-too-large in weight space.  You can see the
% weights hop back and forth between the two sides of the parabola.

load LmsPat.dat;
load LmsAns.dat;

Patterns = LmsPat';
Desired = LmsAns';

NINPUTS = size(Patterns,1);
NPATS   = size(Patterns,2);
NUNITS  = size(Desired,1);

Inputs = [ones(1,NPATS); Patterns];

InitWeights = rand(NUNITS,1+NINPUTS)*2 - 1.5; % bias weights for higher error
Weights = InitWeights;

LearnRate = 0.142;
OldTSS = Inf;

Titles = ['W1 Error Surface' ; 'W2 Error Surface' ];
xvals = -2:.05:2;
clf reset
whitebg(gcf,[0 0 0])
axpat=subplot(1,3,3); hold on
PlotLmsPats(Patterns,Desired);

for i = 1:200,

  NetIn = Weights * Inputs;
  Result = NetIn;
  Error = Result - Desired;
  TSS = sum(sum(Error.^2));
  fprintf('Epoch %3d:  TSS = %6.5f\n',i,TSS);

  if rem(i-1,5) == 0
     for f=1:2   % weight # = figure # = 1 or 2
       subplot(1,3,f);cla
       set(gca,'nextplot','add')
       title(Titles(f,:))
       W = Weights; yvals = [];
       for x=xvals, W(f)=x; yvals=[yvals tss(W,Inputs,Desired)];end
       plot(xvals,yvals,'c');
       axis([-2 2 0 50]);
       plot(Weights(f),TSS,'*','Color',[1 0.8 0.5]);
       end
     subplot(axpat);
     PlotLmsFn(Weights);
     pause(0.5);
    end

  if abs(TSS-OldTSS) < 0.0001, break, end
  OldTSS = TSS;

  dW = - (Error * Inputs');

  Weights = Weights + LearnRate * dW;
end
