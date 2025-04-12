create or replace table yelp_reviews (review_text VARIANT);

 COPY INTO yelp_reviews
FROM 's3://your-bucket-name/Folder-name/yelp_academic_dataset_review_split.json'
CREDENTIALS = (
    AWS_KEY_ID = 
    AWS_SECRET_KEY = 
)
FILE_FORMAT = (TYPE = JSON);

SELECT * FROM yelp_reviews;

FILE_FORMAT = (TYPE = JSON);

create or replace table tbl_yelp_reviews as 
    select review_text:business_id::string as business_id ,
    review_text:user_id::string as user_id ,
    review_text:date::date as review_date,
    review_text:stars::number as review_stars,
    review_text:text::string as review_text,
    analyze_sentiment(review_text) as sentiments,

    from yelp_reviews 
    -- limit 10


select * from tbl_yelp_reviews


