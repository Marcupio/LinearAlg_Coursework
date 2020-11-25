% Quadratic error demo from Hertz Krogh & Palmer fig. 5.10

function quaderr(eta,momentum)

if nargin < 2
  momentum = 0;
  if nargin < 1
    eta = 0.02
  end
end

ud = get(gcf,'UserData');
if ~ischar(ud) || ~strcmp(ud,'quaderr') == 1
  clf, hold on
  initxy = [-1 1];
  set(gcf,'UserData','quaderr')
  set(gcf,'Color',[1 1 1])
  plot(0,0,'+')
  pts = 0 : 0.01 : 2*pi;
  plot(cos(pts), sin(pts)/20,'m')
  axis([-1.5 1.5 -1.5 1.5])
  axis equal off
else
  initxy = [1 1];
  set(gcf,'UserData',[])
end

curxy = initxy;
deltaxy = 0;

plot(curxy(1),curxy(2),'o')
text(curxy(1)+0.07,curxy(2), ...
    ['\eta=' num2str(eta) '  \alpha=' num2str(momentum)], ...
    'FontSize',18)
for i=1:20
  prevxy = curxy;
  dxy = -eta * [2 40] .* curxy;
  deltaxy = dxy + momentum * deltaxy;
  curxy =  curxy + deltaxy;
  plot([prevxy(1) curxy(1)],[prevxy(2) curxy(2)])
  plot(curxy(1),curxy(2),'*')
end
