% APPROXFN   -- the function to be approximated
function y = approxfn(x)
 y = -0.85*cos(2*x).*x.*exp(-(0.6*x-.4).^2);
