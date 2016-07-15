function [c_toi] = Tofts(pars,time,Cp)
% Simulate Concentration in a tissue of interest usign the Tofs model
%
% [c_toi] =myToftsCt2(ktrans,kep,t,Cp)
%
% ktrans=pars(1);
% kep=pars(2);
% t=X(:,1);
% Cp=X(:,2);

% Authors:
% Joey DeGrandchamp                 Julio Cardenas-Rodriguez
% University of Arizona             University of Arizona
% jdegrandchamp@email.arizona.edu   cardenaj@email.arizona.edu
%
%                       www.cardenaslab.org

ktrans=pars(1);
kep=pars(2);

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

end
