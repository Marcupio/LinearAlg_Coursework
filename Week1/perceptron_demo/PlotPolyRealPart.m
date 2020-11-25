function PlotPolyRealPart(xpts,ypts,linetype)

% Some of the elements of ypts may be complex numbers.  We can't
% plot them, so we must leave a gap in the boundary line.
%
% This function finds contiguous sequences of real-valued elements
% of ypts and plots those.

valid = imag(ypts) == 0;

while 1

  if ~valid, break, end

  ystart = find(valid);
  ystart = ystart(1);

  temp = valid;
  temp(1:ystart) = 1;
  yend = find(~temp);
  if isempty(yend)
    yend = length(ypts);
  else 
    yend = yend(1) - 1;
  end

  plot(xpts(ystart:yend), ypts(ystart:yend), linetype)
  valid(ystart:yend) = 0;

end
