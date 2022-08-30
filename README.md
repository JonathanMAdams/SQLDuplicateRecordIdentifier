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

In order to determine when data should have been captured, I first needed to determine the ```difference``` between the date when baseline data were captured and when each record was captured. However, data were in long format, thus the ```Baseline Module 1 Dates``` column was ```NULL``` in all but the first row for each participant. The following query calcuates the difference between the capture of each record (i.e., row) from the baseline grouped by participant using a ```DATEDIFF``` and window function.

```
WITH diff_generator AS (SELECT DISTINCT *,
DATEDIFF(DAY, FIRST_VALUE([Surveys_DAG].[Baseline Module 1 Dates]) OVER (PARTITION BY [Surveys_DAG].[Study ID] ORDER BY [Event Name]), 
ProprietaryDataSet_Partic.[REDCap].[Surveys_DAG].[Proprietary Survey Dates]) AS [difference]
FROM ProprietaryDataSet_Partic.[REDCap].[Surveys_DAG]
INNER JOIN @IDsInQuestion
ON [Surveys_DAG].[Study ID] = [@IDsInQuestion].ProprietaryID),
```

### Creating Filters for Dates

After calcuating the number of days between the baseline and each follow-up visit for every participant, I then needed to determine how many participants had more than one record within a span of time. A bit of context may be necessary here: our project provides a certain "grace period" for data collection. For example, it's okay if a participant's one-month follow-up doesn't take place exactly 30 days after their baseline visit. These grace periods, or windows, are defined as follows:

| Timepoint | Windows |
| --- | --- |
| Month 1 | 28 to 59 days |
| Month 3 | 60 to 135 days |
| Month 6 | 136 to 266 days |
| Month 12 | 267 to 442 days |

The following query, expressed as a CTE, provides the IDs of participants who had more than one recorded visit during the Month 1 study window, as well as how many visits (```occurrences```) they had during the Month 1 window:

```
WITH mo01_filter AS (SELECT [Study ID] AS ParticID, COUNT([Study ID]) as occurrences
FROM diff_generator
WHERE ([difference] BETWEEN 28 AND 59) AND VisitInQuestion = 'mos1'
GROUP BY [Study ID]
HAVING COUNT(*) > 1),
```

I repeated this process for the Month 3, Month 6, and Month 12 windows, adjusting ```BETWEEN x AND y```, ```VisitInQuestion```, and the CTE names accordingly. 

### Picking Out Problem Participants

To select all IDs associated with problematic entries at all time points, I created the CTE ```ids_in_question```, which united all IDs and the number of visits they had per time point into a single query, given that the number of visits per time point was greater than one. 

```
ids_in_question AS
(SELECT *
FROM mo01_filter
INNER JOIN diff_generator ON mo01_filter.ParticID = diff_generator.[Study ID]
WHERE ([difference] BETWEEN 28 AND 59) AND VisitInQuestion = 'mos1'
UNION
SELECT *
FROM mo03_filter
INNER JOIN diff_generator ON mo03_filter.ParticID = diff_generator.[Study ID]
WHERE ([difference] BETWEEN 60 AND 135) AND VisitInQuProprietaryQuestionnaireestion = 'mos3'
UNION
SELECT *
FROM mo06_filter
INNER JOIN diff_generator ON mo06_filter.ParticID = diff_generator.[Study ID]
WHERE ([difference] BETWEEN 136 AND 266) AND VisitInQuestion = 'mos6'
UNION
SELECT *
FROM mo12_filter
INNER JOIN diff_generator ON mo12_filter.ParticID = diff_generator.[Study ID]
WHERE ([difference] BETWEEN 267 AND 442) AND VisitInQuestion = 'mos12'),
```

### A Deeper Dive

After I identified the problematic records (we really shouldn't blame our poor participants for dirty data!), I wanted to look at each record's item-level data. To do so, I joined my table of participants and time points with problematic records with my survey data. 

This CTE also contains a few other features. First, I created a new column, ```optimal_diff```, using a ```CASE WHEN``` series, that sets an "ideal" time expressed in days for when each record should be captured. Second, I matched the dates I had associated with suspect visits to dates when this survey was recorded by asking for ```DATEDIFF```'s between those two dates of 0. I had to do this because I referenced a different summary table when creating the ``m0**_filter``` CTEs above. Finally, I required data to be complete by setting ```questionnaire_complete = 2```.

```
lts_opt_diff AS
(SELECT ids_in_question.[Study ID], ids_in_question.[VisitInQuestion], ids_in_question.[difference], ids_in_question.[Proprietary Survey Dates], [ProprietaryDataSet_Partic].[REDCap].[ProprietaryQuestionnaire].*,
CASE WHEN VisitInQuestion = 'mos1' THEN 30
WHEN VisitInQuestion = 'mos3' THEN 90
WHEN VisitInQuestion = 'mos6' THEN 180
WHEN VisitInQuestion = 'mos12' THEN 365
END AS optimal_diff
FROM ids_in_question
INNER JOIN [ProprietaryDataSet_Partic].[REDCap].[ProprietaryQuestionnaire] ON ids_in_question.[Study ID] = [ProprietaryDataSet_Partic].[REDCap].[ProprietaryQuestionnaire].[ProprietaryID]
WHERE (DATEDIFF(day, ids_in_question.[Proprietary Survey Dates], [ProprietaryDataSet_Partic].[REDCap].[ProprietaryQuestionnaire].[start]) = 0)
AND questionnaire_complete = 2),
```

### Determining the Best Records

It's finally time to determine the records we should use. This required two steps. First, I had to calcuate the absolute distance (```actual_diff```) between the optimal difference between baseline and the date of record collection (```optimal_diff```) and the actual difference between those two time points. More simply put, the absolute distance would be a measure of how far we were from when we should have collected the data. 

Because there were multiple records per time point--that is why I am writing this query, after all!--I took the minimum absolute difference 
