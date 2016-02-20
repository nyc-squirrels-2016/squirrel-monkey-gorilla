class Survey < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  has_many :answers
  has_many :questions
end
