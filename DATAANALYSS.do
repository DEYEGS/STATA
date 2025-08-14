
*************************************************************************************************************************************************************
************************************************Code Created By*************************************************************************************
**************************************************ARON YEGON*************************************************************************************
*************************************************************************************************************************************************************
capture log close

cd "C:\Users\user\OneDrive\Desktop\aron\Stata\STATA NOTES\"
use "dataX.dta", clear


log using dataXX.log, replace

*********************************************DATA CLEANING AND PREPROCESSING***********************************************************************************
drop v1
drop if missing(no)
*general matemathical expressions for numeric variables
sum
*gives description of variables [data types, variable label]
describe
*sorting by more than one variables
gsort datetreatmentstarted no
*general description of each variable and mostly used to find the number of missing values.
codebook enrolment

count if enrolment=="X"
drop if enrolment=="X"
 
codebook educationlevel
count if educationlevel=="X"
drop if educationlevel=="X"

codebook tbregistrationno
drop if tbregistrationno=="X" | tbregistrationno=="XXX" 
*drop if missing(tbregistrationno)
codebook tbregistrationno

codebook tbregistrationno
encode tbregistrationno, gen(tbregistrationno_) 
replace tbregistrationno_= tbregistrationno_[_n-1] if missing(tbregistrationno_) 
sort tbregistrationno_

*drop if tbregistrationno==" "

rename enrolment enrolment_v1
rename visit1 visit2_
rename visit2 visit3_
rename visit3 visit4_

encode enrolment_v1, gen(enrolment_v1_)
encode visit2_, gen(visit2__)
encode visit3_, gen(visit3__)
encode visit4_, gen(visit4__)
encode rxcompletion, gen(rxcompletion_)
**visits from enrolment period to 3rd visit
gen enrolment_v1_v2_v3=.
replace enrolment_v1_v2_v3=1 if enrolment_v1_ !=. & visit2__ !=. & visit3__ !=.
replace enrolment_v1_v2_v3=0 if enrolment_v1_v2_v3==.
label variable enrolment_v1_v2_v3 "VISITS FROM ENROLMENT TO MONTH 6(VISIT 3__)"
**visits from 2nd visit to the last visit
gen v2_v3_v4=.
replace v2_v3_v4=1 if visit2__ !=. & visit3__ !=. & visit4__ !=.
replace v2_v3_v4=0 if v2_v3_v4==.
label variable v2_v3_v4 "VISITS FROM MONTH 2 TO COMPLETION"

replace  hiv_status="NEG" if  hiv_status=="NOR"
replace  lang_prefer_use="SWA" if lang_prefer_use=="K"
replace  net_used="S" if net_used=="s"
replace  lang_read="ENG" if  lang_read=="N"
replace  lang_read="SWA" if  lang_read=="K"
replace  time_to_SMS="ANYTIME" if  time_to_SMS=="AT"
replace placespent_time_most="SCHOOL" if  placespent_time_most=="S"
replace  phone_share="NO" if  phone_share=="N"
replace hivcontactsmale="0" if hivcontactsmale=="NR"
replace hivcontactsfemale="0" if hivcontactsfemale=="NR"
replace total_hivcontacts="0" if total_hivcontacts=="NR"
replace sex="Female" if sex=="F"
replace sex="Male" if sex=="M"
tab sex
replace  refferedfrom="WARD" if  refferedfrom=="WORD"
tab refferedfrom
**changind string variables to integers(numerics)
encode weight, gen (weight_)
encode age,gen (age_)
encode  pple_liveinhouse, gen ( pple_liveinhouse_)
encode  malecontacts, gen ( malecontacts_)
encode  femalecontacts, gen ( femalecontacts_)
encode  pple_livewithLess5yrs, gen (pple_livewithLess5yrs_)
encode less5yrsmale ,gen (less5yrsmale_)
encode less5yrsf ,gen (less5yrsf_)
encode  total_hivcontacts , gen (total_hivcontacts_)
encode  hivcontactsmale , gen (hivcontactsmale_)
encode  hivcontactsfemale, gen (hivcontactsfemale_)
encode  dist_toclinic_km , gen (dist_toclinic_km_)
encode  timetoclinic_mins, gen (timetoclinic_mins_)

gen incomelevel_= incomelevel if incomelevel != "-"
replace incomelevel_=incomelevel_[_n-1] if missing(incomelevel_)
replace incomelevel_=incomelevel_[_n-1] if incomelevel_=="P"
label variable incomelevel_ "Income Level"


*browse no phoneusage_Type phone_access_internet less5yrsmale_ less5yrsf_ total_hivcontacts_ hivcontactsmale_ hivcontactsfemale if enrolment_v1_v2_v3==1 & v2_v3_v4==1
 
*educationlevel
gen educationlevel__=.
replace educationlevel__=0 if educationlevel=="NONE"
replace educationlevel__=1 if educationlevel=="PRIMARY"
replace educationlevel__=2 if educationlevel=="SECONDARY"
replace educationlevel__=3 if educationlevel=="COLLEGE"
replace educationlevel__=4 if educationlevel=="UNIVERSITY"

label variable educationlevel__ "Education Level"
label define educationlevel__ 0 "NONE" 1 "PRIMARY" 2 "SECONDARY" 3 "COLLEGE" 4 "UNIVERSITY"
label values educationlevel__ educationlevel__
tab educationlevel__

*maritalstatus
gen maritalstatus_=.
replace maritalstatus_=0 if maritalstatus=="DIVORCED"
replace maritalstatus_=1 if maritalstatus=="SINGLE"
replace maritalstatus_=2 if maritalstatus=="MARRIED"
replace maritalstatus_=3 if maritalstatus=="WIDOWED"

label variable maritalstatus_ "Marital Status"
label define maritalstatus_ 0 "DIVORCED" 1 "SINGLE" 2 "MARRIED" 3 "WIDOWED"
label values maritalstatus_ maritalstatus_
bysort educationlevel__: table maritalstatus_ if enrolment_v1_v2_v3==1 & v2_v3_v4==1
tab maritalstatus_

**sex
gen sex_=.
replace sex_=0 if sex=="Female"
replace sex_=1 if sex=="Male"
label define sex_ 0 "Female" 1 "Male"
label variable sex_ "sexgroups"
label values sex_ sex_
tab sex_

*placespent_time_most
gen placespent_time_most_=.
replace placespent_time_most_=0 if placespent_time_most=="OTHER"
replace placespent_time_most_=1 if placespent_time_most=="HOME"
replace placespent_time_most_=2 if placespent_time_most=="SOCIAL PLACE"
replace placespent_time_most_=3 if placespent_time_most=="COLLEGE"
replace placespent_time_most_=4 if placespent_time_most=="SCHOOL"
replace placespent_time_most_=5 if placespent_time_most=="WORK"
label variable placespent_time_most_ "placespent_time_most"
label define placespent_time_most_ 0 "OTHER" 1 "HOME" 2 "SOCIAL PLACE" 3 "COLLEGE" 4 "SCHOOL" 5 "WORK"
label values placespent_time_most_ placespent_time_most_
tab placespent_time_most_
*drop variables/columns that are not important anymore
drop enrolment_v1 visit2_ visit3_ visit4_ rxcompletion educationlevel tbregistrationno weight age pple_liveinhouse malecontacts femalecontacts pple_livewithLess5yrs less5yrsmale less5yrsf total_hivcontacts hivcontactsmale hivcontactsfemale dist_toclinic_km timetoclinic_mins incomelevel
***functions like a loop for handling many variables
foreach X of varlist  phoneusage_Type phone_access_internet pple_liveinhouse_ pple_livewithLess5yrs_ less5yrsmale_ less5yrsf_ total_hivcontacts_ hivcontactsmale_ hivcontactsfemale_{
tab `X'  educationlevel__ if enrolment_v1_v2_v3==1, col
}

foreach X of varlist  pple_liveinhouse_ pple_livewithLess5yrs_ less5yrsmale_ less5yrsf_ total_hivcontacts_ hivcontactsmale_ hivcontactsfemale_{
tabstat `X'  educationlevel__ if enrolment_v1_v2_v3==1 ,m stat(n p25 p50 p75) 
}

foreach Y of varlist pple_liveinhouse_ pple_livewithLess5yrs_ less5yrsmale_ less5yrsf_ total_hivcontacts_ hivcontactsmale_ hivcontactsfemale_{
tabstat `Y'  educationlevel__ if enrolment_v1_v2_v3==1 ,m stat(n p25 p50 p75)
}
*********************EXPLORATORY DATA ANALYSIS****************************
table occupation educationlevel__, by(sex_) c(mean weight_ mean age_) sc format(%9.3f) row
*****Categorical Variables*********
tab occupation
table occupation, c(mean weight_ mean age_) col
tab educationlevel__
tab incomelevel_ 
tab sex_

sort educationlevel__
by educationlevel__: sum age_ weight_ if  enrolment_v1_v2_v3==1 &  v2_v3_v4==1, detail

sort occupation
by occupation: sum age_ weight_ if  enrolment_v1_v2_v3==1 &  v2_v3_v4==1, detail

gsort sex_ occupation
by sex_ occupation: sum age_ weight_ if  enrolment_v1_v2_v3==1 &  v2_v3_v4==1, detail

gsort sex_ occupation
by sex_ occupation: tab educationlevel__ if  enrolment_v1_v2_v3==1 &  v2_v3_v4==1, sum(age_)


sort educationlevel__
by educationlevel__: tab  phone_access_internet if  enrolment_v1_v2_v3==1 &  v2_v3_v4==1, sum(age_)

sort educationlevel__
by educationlevel__: tab net_used if  enrolment_v1_v2_v3==1 &  v2_v3_v4==1, sum(age_)

sort educationlevel__
by educationlevel__: tab  phone_Type if  enrolment_v1_v2_v3==1 &  v2_v3_v4==1, sum(age_)

sort sex_
by sex_: tab phone_Type if  enrolment_v1_v2_v3==1 &  v2_v3_v4==1, sum(age_)



     

**educationlevel
bysort educationlevel : tab sex_ if enrolment_v1_v2_v3==1
bysort educationlevel : tab total_hivcontacts_ if enrolment_v1_v2_v3==1
tab educationlevel__ sex_ if enrolment_v1_v2_v3==0
tab educationlevel__ sex_ if enrolment_v1_v2_v3==1

table educationlevel, by(sex) col 
table educationlevel__ if enrolment_v1_v2_v3==1, by(occupation) c(mean pple_livewithLess5yrs_ count pple_livewithLess5yrs_ mean pple_liveinhouse_ count pple_liveinhouse_) col

rename less5yrsf_ less5yrsfemale_
tabstat pple_liveinhouse_  pple_livewithLess5yrs_ less5yrsmale_ less5yrsfemale_, by(educationlevel__) stats(n p25 p50 p75)format long col(stat)

**weight - continuous variable
tabstat weight_ if enrolment_v1_v2_v3==1, stats(n min p25 p50 p75 max)
sum weight_ if enrolment_v1_v2_v3==1, detail
**age  - continuous variable
tabstat age_ if enrolment_v1_v2_v3==1, m stats(n min p25 p50 p75 max)
sum age_ if enrolment_v1_v2_v3==1, detail

*sex - categorical variable
tab sex if enrolment_v1_v2_v3==1
tab sex if enrolment_v1_v2_v3==0

ttest (weight_),by(sex)
****Phone
tab  phone_access_internet net_used
tab  phone_Type net_used
tab  phone_access_internet phone_Type
tab  lang_read lang_prefer_use
tab educationlevel placespent_time_most,row
**occupation  - categrical variable
table  occupation trans_means, col
table  occupation trans_means if cost_toclinic==0, col
table  occupation trans_means if cost_toclinic!=0, col
table  occupation time_to_SMS, col

***************************************************VISUALIZATIONS*********************************************************************************
**histogram for how the data is distributed
hist weight_,frequency normal
histogram age_, frequency normal 
****box plots for extreme values/outliers
graph box weight_ if sex=="Male", title("Box plot for Male's weight")
graph box weight_ if sex=="Female", title("Box plot for Female's weight")
graph box  age_ weight_ , over(educationlevel)  title("Box plot for Sex and Weight against Education levels")
graph box age_, over(sex)
******bar graphs
separate sex_, by(sex_)
graph bar (count) sex_0 sex_1, by(educationlevel) legend(order(1 "Male" 2 "Female")) bargap(0.2) 
twoway (scatter age_ weight_) , ytitle("Age") xtitle("Weight")

tab placespent_time_most_
separate  placespent_time_most_,by(placespent_time_most_)
graph bar (count) placespent_time_most_0 placespent_time_most_1 placespent_time_most_2 placespent_time_most_3 placespent_time_most_4 placespent_time_most_5, legend(order(0 "OTHER" 1 "HOME" 2 "SOCIAL PLACE" 3 "COLLEGE" 4 "SCHOOL" 5 "WORK")) blabel(bar, position(outside))

graph bar (mean) weight_, over(sex) legend(order(0 "FEMALE" 1 "MALE")) bargap(0.1) blabel(bar,  color(white) position(inside)) title("mean weight for sex categories")  ytitle("mean weight")
graph bar (mean) age_, over(sex_) legend(order(0 "FEMALE" 1 "MALE")) bargap(0.1) blabel(bar,  color(red) position(top)) title("mean age for sex categories")  ytitle("mean age")

graph bar age_, over(educationlevel__) legend(order(0 "NONE" 1 "PRIMARY" 2 "SECONDARY" 3 "COLLEGE" 4 "UNIVERSITY")) blabel(bar, color(white) position(inside))
graph bar weight_, over(educationlevel__) bargap(0.2) legend(order(0 "NONE" 1 "PRIMARY" 2 "SECONDARY" 3 "COLLEGE" 4 "UNIVERSITY")) blabel(bar, color(green) position(outside))
	**REGRESSION ANALYSIS**
regress age_ weight_ pple_liveinhouse_ pple_livewithLess5yrs_ less5yrsmale_ less5yrsfemale_
*predict y
*twoway (scatter pple_liveinhouse_ weight_) (line y weight_)

regress age_ weight_
predict y
twoway (scatter age_ weight_) (line y weight_)

save dataXX.dta, replace

log close
