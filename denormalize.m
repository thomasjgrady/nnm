function val = denormalize(ndata, data)
    
    [m,n] = size(ndata);
    val = zeros(m,n);
    
    for i = 1:n
        val(:,i) = ndata(:,i).*(max(data(:,i)) - min(data(:,i))) + min(data(:,i));
    end

end