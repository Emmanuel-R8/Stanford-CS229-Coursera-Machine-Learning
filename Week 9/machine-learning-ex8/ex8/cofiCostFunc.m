function [J, grad] = cofiCostFunc(params, Y, R, num_users, num_movies, ...
                                  num_features, lambda)
%COFICOSTFUNC Collaborative filtering cost function
%   [J, grad] = COFICOSTFUNC(params, Y, R, num_users, num_movies, ...
%   num_features, lambda) returns the cost and gradient for the
%   collaborative filtering problem.
%

% Unfold the U and W matrices from params
X = reshape(params(1:num_movies*num_features), num_movies, num_features);
Theta = reshape(params(num_movies*num_features+1:end), ...
                num_users, num_features);

            
% You need to return the following values correctly
J = 0;
X_grad = zeros(size(X));
Theta_grad = zeros(size(Theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost function and gradient for collaborative
%               filtering. Concretely, you should first implement the cost
%               function (without regularization) and make sure it is
%               matches our costs. After that, you should implement the 
%               gradient and use the checkCostFunction routine to check
%               that the gradient is correct. Finally, you should implement
%               regularization.
%
% Notes: X - num_movies  x num_features matrix of movie features
%        Theta - num_users  x num_features matrix of user features
%        Y - num_movies x num_users matrix of user ratings of movies
%        R - num_movies x num_users matrix, where R(i, j) = 1 if the 
%            i-th movie was rated by the j-th user
%
% You should set the following variables correctly:
%
%        X_grad - num_movies x num_features matrix, containing the 
%                 partial derivatives w.r.t. to each element of X
%        Theta_grad - num_users x num_features matrix, containing the 
%                     partial derivatives w.r.t. to each element of Theta
%

  errorY = R .* (X*Theta' - Y);

  J  = 1 / 2 * sumsq( errorY(:) ) + lambda / 2 * ( sumsq(Theta(:)) + sumsq(X(:)) );

  % Calculates X_grad
  for movie = 1:num_movies,
    % list of users who reviewed movie movie
    % result is in a row format
    idx_horiz = find(R(movie, :) == 1);
    
    % Parameters restricted to those users
    Theta_temp = Theta(idx_horiz, :);
    Y_temp = Y(movie, idx_horiz);
    
    % Calculates X gradients
    X_grad(movie, :) = (X(movie, :) * Theta_temp' - Y_temp) * Theta_temp  + lambda * X(movie, :);
    
  endfor


  % Calculates Theta_grad
  for user = 1:num_users,
    % list of movies who were reviewed by user user
    % result is in a column format
    idx_vert = find(R(:, user) == 1);
    
    % Parameters restricted to those users
    X_temp = X(idx_vert', :);
    Y_temp = Y(idx_vert', user);
    
    % Calculates X gradients
    Theta_grad(user, :) = (X_temp * Theta(user, :)' - Y_temp)' * X_temp + lambda *  Theta(user, :); 
    
  endfor





% =============================================================

grad = [X_grad(:); Theta_grad(:)];

end
