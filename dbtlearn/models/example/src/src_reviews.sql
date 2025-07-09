with cte as ( select * from airbnb.raw.raw_reviews)
select 
    listing_id,
    date as review_Date,
    reviewer_name,
    comments as review_text,
    sentiment as review_sentiment
from
    cte
    
    