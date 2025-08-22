# Burnout-Analysis

**Author:** Danylo Karaulanov
**Date:** August 2025

---

## Project Overview
Burnout has become one of the most critical issues in the modern workplace. With rapid shift toward remote and hybrid work, organizations face new challenges in maintaining employee well-being.

This project explores whether burnout levels differ across different work arrangements (remote, onsite, hybrid), and how factors such as age, working hours, salary, job roles, mental health status, and geography contribute to burnout risk.

The analysis combines:
- **R** → for data cleaning, exploration and statistical testing
- **SQ**L → for querying and aggregating relational data
- **Tableau** → for interactive dashboards and regional comparisons

---

## Data & Methods
- **Dataset**: 3,000+ survey responses (demographics, work arrangements, hours worked, burnout scores, mental/physical health, salary).
- **R Analysis**:
  - Data wrangling with 'tidyverse'
  - Statistical testing
  - Visualizations with 'ggplot'
- **SQL**: Querying large survey tables for group breakdowns (e.g., buenout level by work arrangements, burnout level by average working hours, work preferences: onsite, hybrid, remote).
- **Tableau**: Dashboards to visually compare remote vs onsite burnout, combined with other factors such as gender, age, mental health state.

---

## Key Research Questions
- Does work arrangement affect burnout level?
- Is burnout related to age or working hours?
- What role do mental health conditions play in burnout risk?
- Are some job roles more vulnerable to high burnout risk than others?
- Are there any regional differences (Asia, Africa, Europe, North America, South America, Oceania) in burnout trends?
- Does income level protect against burnout or does it add pressure?

---

## Insights & Findings 

### Age & Burnout 
- **30-year-olds** reported the highest burnout rates, followed by 60s, 20s, 50s.
- **40-year-olds** consistently had lowest burnout rates.
  
The data shows that burnout peaks at early career (30s) and again pre-retirement (60s). This suggests that both career pressure and late-career stress may play roles.

---

### Mental Health and Burnout 
- Employees with no diagnosed mental health issues actually had the highest burnout rate (26.7%), compared to ~12% for those reporting conditions like anxiety or ADHD.

This could reflect that employees with no diagnosed mental health issues are lack of awareness therefore they experience higher burnout without support. Thos with diagnosed conditions may have already developed coping strategies or have access to support such as therapists, medications that can help to manage stress and prevent burnout.

---

### Hours Worked vs Burnout
- Employees working fewer hours reported higher burnout than those with longer schedules.

This suggests burnout is not only about workload but also stress, anxiety, inadequate rest and recovery, as well as job insecurities.

---

### Mental Health and Work Arrangement
- Onsite workers with mental health issues showed 75.5% high burnout, compared to 71.4% for remote.

The data suggests that onsite environments may create more stressors (commune, office politics) than remote setups.

---

### Work Arrangement Patterns
- Onsite workers work longer hours but report lower burnout then remote employees.

Longer hours don`t necessarily lead to burnout. 

--- 

### Job Role Factor
- Marketing Specialists (Remote): 61.5% high burnout → the most at-risk group. Meanwhile Onsite employees report to have 35.39% high burnout.
- Quality Assurance (Onsite): 17.2% high burnout → lowest risk group. Meanwhile Remote employees report to have 25.8% high burnout.

This suggests that creative/communication-heavy roles appear more exposed to burnout, especially in remote settings, compared to structured roles like QA.

---

### Regional Differences (High Burnout % Remote vs Onsite)
- Asia: Remote 54.7% vs Onsite 24.5%
- Africa: Remote 44.6% vs Onsite 26.3%
- Europe: Remote 43.3% vs Onsite 24.7%
- North America: Remote 37.4% vs Onsite 26.6%
- South America: Remote 53.2% vs Onsite 28.4%
- Oceania: Remote 44.7% vs Onsite 28.0%

Across all continets, remote workers consistently face higher burnout. The data shows that Asia, Africa, Oceania and South America face higher burnout rate in remote workers than in North America and Europe. A few possible reasons include stronger policy support, better work-life balance and greater cultural acceptance of mental health care in Europe and North America.

---

### Salary and Burnout 
- Lower-income workers experienced more burnout:
   - $40-60K → 13.7% high burnout
   - $120K+ → 8.1% high burnout
- Higher salaries correlated with longer working hours but lower burnout.

Higher income can provide resources to manage stress, improve overall well-being and reduce risk of burnout.

---

### Work Preferences
- Across all genders, employees prefer onsite work over remote.

Despite remote flexibility, employees value social interaction and separation between work and home.

---

## Sample Visuals
![Burnout and Mental Health by Work Arrangements](https://github.com/DanyloKaraulanov/Burnout-Analysis/blob/main/tableau/Burnout_and_Mental_Health_by_Work_Arrangements.png)

![Burnout by Work Arrangement](https://github.com/DanyloKaraulanov/Burnout-Analysis/blob/main/r_images/Burnout%20by%20Work%20Arrangement.png)

![Burnout by Age](https://github.com/DanyloKaraulanov/Burnout-Analysis/blob/main/r_images/Burnout%20by%20Age.png)

---

## Tableau Dashboard
[Burnout and Mental Health by Work Arrangements ](https://public.tableau.com/shared/FK27W7F5R?:display_count=n&:origin=viz_share_link)

[Correlation Between Burnout, Work Arrangement and Weekly Work Hours](https://public.tableau.com/views/CorrelationBetweenBurnoutWorkArrangementandWeeklyWorkHours/Sheet1?:language=en-GB&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)

[Burnout Level by Average Weekly Working Hours](https://public.tableau.com/views/BurnoutLevelbyAverageWeeklyWorkingHours/Sheet1?:language=en-GB&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)

[Work Arrangement Distribution by Age and Gender](https://public.tableau.com/views/WorkArrangementDistributionbyAgeandGender/Sheet1?:language=en-GB&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)

[Average Weekly Hours by Work Arrangements](https://public.tableau.com/views/AverageWeeklyHoursbyWorkArrangements/Sheet1?:language=en-GB&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)

---


## SQL Examples
Example query used to analyze burnout by job role:
```sql
SELECT 
Job_Role, Work_Arrangement, AVG(CASE
WHEN Burnout_Level = 'High' THEN 3
WHEN Burnout_Level = 'Medium' THEN 2
WHEN Burnout_Level = 'Low' THEN 1
ELSE NULL END) AS Avg_Burnout,
SUM(CASE WHEN Burnout_Level = 'High' THEN 1 ELSE 0 END) * 100.0  / COUNT(*) AS PCT_High,
SUM(CASE WHEN Burnout_Level = 'Medium' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS PCT_Medium,
SUM(CASE WHEN Burnout_Level = 'Low' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS PCT_Low,
COUNT(*) AS Total_Count
FROM sakila.remote_work
GROUP BY Job_Role, Work_Arrangement
ORDER BY Job_Role, 
CASE Work_Arrangement
WHEN 'Onsite' THEN 1
WHEN 'Hybrid' THEN 2
WHEN 'Remote' Then 3
ELSE 4
END,
Avg_Burnout DESC
```

More queries are avaliable in the [sql folder](https://github.com/DanyloKaraulanov/Burnout-Analysis/tree/main/sql)

---

## Recommendations
- Develop **wellness programs** for remote employees, addressing both physical and mental health needs through accessible and flexible options.
- Create **age-specific support**: mentorship for early-career employees, flexibility for older staff.
- Provide **mental health resources** proactively, even for employees without formal diagnoses.
- Support **high-risk job roles** (e.g., Marketing Specialists) with workload management and clearer expectations.
- Monitor **regional patterns** and adapt HR strategies to local contexts.

## Limitations
- Data is self-reported which may include bias or underreporting.
- Analysis is cross-sectional (one-time survey).
- Geographic analysis was limited to broad regions (continents) rather than individual countries.

## Reflection
This project demonstrates how combining R, SQL and Tableau provides a comprehensive approach:
- R for statistical depth,
- SQL for efficient querying,
- Tableau for accessible storytelling.

Future would could integrate time-series data, industry-specific splits to forecast burnout risks before they escalate.
