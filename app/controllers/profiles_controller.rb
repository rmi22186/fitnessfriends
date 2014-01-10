class ProfilesController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(current_user)
  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user].permit(:fun_fact, :description, :fitness_goal, :zipcode, :avatar, :experience, :sport))
      redirect_to profile_path(current_user), :notice => "Succesfully Updated"
    end
  end

end