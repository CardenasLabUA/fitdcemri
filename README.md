# fitdcemri
fitdcemri: a Matlab function for the analysis of DCE MRI data
DCE_MRI_FIT performs fitting to estimate DCE MRI parameters for the following models:

  1) Linear Reference Region Model
  
  		pars = fitdcemri(toi,rr,time,'lsq')

  2) Non-Linear Reference Region Model
  		
  		pars = fitdcemri(toi,rr,time,x0,lb,ub,'RRM')

  3) Linear Tofts Model
  
  		pars = fitdcemri(Ctoi,Cp,time)
 
  4) Non-linear Tofts Model
  
  		pars = fitdcemri(Ctoi,Cp,time,x0,lb,ub,'Tofts')
 
  Joey DeGrandchamp                 
  University of Arizona             
  jdegrandchamp@email.arizona.edu   
 
  Julio Cárdenas-Rodríguez                 
  University of Arizona             
  cardenaj@email.arizona.edu  
