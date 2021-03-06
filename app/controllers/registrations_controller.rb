class RegistrationsController < Devise::RegistrationsController
  def business

  end

  def plans

  end

  def new
    super
  end

  def create

    build_resource(sign_up_params)

    if resource.save
      yield resource if block_given?
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up
        sign_up(resource_name, resource)
        respond_with resource, :location => after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        respond_with resource, :location => after_inactive_sign_up_path_for(resource)
      end
    else
      role = Role.find_by(name: "business")
      if resource.role_id == role.id
        clean_up_passwords resource
        render :business
      else
        clean_up_passwords resource
        respond_with resource
      end
    end
  end

protected
  def after_update_path_for(resource)
    dashboard_path
  end

  # def edit
  #   if params[:type] == "Business"
  #     render "/devise/registrations/business.html.erb"
  #   else
  #     render "/devise/registrations/new.html.erb"
  #   end

  # end

end
