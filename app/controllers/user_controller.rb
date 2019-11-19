class UserController < ApplicationController
  def configs
    @user = current_user
  end

  def upload_avatar
    @user = User.find(current_user.id)
    if params[:avatar]
        if @user.update_attribute(:avatar, params[:avatar])
            redirect_to user_configs_path
        else
            redirect_to user_configs_path
        end
    end
  end
end
