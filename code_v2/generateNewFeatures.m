function [Phi] = ...
    generateNewFeatures(X,a,b)
    m_x = size(X, 1);
    for i=1:m_x
        sample = reshape(X(i,:),a,b);
        Phi(i,:) = hog(sample);
    end
end

