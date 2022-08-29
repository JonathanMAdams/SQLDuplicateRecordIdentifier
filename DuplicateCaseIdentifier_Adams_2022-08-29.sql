/* Import IDs in Question from Aaron's CSV file. 
Create temporary table. */

DECLARE @IDsInQuestion TABLE (ProprietaryID varchar(20), VisitInQuestion varchar(20))
INSERT INTO @IDsInQuestion 
VALUES('redacted','mos1'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos12'),
('redacted','mos12'),
('redacted','mos3'),
('redacted','mos3'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos3'),
('redacted','mos3'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos3'),
('redacted','mos3'),
('redacted','mos3'),
('redacted','mos3'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos6'),
('redacted','mos6'),
('redacted','mos3'),
('redacted','mos3'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos3'),
('redacted','mos3'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos6'),
('redacted','mos6'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos3'),
('redacted','mos3'),
('redacted','mos3'),
('redacted','mos3'),
('redacted','mos3'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos6'),
('redacted','mos6'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos3'),
('redacted','mos3'),
('redacted','mos12'),
('redacted','mos12'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos6'),
('redacted','mos6'),
('redacted','mos12'),
('redacted','mos12'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos3'),
('redacted','mos3'),
('redacted','mos3'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos6'),
('redacted','mos6'),
('redacted','mos6'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos6'),
('redacted','mos6'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos12'),
('redacted','mos12'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos12'),
('redacted','mos12'),
('redacted','mos6'),
('redacted','mos6'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos12'),
('redacted','mos12'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos3'),
('redacted','mos3'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos3'),
('redacted','mos3'),
('redacted','mos3'),
('redacted','mos3'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos6'),
('redacted','mos6'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos6'),
('redacted','mos6'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos3'),
('redacted','mos3'),
('redacted','mos6'),
('redacted','mos6'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos3'),
('redacted','mos3'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos6'),
('redacted','mos6'),
('redacted','mos12'),
('redacted','mos12'),
('redacted','mos6'),
('redacted','mos6'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos3'),
('redacted','mos3'),
('redacted','mos3'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos6'),
('redacted','mos6'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos12'),
('redacted','mos12'),
('redacted','mos6'),
('redacted','mos6'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos6'),
('redacted','mos6'),
('redacted','mos6'),
('redacted','mos6'),
('redacted','mos3'),
('redacted','mos3'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos6'),
('redacted','mos6'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos12'),
('redacted','mos12'),
('redacted','mos3'),
('redacted','mos3'),
('redacted','mos6'),
('redacted','mos6'),
('redacted','mos3'),
('redacted','mos3'),
('redacted','mos3'),
('redacted','mos3'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos12'),
('redacted','mos12'),
('redacted','mos3'),
('redacted','mos3'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos6'),
('redacted','mos6'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos6'),
('redacted','mos6'),
('redacted','mos6'),
('redacted','mos6'),
('redacted','mos1'),
('redacted','mos1'),
('redacted','mos1');

/* Create a difference generator for dates.*/

WITH diff_generator AS (SELECT DISTINCT *,
DATEDIFF(DAY, FIRST_VALUE([Surveys_DAG].[Baseline Module 1 Dates]) OVER (PARTITION BY [Surveys_DAG].[Study ID] ORDER BY [Event Name]), 
ProprietaryDataSet_Partic.[REDCap].[Surveys_DAG].[LT Symptoms Survey Dates]) AS [difference]
FROM ProprietaryDataSet_Partic.[REDCap].[Surveys_DAG]
INNER JOIN @IDsInQuestion
ON [Surveys_DAG].[Study ID] = [@IDsInQuestion].ProprietaryID),

/* Create filters for dates. 
These filters identify individuals who have more than one recorded visit per time period.*/

mo01_filter AS (SELECT [Study ID] AS ParticID, COUNT([Study ID]) as occurrences
FROM diff_generator
WHERE ([difference] BETWEEN 28 AND 59) AND VisitInQuestion = 'mos1'
GROUP BY [Study ID]
HAVING COUNT(*) > 1),

mo03_filter AS (SELECT [Study ID] AS ParticID, COUNT([Study ID]) as occurrences
FROM diff_generator
WHERE ([difference] BETWEEN 60 AND 135) AND VisitInQuestion = 'mos3'
GROUP BY [Study ID]
HAVING COUNT(*) > 1),

mo06_filter AS (SELECT [Study ID] AS ParticID, COUNT([Study ID]) as occurrences
FROM diff_generator
WHERE ([difference] BETWEEN 136 AND 266) AND VisitInQuestion = 'mos6'
GROUP BY [Study ID]
HAVING COUNT(*) > 1),

mo12_filter AS (SELECT [Study ID] AS ParticID, COUNT([Study ID]) as occurrences
FROM diff_generator
WHERE ([difference] BETWEEN 267 AND 442) AND VisitInQuestion = 'mos12'
GROUP BY [Study ID]
HAVING COUNT(*) > 1),

/* Identify all participants with duplicate values within the same time point. */

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

/* Fetch data captured at the time closest to ideal follow-up. */

lts_opt_diff AS
(SELECT ids_in_question.[Study ID], ids_in_question.[VisitInQuestion], ids_in_question.[difference], ids_in_question.[LT Symptoms Survey Dates], [ProprietaryDataSet_Partic].[REDCap].[ProprietaryQuestionnaire].*,
CASE WHEN VisitInQuestion = 'mos1' THEN 30
WHEN VisitInQuestion = 'mos3' THEN 90
WHEN VisitInQuestion = 'mos6' THEN 180
WHEN VisitInQuestion = 'mos12' THEN 365
END AS optimal_diff
FROM ids_in_question
INNER JOIN [ProprietaryDataSet_Partic].[REDCap].[ProprietaryQuestionnaire] ON ids_in_question.[Study ID] = [ProprietaryDataSet_Partic].[REDCap].[ProprietaryQuestionnaire].[ProprietaryID]
WHERE (DATEDIFF(day, ids_in_question.[LT Symptoms Survey Dates], [ProprietaryDataSet_Partic].[REDCap].[ProprietaryQuestionnaire].[start]) = 0)
AND questionnaire_complete = 2),

lts_act_diff AS
(SELECT *, ABS(optimal_diff - [difference]) AS actual_diff
FROM lts_opt_diff),

lts_ideal_diff AS
(SELECT *, 
MIN(actual_diff) OVER (PARTITION BY [Study ID]) AS ideal_diff
FROM lts_act_diff),

/* These are the ideal data for each time point.
Remove the first line of this code block and the comma from the previous CTE to generate results.
Unfortunately, we have duplicate entries at certain time points, and these duplicate entries have DIFFERENT values in the columns. This suggests data entry error. */

lts_ideal_tps AS 
(SELECT DISTINCT *
FROM lts_ideal_diff
WHERE ideal_diff = actual_diff),

visits_in_question AS
(SELECT [Study ID], COUNT(*) AS entries
FROM lts_ideal_tps
GROUP BY [Study ID]
HAVING COUNT(*) > 1)

SELECT DISTINCT visits_in_question.[Study ID], entries, lts_ideal_diff.VisitInQuestion
FROM visits_in_question
LEFT JOIN lts_ideal_diff ON visits_in_question.[Study ID] = lts_ideal_diff.[Study ID]