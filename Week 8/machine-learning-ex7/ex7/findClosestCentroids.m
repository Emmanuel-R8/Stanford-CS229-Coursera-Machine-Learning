function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

% Set K
K = size(centroids, 1);

% You need to return the following variables correctly.
idx = zeros(size(X,1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the 
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.
%

% number of samples
m = size(X, 1);

% for each sample
for i = 1:m,
  
  % calculate the difference of the sample to the centroids
  % ones(K, 1) * X(i,:) is a matrix with a sample repeated K times
  % sumsq( ones() - centroids, 2) sumsquare of all difference vectors
  % min gives the index where distance is minimum
  [v, idx(i)] = min( sumsq( ones(K, 1) * X(i,:) - centroids, 2) );
endfor


% =============================================================

end

