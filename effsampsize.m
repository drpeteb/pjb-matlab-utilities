function ess = effsampsize( weight )
% Calculates the effective sample size from a vector of unnormalised 
% log-weights

% Convert weights to linear domain and normalise
weight = weight - max(weight);
weight = exp(weight);
weight = weight/sum(weight);

% Catch NaNs
assert(~any(isnan(weight)));

% Calculate ESS
ess = 1/( sum( weight.^2 ) );

end

