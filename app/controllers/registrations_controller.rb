class RegistrationsController < Devise::RegistrationsController
  before_filter :update_sanitized_params, if: :devise_controller?
  before_filter :generate_ids, only: [:new, :create]

  def update_sanitized_params
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:id, :username, :name, :email, :password, :password_confirmation, :answers_attributes => [:id, :question_id, :answer, :user_id])}
    devise_parameter_sanitizer.for(:account_update) {|u| u.permit(:username, :name, :email, :password, :password_confirmation)}
  end

  def update
    account_update_params = devise_parameter_sanitizer.sanitize(:account_update)

    # required for settings form to submit when password is left blank
    if account_update_params[:password].blank?
      account_update_params.delete("password")
      account_update_params.delete("password_confirmation")
    end

    @user = User.find(current_user.id)
    if @user.update_attributes(account_update_params)
      set_flash_message :notice, :updated
      # Sign in the user bypassing validation in case his password changed
      sign_in @user, :bypass => true
      redirect_to after_update_path_for(@user)
    else
      render "edit"
    end
  end

  def new
    build_resource({})
    3.times do |n|
     resource.answers.build(question_id: @questions_ids[n])
   end
    respond_with self.resource
  end

  # def create
  #   super
  #   resource.answers = []
  # end


  def generate_ids
     @questions_ids = Question.pluck(:id).shuffle unless @questions_ids
  end


end
