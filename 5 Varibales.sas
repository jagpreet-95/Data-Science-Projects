options validvarname=v7;
libname PG1 xlsx 
	"/global/home/gbc_jsingh1/Jagpreet Singh/Group 11/LOAN_PORTFOLIO_Final (2).xlsx";

*Variable1;
data Loan_portfolio;
set PG1.LOAN_PORTFOLIO_FINAL;
format  Active_Account $char3.;
  if ArrearsDays<=45 then Active_Account="Yes";
  else Active_Account="No";
 run;


*Variable 2;
data Loan_portfolio;
	set PG1.LOAN_PORTFOLIO_FINAL;
	format  Account_Risk $char7.;
	
    if ArrearsDays<0 then Account_Risk= "NA" ;

	else if ArrearsDays=<45 then Account_Risk= "Low" ;
	
	else if ArrearsDays=<90 then Account_Risk=" Medium" ;

	else if ArrearsDays>90 then Account_Risk = "High";	


run;

*Variable 3;
data Loan_portfolio;
	set PG1.LOAN_PORTFOLIO_FINAL;
	format  InstallmentSize $char9.;
	a = divide (InstallmentAmount,DisbursementAmount);
	if a <=0.12 then InstallmentSize="Small";
	else if a <=0.18 then InstallmentSize="Medium";
	else if a <=0.24 then InstallmentSize="High";
	else if a >0.24 then InstallmentSize="Very High";
run;
 proc export 
  data=WORK.LOAN_PORTFOLIO
  dbms=xlsx 
  outfile="/global/home/gbc_jsingh1/Jagpreet Singh/Group 11/Final Excel" 
  replace;
run;
*Variable 4;

data Loan_portfolio;
	set PG1.LOAN_PORTFOLIO_FINAL;
	   
	if ArrearsDays >30 and ActualApplicationGrade="A" then ApplicationGradeAudit='Failed';
    else if ArrearsDays >60 and ActualApplicationGrade="B" then ApplicationGradeAudit='Failed';
    else if ArrearsDays >90 and ActualApplicationGrade="C" then ApplicationGradeAudit='Failed';
    else if ArrearsDays >120 and ActualApplicationGrade="D" then ApplicationGradeAudit='Failed';
    else ApplicationGradeAudit='Succeded';
   
run;


*variable 5;

data Loan_portfolio;
	set PG1.LOAN_PORTFOLIO_FINAL;
	
	b = divide (DisbursementAmount-ActualBalance,DisbursementAmount);
	if ArrearsDays >360 and b <0.1
	then PossibleFraud= "Yes";
	else PossibleFraud= "No";
	drop b;
run;

*To export data file*;
 proc export 
  data=WORK.LOAN_PORTFOLIO
  dbms=xlsx 
  outfile="/global/home/gbc_jsingh1/Jagpreet Singh/Group 11/Final Excel" 
  replace;
run;

