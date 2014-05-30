class Question < ActiveRecord::Base

	has_many :answers
  has_many :users, through: :answers



  def can_be_deleted?
  	Answer.where(question_id: self.id).size > 0  ? false : true
  end
end