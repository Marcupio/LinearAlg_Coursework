function PlotPats3D(P,D)

  colordef none, clf reset
  make3view

  axis([-1 1 -1 1 0 1])
  view(72,24)
  
  Dc = D > 0;
  
  plot3(P(1,Dc),P(2,Dc),D(Dc),'y+')
  plot3(P(1,~Dc),P(2,~Dc),D(~Dc),'mo')
