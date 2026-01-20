-- Funnel step counts
SELECT event, COUNT(DISTINCT user_id) AS users
FROM funnel_events
GROUP BY event;

-- Purchase conversion by channel
SELECT
  channel,
  COUNT(DISTINCT CASE WHEN event = 'purchase' THEN user_id END) * 1.0 /
  COUNT(DISTINCT CASE WHEN event = 'visit' THEN user_id END) AS purchase_conversion
FROM funnel_events
GROUP BY channel;
