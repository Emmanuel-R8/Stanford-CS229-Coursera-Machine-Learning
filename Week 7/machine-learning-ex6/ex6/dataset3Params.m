function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

CRange     = [0.01 0.03 0.1 0.3 1 3 10 30];
SigmaRange = [0.01 0.03 0.1 0.3 1 3 10 30 100 300];

%allResults = zeros(length(CRange), length(SigmaRange));

% result to improve
bestError = 1e9;
bestParam = [0 0];

for i = 1:length(CRange),
  currentC = CRange(i)
  
  for j = 1:length(SigmaRange),
    currentSigma = SigmaRange(j);
    
%    currentModel = svmTrain(X, y, currentC, @(x1, x2) gaussianKernel(x1, x2, currentSigma), 1e-3, 5);
    currentModel = svmTrain(X, y, currentC, @(x1, x2) gaussianKernel(x1, x2, currentSigma));
    
    predictionY = svmPredict(currentModel, Xval);
    currentError = mean(double(predictionY ~= yval));
    allResults(i, j) = currentError;
    
    if currentError < bestError,
      bestError = currentError;
      C = currentC;
      sigma = currentSigma;
    endif
    
    %fprintf('C = %f - Sig = %f - err = %f', currentC, currentSigma, currentError);
    
  endfor
endfor

%figure;
%surf(allResults);
%label('C');
%ylabel('Sigma');



% =========================================================================

end
