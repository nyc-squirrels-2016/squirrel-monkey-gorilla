class Choice < ActiveRecord::Base
  validates :body, presence: true
  belongs_to :question
  has_many :answers
end
