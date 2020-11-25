% bowl -- 3D display of error surface in weight space for LMS learning.

load LmsPat.dat;
load LmsAns.dat;

Patterns = LmsPat';
Desired = LmsAns';

NINPUTS = size(Patterns,1);
NPATS   = size(Patterns,2);
NUNITS  = size(Desired,1);

Inputs = [ones(1,NPATS); Patterns];

InitWeights = rand(NUNITS,1+NINPUTS)*2 - 1.5; % bias weights for larger error
Weights = InitWeights;
LearnRate = 0.142;  % any larger than this, and the weights diverge

colordef none, clf reset
axpat=subplot(1,2,2); hold on
PlotLmsPats(Patterns,Desired);

%   Calculate and plot the error surface
fprintf('Calculating the error surface...');
w0range = -0.5:0.025:1.0;
w1range = -0.5:0.05:2.5;
w0range = -1:0.025:1.0;
w1range = -1:0.05:3;
[xm,ym] = meshgrid(w0range,w1range);
zm = 0*xm;
W = Weights;
for i = 1:size(xm,1)
 for j = 1:size(ym,2)
  W(1,1:2) = [xm(i,j) ym(i,j)];
  zm(i,j) = tss(W,Inputs,Desired);
  end
 end
disp('');

axbowl = subplot(1,2,1);
contour3(xm,ym,zm,50,'b');
hold on; axis([w0range(1) w0range(end) w1range(1) w1range(end) 0 max(zm(:))])
view (60,14); %view(220,50);
grid off, box on
xlabel('w0'); ylabel('w1'); zlabel('TSS'); title('Error Surface')
set(gca,'CameraViewAngleMode','manual')
rotate3d off, rotate3d on
prevW = Weights;
prevTSS = tss(prevW,Inputs,Desired);
plot3(prevW(1,1),prevW(1,2),prevTSS,'or');
drawnow
TSS = prevTSS;

oldTSS = Inf;

%   Main loop of the LMS algorithm
for i = 1:500,
  if rem(i-1,9) == 0
    subplot(axpat)
    PlotLmsFn(Weights);
    subplot(axbowl);
    plot3([prevW(1,1) Weights(1,1)],[prevW(1,2) Weights(1,2)],[prevTSS TSS],'-r');
    plot3(Weights(1,1),Weights(1,2),TSS,'or');
    pause(0.5)
    prevW = Weights; prevTSS = TSS;
    end

  NetIn = Weights * Inputs;
  Result = NetIn;

  Error = Result - Desired;

  TSS = sum(sum(Error.^2));
  fprintf('Epoch %.0f:  ',i);
  fprintf('TSS = %6.5f\n',TSS);

  if abs(TSS-oldTSS) < 0.0001
     subplot(axpat);
     PlotLmsPats(Patterns,Desired,1);
     PlotLmsFn(Weights,[1 1 1]);
     break;
  end;
  oldTSS = TSS;

  dW = - Error * Inputs';

  Weights = Weights + LearnRate * dW;
end
