*Accessing library;
options validvarname=v7;
libname xlLP xlsx 
	"/global/home/gbc_jsingh1/gbc/user-share/Group 11/LOAN_PORTFOLIO.xlsx";

*univariate procedure;
proc univariate data=xllp.LOAN_PORTFOLIO;
var Application_Score ArrearsAmount ArrearsPer Disbursement_Amount 
InstallmentAmt ActualBalance ArrearsDays;
run;


*means procedure;
proc means data=xllp.LOAN_PORTFOLIO;
	var  ActualBalance Application_Score ArrearsAmount 
	ArrearsDays Disbursement_Amount InstallmentAmt ArrearsPer;
run;
	

*frequency procedures;
proc freq data=xllp.LOAN_PORTFOLIO;
	tables BranchID Actual_Application_Grade Actual_Good_Bad Gender LiteracyLevel 
		MaritalStatus Occupation;
run;