function Xnormfro = cnormfro(X)
% Computes the Frobenius norm of X
%
% function Xnormfro = cnormfro(X)
%
% Returns the Frobenius norm of X. This function can be seen as 
% norm(...,'fro') but is compatible with dlarrays and structs with fields
% real and imag. Supports both real and complex numbers.
%
% See also: functions_AD

% This file is part of Manopt: www.manopt.org.
% Original author: Xiaowen Jiang, July. 31, 2021.
% Contributors: Nicolas Boumal
% Change log: 

    if isstruct(X) && isfield(X,'real')
        Xnormfro = sqrt(cinnerprodgeneral(X,X));
    elseif isnumeric(X)
        if isreal(X) 
            Xnormfro = sqrt(X(:)'*X(:));
        else
            Xnormfro = sqrt(sum(real(conj(X(:)).*X(:))));
        end
    else
        ME = MException('cnormfro:inputError', ...
        'Input does not have the expected format.');
        throw(ME);
    end

end