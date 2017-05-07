function actp = activationprime(choice, x)
    switch choice
        case 'sigmoid'
            actp = (1-activation('sigmoid', x)).*(activation('sigmoid',x));
        case 'tanh'
            actp = 1 - (activation('tanh', x)).^2;
        otherwise
            error('Unknown function');
    end
end