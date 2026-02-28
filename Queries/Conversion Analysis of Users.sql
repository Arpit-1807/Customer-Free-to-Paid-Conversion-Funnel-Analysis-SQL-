Select * From db_course_conversions.student_engagement;
Select * From db_course_conversions.student_info;
Select * From db_course_conversions.student_purchases;

/*
your objective is to determine the conversion rate of students who have already watched a lecture. 
Therefore, filter your result dataset so that the date of first-time engagement comes before 
(or is equal to) the date of first-time purchase.
*/

SELECT
    si.student_id,
    si.date_registered,
    se.first_date_watched,
    sp.first_date_purchased,
    DATEDIFF(se.first_date_watched, si.date_registered) AS date_diff_reg_watch,
    CASE 
        WHEN sp.first_date_purchased IS NOT NULL 
        THEN DATEDIFF(sp.first_date_purchased, se.first_date_watched)
        ELSE NULL
    END AS date_diff_watch_purch
FROM db_course_conversions.student_info si
INNER JOIN (
    SELECT
        student_id,
        MIN(date_watched) AS first_date_watched
    FROM db_course_conversions.student_engagement
    GROUP BY student_id
) se
    ON si.student_id = se.student_id
LEFT JOIN (
    SELECT
        student_id,
        MIN(date_purchased) AS first_date_purchased
    FROM db_course_conversions.student_purchases
    GROUP BY student_id
) sp
    ON si.student_id = sp.student_id
WHERE sp.first_date_purchased IS NULL
   OR se.first_date_watched <= sp.first_date_purchased;

-- First Query for Free-to-Paid Conversion Rate

SELECT
    ROUND(
        100.0 * 
        COUNT(
            CASE 
                WHEN sp.first_date_purchased IS NOT NULL
                     AND sp.first_date_purchased >= se.first_date_watched
                THEN si.student_id
            END
        ) 
        / COUNT(DISTINCT si.student_id),
        2
    ) AS conversion_rate
FROM db_course_conversions.student_info si
INNER JOIN (
    SELECT
        student_id,
        MIN(date_watched) AS first_date_watched
    FROM db_course_conversions.student_engagement
    GROUP BY student_id
) se
    ON si.student_id = se.student_id
LEFT JOIN (
    SELECT
        student_id,
        MIN(date_purchased) AS first_date_purchased
    FROM db_course_conversions.student_purchases
    GROUP BY student_id
) sp
    ON si.student_id = sp.student_id;

-- Second query for Average Duration Between Registration and First-Time Engagement:

SELECT
    ROUND(
        AVG(
            DATEDIFF(se.first_date_watched, si.date_registered)
        ),
        2
    ) AS av_reg_watch
FROM db_course_conversions.student_info si
INNER JOIN (
    SELECT
        student_id,
        MIN(date_watched) AS first_date_watched
    FROM db_course_conversions.student_engagement
    GROUP BY student_id
) se
    ON si.student_id = se.student_id;
    
-- Third query Average Duration Between First-Time Engagement and First-Time Purchase:

SELECT
    ROUND(
        AVG(
            DATEDIFF(sp.first_date_purchased, se.first_date_watched)
        ),
        2
    ) AS av_watch_purch
FROM( 
	Select
		student_id,
        Min(date_watched) AS first_date_watched
	from db_course_conversions.student_engagement 
    Group BY student_id
) se
Inner Join(
	Select
		student_id,
        Min(date_purchased) as first_date_purchased
	from db_course_conversions.student_purchases
    Group BY student_id
) sp
	ON se.student_id = sp.student_id
Where sp.first_date_purchased >= se.first_date_watched;
        

		




		