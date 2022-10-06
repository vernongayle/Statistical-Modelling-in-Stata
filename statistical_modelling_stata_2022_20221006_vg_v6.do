STOP

/**

National Centre for Research Methods (NCRM)

Statistical Modelling in Stata (Practical Workshop) (online)

October 2022



The files required for this workshop are available here

https://github.com/vernongayle/Statistical-Modelling-in-Stata


********************************************************************************



CONTENTS


Setting Up Your Stata Session
Loading Data Files into Stata (use)
Simple Linear Regression
Linear Regression
Logistic Regression Models
Multinomial Logistic Regression Models
Ordinal Regression Models
Regression Models for Count Data
Goodness of Fit
Information Criterion (BIC and AIC)
Dummy and Indicator Variables
Interaction Effects
Saving and Outputing Modelling Results
Exercises



********************************************************************************


		**********************************************
		* IT IS IMPORTANT THAT YOU READ THIS HANDOUT *
		* AND FOLLOW THE Stata.do FILE LINE BY LINE! *
		**********************************************

This file provides an intensive 'fast-track' introduction to statistical
modelling in Stata.

The file is aimed at social science researchers.

Please be patient. Computers often go wrong.

Please asks for help when you need it.


********************************************************************************

Latest Update

6th Bookmakers quote odds of 9/4 for Helen Skelton to win Strictly

Previous Updates 

5th October 2022 Rail Strikes
4th October 2022 Covid inquiry first preliminary hearing begins


********************************************************************************

WARNING!

No micro data will be distributed within this file.

The files required are provided in a repository.

Participants MAY NOT make copies of these files or distribute them.

The files have been sepcially created for training and MUST not be 
used for social science research.

THE DATA ARE NOT REAL! DO NOT USE THEM FOR REAL ANALYSES!

We advise that participants galvanise their training experience and
work with 'genuine' data files which they
can dowload legally from the UK Data Service (http://ukdataservice.ac.uk/ -
the old site is www.esds.ac.uk but you will be redirected).

At workshops where real survey datasets are used participants MUST sign 
a data access agreement.

********************************************************************************

 © Vernon Gayle, University of Edinburgh.

This file has been produced for NCRM by Professor Vernon Gayle.

Any material in this file must not be reproduced, 
published or used for teaching without written permission from 
Professor Vernon Gayle. 

Many of the ideas and examples presented in this file draw heavily on
previous work. We are grateful for the comments and feedback from participants 
of earlier workshops. 

Professor Vernon Gayle (vernon.gayle@ed.ac.uk) 


********************************************************************************

A few commands in this file write to your machine.

In face-to-face workshops this would be a memory stick.

For illustration the drive is called "F:\" .

You may need to change this location on your own computer.

In your work environment you will probably use a network location
such as your "M:\" drive.

When using Stata at you own university (or workplace) you will have to change 
this to the correct location.

This file was initially prepared using Stata 17.

Stata is continually being improved.

This means that programs and do-files written for older versions might 
stop working.

It is possible to specify the version of Stata that you are using at the 
top of programs and do-files .

e.g.  version 10

Some of the commands that are used in this file may NOT
run on small demo versions of Stata. 


********************************************************************************

We suggest that you make a copy of this file immediately.


		**************************************************
		* IT IS IMPORTANT THAT YOU READ THIS INFORMATION *
		* AND FOLLOW THE Stata.do FILE LINE BY LINE!     *
		**************************************************


The file is sequential. 

It MUST be run line by line. 

Many of the commands will NOT run if earlier lines of commands have not been 
executed.


Anotate your new copy of the file as you work through it with your own notes 
(use "*" to comment out your notes).

There are "Questions" for you to answer and "Exercises" for you to do.

SPSS users who are new to Stata might find the following page very helpful

https://stats.idre.ucla.edu/stata/faq/how-do-i-do-this-spss-command-in-stata/ .


********************************************************************************

**/



********************************************************************************
*
*                    Setting Up Your Stata Session
*
********************************************************************************

* This section is about organising preliminary settings in Stata *

* clear the computer memory *

clear

/** More causes Stata to display --more-- and pause until any key is pressed. 
    It is usually more convenient to have this function switched off **/

set more off

* keep a log file containing your output *

* close any log files that might already be running *

capture log close

/** 

here we use the capture command because Stata will not report an error 
if there is no log file to close

**/

* display the path of the current working directory *

pwd

/** 

Change the working directory to an area that you want to work in

for example a memory stick that is on the f:\ drive

you can to create a directory on another drive such as the c:\  if the computer
that you are using allows you to do so - but you might have to create the
directory first.

**/

cd f:\

* displays the path of the current working directory *

pwd



********************************************************************************

* start a log file *

* you might want to check which drive your memory stick is in *

/** 

Remember to use a principled and consistent naming convention.

I adopt Professor J. Scott Long's convention

https://www.stata.com/bookstore/workflow-data-analysis-stata/


**/

capture log using f:\stata_log_2022_20221011_vg_v1.txt, replace text



********************************************************************************



********************************************************************************
*
*                    Loading Data Files into Stata (use)
*
********************************************************************************

/**

An administrative social science data file has been prepared for the workshop.

This is not real social science data and MUST not be used to for research!

**/

* use the file from your memory stick *
* you might want to check which drive your memory stick is in *

use "f:\data_file_v1.dta", clear


* examining the data *

* take a look at the variables in the dataset *

codebook, compact

* summary statistics *

summarize

* list values of variables *
* we will only look at the first three respondents *

list in 1/3

* browsing the data file *

browse

* it is worth closing the spreadsheet so you don't have too many windows open *

/**

Save this file (e.g. on your memory stick).

Remember to use a principled naming convention

(e.g. filename_date_author_version)


* save "f:\mydata_20221011_vg_v2.dta", replace

**/


/**

It is always a good idea to save updates of your syntax files and to 

have multiple copies of your data files 

**/


* clearing Stata memory *

clear

* getting help from Stata *

help

********************************************************************************
********************************************************************************
********************************************************************************



********************************************************************************
*
*                    Simple Linear Regression
*
********************************************************************************

/**

The hsb3 dataset is taken from a national survey of high school seniors. 
Two hundred observations were randomly sampled from the 
High School and Beyond survey. 

It is a modified version of a training dataset made publicaly available.

**/

use f:\hsb3.dta, clear

* explore the writing test score (write) variable * 

tab write, missing

* summarize the writing test score (write) variable * 

summarize write, detail

* Question: Comment on the distribution *



********************************************************************************



* measures of central tendency  *

mean write

ci mean write

/** 

Estimate a simple linear regression model of writing test score and gender. 
we will refer to this as model a. 

**/



********************************************************************************



reg write female  

* examine the output for model a *

* Question: How many cases are included in the analysis? *

* Question: What is the value of adjusted R squared ? *

* Question: Is the gender variable significant? *

* Question: How large is the coefficient for gender? *



********************************************************************************
********************************************************************************
********************************************************************************



********************************************************************************
*
*                    Linear Regression
*
********************************************************************************

/**

Estimate a linear regression model of writing test score with gender and 
ethnicity as explanatory variables.

We will refer to this as model b.

**/

reg write female hispanic asian africam 

* examine the output for model b *

* Question: Is the gender variable (female) significant? *

* Question: How large is the coefficient for gender? *

* Question: Are the ethnicity measures significant? *

* Question: Are Asian students significantly different to white students? *

* Question: What is the ratio of the coefficient and the standard error   *
*            of the Asian variable ? *

* Question: What is the confidence interval for the Asian variable? *

* Question: Does the confidence interval for the Asian variable overlap zero?*

* Question: How many cases are included in the analysis? *

* Question: What is the value of adjusted R squared? *

* Question: Does model b explain more of the variance than model a? *



/**

Estimate a linear regression model of writing test score with gender, ethnicity 
and measures of parental social class

We will refer to this as model c.

**/

reg write female  hispanic asian africam middleclass lowerclass

* examine the output for model c *

* Question: Are the social class variables significant? *

* Question: How large are the social class coefficients? *

* Question: What is the t value for the Asian variable? *

* Question: What are the t values for each of the two social class measures? *

* Question: What is the value of adjusted R squared? *

* Question: Does model c explain more of the variance than model b? *

/**

Estimate a linear regression model of writing test score with gender, ethnicity 
and measures of parental social class and private school

We will refer to this as model d.

**/

reg write female  hispanic asian africam middleclass lowerclass prischool

* examine the output for model d *

* Question: Is private schooling important? *

* Question: What is the t value for the private school variable? *

* Question: How large are the social class coefficients? *

* Question: What is the value of adjusted R squared? *

* Question: Does model d explain more of the variance than model a? *

* Question: Does model d explain more of the variance than model c? *



/**

Write some comments here to remind yourself of what you have done.






Save this .do file, preferably as an updated version (e.g. v_2).

**/


********************************************************************************
********************************************************************************
********************************************************************************
/**
WARNING!

No micro data will be distributed within this file.

The files required are provided in a repository.

Participants MAY NOT make copies of these files or distribute them.

The files have been sepcially created for training and MUST not be 
used for social science research.

THE DATA ARE NOT REAL! DO NOT USE THEM FOR REAL ANALYSES!

We advise that participants galvanise their training experience and
work with 'genuine' data files which they
can dowload legally from the UK Data Service (http://ukdataservice.ac.uk/ -
the old site is www.esds.ac.uk but you will be redirected).

At workshops where real survey datasets are used participants MUST sign 
a data access agreement.

**/



********************************************************************************
********************************************************************************
********************************************************************************



********************************************************************************
*
*                    Logistic Regression Models
*
********************************************************************************

/**

This is a training datasets it contains some varaibles that are similar to those
that are contained in the 1990 Youth Cohort Study of England and Wales.

**/

use "f:\youth_data_logit_v1", clear

* examing the dataset *

codebook, compact

* a measure of GCSE attainment *

tab  t0fiveac, missing

* explore some potential explanatory variables *

* examin the gender variable *

tab boys, missing

* examine the ethnicity variable *

tab1 white black indian pakistani bangladeshi oasian other, missing

* examine the parental social class variable *

tab1  man_prof intermediate working, missing

/** 

More information on this measure is available at parental social class 
(simplified NS-SEC see http://bit.do/Link_to_NS-SEC )

**/

* examine the housing tenure variable *

tab1 owned rented ohouse, missing



********************************************************************************


/**

Estimate a logistic regression model of GCSE attainment including gender as an
explanatory variable.

We will refer to this as model e.

**/

logit t0fiveac boys

* examine the output for model e *

* Question: How many cases are included in the analysis? *

* Question: What is the value of Pseudo R squared ? *

* Question: Is the gender variable significant? *

* Question: How large is the coefficient for gender (boys)? *

* Question: What is the ratio of the coefficient for boys and                 *
* the standard error for boys? *

* Question: How large is the Z score for boys? *

* Question: Does the confidence interval for boys overalap zero? *



********************************************************************************


/**

Estimate a logistic regression model of GCSE attainment including gender as an
explanatory variable that reports odd ratios.

We will refer to this as model f.

**/


* a logit regresion model reporting odds ratios *

logistic t0fiveac boys 

* examine the output for model f  *

* Questions: What scale are the coefficients reported on?

* Question: How many cases are included in the analysis? *

* Question: What is the value of Pseudo R squared ? *

* Question: Is the gender variable (boys) significant? *

* Question: How large is the coefficient for boys? *

* Question: Is the odds ratio for boys more than twice the standard error ?

* Question: How large is the Z score for boys? *

* Question: What scale is the Z score measured on?

* Question: Does the confidence interval for boys overalap 1 ? *



********************************************************************************

/**

Estimate a logistic regression model (logit) of GCSE attainment including gender and
parental social class as explanatory variables.

We will refer to this as model g.

**/


logit t0fiveac boys intermediate working

* examine the output for model g  *

* Question: How many cases are included in the analysis? *

* Question: What is the value of Pseudo R squared ? *

* Question: Does model g explain more of the variance than f? *

* Question: Are odds ratios or coefficients (on the logit scale) reported?

* Question: Is there a significant difference between pupils with *
* parents in the managerial and professional social class and those *
* with parents in the intermediate social class? *

* Question: Is the effect of having parents in the intermediate class *
* possitive or negative? *

* Question: Is there a significant difference between pupils with *
* parents in the managerial and professional social class and those *
* with parents in the working social class?  *

* Question: Is the effect of having parents in the working class *
* possitive or negative? *

* Question: Explain the effects of parental social class on GCSE outcomes? *



********************************************************************************



/**

Estimate a logistic regression model of GCSE attainment including gender,
parental social class and housing tenure as explanatory variables.

We will refer to this as model h.

**/


logit t0fiveac boys intermediate working rented ohouse

* examine the output for model h  *

* Question: How many cases are included in the analysis? *

* Question: Is there missing data on the housing tenure variables?

* Question: What is the value of Pseudo R squared ? *

* Question: Does model h explain more of the variance than g? *

* Question: Are odds ratios or coefficients (on the logit scale) reported?

* Question: Is there a significant difference between pupils who *
* live in rented accomodation compared with those whose parents are *
* home owners? *

* Question: Is there a significant difference between pupils who *
* live in other accommodation compared with those whose parents are *
* home owners? *

* Question: Explain the effects of housing tenure on GCSE outcomes? *

* Question: Explain the modelling results overall ? *


/**

Write some comments here to remind yourself of what you have done.






Save this .do file, preferably as an updated version (e.g. v_2).

**/



********************************************************************************
********************************************************************************
********************************************************************************



********************************************************************************
*
*                    Multinomial Logistic Regression Models
*
********************************************************************************

/**

This is a training datasets it contains some varaibles that are similar to those
that are contained in the 1993 Youth Cohort Study of England and Wales.

**/

use "f:\youth_data_mlogit_v1.dta", clear

* add number labels *

numlabel _all, add

* explore the data *

codebook, compact

* summarize the data *

summarize

* examine the main activity variable (activity)*

tab activity, missing

/**

Estimate a multinomial logit model of activity in year 12 (age 16-17)
in 1993 this was the first year after compulsory school 
(it was historically known as the lower 6th form).

We will refer to this as model i.

**/



mlogit activity

* examine the output for model i  *

* Question: How many cases are included in the analysis? *

* Question: What is the value of Pseudo R squared ? *



********************************************************************************

/**

Estimate a multinomial logit model of activity in year 12 (age 16-17)
including gender (boys) as an explanatory variable.

We will refer to this as model j.

**/

mlogit activity boys

* examine the output for model i 
 
* Question: How many cases are included in the analysis? *

* Question: What is the value of Pseudo R squared ? *

* Question: Is the gender (boys) variable significant for each activity? *

* Question: How large is the coefficient for gender for each activity? *

* Question: What is the ratio of the coefficient and the standard error   *
*            of the gender variable for each activity ? *

* Question: How large are the Z scores for gender (boys)? *

* Question: Do any of the confidence intervals for gender overalap zero? *


********************************************************************************

/**

Estimate a multinomial logit model of activity in year 12 (age 16-17)
including gender (boys) as an explanatory variable.

In this example 'employed' will be the base category.

We will refer to this as model k.

**/

mlogit activity boys, base(3)

 * examine the output for model k *


* Question: Overall, do girls have higher odds of being in education in year 12?



/**

Write some comments here to remind yourself of what you have done.






Save this .do file, preferably as an updated version (e.g. v_2).

**/




********************************************************************************
********************************************************************************
********************************************************************************



********************************************************************************
*
*                    Ordinal Regression Models
*
********************************************************************************



/**
This is a dataset of 200 children age 14 who play chess.
They were asked to rate their own expertise playing chess.



**/

use "f:\chess_v1.dta", clear

codebook, compact


* the outcome variable is  level *
tab level, missing

/**

Estimate an ordered logistic regression model of (self-rated) chess expertise
without any explanatory variables.

We will refer to this as model l.

**/


ologit level


* examine the output for model l 
 
* Question: How many cases are included in the analysis? *
* Question: Explain the partitions (cut points) in the model *



********************************************************************************


/**

There are three variables in the dataset which represent the partitions ordered
(cut points) in the model.

master - child rates their expertise as a master
master_expert - child rates their expertise as a master or 
tab master_expert_adv expert


**/

tab master level
tab master_expert level
tab master_expert_adv level

* here is model l again *
ologit level

* estimate the three partitions (cut points) using three logit models *

logit master  
logit master_expert
logit master_expert_adv

* Question: Explain the partitions (cut points) in model l  *

/**

Estimate an ordered logistic regression model of (self-rated) chess expertise
including school as an explanatory variable

We will refer to this as model m.

**/


ologit level school_b school_c



* examine the output for model m *
 
* Question: Is there a significant difference between schools? *



********************************************************************************


/**

Estimate a continuation ratio models for ordinal responses of (self-rated) 
chess expertise without any explanatory variables.

We will refer to this as model n.

**/

tab level, missing

* examine the output for model n *
 
ocratio level

/**
Question: Explain the partitions (cut points) in the continuation ratio model -
model n 

**/

* compare the two ordinal models (model m and model n) *

ologit level
ocratio level

/**

Question: Explain the difference in these two models.

**/


/**

Write some comments here to remind yourself of what you have done.






Save this .do file, preferably as an updated version (e.g. v_2).

**/



********************************************************************************
********************************************************************************
********************************************************************************



********************************************************************************
*
*                    Regression Models for Count Data
*
********************************************************************************



/**

US Data on children aged 10

The outcome variable is days absent during the school year (daysabs)

**/

use "F:\days_sick_v1.dta", clear

codebook, compact

* the outcome variable is number of days absent due to sickness *

summarize  daysabs
summarize  daysabs, detail

/** examine the distribution of the outcome number of days absent 
    during the school year

**/ 


* draw a histogram of the distrubtion of daysab *

histogram daysabs, frequency kdensity scheme(s1mono)


* test the difference in means for males and females *

ttest daysab, by(male)


* Question: Is there a significant difference between males and females? *



********************************************************************************


/**

Estimate a poisson regression model of number of days absent (daysab) 
with gender as an explanatory variable.

We will refer to this as model o.

**/

poisson daysabs male

* examine the output for model o 
 
* Question: How many cases are included in the analysis? *

* Question: What is the value of Pseudo R squared ? *

* Question: Is the gender variable (male) significant? *

* Question: How large is the coefficient for gender for each activity? *

* Question: What is the ratio of the coefficient and the standard error   *
*            of the gender variable for each activity ? *

* Question: How large is the Z score for males? *

* Question: How many interations did it take for the model to converge? *



/**

Estimate a poisson regression model of number of days absent (daysab) 
with gender and ethnicity as explanatory variables.

We will refer to this as model p.

**/

poisson daysabs male hispanic african_american asian native_american filipino 


* Question: Explain the patterns of the ethnicity effects? *



/**

Estimate a negative binomial regression model of number of days absent (daysab) 
with gender and ethnicity as explanatory variables.

We will refer to this as model q.

**/


nbreg daysabs male hispanic african_american asian native_american filipino



* Question: Describe the model output? *

* Question: Explain the value  /lnalpha? *

* Question: Explain the value alpha? *



/**

alpha – The estimate of the dispersion parameter. 

The dispersion parameter alpha can be obtained by exponentiating /lnalpha.

If the dispersion parameter, alpha, is significantly greater than zero than 
the data are over dispersed and are better estimated using a negative binomial 
model than a poisson model.

In the poisson model the dispersion parameter is constrained to equals zero.

**/
   
   
   
* re-examine the mean and the variance for daysabs
   
summarize  daysabs, detail



* Question: Is there overdispersion *   



********************************************************************************
********************************************************************************
********************************************************************************


********************************************************************************
*
*                    Goodness of Fit
*
********************************************************************************

  
   
use f:\hsb3.dta, clear
   
   
reg write female  hispanic asian africam middleclass lowerclass

/** examine the anova table for this model

      Source |       SS           df       MS      Number of obs   =       200
-------------+----------------------------------   F(6, 193)       =      8.17
       Model |  3621.08648         6  603.514413   Prob > F        =    0.0000
    Residual |  14257.7885       193  73.8745519   R-squared       =    0.2025
-------------+----------------------------------   Adj R-squared   =    0.1777
       Total |   17878.875       199   89.843593   Root MSE        =     8.595



**/

/**

Source – This is the source of variance, Model, Residual, and Total. 
The Total variance is partitioned into the variance which can be explained
by the independent variables (Model) and the variance which is not explained by
the independent variables (Residual, sometimes called Error). 
The Sums of Squares for the Model and Residual add up to the Total Variance, 
reflecting the fact that the Total Variance is partitioned into 
Model and Residual variance

**/

* Total sum of squares *

display 3621.08648 + 14257.7885

* calculate the R-Squared from the Model Sum of Squares / Total Sum of Squares *

display 3621.08648  / 17878.875

/** 
alternatively - calculate the R-Squared from the

1 - (Residual Sum of Squares / Total Sum of Squares)

 **/

 display 1 - (14257.7885  / 17878.875 )
 
 
/**

Write some comments here to remind yourself of how R Squared is calculated.



Save this .do file, preferably as an updated version (e.g. v_2).

**/



*******************************************************************************
 
 
 
 /**
 
Examining the "Total" Sum of Squares 
 
In this passage we will use Stata's scalar variables.
 
 
Stata scalar variables are different from variables in the dataset. 
Variables in the dataset are columns of observations in your data. 
Stata scalars are named entities that store single numbers or strings.
 
Remember 

The Total Sum of Squares (TSS) =

Sum (Y - Y_bar)^2

^2 is Stata notation for squared (i.e. to the power of 2)
 
 
 **/
 
 reg write female  hispanic asian africam middleclass lowerclass


* calculate the mean for write *

summarize write

* collect the value of the mean as a scalar variable *

scalar mean_write = r(mean)

* display the mean for the outcome variable write
 
dis mean_write

* construct a new variable called deviation *

capture drop deviation

generate deviation = (write - mean_write)^2

* deviation is the difference between (Y and Y_bar)^2

* sum the total - sum of squares - for the whole sample *

egen total_ss = sum(deviation)

summarize total_ss

* examine the anova table in the model above *

* Question: What is the value of the Sum of Squares Total (SS)?



********************************************************************************


/**

Now calculate the Total MS 

First we will construct a scalar capturing the mean of total_ss.

Unfortunately the language is a little tongue twisting!

**/


summarize total_ss
scalar m_total_ss= r(mean)
 
dis m_total_ss

* calculate the MS Total

dis m_total_ss / (e(df_m) + e(df_r) )
 
* examine the anova table in the model above *

* Question: What is the value of the MS Total? *
* Question: How is Total df calculated? 



*******************************************************************************
*******************************************************************************
*******************************************************************************


 /**
 
Examining "Model" Sum of Squares
 
Remember 

Model Sum of Squares =

Sum (Y_hat - Y_bar)^2

^2 is Stata notation for squared (i.e. to the power of 2)

 **/
 

* estimate the regression model *

reg write female  hispanic asian africam middleclass lowerclass

/**

here we use predict - which calculates prediction, residuals, 
and influential statistics

**/


predict y_hat

* examine the correlation between y (write) and the estimate of y (y_hat) *

corr write y_hat

* plot the relationship between y (write) and the estimate of y (y_hat) *

plot write y_hat



* construct a new variable called model_deviation *

capture drop model_deviation

* model_deviation is the difference between (Y_hat and Y_bar)^2

generate model_deviation = (y_hat-mean_write)^2

egen mss = sum(model_deviation)

summarize mss

* examine the anova table in the model above *



* Question: What is the value of the Model SS (Sum of Squares)?


********************************************************************************


* now construct a scalar capturing the mean of mss (Model SS)

summarize mss
scalar m_mss= r(mean)
 
dis m_mss

* calculate the MS Model

dis m_mss / (e(df_m))
 
* examine the anova table in the model above *

* Question: What is the value of the Model MS ? *
* Question: How is Model df calculated? 


********************************************************************************
********************************************************************************
********************************************************************************


 
 /**
 
 Examining Model Residuals 
 
 **/
 
 
   
reg write female  hispanic asian africam middleclass lowerclass

* use predict to calculate the residuals *

predict resid_1, residuals

* examine the correlation between y (write) and the residuals *

corr write resid_1

* plot the relationship between y (write) and the residuals *

plot write resid_1

* construct a new varaible *
capture drop resid_2

* resid_2 is the residual squared  (ei)^2 *

generate resid_2 = (resid_1)^2

egen model_residual = sum(resid_2)

summarize model_residual



* examine the anova table in the model above *

* Question: What is the value of the Residual Sum of Squares  (SS)?



********************************************************************************
********************************************************************************
********************************************************************************

* now construct a scalar capturing the mean of model_residual

summarize model_residual
scalar m_resid= r(mean)
 
dis m_resid

* calculate the MS Model

dis m_resid / (e(df_r))
 
* examine the anova table in the model above *

* Question: What is the value of the MS Residual? *
* Question: How is Residual df calculated? 



*******************************************************************************

/**

Calculating Adjusted R Squared  1-((1 - R2)(n-1) / ( n- k – 1)) 


**/

reg write female  hispanic asian africam middleclass lowerclass

* we can use the ereturn commant to get post the estimation results *

ereturn list

* calculate the Adjusted R Square

display 1-((1 - e(r2))*(e(N))) / ( e(N)- e(df_m) ) 



* examine the anova table in the model above *

* Question: What is the value of the Adjusted R Squared? *



*******************************************************************************
*******************************************************************************
*******************************************************************************



/**

Calculating the F statistic


**/

reg write female  hispanic asian africam middleclass lowerclass

* we can use the ereturn commant to get post the estimation results *

ereturn list

* calculate the F statistic

display (e(mss) /e(df_m)) / (e(rss) /e(df_r))

display e(F)

* examine the anova table in the model above *

* Question: What is the value of the F statistic *



/**

The Critical Value of F with (6,193) df = 2.15 

see https://www.danielsoper.com/statcalc/calculator.aspx?id=4 

**/



*******************************************************************************



/**

Calculating the Root Mean Square Error

The Root MSE is the square root of the mean square residual MS Residual


**/


display sqrt(e(rss)/e(df_r) )



/**

Write some comments here to remind yourself of what you have done.






Save this .do file, preferably as an updated version (e.g. v_2).

**/



********************************************************************************
********************************************************************************
********************************************************************************



********************************************************************************
*
*                    Information Criterion
*
********************************************************************************

/**

Information Criterion

estat ic — Display information criteria

In general, statistical models with a lower BIC value are preferable because 
they are more parsimonious descriptions of the data


**/



* first estimate the null model (i.e. without any explanatory variables)

reg write

* estat ic — Display information criteria *

estat ic

* note the log likelihood of the null model and the BIC *

* now estimate a model with gender (female) *
* we will refer to this as model r *

reg write female 
estat ic


* Question: Is the BIC of model r lower than the null model? *


* now estimate the fuller model *
* we will refer to this as model s *

reg write female  hispanic asian africam middleclass lowerclass
estat ic

* Question: Is the BIC of model s lower than model r? *


********************************************************************************
********************************************************************************
********************************************************************************



/**

One formula for BIC is -2 x ln(likelihood) +ln(N) x k

We can use the ereturn command to get a list of post estimation results.

**/


ereturn list

/** 
BIC = -2 x ln(likelihood) +ln(N) x k 
**/

display -2*(e(ll))+ln(e(N))*e(rank) 



/**

We can also calculate the AIC

One formula for AIC is -2 x ln(likelihood) +2k

**/


display (-2*e(ll) + 2*e(rank))



/**

Write some comments here to remind yourself of what you have done.






Save this .do file, preferably as an updated version (e.g. v_2).

**/



********************************************************************************
********************************************************************************
********************************************************************************


********************************************************************************
*
*                    Dummy and Indicator Variables
*
********************************************************************************

* open a new dataset *  

use f:\dummy_vars_v1, clear
   
codebook, compact

* examine the variable race *

tab race

* add number labels to the variables *

numlabel _all, add

* re-examine the variable race *

tab race

* now create a block of dummy variables (0,1) automatically *

tabulate race, gen(eth) 

* examine the dummy variables *

codebook, compact

tab1 race eth*


* now rename the new ethnicity dummy variables *

tab1 race eth*
rename eth1 hispanic
rename eth2 asian
rename eth3 african_american
rename eth4 white

codebook, compact

* change the labels of the variables

label variable hispanic "hispanic"
label variable asian "asian"
label variable african_american "african_american"
label variable white "white"

codebook, compact

* estamate a regression model of math score (math) and ethnicity *

regress math hispanic asian african_american 

********************************************************************************
********************************************************************************
********************************************************************************



/**

Now we look at factor variables (or variables with indicators).

One indicator is used for each level of the variable. 

Add i. in front of the variable's name.


**/



regress math i.race

/** 

Notice that these models are equivallent however the reference category for
race is hispanic in this model.

It is possible to change the reference category using the indicator baselevel
ib .


**/

regress math ib4.race



/**

Write some comments here to remind yourself of what you have done.






Save this .do file, preferably as an updated version (e.g. v_2).

**/



********************************************************************************
********************************************************************************
********************************************************************************


********************************************************************************
*
*                    Interaction Effects
*
********************************************************************************

/**


This section uses the xi — Interaction expansion prefix.

The use of i.varname creates dummies for categorical variable 


**/


clear

use f:\interaction_positive_v1.dta, clear
   
codebook, compact


reg y1 
estat ic 

reg y1 x1 x2
estat ic  

xi:reg y1 i.x1 i.x2 
estat ic

* positive interaction effect *

xi:reg y1 i.x1 i.x2  i.x1*i.x2 
estat ic
 

use f:\interaction_neg_v1.dta, clear
   
codebook, compact

*null model *

reg y2
estat ic

*main effects model *

reg y2 x1 x2
estat ic  

*main effects model in Xi: format * 

xi:reg y2 i.x1 i.x2 
estat ic

* negative interaction effect *

xi:reg y2 i.x1 i.x2  i.x1*i.x2
estat ic


* Question: Is the interaction effect significant? *
* Question: Is the interaction effect model more parsimonious? *

 

*******************************************************************************
*******************************************************************************
*******************************************************************************



use f:\driving_test_logit_v1, clear
 
codebook, compact



/**


y = pass (passes the driving test)

categorical variables

x1 = driving_school (taught by a driving school)
x2 = not_anxious (pupil reports that they are not anxious before test)


continuous variables

x3 = hours (number of hours of lessons before test)


**/


* bivariate exploratory data analysis *

tab pass driving_school, row chi V

tab pass not_anxious, row chi V

mean hours, over(pass)
ttest hours, by(pass)


* logit model main effects *

logit pass driving_school not_anxious

/** 

Question: Is being taught by a driving school is good for the pupil?

Question: Is not being anxious is good for the pupil?


**/


* estimate the logit model with an interaction effect x1 and x2 *

logit pass driving_schoo##not_anxious hours



/** 

Question: Is there an a significant interaction between 
          driving_schoo and not_anxious ?

**/


/**

Margins are statistics calculated from predictions of a previously fitted model 
at fixed values of some covariates and averaging or otherwise integrating over 
the remaining covariates.

**/


* construct a marginsplot  

margins driving_schoo#not_anxious, asbalanced post
margins, coeflegend
marginsplot, scheme(s1mono)


/**

Write some comments here to remind yourself of what you have done.






Save this .do file, preferably as an updated version (e.g. v_2).

**/



********************************************************************************
********************************************************************************
********************************************************************************


********************************************************************************
*
*                    Saving and Outputing Modelling Results
*
********************************************************************************


use f:\hsb3.dta, clear
   
* estimate two models and save the results *

reg write female 

estimates store reg1

reg write female  hispanic asian africam middleclass lowerclass

estimates store reg2

* replay the results from the previous model reg1 *

estimate replay reg1


/**

estimates restore

loads the results stored under name into the current (active) estimation
results.

**/

estimates restore reg2


/**

click on the blue text in the output window (i.e. "reg2") to restore the results

**/



********************************************************************************



/**

esttab -- Display formatted regression table

For this section you must have esttab installed

type "help esttab" and run it in your .do file

If esttab it not installed on you machine type and run

findit esttab

Install esttab - If you are have problems then ask for help

**/



* use the esstab command to send the regression table directly to a Word file *


* run all of these line together *

esttab reg1 using f:\regress1.rtf,		///
	cells(b(star fmt(%9.2f)) se(par)) 					///
	stats(r2 r2_a N, fmt(%9.2f %9.2f) labels(R-Squared AdjR-Squared n)) /// 
	starlevels(* .10 ** .05 *** .01) stardetach 	///
	label mtitles("Regression Model") 		///
	nogaps replace
	

/**

click on the blue text in the output window (i.e. "regress1.rtf") to open
the Word file

**/





/**

Producing Automated Outputs (using Stata)

see 

https://www.ncrm.ac.uk/resources/online/all/?materials&id=20788

for a comprehensive set of examples.

**/


/**

Write some comments here to remind yourself of what you have done.






Save this .do file, preferably as an updated version (e.g. v_2).

**/



********************************************************************************
********************************************************************************
********************************************************************************



********************************************************************************

* close your log file *

capture log close




********************************************************************************
*
*                    Exercise 1 Regression Modelling
*
********************************************************************************


use "f:\hsb3.dta", clear

/**

The hsb3 dataset is taken from a national survey of high school seniors. 
Two hundred observations were randomly sampled from the 
High School and Beyond survey. 

**/



* Task: Explore the reading test score (read) variable * 

* Task: Produce some summary statistics *

* Task: Comment on the distribution of the *

* Task: Explore the correlation between the reading and writing test scores *

* Task: Estimate a linear regression model of reading test score *
* including explanatory variables for gender, ethnicity and social class. *

* Task: How well does the model fit? *

* Task: Overall what can you infer from the model? *



********************************************************************************



********************************************************************************
*
*                    Exercise 2 Logistic Regression Modelling
*
********************************************************************************


use "f:\youth_data_logit_v1.dta", clear

/**
This is a training datasets it contains some varaibles that are similar to those
that are contained in the 1993 Youth Cohort Study of England and Wales.

**/



/**

Task: Explore the relationships between GCSE attainment (5+ grades A - C) 
and gender, ethnicity, parental social class, housing and household type. 

Task: Estimate a suitable logistic regression model. 

**/



********************************************************************************

********************************************************************************
*
*                    Installing Packages
*
********************************************************************************

/**

Installing Packages in Stata

A benefit of Stata is that new commands and functions are developed which can 
be incorporated into your current version of Stata. It is possible to acquire 
and manage downloads from the internet using the command net. 
The findit command can be used to search the Stata site and other sites for 
information. For example imagine that you heard about a program to draw graphs 
using quasi-variance estimates, then using the syntax findit qvgraph would lead 
you to the module written by Aspen Chen of the University of Connecticut. 

Many new packages are deposited at the Statistical Software Components (SSC) 
archive which is sometime called the Boston College Archive and is administered 
by http://repec.org . 

The SSC archive has become the premier Stata download site for user-written 
software and also archives proceedings of Stata Users Group meetings and 
conferences. Programmes can be downloaded from the SSC archive using the syntax
ssc install followed by the new programme’s name. 

Participants who do not have administrative access to Stata 
(for example when working on their university network), may first require 
permission to download packages. 

An alternative approach may be to set up an area locally where you have write 
access (e.g. c:\temp ) and then use the following Stata syntax

	global path10 "c:\temp\"
	capture mkdir $path10\stata
	capture mkdir $path10\stata\ado
	adopath +  $path10\stata\ado
	net set ado $path10\stata\ado

You can test this by installing a package from SSC for example the estout 
package

ssc install estout

Help on this new package should then be available

		help estout


**/



********************************************************************************

/**

WARNING!

No micro data will be distributed within this file.

The files required are provided in a repository.

Participants MAY NOT make copies of these files or distribute them.

The files have been sepcially created for training and MUST not be 
used for social science research.

THE DATA ARE NOT REAL! DO NOT USE THEM FOR REAL ANALYSES!

We advise that participants galvanise their training experience and
work with 'genuine' data files which they
can dowload legally from the UK Data Service (http://ukdataservice.ac.uk/ -
the old site is www.esds.ac.uk but you will be redirected).

At workshops where real survey datasets are used participants MUST sign 
a data access agreement.

********************************************************************************

 © Vernon Gayle, University of Edinburgh.

This file has been produced for NCRM by Professor Vernon Gayle.

Any material in this file must not be reproduced, 
published or used for teaching without written permission from 
Professor Vernon Gayle. 

Many of the ideas and examples presented in this file draw heavily on
previous work. We are grateful for the comments and feedback from participants 
of earlier workshops. 

Professor Vernon Gayle (vernon.gayle@ed.ac.uk) 


********************************************************************************

**/


* End of file *


