class AnswersController < ApplicationController
	before_filter :set_user

  def verify
    @results = Answer.verify(params[:answers][:question_id], params[:answers][:answers], @user.id)
    @user.send_reset_password if @results[:verify]
    respond_to :js
  end

  def index
    return redirect_to new_user_password_path , alert: "Nombre de usuario no encontrado" if not @user
  	@questions = @user.questions.order("RANDOM()").limit(2)


  end

  private
  def set_user
  	@user = User.find_by_username(params[:answers][:username])
  end
end
