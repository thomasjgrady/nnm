function y_hat = forward(X, W, F)
    
    Z2 = X*W{1};
    A2 = F(Z2);

    Z3 = A2*W{2};
    A3 = F(Z3);
    y_hat = A3;
      
end