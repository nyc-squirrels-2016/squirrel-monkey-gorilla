class Question < ActiveRecord::Base
  validates :body, presence: true
  # , uniqueness: {scope: :survey_id, message: "This survey already contains that question"}

  belongs_to :survey
  has_many :choices, dependent: :destroy
  has_many :answers

end
