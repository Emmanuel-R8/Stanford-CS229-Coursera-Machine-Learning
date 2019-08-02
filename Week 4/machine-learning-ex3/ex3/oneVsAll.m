function [all_theta] = oneVsAll(X, y, num_labels, lambda)
%ONEVSALL trains multiple logistic regression classifiers and returns all
%the classifiers in a matrix all_theta, where the i-th row of all_theta 
%corresponds to the classifier for label i
%   [all_theta] = ONEVSALL(X, y, num_labels, lambda) trains num_labels
%   logistic regression classifiers and returns each of these classifiers
%   in a matrix all_theta, where the i-th row of all_theta corresponds 
%   to the classifier for label i

% Some useful variables
m = size(X, 1);
n = size(X, 2);

% You need to return the following variables correctly 
all_theta = zeros(num_labels, n + 1);

% Add ones to the X data matrix
X = [ones(m, 1) X];

% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the following code to train num_labels
%               logistic regression classifiers with regularization
%               parameter lambda. 
%
% Hint: theta(:) will return a column vector.
%
% Hint: You can use y == c to obtain a vector of 1's and 0's that tell you
%       whether the ground truth is true/false for this class.
%
% Note: For this assignment, we recommend using fmincg to optimize the cost
%       function. It is okay to use a for-loop (for c = 1:num_labels) to
%       loop over the different classes.
%
%       fmincg works similarly to fminunc, but is more efficient when we
%       are dealing with large number of parameters.
%
% Example Code for fmincg:
%
%     % Set Initial theta
%     initial_theta = zeros(n + 1, 1);
%     
%     % Set options for fminunc
%     options = optimset('GradObj', 'on', 'MaxIter', 50);
% 
%     % Run fmincg to obtain the optimal theta
%     % This function will return theta and the cost 
%     [theta] = ...
%         fmincg (@(t)(lrCostFunction(t, X, (y == c), lambda)), ...
%                 initial_theta, options);
%

% Some useful variables, but better named
n_samples = m ;
n_features = n ;

% all_theta is a matrix of classifiers. 
% Each row is a theta classifier for a given label to classify.
% Within the row, there is a value per feature used to classify.
all_theta = zeros(num_labels, n_features+1);

% Loop through all the labels one by one
for currentLabel = 1:num_labels,

  % zeros-out all the 'negative' labels: sets y at 1 for the right label; others to 0
  currentY = (y == currentLabel);
    
  % temporary matrix to calculate the current classifier
  currentTheta = zeros(n_features + 1, 1);
  
  % Sets options for fmincfg
  options = optimset('GradObj', 'on', 'MaxIter', 50);
  
  % Run fmincg to obtain the optimal theta
  % This function will return theta and the cost 
  [currentResult] = fmincg ( ...
                      @(t) (lrCostFunction(t, X, currentY, lambda)), ... %% function to optimise
                            currentTheta, options);
  
  all_theta(currentLabel,:) = currentResult';
  
endfor


% =========================================================================

end
