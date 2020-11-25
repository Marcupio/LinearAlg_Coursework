% PlotApprox.m

function PlotApprox(x,intermediates,target,y)

  cla
  axis([-3.6 3.6 -1.2 1.2])

  plot(x,target,'-b')
  plot(x,target,'ob')

  for i = 1:size(intermediates,1)
   plot(x,intermediates(i,:),'-r')
   end

  plot(x,y,'--w')

