A SQL-based analytical project measuring user activation and monetization performance by analyzing the free-to-paid conversion funnel of an online learning platform. The project calculates key KPIs including conversion rate, activation time, and time-to-purchase using multi-table relational datasets.

# Customer-Free-to-Paid-Conversion-Funnel-Analysis-SQL-

1. **Project Overview**

This project analyzes the Free-to-Paid conversion funnel of students on the 365 learning platform using SQL.

The goal is to evaluate:

A. How quickly students engage after registration

B. How effectively engaged users convert to paid subscriptions

C. How long it takes for engagement to turn into revenue

The analysis is performed using structured SQL queries on relational datasets.

2. **Dataset Description**

The project uses three relational tables:

A. student_info

~ student_id

~ date_registered

B. student_engagement

~ student_id

~ date_watched

C. student_purchases

~ student_id

~ date_purchased

Dataset Size:

~ 40,979 registered students

~ 74,246 engagement records

~ 5,922 purchase records

3. **Business Problem**

Understanding user behavior in a subscription-based platform requires answering:

A. What percentage of engaged students convert to paid users?

B. How quickly do students engage after registering?

C. How long does it take engaged students to subscribe?

These insights help optimize:

~ Onboarding

~ Content strategy

~ Monetization timing

~ Marketing automation

4. **Key Metrics Computed**

Metric 1: Free-to-Paid Conversion Rate

<img width="1127" height="98" alt="image" src="https://github.com/user-attachments/assets/1e595525-950d-4e32-9144-76bc3152fb57" />

Measures monetization efficiency of engaged users.

Metric 2: Average Duration Between Registration and First Engagement

**Avg(Reg→Watch)**

Measures activation speed.

Metric 3: Average Duration Between First Engagement and First Purchase

**Avg(Watch→Purchase)**

Measures conversion latency.

5. **Technical Approach**

Key SQL Techniques Used:

~ GROUP BY with MIN() to extract first-time events

~ INNER JOIN to define engaged cohorts

~ LEFT JOIN to retain non-converters

~ DATEDIFF() to compute behavioral time gaps

~ Conditional aggregation for conversion rate

~ Funnel-based filtering (purchase_date >= watch_date)

6. **Funnel Logic**

The analysis follows this structure:

<img width="593" height="182" alt="image" src="https://github.com/user-attachments/assets/278f6c66-1754-434a-bef3-4d311b8d3528" />

To ensure valid funnel behavior:

~ First purchase must occur on or after first watch

~ Aggregation is done before joining to avoid row duplication

7. **Key Insights**

~ Engagement is a strong predictor of monetization.

~ Reducing time to first watch may increase conversion probability.

~ Faster watch-to-purchase duration suggests higher perceived value.

~ Delayed purchase behavior may indicate pricing or friction barriers.

8. **Business Implications**

This analysis can help:

~ Improve onboarding flows

~ Optimize paywall timing

~ Design re-engagement campaigns

~ Increase subscription conversion rates

9. **Skills Demonstrated**

~ Advanced SQL querying

~ Funnel analysis

~ KPI design

~ Aggregation & subqueries

~ Cohort logic

~ Business metric interpretation

~ Data storytelling

10. **Tools Used**

~ MySQL

~ SQL Aggregations & Joins

~ Relational Database Modeling

11. **Author**

Arpit Mukherjee

Data Analyst | SQL | Business Analytics
