function ndata = normalize(data)
    
    [m,n] = size(data);
    ndata = zeros(m,n);
    
    for i = 1:n
        ndata(:,i) = (data(:,i)-min(data(:,i)))./(max(data(:,i)) - min(data(:,i)));
    end

end