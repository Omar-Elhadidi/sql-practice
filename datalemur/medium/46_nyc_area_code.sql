-- Problem: NYC Area Code (DataLemur - Medium)
-- URL: https://datalemur.com/questions/verizon-nyc-area-code
-- Note: Must use a single pass with two JOINs and an OR condition to avoid double-counting intra-NYC calls (calls where both caller and receiver have 212 area codes).

SELECT COUNT(*) AS nyc_call_count
FROM phone_calls c
JOIN phone_info caller 
  ON c.caller_id = caller.caller_id
JOIN phone_info receiver 
  ON c.receiver_id = receiver.caller_id
WHERE caller.phone_number LIKE '+1-212%'
   OR receiver.phone_number LIKE '+1-212%';
