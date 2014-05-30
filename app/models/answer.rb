class Answer < ActiveRecord::Base


	belongs_to :user
  belongs_to :question

  validates :answer, :presence => true



  def self.verify(id_questions, answers, user_id)
  	result = {verify: true, bad: [], good: []}
  	answers.each_with_index do |ans, i|
  		pos_ans = Answer.where("answer ilike ?", ans).first
  		if pos_ans and pos_ans.question.id == id_questions[i].to_i and pos_ans.user_id == user_id
  			result[:good][i] = ans
  		else
  			result[:verify] = false
  			result[:bad][i] = ans
  		end
  	end
  	result
  end
end
