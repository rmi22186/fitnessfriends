class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def editprofile
    @user = User.find(current_user)
  end

  def search
    @user = User.find(current_user)
  end

  def updateprofile
    @user = current_user
    if @user.update_attributes(params[:user].permit(:fun_fact, :description, :fitness_goal, :zipcode, :avatar, :experience, :sport))
      redirect_to user_path(current_user), :notice => "Succesfully Updated"
    end
  end

  def update_password
    @user = User.find(current_user.id)
    if true
      if @user.update_attributes(user_params)
        Rails.logger.info "updated"
        redirect_to edit_user_registration_path
      else
        Rails.logger.info "unable to update"
        render edit_password_path
      end
    else
      Rails.logger.info "password incorrect"
      flash[:notice] = "Current password incorrect"
      render edit_password_path
    end
  end

  def edit_password
  end

  private
  
  def user_params
    @user.update_attributes(params[:user].permit(:password, :password_confirmation, :current_password))
  end

end