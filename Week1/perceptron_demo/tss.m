function y =  tss(Weights,Inputs,Desired)
% tss(Weights,Inputs,Desired) -- returns total sum-squared error

  y = sum(sum((Weights*Inputs-Desired).^2));
