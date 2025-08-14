# STATA
This is the practical statistical data analysis for medical data using STATA software right from data cleaning to data wrangling/preprocessing and finally to data visualization.

The following is the code written in STATA commands alongside the outputs for each command:

---------------------------------------------------------------------------------------------------------------------------------------------------------
      name:  <unnamed>
       log:  C:\Users\user\OneDrive\Desktop\aron\Stata\STATA NOTES\dataXX.log
  log type:  text
 opened on:  13 Aug 2025, 13:41:28

. 
. *****************DATA CLEANING AND PREPROCESSING**********************************************************************
. drop v1

. drop if missing(no)
(699 observations deleted)

. *general matemathical expressions for numeric variables
. sum

    Variable |       Obs        Mean    Std. Dev.       Min        Max
-------------+--------------------------------------------------------
          no |       200       100.5    57.87918          1        200
    tbclinic |         0
researchas~t |         0
datetreatm~d |         0
   enrolment |         0
-------------+--------------------------------------------------------
      visit1 |         0
      visit2 |         0
      visit3 |         0
rxcompletion |         0
researchcode |         0
-------------+--------------------------------------------------------
tbregistra~o |         0
           a |         0
dataofinte~w |         0
         sex |         0
      weight |         0
-------------+--------------------------------------------------------
         age |         0
refferedfrom |         0
    religion |         0
  occupation |         0
 incomelevel |         0
-------------+--------------------------------------------------------
educationl~l |         0
maritalsta~s |         0
placespent~t |         0
pple_livei~e |         0
malecontacts |         0
-------------+--------------------------------------------------------
femalecont~s |         0
pple_livew~s |         0
less5yrsmale |         0
   less5yrsf |         0
total_hivc~s |         0
-------------+--------------------------------------------------------
hivcon~smale |         0
hivcon~emale |         0
dist_tocli~m |         0
 trans_means |         0
timetoclin~s |         0
-------------+--------------------------------------------------------
cost_tocli~c |       199    32.71357    59.72727          0        300
  hiv_status |         0
  phone_Type |         0
    net_used |         0
phoneusage~e |         0
-------------+--------------------------------------------------------
phone_acce~t |         0
 phone_share |         0
phoneshareTo |         0
   lang_read |         0
lang_prefe~e |         0
-------------+--------------------------------------------------------
 time_to_SMS |         0

. *gives description of variables [data types, variable label]
. describe

Contains data from dataX.dta
  obs:           200                          
 vars:            46                          11 Jul 2024 14:57
 size:        48,200                          
---------------------------------------------------------------------------------------------------------------------------------------------------------
              storage  display     value
variable name   type   format      label      variable label
---------------------------------------------------------------------------------------------------------------------------------------------------------
no              int    %8.0g                  NO
tbclinic        str6   %9s                    TB clinic
researchassis~t str8   %9s                    Research assistant
datetreatment~d str10  %10s                   Date treatment started
enrolment       str6   %9s                    Start date
visit1          str5   %9s                    2nd month sputum date
visit2          str7   %9s                    5th Month sputum
visit3          str6   %9s                    6th Month sputum
rxcompletion    str6   %9s                    RX completion
researchcode    str6   %9s                    Research code
tbregistratio~o str9   %9s                    TB registration no
a               str1   %9s                    A
dataofinterview str10  %10s                   DATA OF INTERVIEW
sex             str1   %9s                    Sex
weight          str4   %9s                    Weight
age             str2   %9s                    Age
refferedfrom    str10  %10s                   REFFERED FROM
religion        str10  %10s                   RELIGION
occupation      str10  %10s                   OCCUPATION
incomelevel     str8   %9s                    INCOME LEVEL
educationlevel  str10  %10s                   EDUCATION LEVEL
maritalstatus   str9   %9s                    MARITAL STATUS
placespent_ti~t str12  %12s                   Where do you spend most of your time during the day
pple_liveinho~e str2   %9s                    How many people do you live with in your house (household contacts)?
malecontacts    str1   %9s                    MALE CONTACTS
femalecontacts  str1   %9s                    FEMALE CONTACTS
pple_livewith~s str1   %9s                    LESS 5 YRS TOTAL From those you live with, how many are aged less than 5 years?
less5yrsmale    str1   %9s                    LESS 5 YRS MALE
less5yrsf       str1   %9s                    LESS 5 YRS F
total_hivcont~s str2   %9s                    HIV CONTACTS TOTAL From those you live with, how many are living with HIV?
hivcontactsmale str2   %9s                    HIV CONTACTS MALE
hivcontactsfe~e str2   %9s                    HIV CONTACTS FEMALE
dist_toclinic~m str5   %9s                    DISTANCE IN KM What is the distance from Home to TB Clinic (in km)
trans_means     str12  %12s                   Which means do you use to get to the TB clinic?
timetoclinic_~s str3   %9s                    MINUTES How long does it take you to get to the TB clinic? (In Minutes/Hrs)
cost_toclinic   int    %8.0g                  How much does it cost you from home to the TB clinic (in ksh)
hiv_status      str5   %9s                    What is your HIV status
phone_Type      str8   %9s                    What kind of phone do you have?
net_used        str3   %9s                    To which network do you subscribe?
phoneusage_Type str4   %9s                    What do you use your mobile phone for
phone_access_~t str3   %9s                    INTERNET Is your phone (or any of your phones) able to access the internet?
phone_share     str3   %9s                    Do you share your mobile phone with any other person?
phoneshareTo    str8   %9s                    Whom do you share your mobile phone with?
lang_read       str4   %9s                    Which language are you able to read SMS?
lang_prefer_use str3   %9s                    Which language would you like us to use in sending the SMS
time_to_SMS     str7   %9s                    What time would you like us to send the SMS to you
---------------------------------------------------------------------------------------------------------------------------------------------------------
Sorted by:  
     Note:  dataset has changed since last saved

. *sorting by more than one variables
. gsort datetreatmentstarted no

. *general description of each variable and mostly used to find the number of missing values.
. codebook enrolment

---------------------------------------------------------------------------------------------------------------------------------------------------------
enrolment                                                                                                                                      Start date
---------------------------------------------------------------------------------------------------------------------------------------------------------

                  type:  string (str6), but longest is str3

         unique values:  12                       missing "":  0/200

              examples:  "FEB"
                         "JAN"
                         "JUL"
                         "MAY"

. 
. count if enrolment=="X"
    6

. drop if enrolment=="X"
(6 observations deleted)

.  
. codebook educationlevel

----------------------------------------------------------------------------------------------------------------------------------
educationlevel                                                                                                                            EDUCATION LEVEL
----------------------------------------------------------------------------------------------------------------------------------

                  type:  string (str10)

         unique values:  6                        missing "":  0/194

            tabulation:  Freq.  Value
                            31  "COLLEGE"
                             2  "NONE"
                            73  "PRIMARY"
                            79  "SECONDARY"
                             8  "UNIVERSITY"
                             1  "X"

. count if educationlevel=="X"
    1

. drop if educationlevel=="X"
(1 observation deleted)

. 
. codebook tbregistrationno

------------------------------------------------------------------------------------------------------------------------------
tbregistrationno                                                                                                                       TB registration no
------------------------------------------------------------------------------------------------------------------------------

                  type:  string (str9)

         unique values:  106                      missing "":  18/193

              examples:  "05/19"
                         "29/19"
                         "416/19"
                         "69/19"

. drop if tbregistrationno=="X" | tbregistrationno=="XXX" 
(4 observations deleted)

. *drop if missing(tbregistrationno)
. codebook tbregistrationno

------------------------------------------------------------------------------------------------------------------------------
tbregistrationno                                                                                                                       TB registration no
------------------------------------------------------------------------------------------------------------------------------

                  type:  string (str9)

         unique values:  104                      missing "":  18/189

              examples:  "019/19"
                         "25/4/19"
                         "41/19"
                         "66/19"

. 
. codebook tbregistrationno

---------------------------------------------------------------------------------------------------------------------------------------------------------
tbregistrationno                                                                                                                       TB registration no
---------------------------------------------------------------------------------------------------------------------------------------------------------

                  type:  string (str9)

         unique values:  104                      missing "":  18/189

              examples:  "019/19"
                         "25/4/19"
                         "41/19"
                         "66/19"

. encode tbregistrationno, gen(tbregistrationno_) 

. replace tbregistrationno_= tbregistrationno_[_n-1] if missing(tbregistrationno_) 
(18 real changes made)

. sort tbregistrationno_

. 
. *drop if tbregistrationno==" "
. 
. rename enrolment enrolment_v1

. rename visit1 visit2_

. rename visit2 visit3_

. rename visit3 visit4_

. 
. encode enrolment_v1, gen(enrolment_v1_)

. encode visit2_, gen(visit2__)

. encode visit3_, gen(visit3__)

. encode visit4_, gen(visit4__)

. encode rxcompletion, gen(rxcompletion_)

. **visits from enrolment period to 3rd visit
. gen enrolment_v1_v2_v3=.
(189 missing values generated)

. replace enrolment_v1_v2_v3=1 if enrolment_v1_ !=. & visit2__ !=. & visit3__ !=.
(187 real changes made)

. replace enrolment_v1_v2_v3=0 if enrolment_v1_v2_v3==.
(2 real changes made)

. label variable enrolment_v1_v2_v3 "VISITS FROM ENROLMENT TO MONTH 6(VISIT 3__)"

. **visits from 2nd visit to the last visit
. gen v2_v3_v4=.
(189 missing values generated)

. replace v2_v3_v4=1 if visit2__ !=. & visit3__ !=. & visit4__ !=.
(187 real changes made)

. replace v2_v3_v4=0 if v2_v3_v4==.
(2 real changes made)

. label variable v2_v3_v4 "VISITS FROM MONTH 2 TO COMPLETION"

. 
. replace  hiv_status="NEG" if  hiv_status=="NOR"
(2 real changes made)

. replace  lang_prefer_use="SWA" if lang_prefer_use=="K"
(1 real change made)

. replace  net_used="S" if net_used=="s"
(4 real changes made)

. replace  lang_read="ENG" if  lang_read=="N"
(1 real change made)

. replace  lang_read="SWA" if  lang_read=="K"
(1 real change made)

. replace  time_to_SMS="ANYTIME" if  time_to_SMS=="AT"
(3 real changes made)

. replace placespent_time_most="SCHOOL" if  placespent_time_most=="S"
(1 real change made)

. replace  phone_share="NO" if  phone_share=="N"
(11 real changes made)

. replace hivcontactsmale="0" if hivcontactsmale=="NR"
(1 real change made)

. replace hivcontactsfemale="0" if hivcontactsfemale=="NR"
(1 real change made)

. replace total_hivcontacts="0" if total_hivcontacts=="NR"
(2 real changes made)

. replace sex="Female" if sex=="F"
sex was str1 now str6
(59 real changes made)

. replace sex="Male" if sex=="M"
(130 real changes made)

. tab sex

        Sex |      Freq.     Percent        Cum.
------------+-----------------------------------
     Female |         59       31.22       31.22
       Male |        130       68.78      100.00
------------+-----------------------------------
      Total |        189      100.00

. replace  refferedfrom="WARD" if  refferedfrom=="WORD"
(1 real change made)

. tab refferedfrom

   REFFERED |
       FROM |      Freq.     Percent        Cum.
------------+-----------------------------------
  COMMUNITY |         11        5.85        5.85
   FACILITY |          1        0.53        6.38
        GOK |          1        0.53        6.91
 HIV CLINIC |         17        9.04       15.96
     KIAMBU |          2        1.06       17.02
        KNH |          1        0.53       17.55
        OPD |        126       67.02       84.57
      OTHER |         14        7.45       92.02
       SELF |         12        6.38       98.40
       WARD |          3        1.60      100.00
------------+-----------------------------------
      Total |        188      100.00

. **changind string variables to integers(numerics)
. encode weight, gen (weight_)

. encode age,gen (age_)

. encode  pple_liveinhouse, gen ( pple_liveinhouse_)

. encode  malecontacts, gen ( malecontacts_)

. encode  femalecontacts, gen ( femalecontacts_)

. encode  pple_livewithLess5yrs, gen (pple_livewithLess5yrs_)

. encode less5yrsmale ,gen (less5yrsmale_)

. encode less5yrsf ,gen (less5yrsf_)

. encode  total_hivcontacts , gen (total_hivcontacts_)

. encode  hivcontactsmale , gen (hivcontactsmale_)

. encode  hivcontactsfemale, gen (hivcontactsfemale_)

. encode  dist_toclinic_km , gen (dist_toclinic_km_)

. encode  timetoclinic_mins, gen (timetoclinic_mins_)

. 
. gen incomelevel_= incomelevel if incomelevel != "-"
(70 missing values generated)

. replace incomelevel_=incomelevel_[_n-1] if missing(incomelevel_)
(70 real changes made)

. replace incomelevel_=incomelevel_[_n-1] if incomelevel_=="P"
(2 real changes made)

. label variable incomelevel_ "Income Level"

. 
. 
. *browse no phoneusage_Type phone_access_internet less5yrsmale_ less5yrsf_ total_hivcontacts_ hivcontactsmale_ hivcontactsfemale if enrolment_v1_v2_v3==
> 1 & v2_v3_v4==1
.  
. *educationlevel
. gen educationlevel__=.
(189 missing values generated)

. replace educationlevel__=0 if educationlevel=="NONE"
(2 real changes made)

. replace educationlevel__=1 if educationlevel=="PRIMARY"
(72 real changes made)

. replace educationlevel__=2 if educationlevel=="SECONDARY"
(77 real changes made)

. replace educationlevel__=3 if educationlevel=="COLLEGE"
(30 real changes made)

. replace educationlevel__=4 if educationlevel=="UNIVERSITY"
(8 real changes made)

. 
. label variable educationlevel__ "Education Level"

. label define educationlevel__ 0 "NONE" 1 "PRIMARY" 2 "SECONDARY" 3 "COLLEGE" 4 "UNIVERSITY"

. label values educationlevel__ educationlevel__

. tab educationlevel__

  Education |
      Level |      Freq.     Percent        Cum.
------------+-----------------------------------
       NONE |          2        1.06        1.06
    PRIMARY |         72       38.10       39.15
  SECONDARY |         77       40.74       79.89
    COLLEGE |         30       15.87       95.77
 UNIVERSITY |          8        4.23      100.00
------------+-----------------------------------
      Total |        189      100.00

. 
. *maritalstatus
. gen maritalstatus_=.
(189 missing values generated)

. replace maritalstatus_=0 if maritalstatus=="DIVORCED"
(13 real changes made)

. replace maritalstatus_=1 if maritalstatus=="SINGLE"
(68 real changes made)

. replace maritalstatus_=2 if maritalstatus=="MARRIED"
(105 real changes made)

. replace maritalstatus_=3 if maritalstatus=="WIDOWED"
(3 real changes made)

. 
. label variable maritalstatus_ "Marital Status"

. label define maritalstatus_ 0 "DIVORCED" 1 "SINGLE" 2 "MARRIED" 3 "WIDOWED"

. label values maritalstatus_ maritalstatus_

. bysort educationlevel__: table maritalstatus_ if enrolment_v1_v2_v3==1 & v2_v3_v4==1

---------------------------------------------------------------------------------------------------------------------------------------------------------
-> educationlevel__ = NONE

----------------------
Marital   |
Status    |      Freq.
----------+-----------
   SINGLE |          1
  MARRIED |          1
----------------------

---------------------------------------------------------------------------------------------------------------------------------------------------------
-> educationlevel__ = PRIMARY

----------------------
Marital   |
Status    |      Freq.
----------+-----------
 DIVORCED |         11
   SINGLE |         15
  MARRIED |         45
  WIDOWED |          1
----------------------

---------------------------------------------------------------------------------------------------------------------------------------------------------
-> educationlevel__ = SECONDARY

----------------------
Marital   |
Status    |      Freq.
----------+-----------
 DIVORCED |          2
   SINGLE |         33
  MARRIED |         41
----------------------

---------------------------------------------------------------------------------------------------------------------------------------------------------
-> educationlevel__ = COLLEGE

----------------------
Marital   |
Status    |      Freq.
----------+-----------
   SINGLE |         13
  MARRIED |         15
  WIDOWED |          2
----------------------

---------------------------------------------------------------------------------------------------------------------------------------------------------
-> educationlevel__ = UNIVERSITY

----------------------
Marital   |
Status    |      Freq.
----------+-----------
   SINGLE |          4
  MARRIED |          3
----------------------

. tab maritalstatus_

    Marital |
     Status |      Freq.     Percent        Cum.
------------+-----------------------------------
   DIVORCED |         13        6.88        6.88
     SINGLE |         68       35.98       42.86
    MARRIED |        105       55.56       98.41
    WIDOWED |          3        1.59      100.00
------------+-----------------------------------
      Total |        189      100.00

. 
. **sex
. gen sex_=.
(189 missing values generated)

. replace sex_=0 if sex=="Female"
(59 real changes made)

. replace sex_=1 if sex=="Male"
(130 real changes made)

. label define sex_ 0 "Female" 1 "Male"

. label variable sex_ "sexgroups"

. label values sex_ sex_

. tab sex_

  sexgroups |      Freq.     Percent        Cum.
------------+-----------------------------------
     Female |         59       31.22       31.22
       Male |        130       68.78      100.00
------------+-----------------------------------
      Total |        189      100.00

. 
. *placespent_time_most
. gen placespent_time_most_=.
(189 missing values generated)

. replace placespent_time_most_=0 if placespent_time_most=="OTHER"
(11 real changes made)

. replace placespent_time_most_=1 if placespent_time_most=="HOME"
(46 real changes made)

. replace placespent_time_most_=2 if placespent_time_most=="SOCIAL PLACE"
(4 real changes made)

. replace placespent_time_most_=3 if placespent_time_most=="COLLEGE"
(1 real change made)

. replace placespent_time_most_=4 if placespent_time_most=="SCHOOL"
(7 real changes made)

. replace placespent_time_most_=5 if placespent_time_most=="WORK"
(120 real changes made)

. label variable placespent_time_most_ "placespent_time_most"

. label define placespent_time_most_ 0 "OTHER" 1 "HOME" 2 "SOCIAL PLACE" 3 "COLLEGE" 4 "SCHOOL" 5 "WORK"

. label values placespent_time_most_ placespent_time_most_

. tab placespent_time_most_

placespent_t |
    ime_most |      Freq.     Percent        Cum.
-------------+-----------------------------------
       OTHER |         11        5.82        5.82
        HOME |         46       24.34       30.16
SOCIAL PLACE |          4        2.12       32.28
     COLLEGE |          1        0.53       32.80
      SCHOOL |          7        3.70       36.51
        WORK |        120       63.49      100.00
-------------+-----------------------------------
       Total |        189      100.00

. *drop variables/columns that are not important anymore
. drop enrolment_v1 visit2_ visit3_ visit4_ rxcompletion educationlevel tbregistrationno weight age pple_liveinhouse malecontacts femalecontacts pple_liv
> ewithLess5yrs less5yrsmale less5yrsf total_hivcontacts hivcontactsmale hivcontactsfemale dist_toclinic_km timetoclinic_mins incomelevel

. ***functions like a loop for handling many variables
. foreach X of varlist  phoneusage_Type phone_access_internet pple_liveinhouse_ pple_livewithLess5yrs_ less5yrsmale_ less5yrsf_ total_hivcontacts_ hivcon
> tactsmale_ hivcontactsfemale_{
  2. tab `X'  educationlevel__ if enrolment_v1_v2_v3==1, col
  3. }

+-------------------+
| Key               |
|-------------------|
|     frequency     |
| column percentage |
+-------------------+

   What do |
   you use |
      your |
    mobile |                    Education Level
 phone for |      NONE    PRIMARY  SECONDARY    COLLEGE  UNIVERSIT |     Total
-----------+-------------------------------------------------------+----------
        12 |         1         47         34         10          0 |        92 
           |     50.00      65.28      44.74      33.33       0.00 |     49.20 
-----------+-------------------------------------------------------+----------
      1234 |         1         25         42         20          7 |        95 
           |     50.00      34.72      55.26      66.67     100.00 |     50.80 
-----------+-------------------------------------------------------+----------
     Total |         2         72         76         30          7 |       187 
           |    100.00     100.00     100.00     100.00     100.00 |    100.00 


+-------------------+
| Key               |
|-------------------|
|     frequency     |
| column percentage |
+-------------------+

  INTERNET |
   Is your |
 phone (or |
    any of |
      your |
   phones) |
   able to |
access the |                    Education Level
 internet? |      NONE    PRIMARY  SECONDARY    COLLEGE  UNIVERSIT |     Total
-----------+-------------------------------------------------------+----------
        NO |         2         49         37         10          0 |        98 
           |    100.00      68.06      48.68      33.33       0.00 |     52.41 
-----------+-------------------------------------------------------+----------
       YES |         0         23         39         20          7 |        89 
           |      0.00      31.94      51.32      66.67     100.00 |     47.59 
-----------+-------------------------------------------------------+----------
     Total |         2         72         76         30          7 |       187 
           |    100.00     100.00     100.00     100.00     100.00 |    100.00 


+-------------------+
| Key               |
|-------------------|
|     frequency     |
| column percentage |
+-------------------+

  How many |
 people do |
  you live |
   with in |
your house |
(household |                    Education Level
contacts)? |      NONE    PRIMARY  SECONDARY    COLLEGE  UNIVERSIT |     Total
-----------+-------------------------------------------------------+----------
         0 |         0          4          4          0          1 |         9 
           |      0.00       5.56       5.26       0.00      14.29 |      4.81 
-----------+-------------------------------------------------------+----------
         1 |         2         19         19          8          0 |        48 
           |    100.00      26.39      25.00      26.67       0.00 |     25.67 
-----------+-------------------------------------------------------+----------
        10 |         0          0          2          0          0 |         2 
           |      0.00       0.00       2.63       0.00       0.00 |      1.07 
-----------+-------------------------------------------------------+----------
         2 |         0         16         19          5          3 |        43 
           |      0.00      22.22      25.00      16.67      42.86 |     22.99 
-----------+-------------------------------------------------------+----------
         3 |         0         13         16         12          1 |        42 
           |      0.00      18.06      21.05      40.00      14.29 |     22.46 
-----------+-------------------------------------------------------+----------
         4 |         0         13          9          4          1 |        27 
           |      0.00      18.06      11.84      13.33      14.29 |     14.44 
-----------+-------------------------------------------------------+----------
         5 |         0          7          3          0          0 |        10 
           |      0.00       9.72       3.95       0.00       0.00 |      5.35 
-----------+-------------------------------------------------------+----------
         6 |         0          0          3          1          1 |         5 
           |      0.00       0.00       3.95       3.33      14.29 |      2.67 
-----------+-------------------------------------------------------+----------
         7 |         0          0          1          0          0 |         1 
           |      0.00       0.00       1.32       0.00       0.00 |      0.53 
-----------+-------------------------------------------------------+----------
     Total |         2         72         76         30          7 |       187 
           |    100.00     100.00     100.00     100.00     100.00 |    100.00 


+-------------------+
| Key               |
|-------------------|
|     frequency     |
| column percentage |
+-------------------+

LESS 5 YRS |
TOTAL From |
 those you |
live with, |
  how many |
  are aged |
 less than |                    Education Level
  5 years? |      NONE    PRIMARY  SECONDARY    COLLEGE  UNIVERSIT |     Total
-----------+-------------------------------------------------------+----------
         0 |         2         49         46         18          4 |       119 
           |    100.00      68.06      60.53      60.00      57.14 |     63.64 
-----------+-------------------------------------------------------+----------
         1 |         0         19         25         11          3 |        58 
           |      0.00      26.39      32.89      36.67      42.86 |     31.02 
-----------+-------------------------------------------------------+----------
         2 |         0          3          4          1          0 |         8 
           |      0.00       4.17       5.26       3.33       0.00 |      4.28 
-----------+-------------------------------------------------------+----------
         3 |         0          0          1          0          0 |         1 
           |      0.00       0.00       1.32       0.00       0.00 |      0.53 
-----------+-------------------------------------------------------+----------
         5 |         0          1          0          0          0 |         1 
           |      0.00       1.39       0.00       0.00       0.00 |      0.53 
-----------+-------------------------------------------------------+----------
     Total |         2         72         76         30          7 |       187 
           |    100.00     100.00     100.00     100.00     100.00 |    100.00 


+-------------------+
| Key               |
|-------------------|
|     frequency     |
| column percentage |
+-------------------+

LESS 5 YRS |                    Education Level
      MALE |      NONE    PRIMARY  SECONDARY    COLLEGE  UNIVERSIT |     Total
-----------+-------------------------------------------------------+----------
         0 |         2         56         57         21          4 |       140 
           |    100.00      77.78      75.00      70.00      57.14 |     74.87 
-----------+-------------------------------------------------------+----------
         1 |         0         14         16          8          3 |        41 
           |      0.00      19.44      21.05      26.67      42.86 |     21.93 
-----------+-------------------------------------------------------+----------
         2 |         0          1          2          1          0 |         4 
           |      0.00       1.39       2.63       3.33       0.00 |      2.14 
-----------+-------------------------------------------------------+----------
         3 |         0          1          1          0          0 |         2 
           |      0.00       1.39       1.32       0.00       0.00 |      1.07 
-----------+-------------------------------------------------------+----------
     Total |         2         72         76         30          7 |       187 
           |    100.00     100.00     100.00     100.00     100.00 |    100.00 


+-------------------+
| Key               |
|-------------------|
|     frequency     |
| column percentage |
+-------------------+

LESS 5 YRS |                    Education Level
         F |      NONE    PRIMARY  SECONDARY    COLLEGE  UNIVERSIT |     Total
-----------+-------------------------------------------------------+----------
         0 |         2         64         63         27          7 |       163 
           |    100.00      88.89      82.89      90.00     100.00 |     87.17 
-----------+-------------------------------------------------------+----------
         1 |         0          6         12          3          0 |        21 
           |      0.00       8.33      15.79      10.00       0.00 |     11.23 
-----------+-------------------------------------------------------+----------
         2 |         0          2          1          0          0 |         3 
           |      0.00       2.78       1.32       0.00       0.00 |      1.60 
-----------+-------------------------------------------------------+----------
     Total |         2         72         76         30          7 |       187 
           |    100.00     100.00     100.00     100.00     100.00 |    100.00 


+-------------------+
| Key               |
|-------------------|
|     frequency     |
| column percentage |
+-------------------+

       HIV |
  CONTACTS |
TOTAL From |
 those you |
live with, |
  how many |
are living |                    Education Level
 with HIV? |      NONE    PRIMARY  SECONDARY    COLLEGE  UNIVERSIT |     Total
-----------+-------------------------------------------------------+----------
         0 |         2         70         73         30          7 |       182 
           |    100.00      97.22      96.05     100.00     100.00 |     97.33 
-----------+-------------------------------------------------------+----------
         1 |         0          1          3          0          0 |         4 
           |      0.00       1.39       3.95       0.00       0.00 |      2.14 
-----------+-------------------------------------------------------+----------
         3 |         0          1          0          0          0 |         1 
           |      0.00       1.39       0.00       0.00       0.00 |      0.53 
-----------+-------------------------------------------------------+----------
     Total |         2         72         76         30          7 |       187 
           |    100.00     100.00     100.00     100.00     100.00 |    100.00 


+-------------------+
| Key               |
|-------------------|
|     frequency     |
| column percentage |
+-------------------+

       HIV |
  CONTACTS |                    Education Level
      MALE |      NONE    PRIMARY  SECONDARY    COLLEGE  UNIVERSIT |     Total
-----------+-------------------------------------------------------+----------
         0 |         2         70         74         30          7 |       183 
           |    100.00      97.22      97.37     100.00     100.00 |     97.86 
-----------+-------------------------------------------------------+----------
         1 |         0          1          2          0          0 |         3 
           |      0.00       1.39       2.63       0.00       0.00 |      1.60 
-----------+-------------------------------------------------------+----------
         2 |         0          1          0          0          0 |         1 
           |      0.00       1.39       0.00       0.00       0.00 |      0.53 
-----------+-------------------------------------------------------+----------
     Total |         2         72         76         30          7 |       187 
           |    100.00     100.00     100.00     100.00     100.00 |    100.00 


+-------------------+
| Key               |
|-------------------|
|     frequency     |
| column percentage |
+-------------------+

       HIV |
  CONTACTS |                    Education Level
    FEMALE |      NONE    PRIMARY  SECONDARY    COLLEGE  UNIVERSIT |     Total
-----------+-------------------------------------------------------+----------
         0 |         2         71         74         30          7 |       184 
           |    100.00      98.61      97.37     100.00     100.00 |     98.40 
-----------+-------------------------------------------------------+----------
         1 |         0          1          2          0          0 |         3 
           |      0.00       1.39       2.63       0.00       0.00 |      1.60 
-----------+-------------------------------------------------------+----------
     Total |         2         72         76         30          7 |       187 
           |    100.00     100.00     100.00     100.00     100.00 |    100.00 


. 
. foreach X of varlist  pple_liveinhouse_ pple_livewithLess5yrs_ less5yrsmale_ less5yrsf_ total_hivcontacts_ hivcontactsmale_ hivcontactsfemale_{
  2. tabstat `X'  educationlevel__ if enrolment_v1_v2_v3==1 ,m stat(n p25 p50 p75) 
  3. }

   stats |  pple_~e_  educat~_
---------+--------------------
       N |       187       187
     p25 |         2         1
     p50 |         4         2
     p75 |         5         2
------------------------------

   stats |  pple_~s_  educat~_
---------+--------------------
       N |       187       187
     p25 |         1         1
     p50 |         1         2
     p75 |         2         2
------------------------------

   stats |  less5~e_  educat~_
---------+--------------------
       N |       187       187
     p25 |         1         1
     p50 |         1         2
     p75 |         2         2
------------------------------

   stats |  less5~f_  educat~_
---------+--------------------
       N |       187       187
     p25 |         1         1
     p50 |         1         2
     p75 |         1         2
------------------------------

   stats |  total_~_  educat~_
---------+--------------------
       N |       187       187
     p25 |         1         1
     p50 |         1         2
     p75 |         1         2
------------------------------

   stats |  h~smale_  educat~_
---------+--------------------
       N |       187       187
     p25 |         1         1
     p50 |         1         2
     p75 |         1         2
------------------------------

   stats |  h~emale_  educat~_
---------+--------------------
       N |       187       187
     p25 |         1         1
     p50 |         1         2
     p75 |         1         2
------------------------------

. 
. foreach Y of varlist pple_liveinhouse_ pple_livewithLess5yrs_ less5yrsmale_ less5yrsf_ total_hivcontacts_ hivcontactsmale_ hivcontactsfemale_{
  2. tabstat `Y'  educationlevel__ if enrolment_v1_v2_v3==1 ,m stat(n p25 p50 p75)
  3. }

   stats |  pple_~e_  educat~_
---------+--------------------
       N |       187       187
     p25 |         2         1
     p50 |         4         2
     p75 |         5         2
------------------------------

   stats |  pple_~s_  educat~_
---------+--------------------
       N |       187       187
     p25 |         1         1
     p50 |         1         2
     p75 |         2         2
------------------------------

   stats |  less5~e_  educat~_
---------+--------------------
       N |       187       187
     p25 |         1         1
     p50 |         1         2
     p75 |         2         2
------------------------------

   stats |  less5~f_  educat~_
---------+--------------------
       N |       187       187
     p25 |         1         1
     p50 |         1         2
     p75 |         1         2
------------------------------

   stats |  total_~_  educat~_
---------+--------------------
       N |       187       187
     p25 |         1         1
     p50 |         1         2
     p75 |         1         2
------------------------------

   stats |  h~smale_  educat~_
---------+--------------------
       N |       187       187
     p25 |         1         1
     p50 |         1         2
     p75 |         1         2
------------------------------

   stats |  h~emale_  educat~_
---------+--------------------
       N |       187       187
     p25 |         1         1
     p50 |         1         2
     p75 |         1         2
------------------------------

. *********************EXPLORATORY DATA ANALYSIS****************************
. table occupation educationlevel__, by(sex_) c(mean weight_ mean age_) sc format(%9.3f) row

-----------------------------------------------------------------------
sexgroups  |
and        |                      Education Level                      
OCCUPATION |       NONE     PRIMARY   SECONDARY     COLLEGE  UNIVERSITY
-----------+-----------------------------------------------------------
Female     |
  EMPLOYED |                 76.000      67.222      61.333      41.000
           |                  9.000       7.889      11.333      41.000
           | 
   RETIRED |                                                           
           |                                                           
           | 
   STUDENT |                             52.667      54.500            
           |                              2.333       5.000            
           | 
UNEMPLOYED |     37.000      47.650      53.800      53.167            
           |     23.000      13.350      12.700       8.667            
           | 
     Total |     37.000      52.375      59.136      55.636      41.000
           |     23.000      12.625       9.318       8.727      41.000
-----------+-----------------------------------------------------------
Male       |
  EMPLOYED |                 63.500      80.344      83.429     100.500
           |                 20.250      17.938      18.429      28.500
           | 
   RETIRED |                 24.000                  31.000            
           |                 37.000                  40.000            
           | 
   STUDENT |                                         38.750      49.333
           |                                          3.500       5.333
           | 
UNEMPLOYED |     66.000      52.444      57.304      96.143            
           |     10.000      19.444      13.087      20.286            
           | 
     Total |     66.000      56.458      70.709      75.947      78.571
           |     10.000      20.146      15.909      17.105      18.571
-----------------------------------------------------------------------

. *****Categorical Variables*********
. tab occupation

 OCCUPATION |      Freq.     Percent        Cum.
------------+-----------------------------------
   EMPLOYED |         80       42.33       42.33
    RETIRED |          2        1.06       43.39
    STUDENT |         12        6.35       49.74
 UNEMPLOYED |         95       50.26      100.00
------------+-----------------------------------
      Total |        189      100.00

. table occupation, c(mean weight_ mean age_) col

-----------------------------------------
OCCUPATION | mean(weight_)     mean(age_)
-----------+-----------------------------
  EMPLOYED |       74.5125          17.55
   RETIRED |          27.5           38.5
   STUDENT |          47.5        3.91667
UNEMPLOYED |            56        15.2316
-----------------------------------------

. tab educationlevel__

  Education |
      Level |      Freq.     Percent        Cum.
------------+-----------------------------------
       NONE |          2        1.06        1.06
    PRIMARY |         72       38.10       39.15
  SECONDARY |         77       40.74       79.89
    COLLEGE |         30       15.87       95.77
 UNIVERSITY |          8        4.23      100.00
------------+-----------------------------------
      Total |        189      100.00

. tab incomelevel_ 

     Income |
      Level |      Freq.     Percent        Cum.
------------+-----------------------------------
    10,000  |         29       15.34       15.34
    12,000  |         10        5.29       20.63
    15,000  |         28       14.81       35.45
    16,000  |          3        1.59       37.04
    16,500  |          1        0.53       37.57
    17,000  |          3        1.59       39.15
    18,000  |          1        0.53       39.68
    19,000  |          1        0.53       40.21
     2,000  |          1        0.53       40.74
    20,000  |         40       21.16       61.90
    21,000  |          1        0.53       62.43
    25,000  |          8        4.23       66.67
    26,000  |          3        1.59       68.25
     3,000  |          7        3.70       71.96
    30,000  |          4        2.12       74.07
    32,000  |          1        0.53       74.60
    35,000  |          3        1.59       76.19
    36,000  |          1        0.53       76.72
     4,000  |          2        1.06       77.78
     4,500  |          1        0.53       78.31
    40,000  |          2        1.06       79.37
     5,000  |          8        4.23       83.60
    50,000  |          1        0.53       84.13
     6,000  |          7        3.70       87.83
     7,000  |          6        3.17       91.01
     8,000  |         12        6.35       97.35
     9,000  |          3        1.59       98.94
    95,000  |          1        0.53       99.47
          O |          1        0.53      100.00
------------+-----------------------------------
      Total |        189      100.00

. tab sex_

  sexgroups |      Freq.     Percent        Cum.
------------+-----------------------------------
     Female |         59       31.22       31.22
       Male |        130       68.78      100.00
------------+-----------------------------------
      Total |        189      100.00

. 
. sort educationlevel__

. by educationlevel__: sum age_ weight_ if  enrolment_v1_v2_v3==1 &  v2_v3_v4==1, detail

---------------------------------------------------------------------------------------------------------------------------------------------------------
-> educationlevel__ = NONE

                             Age
-------------------------------------------------------------
      Percentiles      Smallest
 1%           10             10
 5%           10             23
10%           10              .       Obs                   2
25%           10              .       Sum of Wgt.           2

50%         16.5                      Mean               16.5
                        Largest       Std. Dev.      9.192388
75%           23              .
90%           23              .       Variance           84.5
95%           23             10       Skewness              0
99%           23             23       Kurtosis              1

                           Weight
-------------------------------------------------------------
      Percentiles      Smallest
 1%           37             37
 5%           37             66
10%           37              .       Obs                   2
25%           37              .       Sum of Wgt.           2

50%         51.5                      Mean               51.5
                        Largest       Std. Dev.       20.5061
75%           66              .
90%           66              .       Variance          420.5
95%           66             37       Skewness              0
99%           66             66       Kurtosis              1

---------------------------------------------------------------------------------------------------------------------------------------------------------
-> educationlevel__ = PRIMARY

                             Age
-------------------------------------------------------------
      Percentiles      Smallest
 1%            1              1
 5%            4              2
10%            7              3       Obs                  72
25%           11              4       Sum of Wgt.          72

50%           17                      Mean           17.63889
                        Largest       Std. Dev.      9.586237
75%         23.5             36
90%           31             37       Variance       91.89593
95%           36             38       Skewness         .41899
99%           39             39       Kurtosis       2.379074

                           Weight
-------------------------------------------------------------
      Percentiles      Smallest
 1%            1              1
 5%            4              2
10%            8              3       Obs                  72
25%         28.5              4       Sum of Wgt.          72

50%           50                      Mean           55.09722
                        Largest       Std. Dev.      35.23609
75%           81            115
90%          105            117       Variance       1241.582
95%          115            119       Skewness       .2069335
99%          124            124       Kurtosis       1.922692

---------------------------------------------------------------------------------------------------------------------------------------------------------
-> educationlevel__ = SECONDARY

                             Age
-------------------------------------------------------------
      Percentiles      Smallest
 1%            1              1
 5%            3              2
10%            3              2       Obs                  76
25%          6.5              3       Sum of Wgt.          76

50%           12                      Mean           14.17105
                        Largest       Std. Dev.      9.799848
75%           21             36
90%           30             37       Variance       96.03702
95%           36             38       Skewness       .9533125
99%           41             41       Kurtosis       3.160721

                           Weight
-------------------------------------------------------------
      Percentiles      Smallest
 1%            9              9
 5%           18             10
10%           23             15       Obs                  76
25%         42.5             18       Sum of Wgt.          76

50%           66                      Mean                 68
                        Largest       Std. Dev.      32.50723
75%           93            122
90%          114            123       Variance        1056.72
95%          122            124       Skewness       .0406068
99%          124            124       Kurtosis       1.940357

---------------------------------------------------------------------------------------------------------------------------------------------------------
-> educationlevel__ = COLLEGE

                             Age
-------------------------------------------------------------
      Percentiles      Smallest
 1%            1              1
 5%            2              2
10%          3.5              3       Obs                  30
25%            6              4       Sum of Wgt.          30

50%           12                      Mean           14.03333
                        Largest       Std. Dev.      9.970589
75%           18             25
90%           29             33       Variance       99.41264
95%           37             37       Skewness       1.071084
99%           40             40       Kurtosis       3.593778

                           Weight
-------------------------------------------------------------
      Percentiles      Smallest
 1%           11             11
 5%           13             13
10%           15             14       Obs                  30
25%           32             16       Sum of Wgt.          30

50%           72                      Mean               68.5
                        Largest       Std. Dev.      35.21633
75%           95            108
90%          113            118       Variance        1240.19
95%          119            119       Skewness      -.2975007
99%          120            120       Kurtosis       1.832264

---------------------------------------------------------------------------------------------------------------------------------------------------------
-> educationlevel__ = UNIVERSITY

                             Age
-------------------------------------------------------------
      Percentiles      Smallest
 1%            4              4
 5%            4              5
10%            4              7       Obs                   7
25%            5             11       Sum of Wgt.           7

50%           11                      Mean           18.57143
                        Largest       Std. Dev.      16.54143
75%           41             11
90%           42             20       Variance        273.619
95%           42             41       Skewness       .6589938
99%           42             42       Kurtosis       1.700025

                           Weight
-------------------------------------------------------------
      Percentiles      Smallest
 1%           25             25
 5%           25             41
10%           25             55       Obs                   7
25%           41             68       Sum of Wgt.           7

50%           68                      Mean           75.85714
                        Largest       Std. Dev.      38.86913
75%          119             68
90%          125             98       Variance        1510.81
95%          125            119       Skewness       .0808996
99%          125            125       Kurtosis       1.524536


. 
. sort occupation

. by occupation: sum age_ weight_ if  enrolment_v1_v2_v3==1 &  v2_v3_v4==1, detail

---------------------------------------------------------------------------------------------------------------------------------------------------------
-> occupation = EMPLOYED

                             Age
-------------------------------------------------------------
      Percentiles      Smallest
 1%            1              1
 5%            4              3
10%            5              3       Obs                  78
25%           10              4       Sum of Wgt.          78

50%         14.5                      Mean            17.4359
                        Largest       Std. Dev.      10.45533
75%           23             39
90%           35             41       Variance        109.314
95%           39             41       Skewness        .715434
99%           42             42       Kurtosis       2.643238

                           Weight
-------------------------------------------------------------
      Percentiles      Smallest
 1%            8              8
 5%           23             10
10%           26             18       Obs                  78
25%           55             23       Sum of Wgt.          78

50%         77.5                      Mean           75.37179
                        Largest       Std. Dev.      30.63489
75%          100            120
90%          117            124       Variance       938.4963
95%          120            124       Skewness      -.2805346
99%          125            125       Kurtosis       2.227892

---------------------------------------------------------------------------------------------------------------------------------------------------------
-> occupation = RETIRED

                             Age
-------------------------------------------------------------
      Percentiles      Smallest
 1%           37             37
 5%           37             40
10%           37              .       Obs                   2
25%           37              .       Sum of Wgt.           2

50%         38.5                      Mean               38.5
                        Largest       Std. Dev.       2.12132
75%           40              .
90%           40              .       Variance            4.5
95%           40             37       Skewness              0
99%           40             40       Kurtosis              1

                           Weight
-------------------------------------------------------------
      Percentiles      Smallest
 1%           24             24
 5%           24             31
10%           24              .       Obs                   2
25%           24              .       Sum of Wgt.           2

50%         27.5                      Mean               27.5
                        Largest       Std. Dev.      4.949747
75%           31              .
90%           31              .       Variance           24.5
95%           31             24       Skewness              0
99%           31             31       Kurtosis              1

---------------------------------------------------------------------------------------------------------------------------------------------------------
-> occupation = STUDENT

                             Age
-------------------------------------------------------------
      Percentiles      Smallest
 1%            1              1
 5%            1              1
10%            1              2       Obs                  12
25%          2.5              3       Sum of Wgt.          12

50%            4                      Mean           3.916667
                        Largest       Std. Dev.      1.928652
75%          5.5              5
90%            6              6       Variance       3.719697
95%            7              6       Skewness      -.1159944
99%            7              7       Kurtosis       2.066977

                           Weight
-------------------------------------------------------------
      Percentiles      Smallest
 1%           14             14
 5%           14             16
10%           16             17       Obs                  12
25%         18.5             20       Sum of Wgt.          12

50%           56                      Mean               47.5
                        Largest       Std. Dev.      27.77998
75%         66.5             65
90%           77             68       Variance       771.7273
95%           95             77       Skewness       .0936601
99%           95             95       Kurtosis       1.681941

---------------------------------------------------------------------------------------------------------------------------------------------------------
-> occupation = UNEMPLOYED

                             Age
-------------------------------------------------------------
      Percentiles      Smallest
 1%            2              2
 5%            3              2
10%            6              2       Obs                  95
25%            8              3       Sum of Wgt.          95

50%           12                      Mean           15.23158
                        Largest       Std. Dev.        8.9341
75%           22             36
90%           28             37       Variance       79.81814
95%           34             37       Skewness        .684848
99%           38             38       Kurtosis       2.778342

                           Weight
-------------------------------------------------------------
      Percentiles      Smallest
 1%            1              1
 5%            5              2
10%           11              3       Obs                  95
25%           31              4       Sum of Wgt.          95

50%           49                      Mean                 56
                        Largest       Std. Dev.      35.55158
75%           88            121
90%          108            122       Variance       1263.915
95%          120            123       Skewness         .29549
99%          124            124       Kurtosis       1.945302


. 
. gsort sex_ occupation

. by sex_ occupation: sum age_ weight_ if  enrolment_v1_v2_v3==1 &  v2_v3_v4==1, detail

---------------------------------------------------------------------------------------------------------------------------------------------------------
-> sex_ = Female, occupation = EMPLOYED

                             Age
-------------------------------------------------------------
      Percentiles      Smallest
 1%            3              3
 5%            3              3
10%            3              4       Obs                  16
25%          5.5              5       Sum of Wgt.          16

50%           10                      Mean            11.1875
                        Largest       Std. Dev.      8.997916
75%         12.5             13
90%           17             16       Variance        80.9625
95%           41             17       Skewness       2.357164
99%           41             41       Kurtosis       8.738748

                           Weight
-------------------------------------------------------------
      Percentiles      Smallest
 1%           23             23
 5%           23             24
10%           24             25       Obs                  16
25%           38             35       Sum of Wgt.          16

50%         77.5                      Mean               69.5
                        Largest       Std. Dev.      33.02726
75%           98            105
90%          113            106       Variance         1090.8
95%          114            113       Skewness      -.1519803
99%          114            114       Kurtosis       1.585183

---------------------------------------------------------------------------------------------------------------------------------------------------------
-> sex_ = Female, occupation = STUDENT

                             Age
-------------------------------------------------------------
      Percentiles      Smallest
 1%            1              1
 5%            1              2
10%            1              4       Obs                   5
25%            2              4       Sum of Wgt.           5

50%            4                      Mean                3.4
                        Largest       Std. Dev.      1.949359
75%            4              2
90%            6              4       Variance            3.8
95%            6              4       Skewness       .0543353
99%            6              6       Kurtosis       1.795706

                           Weight
-------------------------------------------------------------
      Percentiles      Smallest
 1%           14             14
 5%           14             20
10%           14             61       Obs                   5
25%           20             77       Sum of Wgt.           5

50%           61                      Mean               53.4
                        Largest       Std. Dev.      35.40198
75%           77             20
90%           95             61       Variance         1253.3
95%           95             77       Skewness      -.0809382
99%           95             95       Kurtosis       1.385211

---------------------------------------------------------------------------------------------------------------------------------------------------------
-> sex_ = Female, occupation = UNEMPLOYED

                             Age
-------------------------------------------------------------
      Percentiles      Smallest
 1%            2              2
 5%            2              2
10%            3              3       Obs                  37
25%            7              3       Sum of Wgt.          37

50%           11                      Mean           12.67568
                        Largest       Std. Dev.       8.66684
75%           17             23
90%           23             28       Variance       75.11411
95%           37             37       Skewness       1.357876
99%           38             38       Kurtosis       4.602728

                           Weight
-------------------------------------------------------------
      Percentiles      Smallest
 1%            1              1
 5%            4              4
10%            6              5       Obs                  37
25%           13              6       Sum of Wgt.          37

50%           37                      Mean           49.91892
                        Largest       Std. Dev.       39.3223
75%           85            112
90%          112            118       Variance       1546.243
95%          122            122       Skewness        .533535
99%          123            123       Kurtosis       1.905879

---------------------------------------------------------------------------------------------------------------------------------------------------------
-> sex_ = Male, occupation = EMPLOYED

                             Age
-------------------------------------------------------------
      Percentiles      Smallest
 1%            1              1
 5%            5              4
10%            7              5       Obs                  62
25%           12              5       Sum of Wgt.          62

50%         17.5                      Mean           19.04839
                        Largest       Std. Dev.      10.25643
75%           25             38
90%           35             39       Variance       105.1943
95%           38             41       Skewness       .5052536
99%           42             42       Kurtosis          2.404

                           Weight
-------------------------------------------------------------
      Percentiles      Smallest
 1%            8              8
 5%           26             10
10%           42             18       Obs                  62
25%           59             26       Sum of Wgt.          62

50%         77.5                      Mean            76.8871
                        Largest       Std. Dev.      30.08409
75%          100            120
90%          119            124       Variance       905.0526
95%          120            124       Skewness      -.3018376
99%          125            125       Kurtosis       2.433174

---------------------------------------------------------------------------------------------------------------------------------------------------------
-> sex_ = Male, occupation = RETIRED

                             Age
-------------------------------------------------------------
      Percentiles      Smallest
 1%           37             37
 5%           37             40
10%           37              .       Obs                   2
25%           37              .       Sum of Wgt.           2

50%         38.5                      Mean               38.5
                        Largest       Std. Dev.       2.12132
75%           40              .
90%           40              .       Variance            4.5
95%           40             37       Skewness              0
99%           40             40       Kurtosis              1

                           Weight
-------------------------------------------------------------
      Percentiles      Smallest
 1%           24             24
 5%           24             31
10%           24              .       Obs                   2
25%           24              .       Sum of Wgt.           2

50%         27.5                      Mean               27.5
                        Largest       Std. Dev.      4.949747
75%           31              .
90%           31              .       Variance           24.5
95%           31             24       Skewness              0
99%           31             31       Kurtosis              1

---------------------------------------------------------------------------------------------------------------------------------------------------------
-> sex_ = Male, occupation = STUDENT

                             Age
-------------------------------------------------------------
      Percentiles      Smallest
 1%            1              1
 5%            1              3
10%            1              4       Obs                   7
25%            3              4       Sum of Wgt.           7

50%            4                      Mean           4.285714
                        Largest       Std. Dev.      1.976047
75%            6              4
90%            7              5       Variance       3.904762
95%            7              6       Skewness      -.2856837
99%            7              7       Kurtosis       2.327037

                           Weight
-------------------------------------------------------------
      Percentiles      Smallest
 1%           16             16
 5%           16             17
10%           16             25       Obs                   7
25%           17             55       Sum of Wgt.           7

50%           55                      Mean           43.28571
                        Largest       Std. Dev.      23.01242
75%           65             55
90%           68             57       Variance       529.5714
95%           68             65       Skewness      -.2226072
99%           68             68       Kurtosis       1.243223

---------------------------------------------------------------------------------------------------------------------------------------------------------
-> sex_ = Male, occupation = UNEMPLOYED

                             Age
-------------------------------------------------------------
      Percentiles      Smallest
 1%            2              2
 5%            3              3
10%            6              3       Obs                  58
25%           10              6       Sum of Wgt.          58

50%           17                      Mean           16.86207
                        Largest       Std. Dev.      8.788845
75%           23             32
90%           30             34       Variance        77.2438
95%           34             36       Skewness       .3607288
99%           37             37       Kurtosis       2.361182

                           Weight
-------------------------------------------------------------
      Percentiles      Smallest
 1%            2              2
 5%            7              3
10%           15              7       Obs                  58
25%           35             11       Sum of Wgt.          58

50%         55.5                      Mean           59.87931
                        Largest       Std. Dev.      32.68729
75%           88            115
90%          104            120       Variance       1068.459
95%          120            121       Skewness       .2033078
99%          124            124       Kurtosis       2.084626


. 
. gsort sex_ occupation

. by sex_ occupation: tab educationlevel__ if  enrolment_v1_v2_v3==1 &  v2_v3_v4==1, sum(age_)

---------------------------------------------------------------------------------------------------------------------------------------------------------
-> sex_ = Female, occupation = EMPLOYED

  Education |           Summary of Age
      Level |        Mean   Std. Dev.       Freq.
------------+------------------------------------
    PRIMARY |           9   6.6833126           4
  SECONDARY |         8.5   3.9641248           8
    COLLEGE |   11.333333   1.5275252           3
  UNIVERSIT |          41           0           1
------------+------------------------------------
      Total |     11.1875   8.9979164          16

---------------------------------------------------------------------------------------------------------------------------------------------------------
-> sex_ = Female, occupation = STUDENT

  Education |           Summary of Age
      Level |        Mean   Std. Dev.       Freq.
------------+------------------------------------
  SECONDARY |   2.3333333   1.5275252           3
    COLLEGE |           5   1.4142136           2
------------+------------------------------------
      Total |         3.4   1.9493589           5

---------------------------------------------------------------------------------------------------------------------------------------------------------
-> sex_ = Female, occupation = UNEMPLOYED

  Education |           Summary of Age
      Level |        Mean   Std. Dev.       Freq.
------------+------------------------------------
       NONE |          23           0           1
    PRIMARY |       13.35   8.3620383          20
  SECONDARY |        12.7   10.719142          10
    COLLEGE |   8.6666667   5.0859283           6
------------+------------------------------------
      Total |   12.675676   8.6668399          37

---------------------------------------------------------------------------------------------------------------------------------------------------------
-> sex_ = Male, occupation = EMPLOYED

  Education |           Summary of Age
      Level |        Mean   Std. Dev.       Freq.
------------+------------------------------------
    PRIMARY |       20.25   10.803874          20
  SECONDARY |     17.9375   10.067314          32
    COLLEGE |   18.428571   8.1005585           7
  UNIVERSIT |   24.333333   15.947832           3
------------+------------------------------------
      Total |   19.048387   10.256429          62

---------------------------------------------------------------------------------------------------------------------------------------------------------
-> sex_ = Male, occupation = RETIRED

  Education |           Summary of Age
      Level |        Mean   Std. Dev.       Freq.
------------+------------------------------------
    PRIMARY |          37           0           1
    COLLEGE |          40           0           1
------------+------------------------------------
      Total |        38.5   2.1213203           2

---------------------------------------------------------------------------------------------------------------------------------------------------------
-> sex_ = Male, occupation = STUDENT

  Education |           Summary of Age
      Level |        Mean   Std. Dev.       Freq.
------------+------------------------------------
    COLLEGE |         3.5    2.081666           4
  UNIVERSIT |   5.3333333   1.5275252           3
------------+------------------------------------
      Total |   4.2857143    1.976047           7

---------------------------------------------------------------------------------------------------------------------------------------------------------
-> sex_ = Male, occupation = UNEMPLOYED

  Education |           Summary of Age
      Level |        Mean   Std. Dev.       Freq.
------------+------------------------------------
       NONE |          10           0           1
    PRIMARY |   19.444444   7.7921723          27
  SECONDARY |   13.086957   8.8723936          23
    COLLEGE |   20.285714   8.7123339           7
------------+------------------------------------
      Total |   16.862069   8.7888452          58


. 
. 
. sort educationlevel__

. by educationlevel__: tab  phone_access_internet if  enrolment_v1_v2_v3==1 &  v2_v3_v4==1, sum(age_)

---------------------------------------------------------------------------------------------------------------------------------------------------------
-> educationlevel__ = NONE

INTERNET Is |
 your phone |
 (or any of |
       your |
    phones) |
    able to |
 access the |           Summary of Age
  internet? |        Mean   Std. Dev.       Freq.
------------+------------------------------------
         NO |        16.5   9.1923882           2
------------+------------------------------------
      Total |        16.5   9.1923882           2

---------------------------------------------------------------------------------------------------------------------------------------------------------
-> educationlevel__ = PRIMARY

INTERNET Is |
 your phone |
 (or any of |
       your |
    phones) |
    able to |
 access the |           Summary of Age
  internet? |        Mean   Std. Dev.       Freq.
------------+------------------------------------
         NO |   19.612245   9.6518917          49
        YES |   13.434783   8.1342491          23
------------+------------------------------------
      Total |   17.638889   9.5862365          72

---------------------------------------------------------------------------------------------------------------------------------------------------------
-> educationlevel__ = SECONDARY

INTERNET Is |
 your phone |
 (or any of |
       your |
    phones) |
    able to |
 access the |           Summary of Age
  internet? |        Mean   Std. Dev.       Freq.
------------+------------------------------------
         NO |   16.243243    11.13155          37
        YES |   12.205128   8.0005904          39
------------+------------------------------------
      Total |   14.171053   9.7998478          76

---------------------------------------------------------------------------------------------------------------------------------------------------------
-> educationlevel__ = COLLEGE

INTERNET Is |
 your phone |
 (or any of |
       your |
    phones) |
    able to |
 access the |           Summary of Age
  internet? |        Mean   Std. Dev.       Freq.
------------+------------------------------------
         NO |        18.8   11.193252          10
        YES |       11.65   8.6284413          20
------------+------------------------------------
      Total |   14.033333   9.9705889          30

---------------------------------------------------------------------------------------------------------------------------------------------------------
-> educationlevel__ = UNIVERSITY

INTERNET Is |
 your phone |
 (or any of |
       your |
    phones) |
    able to |
 access the |           Summary of Age
  internet? |        Mean   Std. Dev.       Freq.
------------+------------------------------------
        YES |   18.571429   16.541434           7
------------+------------------------------------
      Total |   18.571429   16.541434           7


. 
. sort educationlevel__

. by educationlevel__: tab net_used if  enrolment_v1_v2_v3==1 &  v2_v3_v4==1, sum(age_)

---------------------------------------------------------------------------------------------------------------------------------------------------------
-> educationlevel__ = NONE

   To which |
 network do |
        you |           Summary of Age
 subscribe? |        Mean   Std. Dev.       Freq.
------------+------------------------------------
          S |        16.5   9.1923882           2
------------+------------------------------------
      Total |        16.5   9.1923882           2

---------------------------------------------------------------------------------------------------------------------------------------------------------
-> educationlevel__ = PRIMARY

   To which |
 network do |
        you |           Summary of Age
 subscribe? |        Mean   Std. Dev.       Freq.
------------+------------------------------------
          A |        11.5   5.6862407           4
          S |   17.824561   9.8961082          57
        S A |   18.909091   8.7915248          11
------------+------------------------------------
      Total |   17.638889   9.5862365          72

---------------------------------------------------------------------------------------------------------------------------------------------------------
-> educationlevel__ = SECONDARY

   To which |
 network do |
        you |           Summary of Age
 subscribe? |        Mean   Std. Dev.       Freq.
------------+------------------------------------
          A |          20           0           1
          S |    14.15942    10.06833          69
        S A |   13.333333   7.3665913           6
------------+------------------------------------
      Total |   14.171053   9.7998478          76

---------------------------------------------------------------------------------------------------------------------------------------------------------
-> educationlevel__ = COLLEGE

   To which |
 network do |
        you |           Summary of Age
 subscribe? |        Mean   Std. Dev.       Freq.
------------+------------------------------------
          S |   15.545455   10.608744          22
        S A |       9.875   6.8751623           8
------------+------------------------------------
      Total |   14.033333   9.9705889          30

---------------------------------------------------------------------------------------------------------------------------------------------------------
-> educationlevel__ = UNIVERSITY

   To which |
 network do |
        you |           Summary of Age
 subscribe? |        Mean   Std. Dev.       Freq.
------------+------------------------------------
          S |   19.833333     17.7473           6
        S A |          11           0           1
------------+------------------------------------
      Total |   18.571429   16.541434           7


. 
. sort educationlevel__

. by educationlevel__: tab  phone_Type if  enrolment_v1_v2_v3==1 &  v2_v3_v4==1, sum(age_)

---------------------------------------------------------------------------------------------------------------------------------------------------------
-> educationlevel__ = NONE

  What kind |
of phone do |           Summary of Age
  you have? |        Mean   Std. Dev.       Freq.
------------+------------------------------------
    FEATURE |          23           0           1
      SMART |          10           0           1
------------+------------------------------------
      Total |        16.5   9.1923882           2

---------------------------------------------------------------------------------------------------------------------------------------------------------
-> educationlevel__ = PRIMARY

  What kind |
of phone do |           Summary of Age
  you have? |        Mean   Std. Dev.       Freq.
------------+------------------------------------
    FEATURE |   19.446809   9.7797673          47
      SMART |       14.24   8.3729724          25
------------+------------------------------------
      Total |   17.638889   9.5862365          72

---------------------------------------------------------------------------------------------------------------------------------------------------------
-> educationlevel__ = SECONDARY

  What kind |
of phone do |           Summary of Age
  you have? |        Mean   Std. Dev.       Freq.
------------+------------------------------------
    FEATURE |   16.970588    11.30161          34
      SMART |   11.904762   7.8174586          42
------------+------------------------------------
      Total |   14.171053   9.7998478          76

---------------------------------------------------------------------------------------------------------------------------------------------------------
-> educationlevel__ = COLLEGE

  What kind |
of phone do |           Summary of Age
  you have? |        Mean   Std. Dev.       Freq.
------------+------------------------------------
    FEATURE |        18.8   11.193252          10
      SMART |       11.65   8.6284413          20
------------+------------------------------------
      Total |   14.033333   9.9705889          30

---------------------------------------------------------------------------------------------------------------------------------------------------------
-> educationlevel__ = UNIVERSITY

  What kind |
of phone do |           Summary of Age
  you have? |        Mean   Std. Dev.       Freq.
------------+------------------------------------
      SMART |   18.571429   16.541434           7
------------+------------------------------------
      Total |   18.571429   16.541434           7


. 
. sort sex_

. by sex_: tab phone_Type if  enrolment_v1_v2_v3==1 &  v2_v3_v4==1, sum(age_)

---------------------------------------------------------------------------------------------------------------------------------------------------------
-> sex_ = Female

  What kind |
of phone do |           Summary of Age
  you have? |        Mean   Std. Dev.       Freq.
------------+------------------------------------
    FEATURE |   12.791667   9.8200291          24
      SMART |   10.529412   7.8324705          34
------------+------------------------------------
      Total |   11.465517   8.7001019          58

---------------------------------------------------------------------------------------------------------------------------------------------------------
-> sex_ = Male

  What kind |
of phone do |           Summary of Age
  you have? |        Mean   Std. Dev.       Freq.
------------+------------------------------------
    FEATURE |   20.514706   9.9318463          68
      SMART |   14.278689   9.3668407          61
------------+------------------------------------
      Total |   17.565891   10.125652         129


. 
. 
. 
.      
. 
. **educationlevel
. bysort educationlevel : tab sex_ if enrolment_v1_v2_v3==1

---------------------------------------------------------------------------------------------------------------------------------------------------------
-> educationlevel__ = NONE

  sexgroups |      Freq.     Percent        Cum.
------------+-----------------------------------
     Female |          1       50.00       50.00
       Male |          1       50.00      100.00
------------+-----------------------------------
      Total |          2      100.00

---------------------------------------------------------------------------------------------------------------------------------------------------------
-> educationlevel__ = PRIMARY

  sexgroups |      Freq.     Percent        Cum.
------------+-----------------------------------
     Female |         24       33.33       33.33
       Male |         48       66.67      100.00
------------+-----------------------------------
      Total |         72      100.00

---------------------------------------------------------------------------------------------------------------------------------------------------------
-> educationlevel__ = SECONDARY

  sexgroups |      Freq.     Percent        Cum.
------------+-----------------------------------
     Female |         21       27.63       27.63
       Male |         55       72.37      100.00
------------+-----------------------------------
      Total |         76      100.00

---------------------------------------------------------------------------------------------------------------------------------------------------------
-> educationlevel__ = COLLEGE

  sexgroups |      Freq.     Percent        Cum.
------------+-----------------------------------
     Female |         11       36.67       36.67
       Male |         19       63.33      100.00
------------+-----------------------------------
      Total |         30      100.00

---------------------------------------------------------------------------------------------------------------------------------------------------------
-> educationlevel__ = UNIVERSITY

  sexgroups |      Freq.     Percent        Cum.
------------+-----------------------------------
     Female |          1       14.29       14.29
       Male |          6       85.71      100.00
------------+-----------------------------------
      Total |          7      100.00


. bysort educationlevel : tab total_hivcontacts_ if enrolment_v1_v2_v3==1

---------------------------------------------------------------------------------------------------------------------------------------------------------
-> educationlevel__ = NONE

        HIV |
   CONTACTS |
 TOTAL From |
  those you |
 live with, |
   how many |
 are living |
  with HIV? |      Freq.     Percent        Cum.
------------+-----------------------------------
          0 |          2      100.00      100.00
------------+-----------------------------------
      Total |          2      100.00

---------------------------------------------------------------------------------------------------------------------------------------------------------
-> educationlevel__ = PRIMARY

        HIV |
   CONTACTS |
 TOTAL From |
  those you |
 live with, |
   how many |
 are living |
  with HIV? |      Freq.     Percent        Cum.
------------+-----------------------------------
          0 |         70       97.22       97.22
          1 |          1        1.39       98.61
          3 |          1        1.39      100.00
------------+-----------------------------------
      Total |         72      100.00

---------------------------------------------------------------------------------------------------------------------------------------------------------
-> educationlevel__ = SECONDARY

        HIV |
   CONTACTS |
 TOTAL From |
  those you |
 live with, |
   how many |
 are living |
  with HIV? |      Freq.     Percent        Cum.
------------+-----------------------------------
          0 |         73       96.05       96.05
          1 |          3        3.95      100.00
------------+-----------------------------------
      Total |         76      100.00

---------------------------------------------------------------------------------------------------------------------------------------------------------
-> educationlevel__ = COLLEGE

        HIV |
   CONTACTS |
 TOTAL From |
  those you |
 live with, |
   how many |
 are living |
  with HIV? |      Freq.     Percent        Cum.
------------+-----------------------------------
          0 |         30      100.00      100.00
------------+-----------------------------------
      Total |         30      100.00

---------------------------------------------------------------------------------------------------------------------------------------------------------
-> educationlevel__ = UNIVERSITY

        HIV |
   CONTACTS |
 TOTAL From |
  those you |
 live with, |
   how many |
 are living |
  with HIV? |      Freq.     Percent        Cum.
------------+-----------------------------------
          0 |          7      100.00      100.00
------------+-----------------------------------
      Total |          7      100.00


. tab educationlevel__ sex_ if enrolment_v1_v2_v3==0

 Education |       sexgroups
     Level |    Female       Male |     Total
-----------+----------------------+----------
 SECONDARY |         1          0 |         1 
UNIVERSITY |         0          1 |         1 
-----------+----------------------+----------
     Total |         1          1 |         2 


. tab educationlevel__ sex_ if enrolment_v1_v2_v3==1

 Education |       sexgroups
     Level |    Female       Male |     Total
-----------+----------------------+----------
      NONE |         1          1 |         2 
   PRIMARY |        24         48 |        72 
 SECONDARY |        21         55 |        76 
   COLLEGE |        11         19 |        30 
UNIVERSITY |         1          6 |         7 
-----------+----------------------+----------
     Total |        58        129 |       187 


. 
. table educationlevel, by(sex) col 

-----------------------
Sex and    |
Education  |
Level      |      Freq.
-----------+-----------
Female     |
      NONE |          1
   PRIMARY |         24
 SECONDARY |         22
   COLLEGE |         11
UNIVERSITY |          1
-----------+-----------
Male       |
      NONE |          1
   PRIMARY |         48
 SECONDARY |         55
   COLLEGE |         19
UNIVERSITY |          7
-----------------------

. table educationlevel__ if enrolment_v1_v2_v3==1, by(occupation) c(mean pple_livewithLess5yrs_ count pple_livewithLess5yrs_ mean pple_liveinhouse_ count
>  pple_liveinhouse_) col

---------------------------------------------------------------------------
OCCUPATION |
and        |
Education  |
Level      | mean(pple_l~_)     N(pple_l~_)  mean(pple_l~_)     N(pple_l~_)
-----------+---------------------------------------------------------------
EMPLOYED   |
      NONE |                                                               
   PRIMARY |           1.25              24         3.66667              24
 SECONDARY |            1.4              40            3.85              40
   COLLEGE |            1.6              10             4.5              10
UNIVERSITY |           1.75               4            4.75               4
-----------+---------------------------------------------------------------
RETIRED    |
      NONE |                                                               
   PRIMARY |              1               1               4               1
 SECONDARY |                                                               
   COLLEGE |              1               1               6               1
UNIVERSITY |                                                               
-----------+---------------------------------------------------------------
STUDENT    |
      NONE |                                                               
   PRIMARY |                                                               
 SECONDARY |              1               3               6               3
   COLLEGE |        1.16667               6         4.33333               6
UNIVERSITY |              1               3         4.33333               3
-----------+---------------------------------------------------------------
UNEMPLOYED |
      NONE |              1               2               2               2
   PRIMARY |        1.48936              47         4.38298              47
 SECONDARY |        1.60606              33         4.24242              33
   COLLEGE |        1.46154              13         3.92308              13
UNIVERSITY |                                                               
---------------------------------------------------------------------------

. 
. rename less5yrsf_ less5yrsfemale_

. tabstat pple_liveinhouse_  pple_livewithLess5yrs_ less5yrsmale_ less5yrsfemale_, by(educationlevel__) stats(n p25 p50 p75)format long col(stat)

educationlevel__     variable |         N       p25       p50       p75
------------------------------+----------------------------------------
NONE             pple_livei~_ |         2         2         2         2
                 pple_livew~_ |         2         1         1         1
                 less5yrsma~_ |         2         1         1         1
                 less5yrsfe~_ |         2         1         1         1
------------------------------+----------------------------------------
PRIMARY          pple_livei~_ |        72         2         4         6
                 pple_livew~_ |        72         1         1         2
                 less5yrsma~_ |        72         1         1         1
                 less5yrsfe~_ |        72         1         1         1
------------------------------+----------------------------------------
SECONDARY        pple_livei~_ |        77         2         4         5
                 pple_livew~_ |        77         1         1         2
                 less5yrsma~_ |        77         1         1         1
                 less5yrsfe~_ |        77         1         1         1
------------------------------+----------------------------------------
COLLEGE          pple_livei~_ |        30         2         5         5
                 pple_livew~_ |        30         1         1         2
                 less5yrsma~_ |        30         1         1         2
                 less5yrsfe~_ |        30         1         1         1
------------------------------+----------------------------------------
UNIVERSITY       pple_livei~_ |         8         3         4       5.5
                 pple_livew~_ |         8         1         1         2
                 less5yrsma~_ |         8         1         1         2
                 less5yrsfe~_ |         8         1         1         1
------------------------------+----------------------------------------
Total            pple_livei~_ |       189         2         4         5
                 pple_livew~_ |       189         1         1         2
                 less5yrsma~_ |       189         1         1         1
                 less5yrsfe~_ |       189         1         1         1
-----------------------------------------------------------------------

. 
. **weight - continuous variable
. tabstat weight_ if enrolment_v1_v2_v3==1, stats(n min p25 p50 p75 max)

    variable |         N       min       p25       p50       p75       max
-------------+------------------------------------------------------------
     weight_ |       187         1        34        63        93       125
--------------------------------------------------------------------------

. sum weight_ if enrolment_v1_v2_v3==1, detail

                           Weight
-------------------------------------------------------------
      Percentiles      Smallest
 1%            2              1
 5%           10              2
10%           15              3       Obs                 187
25%           34              4       Sum of Wgt.         187

50%           63                      Mean           63.22995
                        Largest       Std. Dev.      34.51454
75%           93            124
90%          112            124       Variance       1191.253
95%          119            124       Skewness       .0345483
99%          124            125       Kurtosis       1.908353

. **age  - continuous variable
. tabstat age_ if enrolment_v1_v2_v3==1, m stats(n min p25 p50 p75 max)

    variable |         N       min       p25       p50       p75       max
-------------+------------------------------------------------------------
        age_ |       187         1         8        12        22        42
--------------------------------------------------------------------------

. sum age_ if enrolment_v1_v2_v3==1, detail

                             Age
-------------------------------------------------------------
      Percentiles      Smallest
 1%            1              1
 5%            3              1
10%            4              1       Obs                 187
25%            8              2       Sum of Wgt.         187

50%           12                      Mean            15.6738
                        Largest       Std. Dev.      10.08755
75%           22             40
90%           31             41       Variance       101.7586
95%           37             41       Skewness       .7684285
99%           41             42       Kurtosis       2.816068

. 
. *sex - categorical variable
. tab sex if enrolment_v1_v2_v3==1

        Sex |      Freq.     Percent        Cum.
------------+-----------------------------------
     Female |         58       31.02       31.02
       Male |        129       68.98      100.00
------------+-----------------------------------
      Total |        187      100.00

. tab sex if enrolment_v1_v2_v3==0

        Sex |      Freq.     Percent        Cum.
------------+-----------------------------------
     Female |          1       50.00       50.00
       Male |          1       50.00      100.00
------------+-----------------------------------
      Total |          2      100.00

. 
. ttest (weight_),by(sex)

Two-sample t test with equal variances
------------------------------------------------------------------------------
   Group |     Obs        Mean    Std. Err.   Std. Dev.   [95% Conf. Interval]
---------+--------------------------------------------------------------------
  Female |      59    55.05085    4.908897    37.70595    45.22462    64.87707
    Male |     130        66.6     2.84146    32.39763     60.9781     72.2219
---------+--------------------------------------------------------------------
combined |     189    62.99471    2.506734     34.4619    58.04977    67.93965
---------+--------------------------------------------------------------------
    diff |           -11.54915    5.357982               -22.11901   -.9792961
------------------------------------------------------------------------------
    diff = mean(Female) - mean(Male)                              t =  -2.1555
Ho: diff = 0                                     degrees of freedom =      187

    Ha: diff < 0                 Ha: diff != 0                 Ha: diff > 0
 Pr(T < t) = 0.0162         Pr(|T| > |t|) = 0.0324          Pr(T > t) = 0.9838

. ****Phone
. tab  phone_access_internet net_used

  INTERNET |
   Is your |
 phone (or |
    any of |
      your |
   phones) |
   able to |     To which network do you
access the |            subscribe?
 internet? |         A          S        S A |     Total
-----------+---------------------------------+----------
        NO |         4         87          9 |       100 
       YES |         2         69         18 |        89 
-----------+---------------------------------+----------
     Total |         6        156         27 |       189 


. tab  phone_Type net_used

 What kind |
  of phone |     To which network do you
    do you |            subscribe?
     have? |         A          S        S A |     Total
-----------+---------------------------------+----------
   FEATURE |         4         82          8 |        94 
     SMART |         2         74         19 |        95 
-----------+---------------------------------+----------
     Total |         6        156         27 |       189 


. tab  phone_access_internet phone_Type

  INTERNET |
   Is your |
 phone (or |
    any of |
      your |
   phones) |
   able to | What kind of phone do
access the |       you have?
 internet? |   FEATURE      SMART |     Total
-----------+----------------------+----------
        NO |        94          6 |       100 
       YES |         0         89 |        89 
-----------+----------------------+----------
     Total |        94         95 |       189 


. tab  lang_read lang_prefer_use

     Which |
  language |
   are you | Which language would you like us
   able to |    to use in sending the SMS
 read SMS? |       ANY        ENG        SWA |     Total
-----------+---------------------------------+----------
      BOTH |        31         39          9 |        79 
       ENG |         2         54          0 |        56 
       SWA |         0          0         54 |        54 
-----------+---------------------------------+----------
     Total |        33         93         63 |       189 


. tab educationlevel placespent_time_most,row

+----------------+
| Key            |
|----------------|
|   frequency    |
| row percentage |
+----------------+

 Education |        Where do you spend most of your time during the day
     Level |   COLLEGE       HOME      OTHER     SCHOOL  SOCIAL PL       WORK |     Total
-----------+------------------------------------------------------------------+----------
      NONE |         0          2          0          0          0          0 |         2 
           |      0.00     100.00       0.00       0.00       0.00       0.00 |    100.00 
-----------+------------------------------------------------------------------+----------
   PRIMARY |         0         25          0          0          2         45 |        72 
           |      0.00      34.72       0.00       0.00       2.78      62.50 |    100.00 
-----------+------------------------------------------------------------------+----------
 SECONDARY |         0         15          4          4          1         53 |        77 
           |      0.00      19.48       5.19       5.19       1.30      68.83 |    100.00 
-----------+------------------------------------------------------------------+----------
   COLLEGE |         1          4          5          2          1         17 |        30 
           |      3.33      13.33      16.67       6.67       3.33      56.67 |    100.00 
-----------+------------------------------------------------------------------+----------
UNIVERSITY |         0          0          2          1          0          5 |         8 
           |      0.00       0.00      25.00      12.50       0.00      62.50 |    100.00 
-----------+------------------------------------------------------------------+----------
     Total |         1         46         11          7          4        120 |       189 
           |      0.53      24.34       5.82       3.70       2.12      63.49 |    100.00 


. **occupation  - categrical variable
. table  occupation trans_means, col

---------------------------------------------------------------------------------
           |           Which means do you use to get to the TB clinic?           
OCCUPATION |         BODA          FOOT           MAT  PERSONAL CAR         Total
-----------+---------------------------------------------------------------------
  EMPLOYED |            2            56            22                          80
   RETIRED |                          1                           1             2
   STUDENT |                          5             7                          12
UNEMPLOYED |            3            55            37                          95
---------------------------------------------------------------------------------

. table  occupation trans_means if cost_toclinic==0, col

--------------------------------
           | Which means do you 
           |use to get to the TB
           |       clinic?      
OCCUPATION |  FOOT    MAT  Total
-----------+--------------------
  EMPLOYED |    56            56
   RETIRED |     1             1
   STUDENT |     5             5
UNEMPLOYED |    55      2     57
--------------------------------

. table  occupation trans_means if cost_toclinic!=0, col

-------------------------------------------------------------------
           |    Which means do you use to get to the TB clinic?    
OCCUPATION |         BODA           MAT  PERSONAL CAR         Total
-----------+-------------------------------------------------------
  EMPLOYED |            2            22                          24
   RETIRED |                                        1             1
   STUDENT |                          7                           7
UNEMPLOYED |            3            35                          38
-------------------------------------------------------------------

. table  occupation time_to_SMS, col

--------------------------------------------------------
           | What time would you like us to send the SMS
           |                   to you                   
OCCUPATION |     AFT  ANYTIME      EVE      MOR    Total
-----------+--------------------------------------------
  EMPLOYED |      15                53       12       80
   RETIRED |                         2                 2
   STUDENT |       1                10        1       12
UNEMPLOYED |      20        5       57       13       95
--------------------------------------------------------

. 
. ***************************************************VISUALIZATIONS*********************************************************************************
. **histogram for how the data is distributed
. hist weight_,frequency normal
(bin=13, start=1, width=9.5384615)

. histogram age_, frequency normal 
(bin=13, start=1, width=3.1538462)

. ****box plots for extreme values/outliers
. graph box weight_ if sex=="Male", title("Box plot for Male's weight")

. graph box weight_ if sex=="Female", title("Box plot for Female's weight")

. graph box  age_ weight_ , over(educationlevel)  title("Box plot for Sex and Weight against Education levels")

. graph box age_, over(sex)

. ******bar graphs
. separate sex_, by(sex_)

              storage  display     value
variable name   type   format      label      variable label
---------------------------------------------------------------------------------------------------------------------------------------------------------
sex_0           byte   %9.0g       sex_       sex_, sex_ == Female
sex_1           byte   %9.0g       sex_       sex_, sex_ == Male

. graph bar (count) sex_0 sex_1, by(educationlevel) legend(order(1 "Male" 2 "Female")) bargap(0.2) 

. twoway (scatter age_ weight_) , ytitle("Age") xtitle("Weight")

. 
. tab placespent_time_most_

placespent_t |
    ime_most |      Freq.     Percent        Cum.
-------------+-----------------------------------
       OTHER |         11        5.82        5.82
        HOME |         46       24.34       30.16
SOCIAL PLACE |          4        2.12       32.28
     COLLEGE |          1        0.53       32.80
      SCHOOL |          7        3.70       36.51
        WORK |        120       63.49      100.00
-------------+-----------------------------------
       Total |        189      100.00

. separate  placespent_time_most_,by(placespent_time_most_)

              storage  display     value
variable name   type   format      label      variable label
---------------------------------------------------------------------------------------------------------------------------------------------------------
placespent_ti~0 byte   %12.0g      placespent_time_most_
                                              placespent_time_most_, placespent_time_most_ == OTHER
placespent_ti~1 byte   %12.0g      placespent_time_most_
                                              placespent_time_most_, placespent_time_most_ == HOME
placespent_ti~2 byte   %12.0g      placespent_time_most_
                                              placespent_time_most_, placespent_time_most_ == SOCIAL PLACE
placespent_ti~3 byte   %12.0g      placespent_time_most_
                                              placespent_time_most_, placespent_time_most_ == COLLEGE
placespent_ti~4 byte   %12.0g      placespent_time_most_
                                              placespent_time_most_, placespent_time_most_ == SCHOOL
placespent_ti~5 byte   %12.0g      placespent_time_most_
                                              placespent_time_most_, placespent_time_most_ == WORK

. graph bar (count) placespent_time_most_0 placespent_time_most_1 placespent_time_most_2 placespent_time_most_3 placespent_time_most_4 placespent_time_mo
> st_5, legend(order(0 "OTHER" 1 "HOME" 2 "SOCIAL PLACE" 3 "COLLEGE" 4 "SCHOOL" 5 "WORK")) blabel(bar, position(outside))

. 
. graph bar (mean) weight_, over(sex) legend(order(0 "FEMALE" 1 "MALE")) bargap(0.1) blabel(bar,  color(white) position(inside)) title("mean weight for s
> ex categories")  ytitle("mean weight")

. graph bar (mean) age_, over(sex_) legend(order(0 "FEMALE" 1 "MALE")) bargap(0.1) blabel(bar,  color(red) position(top)) title("mean age for sex categor
> ies")  ytitle("mean age")
(note:  named style top not found in class barlabelpos, default attributes used)
(note:  barlabelpos not found in scheme, default attributes used)

. 
. graph bar age_, over(educationlevel__) legend(order(0 "NONE" 1 "PRIMARY" 2 "SECONDARY" 3 "COLLEGE" 4 "UNIVERSITY")) blabel(bar, color(white) position(i
> nside))

. graph bar weight_, over(educationlevel__) bargap(0.2) legend(order(0 "NONE" 1 "PRIMARY" 2 "SECONDARY" 3 "COLLEGE" 4 "UNIVERSITY")) blabel(bar, color(gr
> een) position(outside))

.         **REGRESSION ANALYSIS**
. regress age_ weight_ pple_liveinhouse_ pple_livewithLess5yrs_ less5yrsmale_ less5yrsfemale_

      Source |       SS       df       MS              Number of obs =     189
-------------+------------------------------           F(  5,   183) =    1.74
       Model |  893.720861     5  178.744172           Prob > F      =  0.1283
    Residual |  18834.5754   183  102.921177           R-squared     =  0.0453
-------------+------------------------------           Adj R-squared =  0.0192
       Total |  19728.2963   188  104.937746           Root MSE      =  10.145

----------------------------------------------------------------------------------------
                  age_ |      Coef.   Std. Err.      t    P>|t|     [95% Conf. Interval]
-----------------------+----------------------------------------------------------------
               weight_ |   .0492935   .0217698     2.26   0.025     .0063413    .0922456
     pple_liveinhouse_ |   .0313731   .4503768     0.07   0.945    -.8572258    .9199719
pple_livewithLess5yrs_ |  -7.289569    6.49671    -1.12   0.263    -20.10765    5.528516
         less5yrsmale_ |   6.310797   6.194559     1.02   0.310    -5.911141    18.53273
       less5yrsfemale_ |   3.833062   6.154727     0.62   0.534    -8.310288    15.97641
                 _cons |   10.39163   6.135872     1.69   0.092    -1.714521    22.49778
----------------------------------------------------------------------------------------

. *predict y
. *twoway (scatter pple_liveinhouse_ weight_) (line y weight_)
. 
. regress age_ weight_

      Source |       SS       df       MS              Number of obs =     189
-------------+------------------------------           F(  1,   187) =    5.15
       Model |  528.302537     1  528.302537           Prob > F      =  0.0245
    Residual |  19199.9938   187  102.673763           R-squared     =  0.0268
-------------+------------------------------           Adj R-squared =  0.0216
       Total |  19728.2963   188  104.937746           Root MSE      =  10.133

------------------------------------------------------------------------------
        age_ |      Coef.   Std. Err.      t    P>|t|     [95% Conf. Interval]
-------------+----------------------------------------------------------------
     weight_ |   .0486433   .0214443     2.27   0.024     .0063395    .0909471
       _cons |   12.67647   1.538868     8.24   0.000     9.640696    15.71224
------------------------------------------------------------------------------

. predict y
(option xb assumed; fitted values)

. twoway (scatter age_ weight_) (line y weight_)

. 
. save dataXX.dta, replace
file dataXX.dta saved

. 
. log close
      name:  <unnamed>
       log:  C:\Users\user\OneDrive\Desktop\aron\Stata\STATA NOTES\dataXX.log
  log type:  text
 closed on:  13 Aug 2025, 13:42:34
---------------------------------------------------------------------------------------------------------------------------------------------------------
