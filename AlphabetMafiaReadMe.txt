Read Me:

Welcome to the dataset for "The Alphabet Mafia: Effectiveness of LGBTQ+ Interest Groups in Congress!

There are 3 other files in this data besides the Read Me:

- "RD_GIGP.xlxs" is the raw data for the Congressional votes used in this paper. Below is the meaning of each column:
	- Congressperson - Last Name (+ Sometimes State if multiple same names) of the member of Congress
	- Party - A dummy variable for party, 0 is for Republican, 1 is for Democratic
	- State - the state the member of Congress is representing 
	- Vote - did they vote YEA/NAY/Did Not Vote on the bill
	- ProGay - was their vote on the bill in favor of LGBTQ+ rights? This is different from "Vote", pro-LGBTQ+ votes can be either YEA or NAY
	- Year - what year the bill came up for a vote
	- Bill - the name of the bill
	- Chamber - Dummy variable for Chamber, 0 is Senate, 1 is House
	- Congress - which Congress the vote was held in
	- ControlofChamber - Which party had control of the chamber the vote was held in: 0 for Republican, 1 for Democratic
	- LeadershipChair - Was that member serving in party leadership, 0 is No, 1 is Yes
	- CommitteeMembers - did the Congressmember serve on the committee where the bill originated? 0 is No, 1 is Yes
	- LGBTQMember - was this Congressperson a member of the LGBTQ+ community, 0 is not, 1 is a member
	- DW - DW Nominate Scores of the member in this Congress
	- RestofName - Rest of Name (bit all over the place, probably should ignore this column)
	- id - individual ID assigned to members when coding
	- UnadjustedDonos - raw sum of donations from LGBTQ interests
	- DonationsInflation - donations adjusted for inflation
	- OUTLGBT - open members of the LGBTQ community serving in Congress, 0 they are not an open member, 1 they are
	- _merge - merging in from Congressional scorecards
	- Gender - Binary variable for gender of member of Congress
	- Race - Dummy for "Race" (White or Not)
	- African American - dummy for whether the member of Congress is an African American
	- Hispanic - dummy for whether the member of Congress is of Hispanic descent

- "AlphabetMafiaReplicationCode.do" - this is the replication code (STATA) for the results provided within the paper
	- Will Need to Install: catplot in STATA: ssc install catplot
	- WIll Need to Install: outreg in STATA: ssc install outreg

	- Model 1 Replication found on lines 35 - 52 in .do file.
	- Figure 1 Replication found on lines 54 - 82 in .do file.
	- Appendix Table 1 found on lines 86 - 102 in .do file.
	- Appendix Table 2 found on lines 103 - 122 in .do file.
	- Appendix Table 3 found on lines 124 - 134 in .do file.
	- Appendix Table 4 found on lines 136 - 147 in .do file. 

- "AlphabetMafiaLogFile.smcl" - this is the log file of the code (STATA) for the results provided within the paper

