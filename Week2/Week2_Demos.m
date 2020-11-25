A = [1,2;4,5]; # ; break up rows, while ',' (or spaces) break up columns
B = [3,5; -1,2];
b = [3;6];

# A*x = b
x_solve = inv(A)*b;

#Dot products
v = [1 2]
w1 = [1 1]

u = w1*v';
u #Notice how u is a scalar, which encodes all the information of the weights and inputs

#{
 Perceptron - Matrix Vector Dot Product
 two neurons have the same weights: w1 and w2

 If we have weights W, we can calculate neurons output Y as matrix vector dot products
 If we have input, and output, then we have 2 eq and 2 unknowns (w1, w2) and we can calculate
 them by solving the linear eq where X,Y are known and W is unknowns
 
        X*W = Y ~ A*x = b <-- from lecture for solving linear equations
        
 Realistically we tend to have more unknowns than equations, so we cannot directly solve!
 We can solve for vector of weights via:
 
 W = inv(X)*Y (X = inputs, Y = outpus)
 *if we have more equations than unknowns then we do not have unique solution
 
 #}
 
 x = [1 3];
 w = [3 4];
 y = w*x'
 
 #two neurons witth some weights we know model - weights
 X = [1 2;3 4];
 W = [2 3]
 Y = X*W'
 
 #for different input we can calculate output as matrix vector products
 X1= [1 1;9 7];
 Y1 = X1*W'
 
 #if we know X and Y we can calculate model w: wu
 Wu = inv(X)*Y
 X
 
#{
Easy example, simple to solve, and unique solution!

Not always (read hardly) the case! Point being the importance of Linear Alg. and
how it imbeds itself in Machine Learning networks

#}

