class Survey < ActiveRecord::Base
  validates  :title, presence: true 

  belongs_to :author, class_name: "User"
  has_many :answers
  has_many :questions
end
