class UnlocksController < Devise::UnlocksController


	def show
		self.resource = resource_class.unlock_access_by_token(params[:unlock_token])
    yield resource if block_given?

    if resource.errors.empty?
      set_flash_message :notice, :unlocked if is_flashing_format?
      respond_with_navigational(resource){ redirect_to new_session_path }
    else
      redirect_to root_path, alert: "El token que ingreso no corresponde al enviado por correo electronico"
    end

	end
end