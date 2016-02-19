class Response < ActiveRecord::Base
  belongs_to :survey
  belongs_to :question
  belongs_to :taker, class_name: "User"
  belongs_to :choice
end
