*Accessing library;
options validvarname=v7;
libname PG1 xlsx 
	"/global/home/gbc_jsingh1/gbc/user-share/Group 11/LOAN_PORTFOLIO_F2.xlsx";

ods graphics on;
*Question 1*;
	
proc freq data=PG1.LOAN_PORTFOLIO_F;
	tables  LiteracyLevel ;
	run;

*Question 2*;

proc freq data=PG1.LOAN_PORTFOLIO_F;
	tables   BranchID;
	run;
	
*Question 3*;

proc sort data=PG1.LOAN_PORTFOLIO_F out=work.q4; 
 by descending Disbursement_Amount;
run;

proc print data=work.q4 (obs=10);
var Disbursement_Amount BranchID ;
run;

*Question 4*;


proc sort data=PG1.LOAN_PORTFOLIO_F out=work.q4; 
 by descending ArrearsDays;
run;

proc print data=work.q4 (obs=10);
var AccountID ArrearsDays;
run;



*Question 5*;

proc freq data=PG1.LOAN_PORTFOLIO_F order=freq;
    tables  Actual_Good_Bad* Gender/ nocol nocum norow plots=freqplot;
   run;

