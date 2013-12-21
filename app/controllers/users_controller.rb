class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def editprofile
    @user = User.find(current_user)
  end

  def updateprofile
    @user = current_user
    if @user.update_attributes(params[:user].permit(:fun_fact, :description, :fitness_goal))
      redirect_to :back, :notice => "Succesfully Updated"
    end
  end

end