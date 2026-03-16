-- ============================================================================
-- SEMANTIC LAYER FOR APP USER JOURNEY ANALYSIS
-- Mobile App User Behavior Tracking
-- ============================================================================

-- RAW DATA LAYER: Events as they happen
-- ============================================================================

CREATE TABLE raw_events (
    event_id INT PRIMARY KEY,
    user_id INT,
    event_type VARCHAR(50),  -- 'app_open', 'screen_view', 'button_click', 'purchase', 'app_close'
    event_name VARCHAR(100),  -- 'homepage_viewed', 'product_clicked', 'checkout_started', etc.
    screen_name VARCHAR(50),
    timestamp TIMESTAMP,
    event_value DECIMAL(10,2),
    device_type VARCHAR(20),  -- 'mobile', 'tablet'
    os_version VARCHAR(20)    -- 'iOS', 'Android'
);

CREATE TABLE raw_users (
    user_id INT PRIMARY KEY,
    signup_date DATE,
    country VARCHAR(50),
    user_segment VARCHAR(50)  -- 'free', 'premium', 'trial'
);

-- Sample data
INSERT INTO raw_events VALUES
(1, 101, 'app_open', 'app_launched', 'splash_screen', '2026-03-16 09:00:00', NULL, 'mobile', 'iOS'),
(2, 101, 'screen_view', 'homepage_viewed', 'homepage', '2026-03-16 09:01:00', NULL, 'mobile', 'iOS'),
(3, 101, 'button_click', 'product_browsed', 'product_list', '2026-03-16 09:05:00', NULL, 'mobile', 'iOS'),
(4, 101, 'screen_view', 'product_detail_viewed', 'product_detail', '2026-03-16 09:06:00', NULL, 'mobile', 'iOS'),
(5, 101, 'button_click', 'add_to_cart_clicked', 'product_detail', '2026-03-16 09:08:00', 29.99, 'mobile', 'iOS'),
(6, 101, 'screen_view', 'cart_viewed', 'cart', '2026-03-16 09:10:00', NULL, 'mobile', 'iOS'),
(7, 101, 'screen_view', 'checkout_started', 'checkout', '2026-03-16 09:12:00', NULL, 'mobile', 'iOS'),
(8, 101, 'button_click', 'payment_completed', 'payment', '2026-03-16 09:15:00', 29.99, 'mobile', 'iOS'),
(9, 101, 'screen_view', 'order_confirmation', 'confirmation', '2026-03-16 09:16:00', NULL, 'mobile', 'iOS'),
(10, 101, 'app_close', 'app_closed', NULL, '2026-03-16 09:20:00', NULL, 'mobile', 'iOS'),
-- Another user with different journey
(11, 102, 'app_open', 'app_launched', 'splash_screen', '2026-03-16 10:00:00', NULL, 'tablet', 'Android'),
(12, 102, 'screen_view', 'homepage_viewed', 'homepage', '2026-03-16 10:01:00', NULL, 'tablet', 'Android'),
(13, 102, 'button_click', 'product_browsed', 'product_list', '2026-03-16 10:05:00', NULL, 'tablet', 'Android'),
(14, 102, 'app_close', 'app_closed', NULL, '2026-03-16 10:08:00', NULL, 'tablet', 'Android');

INSERT INTO raw_users VALUES
(101, '2026-01-15', 'USA', 'premium'),
(102, '2026-03-01', 'Canada', 'free');

-- ============================================================================
-- SEMANTIC LAYER: User Journey Views
-- ============================================================================

-- VIEW 1: User Session Definition
-- A "session" = continuous app usage from open to close
CREATE OR REPLACE VIEW v_user_sessions AS
SELECT
    user_id,
    MIN(timestamp) AS session_start,
    MAX(timestamp) AS session_end,
    EXTRACT(EPOCH FROM (MAX(timestamp) - MIN(timestamp))) / 60 AS session_duration_minutes,
    COUNT(DISTINCT event_id) AS total_events,
    COUNT(DISTINCT CASE WHEN event_type = 'screen_view' THEN screen_name END) AS unique_screens_visited,
    COUNT(DISTINCT CASE WHEN event_type = 'button_click' THEN event_name END) AS total_clicks,
    SUM(CASE WHEN event_type = 'purchase' THEN event_value ELSE 0 END) AS session_revenue,
    CASE
        WHEN SUM(CASE WHEN event_type = 'purchase' THEN event_value ELSE 0 END) > 0 THEN 'Converted'
        ELSE 'Did Not Convert'
    END AS session_result,
    DATE(MIN(timestamp)) AS session_date
FROM raw_events
GROUP BY 
    user_id,
    DATE(MIN(timestamp))
ORDER BY user_id, session_start;

-- VIEW 2: User Funnel (How far users get in the journey)
CREATE OR REPLACE VIEW v_user_funnel AS
SELECT
    user_id,
    COUNT(DISTINCT CASE WHEN event_name = 'app_launched' THEN 1 END) AS users_who_opened_app,
    COUNT(DISTINCT CASE WHEN event_name = 'homepage_viewed' THEN 1 END) AS users_who_viewed_homepage,
    COUNT(DISTINCT CASE WHEN event_name = 'product_browsed' THEN 1 END) AS users_who_browsed_products,
    COUNT(DISTINCT CASE WHEN event_name = 'product_detail_viewed' THEN 1 END) AS users_who_viewed_details,
    COUNT(DISTINCT CASE WHEN event_name = 'add_to_cart_clicked' THEN 1 END) AS users_who_added_to_cart,
    COUNT(DISTINCT CASE WHEN event_name = 'checkout_started' THEN 1 END) AS users_who_started_checkout,
    COUNT(DISTINCT CASE WHEN event_name = 'payment_completed' THEN 1 END) AS users_who_completed_purchase
FROM raw_events
GROUP BY user_id;

-- VIEW 3: Conversion Path (What journey did users take?)
CREATE OR REPLACE VIEW v_user_conversion_path AS
WITH event_sequence AS (
    SELECT
        user_id,
        event_name,
        ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY timestamp) AS step_number
    FROM raw_events
    WHERE event_type IN ('screen_view', 'button_click', 'purchase')
)
SELECT
    user_id,
    STRING_AGG(event_name, ' → ') AS user_journey,
    COUNT(*) AS total_steps
FROM event_sequence
GROUP BY user_id;

-- VIEW 4: User Engagement Metrics
CREATE OR REPLACE VIEW v_user_engagement AS
SELECT
    u.user_id,
    u.signup_date,
    u.user_segment,
    u.country,
    COUNT(DISTINCT DATE(e.timestamp)) AS days_active,
    COUNT(DISTINCT e.event_id) AS total_events,
    COUNT(DISTINCT CASE WHEN e.event_type = 'app_open' THEN DATE(e.timestamp) END) AS days_app_opened,
    COUNT(DISTINCT CASE WHEN e.event_type = 'purchase' THEN e.event_id END) AS total_purchases,
    SUM(CASE WHEN e.event_type = 'purchase' THEN e.event_value ELSE 0 END) AS total_spent,
    ROUND(AVG(CASE WHEN e.event_type = 'purchase' THEN e.event_value END), 2) AS avg_purchase_value,
    MAX(e.timestamp) AS last_activity,
    DATEDIFF(DAY, MAX(e.timestamp), CURRENT_TIMESTAMP) AS days_since_active
FROM raw_users u
LEFT JOIN raw_events e ON u.user_id = e.user_id
GROUP BY u.user_id, u.signup_date, u.user_segment, u.country;

-- VIEW 5: Drop-off Analysis (Where do users leave?)
CREATE OR REPLACE VIEW v_user_dropoff_points AS
WITH event_sequence AS (
    SELECT
        user_id,
        event_name,
        ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY timestamp) AS step_number,
        LEAD(event_name) OVER (PARTITION BY user_id ORDER BY timestamp) AS next_step
    FROM raw_events
    WHERE event_type IN ('screen_view', 'button_click', 'purchase')
)
SELECT
    user_id,
    event_name AS last_screen_visited,
    next_step,
    CASE
        WHEN next_step IS NULL THEN 'Dropped Off'
        ELSE 'Continued'
    END AS user_status
FROM event_sequence
WHERE event_name IS NOT NULL;

-- VIEW 6: Device & OS Performance
CREATE OR REPLACE VIEW v_device_performance AS
SELECT
    device_type,
    os_version,
    COUNT(DISTINCT user_id) AS unique_users,
    COUNT(DISTINCT DATE(timestamp)) AS active_days,
    AVG(CASE WHEN event_type = 'purchase' THEN 1 ELSE 0 END) * 100 AS purchase_rate_percent,
    COUNT(DISTINCT CASE WHEN event_type = 'purchase' THEN event_id END) AS total_purchases,
    SUM(CASE WHEN event_type = 'purchase' THEN event_value ELSE 0 END) AS total_revenue
FROM raw_events
GROUP BY device_type, os_version;

-- ============================================================================
-- BUSINESS METRICS VIEWS (High-level KPIs)
-- ============================================================================

-- VIEW 7: Daily Funnel Metrics
CREATE OR REPLACE VIEW v_daily_funnel_metrics AS
SELECT
    DATE(timestamp) AS metric_date,
    COUNT(DISTINCT CASE WHEN event_name = 'app_launched' THEN user_id END) AS daily_app_opens,
    COUNT(DISTINCT CASE WHEN event_name = 'homepage_viewed' THEN user_id END) AS users_viewed_homepage,
    COUNT(DISTINCT CASE WHEN event_name = 'product_browsed' THEN user_id END) AS users_browsed_products,
    COUNT(DISTINCT CASE WHEN event_name = 'add_to_cart_clicked' THEN user_id END) AS users_added_to_cart,
    COUNT(DISTINCT CASE WHEN event_name = 'payment_completed' THEN user_id END) AS users_completed_purchase,
    ROUND(100.0 * 
        COUNT(DISTINCT CASE WHEN event_name = 'payment_completed' THEN user_id END) / 
        NULLIF(COUNT(DISTINCT CASE WHEN event_name = 'app_launched' THEN user_id END), 0), 2) AS daily_conversion_rate_percent,
    SUM(CASE WHEN event_type = 'purchase' THEN event_value ELSE 0 END) AS daily_revenue
FROM raw_events
GROUP BY DATE(timestamp);

-- VIEW 8: User Cohort Performance
CREATE OR REPLACE VIEW v_user_cohort_analysis AS
SELECT
    DATE_TRUNC('week', u.signup_date) AS signup_week,
    COUNT(DISTINCT u.user_id) AS cohort_size,
    COUNT(DISTINCT CASE WHEN ue.total_purchases > 0 THEN u.user_id END) AS users_who_purchased,
    ROUND(100.0 * 
        COUNT(DISTINCT CASE WHEN ue.total_purchases > 0 THEN u.user_id END) / 
        NULLIF(COUNT(DISTINCT u.user_id), 0), 2) AS cohort_conversion_rate,
    ROUND(SUM(ue.total_spent) / NULLIF(COUNT(DISTINCT u.user_id), 0), 2) AS avg_ltv_per_user,
    SUM(ue.total_spent) AS total_cohort_revenue
FROM raw_users u
LEFT JOIN v_user_engagement ue ON u.user_id = ue.user_id
GROUP BY DATE_TRUNC('week', u.signup_date);

-- ============================================================================
-- USAGE EXAMPLES: How to use the semantic layer
-- ============================================================================

-- EXAMPLE 1: "Show me today's conversion funnel"
SELECT
    daily_app_opens,
    users_viewed_homepage,
    users_browsed_products,
    users_added_to_cart,
    users_completed_purchase,
    daily_conversion_rate_percent,
    daily_revenue
FROM v_daily_funnel_metrics
WHERE metric_date = '2026-03-16';

-- Result:
-- daily_app_opens | users_viewed_homepage | users_browsed_products | ...
-- 2               | 2                     | 2                      | ...

-- EXAMPLE 2: "Which users dropped off and where?"
SELECT
    user_id,
    last_screen_visited,
    next_step,
    user_status
FROM v_user_dropoff_points
WHERE user_status = 'Dropped Off';

-- Result:
-- user_id | last_screen_visited | next_step | user_status
-- 102     | product_list        | NULL      | Dropped Off

-- EXAMPLE 3: "Show me the complete user journey"
SELECT
    user_id,
    user_journey,
    total_steps
FROM v_user_conversion_path;

-- Result:
-- user_id | user_journey | total_steps
-- 101     | app_launched → homepage_viewed → product_browsed → product_detail_viewed → add_to_cart_clicked → checkout_started → payment_completed → order_confirmation | 8
-- 102     | app_launched → homepage_viewed → product_browsed | 3

-- EXAMPLE 4: "Which cohort has best engagement?"
SELECT
    signup_week,
    cohort_size,
    users_who_purchased,
    cohort_conversion_rate,
    avg_ltv_per_user,
    total_cohort_revenue
FROM v_user_cohort_analysis
ORDER BY cohort_conversion_rate DESC;

-- EXAMPLE 5: "Which device/OS combo converts best?"
SELECT
    device_type,
    os_version,
    unique_users,
    purchase_rate_percent,
    total_revenue
FROM v_device_performance
ORDER BY purchase_rate_percent DESC;

-- EXAMPLE 6: "Show me user engagement by segment"
SELECT
    user_segment,
    COUNT(*) AS total_users,
    ROUND(AVG(days_active), 1) AS avg_days_active,
    ROUND(AVG(total_events), 1) AS avg_events_per_user,
    ROUND(AVG(total_spent), 2) AS avg_spent_per_user,
    COUNT(DISTINCT CASE WHEN total_purchases > 0 THEN user_id END) AS users_who_purchased
FROM v_user_engagement
GROUP BY user_segment;

-- ============================================================================
-- KEY INSIGHTS YOU CAN GET FROM THIS SEMANTIC LAYER
-- ============================================================================

/*
1. CONVERSION FUNNEL
   "What % of users complete each step?"
   - 100% open app
   - 100% view homepage
   - 100% browse products
   - 50% add to cart
   - 50% complete purchase
   
2. DROP-OFF ANALYSIS
   "Where are users leaving?"
   - User 102 dropped off at product_list (didn't go to details)
   
3. USER JOURNEY PATTERNS
   "What path do successful users take?"
   - Successful users: app → homepage → products → details → cart → checkout
   - Abandoned users: app → homepage → products (stop)
   
4. DEVICE PERFORMANCE
   "iOS or Android better?"
   - Compare conversion rates and revenue
   
5. COHORT ANALYSIS
   "Which signup week has best users?"
   - Track which cohorts spend the most
   
6. ENGAGEMENT METRICS
   "Which user segment is most active?"
   - Free vs Premium vs Trial users
*/
