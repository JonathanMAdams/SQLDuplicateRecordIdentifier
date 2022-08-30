# SQLDuplicateRecordIdentifier
This SQL query detects duplicate records within my organization's data repository. Redactions made to protect participant privacy.

## Background
I serve as a research consultant for a large health care enterprise in the United States. After pulling data from our organization's respository for a longitudinal data analysis project, my colleague discovered approximately 200 duplicate records: in other words, there were 200 instances in which a participant had more than one visit logged per data collection period. After he supplied me with a list of participant IDs, my supervisor asked me to compose a SQL query that would determine which entries were legitimate and which cases might need further inspection.

## Solution
### Declaring the Initial IDs
To begin, I created a new table called ```IDsInQuestion```. I took the list of IDs he provided, along with the suspect time point (```mos1``` for Month 1, ```mos3``` for Month 3, ```mos6``` for Month 6, and ```mos12``` for Month 12) and bound them together using the ```CONCAT``` function in Microsoft Excel, like so:

```=CONCAT("('"+A1+"','"+B1+"'),")```

Using the fill handle, I was able to quickly generate values for ```IDsInQuestion```. To comply with my organization's policy, I have redacted the participant IDs in this documentation and in the accompanying query.

```
DECLARE @IDsInQuestion TABLE (ProprietaryID varchar(20), VisitInQuestion varchar(20))
INSERT INTO @IDsInQuestion 
VALUES('redacted','mos1'),
...
('redacted','mos6'),
('redacted','mos6'),
('redacted','mos6'),
('redacted','mos6'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos1');
```

### Computing Durations

In order to determine when data should have been captured, I needed to determine the ```difference``` between the date when baseline data were captured and when each record was captured. However, data were in long format, thus the ```Baseline Module 1 Dates``` column was ```NULL``` in all but the first row for each participant. The following query calcuates the difference between the capture of each record (i.e., row) from the baseline grouped by participant using a ```DATEDIFF``` and window function.

```
WITH diff_generator AS (SELECT DISTINCT *,
DATEDIFF(DAY, FIRST_VALUE([Surveys_DAG].[Baseline Module 1 Dates]) OVER (PARTITION BY [Surveys_DAG].[Study ID] ORDER BY [Event Name]), 
ProprietaryDataSet_Partic.[REDCap].[Surveys_DAG].[Proprietary Survey Dates]) AS [difference]
FROM ProprietaryDataSet_Partic.[REDCap].[Surveys_DAG]
INNER JOIN @IDsInQuestion
ON [Surveys_DAG].[Study ID] = [@IDsInQuestion].ProprietaryID),
```
