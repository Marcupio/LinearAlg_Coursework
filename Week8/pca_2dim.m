 

%PCA Run principal component analysis  
%   
% initialize samples of x and y training dataset
% boy's height with age
clear all
x = load('ex2x.dat');
y = load('ex2y.dat');
m = length(y); % store the number of training examples
figure % open a new figure window
%plot your training set (and label the axes):
plot(x, y, 'o');
ylabel('Height in meters')
xlabel('Age in years')
title('Original 2D data');
hold on

data=[x,y];
mu = mean(data); % each row is a data sample
data_m = (data - repmat(mu, m, 1));
% ====================== YOUR CODE HERE ======================
%Compute the covariance matrix- one line of code
% Note: When computing the covariance matrix, remember to divide by m (the
% number of examples).
% Sx = 


 %  Then use the "svd" function to compute the eigenvectors
%     and eigenvalues of the covariance matrix. 
%              [U,D,V]  =


% ====================== YOUR CODE END ======================


largest_eigenvec = V(:,1);
largest_eigenval = D(1,1);
medium_eigenvec = V(:,2);
medium_eigenval = D(2,2);
X0=mu(1);
Y0=mu(2);
quiver(X0,Y0,  largest_eigenvec(1)*sqrt(largest_eigenval), largest_eigenvec(2)*sqrt(largest_eigenval), '-m', 'LineWidth',3);
quiver(X0, Y0,  medium_eigenvec(1)*sqrt(medium_eigenval), medium_eigenvec(2)*sqrt(medium_eigenval), '-g', 'LineWidth',3);
data_2d=data_m*V;
% Plot the 2D decorrelated data 
figure;
 plot(data_2d(:,1), data_2d(:,2), 'o');
colormap(gray);
hold on;
% Plot the eigenvectors (which are now the axes
h=quiver( 0,0,1*sqrt(D(1,1)), 0*sqrt(D(1,1)), '-m', 'LineWidth',3);
quiver(0, 0, 0*sqrt(D(2,2)), 1*sqrt(D(2,2)), '-g', 'LineWidth',3);
hold on;

%%%%%%%%%%%%% PROJECT THE DATA ONTO THE LARGEST EIGENVECTOR %%%%%%%%%%%

eigenvec_1d=largest_eigenvec;

data_1d = data_m*eigenvec_1d;

% Plot the 1D data
figure;
 plot(data_1d, repmat(0, size(data_1d',1), 1) , 'o');
colormap(gray);

% Plot the eigenvector
hold on;
quiver(0, 0, 1*sqrt(largest_eigenval), 0*sqrt(largest_eigenval), '-m', 'LineWidth',3);
hold on;

% Set the axis labels
hXLabel = xlabel('x');
hYLabel = ylabel('y');

title('Projected 1D data');
grid on;

disp("Matrix of Covariance"), disp(Sx);
disp("Major Principal Component"),disp(V(:,1));
disp("End of the program");

