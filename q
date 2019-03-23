                                      Table "public.reviews"
   Column    |            Type             |                      Modifiers                       
-------------+-----------------------------+------------------------------------------------------
 id          | integer                     | not null default nextval('reviews_id_seq'::regclass)
 product_id  | integer                     | 
 user_id     | integer                     | 
 description | text                        | 
 rating      | integer                     | 
 new_rating  | integer                     | 
 created_at  | timestamp without time zone | not null
 updated_at  | timestamp without time zone | not null
Indexes:
    "reviews_pkey" PRIMARY KEY, btree (id)
    "index_reviews_on_product_id" btree (product_id)
    "index_reviews_on_user_id" btree (user_id)

