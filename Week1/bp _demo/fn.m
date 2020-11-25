function w=fn(x)
 z = exp(-(0.12*x-.4).^2);
 y = cos(x/2.5).*x;
 w = -0.17*y.*z;