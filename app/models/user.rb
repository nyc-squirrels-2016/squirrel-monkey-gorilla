class User < ActiveRecord::Base
  has_many :surveys, foreign_key: "author_id"
  has_many :responses, foreign_key: "taker_id"
end
