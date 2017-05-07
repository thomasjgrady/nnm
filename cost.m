function E = cost(y_true, y_pred)
    E = 0.5*norm(y_true-y_pred).^2;
end