function [ctoi] = conv_with_exp_decay(pars,X)
% INPUTS
% =============
% ktrans=pars(1);
% kep=pars(2);
% time=X(:,1);
% input = X(:,2);
% ==============    
% Simulate Concentration in a tissue assuming the following function
% Ct = k1 (*) exp(k2*time)
% where 
% Ct = simulated concentration
% input = input function (AIF or any other curve)
% k1 = kinetic constant in min^-1
% k2 = kinetic constant in min^-5
% time = time in minutes
% (*) = convolution
%  * = multiplication
%
% EXAMPLE:
% ===================================
% ktrans = 0.25;
% ve = 0.40;
% kep = ktrans/ve;
% Ct = conv_with_exp_decay([ktrans,kep],[time_min,Cp]);
%
% Authors:
% Joey DeGrandchamp                 Julio Cardenas-Rodriguez
% University of Arizona             University of Arizona
% jdegrandchamp@email.arizona.edu   cardenaj@email.arizona.edu
%
%                       www.cardenaslab.org
% version 2.0 01/11/2020

ktrans=pars(1);
kep=pars(2);

time=X(:,1);
Cp = X(:,2);

n_points=length(time);
% expo=zeros(1,n_points);
% crpexp=expo;
% c_toi=crpexp;

c_toi=zeros(n_points,1);

for k = 2:n_points
    int_t = time(k);
    
    for j = 1:k
        dummy_time = time(j);
        expo(j) =exp(-((kep.*(int_t-dummy_time)))); %#ok<*AGROW>
        crpexp(j) = Cp(j)*expo(j);
    end
    
    t2 = time(1:k);
    %%
    crpexp_integral = trapz(t2,crpexp);
    c_toi(k) = ktrans*crpexp_integral;
end


ctoi = c_toi;

end
