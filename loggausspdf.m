function f = loggausspdf(X, Mu, Sigma)
%LOGGAUSSPDF Calculates the log of a Gaussian pdf
%
%   X is a dx1 vector, the test point.
%   Mu is a dx1 vector, the mean parameter.
%   Sigma is a dxd matrix, the covariance matrix parameter.
%   
%   Based on mvnpdf from the stats toolbox with all the error checking and
%   special cases stripped out. Also, the vectors are the right way round.

% Constant
log2pi = 1.83787706640935;

% Get size of data
[d,n] = size(X);
assert(n==1);

% Center it
X0 = X - Mu;

% Cholesky the covariance
R = chol(Sigma);

% Whiten it
xRinv = R' \ X0;

% Calculate the log density
logSqrtDetSigma = sum(log(diag(R)));
quadform = sum(xRinv.^2, 1);
f = -0.5*quadform - logSqrtDetSigma - d*log2pi/2;
