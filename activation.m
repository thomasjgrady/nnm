function act = activation(choice, x)
    switch choice
        case 'sigmoid'
            act = 1./(1+exp(-x));
        case 'tanh'
            act = (exp(2.*x)-1)./(exp(2.*x)+1);
        otherwise
            error('Unknown choice');
    end
end