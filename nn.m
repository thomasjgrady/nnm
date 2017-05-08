%-----------------------------------------------------%
% Simple single hidden layer regression network model %
%-----------------------------------------------------%

% Define hyperparameters
num_iterations = 200;
hidden_layer_size = 3;
num_params = 5;
learning_rate = 0.1;

% Initialize random weights
W = cell(1,2);
W{1} = randn(num_params, hidden_layer_size);
W{2} = randn(hidden_layer_size, 1);

% Load data 
data = csvread('./data/airfoil.csv');
y_true = data(1:100,num_params+1);
y_true_test = data(101:200, num_params+1);

% Normalize data
ndata = normalize(data);
X = ndata(1:100, 1:num_params);
X_test = ndata(101:200, 1:num_params);
y_true_norm = ndata(1:100, num_params+1);
y_true_norm_test = ndata(101:200, num_params+1);

% Define activation functions
F = @(x)activation('sigmoid',x);
Fprime = @(x)activationprime('sigmoid',x);

% Define vectors to plot the cost function
steps = 1:num_iterations;
costs = zeros(1, num_iterations);
costs_test = zeros(1, num_iterations);

% Train the network
for i = 1:num_iterations
    dEdW = back(y_true_norm, X, W, F, Fprime);
    scaledgrad = cellfun(@(x) x*learning_rate, dEdW, 'Un', 0);
    W = cellfun(@minus, W, scaledgrad, 'UniformOutput', false);
    costs(i) = cost(y_true_norm, forward(X,W,F));
    costs_test(i) = cost(y_true_norm_test, forward(X_test, W, F));
end

% Plot cost graphs
hold on
plot(steps, costs);
plot(steps, costs_test);
title('Cost Function of Train and Test Data');
legend('Train set', 'Test set');
hold off

