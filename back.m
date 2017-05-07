function dEdW = back(y_true, X, W, F, Fprime)
   
    % Recompute forward prop matrices
    Z2 = X*(W{1});
    A2 = F(Z2);

    Z3 = A2*(W{2});
    A3 = F(Z3);
    y_hat = A3;

    % Cell to store gradient arrays
    dEdW = cell(1,2);
    
    % dEdW2
    delta2 = -(y_true-y_hat) .* Fprime(Z3);
    dEdW{2} = (A2)' * delta2;
    
    % dEdW1
    dEdW{1} = X' * ((delta2 * (W{2})') .* Fprime(Z2));
    

end