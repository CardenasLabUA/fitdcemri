% add src code folder to path
cd('./src')
%%
clc;
clear all;
%% simulate and plot some data

time_min = linspace(0,5,100)';
Cp   = Cp10(time_min);  

ktrans = 0.25;
ve = 0.40;
kep = ktrans/ve;
Ctoi = conv_with_exp_decay([ktrans,kep],[time_min,Cp]);

ktrans_rr = 0.1;
ve = 0.1;
kep_rr = ktrans/ve;
Crr = conv_with_exp_decay([ktrans_rr,kep_rr],[time_min,Cp]);

plot(time_min,   Cp,'.-', ... 
     time_min, Ctoi,'--k', ...
     time_min,  Crr, 'xm' )
legend({'Cp','Ctoi','Crr'})
xlabel('Time (min)')
ylabel('Conc (mM)')

%% fit data
fitdcemri(Ctoi,Crr,time_min,'robust_linear')
fitdcemri(Ctoi,Crr,time_min,'lrrm')
fitdcemri(Ctoi,Crr,time_min,'lrrm_nonneg')
fitdcemri(Ctoi,Crr,time_min,[1,1,1,1],[0,0,0,0],[4,4,4,4],'NLRRM')
%%
cd ..



