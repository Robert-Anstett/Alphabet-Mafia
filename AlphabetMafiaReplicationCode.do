**** Updated Alphabet Mafia Paper
**** For Journal Submission
**** Robert Anstett

import excel "C:\Users\rober\OneDrive\Documents\IG_Paper\RD_GIGP.xlsx", firstrow

**** This is the updated, complete dataset from 2024. Including the additional bills (Byrd Hatecrime + Marriage Bill in Senate)
*** Should Note when replicating data please change your "import excel" location to wherever you downloaded the data to on your PC for it to work. 

********************************************
**** RUN THIS SECTION, IT IS REQUIRED TO GET CORRECT DATA + VARIABLES

drop if ProGay == "."
drop if Party == "."
destring, replace

gen DonoII = round(DonationsInflation)
gen DonoIII = DonoII/10000

egen billDestring=group(Bill)

label define billDestring 1 "Defense of Marriage Act" 2 "Department of Defense Authorization Act for FY 1994" 3 "Don't Ask Don't Tell Repeal act of 2010" 4 "Employment Non-Discrimination Act of 2013" 5 "Equality Act" 6 "Global Respect Act" 7 "Local Law Enforcement Hate Crimes Prevention Act 2009 (Shepard/Byrd)" 8 "Matthew Shepard and James Byrd Jr hate Crimes Prevention Act (Senate Cloture)" 9 "Respect for Marriage Act"

************************************************
**** Checking Variables

tab LGBTQMember
*** Out of a N of 3536, only 51 votes were from LGBTQ Members of Congress (1.43%)

tab OUTLGBT
*** Out of a N of 3536, only 41 votes were from OPENLY LGBTQ Members of Congress (1.15%)


************************************************
**** Model 1 Replication
**** This set of code is used to get the Table 1 Model Results shown within the actual text of the paper

reg ProGay DonoIII Party DW OUTLGBT Gender Race i.billDestring if Year <=2018, beta

outreg2 using AlphabetMafia.doc

reg ProGay DonoIII Party DW OUTLGBT Gender Race i.billDestring if Year >=2018, beta

outreg2 using AlphabetMafia.doc


** ~ From the Outreg Document, I made some changes:
*** REMOVE BILL.DESTRING LISTS FROM OUTREG DOCUMENT (Mostly to keep the final table clean)
*** MANUALLY Simpified to 3 decimals in final chart
*** MANUALLY Renamed "DonoIII" to "Donations", Renamed "DW" to "Ideology", "OUTLGBT" was renamed to "Openly LGBT"
*** MANUALLY renamed Model specifications, from (1)ProGay and (2)ProGay to Pre-2018 and Post-2018. Manually added last colummn to show changes in coefficients. 

*************************************************
**** Figure 1 Replication
clear
ssc install catplot

import excel "C:\Users\rober\OneDrive\Documents\IG_Paper\RD_GIGP.xlsx", firstrow

drop if ProGay == "."
drop if Party == "."
destring, replace

egen billDestring=group(Bill)

label define billDestring 1 "Defense of Marriage Act" 2 "Department of Defense Authorization Act for FY 1994" 3 "Don't Ask Don't Tell Repeal act of 2010" 4 "Employment Non-Discrimination Act of 2013" 5 "Equality Act" 6 "Global Respect Act" 7 "Local Law Enforcement Hate Crimes Prevention Act 2009 (Shepard/Byrd)" 8 "Matthew Shepard and James Byrd Jr hate Crimes Prevention Act (Senate Cloture)" 9 "Respect for Marriage Act"

gen year2 = Year
replace year2 = 2009.1 if billDestring == 7
replace year2 = 2009.2 if billDestring == 8
replace year2 = 2022.1 if billDestring == 9
replace year2 = 2022.2 if billDestring == 6


label define ProGay 0 "Anti" 1 "Pro"
label values ProGay ProGay
label define Party 0 "Republican" 1 "Democrat"
label values Party Party


catplot, over(Party) over(ProGay) over(year2) stack ytitle("Vote Total") bar(1, color(203 24 29)) bar(2, color(8 81 156)) graphregion(color(white))

*** Manually added red dotted line after in MSWord.

*************************************************
**** Appendix Table 1 Model Replications (Leadership, Chair, and Committee Models)
clear
import excel "C:\Users\rober\OneDrive\Documents\IG_Paper\RD_GIGP.xlsx", firstrow

drop if ProGay == "."
drop if Party == "."
destring, replace

gen DonoII = round(DonationsInflation)
gen DonoIII = DonoII/10000
egen billDestring=group(Bill)
label define billDestring 1 "Defense of Marriage Act" 2 "Department of Defense Authorization Act for FY 1994" 3 "Don't Ask Don't Tell Repeal act of 2010" 4 "Employment Non-Discrimination Act of 2013" 5 "Equality Act" 6 "Global Respect Act" 7 "Local Law Enforcement Hate Crimes Prevention Act 2009 (Shepard/Byrd)" 8 "Matthew Shepard and James Byrd Jr hate Crimes Prevention Act (Senate Cloture)" 9 "Respect for Marriage Act"

reg ProGay DonoIII Party DW OUTLGBT LeadershipChair CommitteeMembers Gender Race i.billDestring, beta

outreg2 using AlphabetAppendix.doc

reg ProGay DonoIII Party DW OUTLGBT LeadershipChair CommitteeMembers Gender Race i.billDestring if Year <=2018, beta

outreg2 using AlphabetAppendix.doc

reg ProGay DonoIII Party DW OUTLGBT LeadershipChair CommitteeMembers Gender Race i.billDestring if Year >=2018, beta

outreg2 using AlphabetAppendix.doc

*** Manually Renamed Model Names from (1)ProGay, (2)ProGay, (3)ProGay to All Legislaton, Pre-2018 Bills, and Post-2018 Bills in the outreg document. 
*** Manually Renamed "DonoIII" to "Donations"; No other variables manually renamed.  

***************************************************
**** Appendix Table 2 Model Replications (Without the 1994 DADT Bill)

drop if Year == 1993

reg ProGay DonoII Party DW OUTLGBT Gender Race i.billDestring, beta

outreg2 using AlphabetNoDADT.doc

reg ProGay DonoII Party DW OUTLGBT Gender Race i.billDestring if Year <=2018, beta

outreg2 using AlphabetNoDADT.doc

reg ProGay DonoII Party DW OUTLGBT Gender Race i.billDestring if Year >=2018, beta

outreg2 using AlphabetNoDADT.doc

*** MANUALLY renamed Models, from (1)ProGay, (2)ProGay, (3)ProGay to All Legislation, Pre-2018 Bills, and Post-2018 Bills respectively. 
*** MANUALLY renamed "DonoII" to "Donations"; left rest of variables alone.

****************************************************
**** Appendix Table 3: Descriptive Statistics of LGBTQ+ Members of Congress
clear
import excel "C:\Users\rober\OneDrive\Documents\IG_Paper\RD_GIGP.xlsx", firstrow

tab OUTLGBT 
drop if OUTLGBT == 0
tab OUTLGBT
tab OUTLGBT Congressperson

*** This got me the total number of votes and out LGBTQ+ Members in the dataset. From here I created a blank table in word and manually exported the data over to make Appendix Table #3. 

****************************************************
**** Appendix Table 4: Sumnmary Statistics of DOnations (Inflation Adjusted in Dollars)
clear
import excel "C:\Users\rober\OneDrive\Documents\IG_Paper\RD_GIGP.xlsx", firstrow

drop if ProGay == "."
drop if Party == "."

sort Year
by Year: summarize DonationsInflation

**** Manually copy/pasted the data from this code into chart. I am sorry for the scuffed code here.

*****************************************************








