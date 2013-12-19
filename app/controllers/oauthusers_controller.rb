class OAuthUsersController < ApplicationController

  def create
    Oauthusers.create(oauthusers_params)
  end

  private

  def oauthusers_params
    params.require(:oauthusers).permit(:provider, :user)
  end

end
