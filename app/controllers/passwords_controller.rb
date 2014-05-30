class PasswordsController < Devise::PasswordsController


	def new
    self.resource = resource_class.new
  end


	protected
	def after_sending_reset_password_instructions_path_for(resource_name)
		if resource_name =~ /user/
			new_session_path
		else
			new_session_path(resource_name) if is_navigational_format?
		end
	end
end