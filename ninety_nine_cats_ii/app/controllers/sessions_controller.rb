class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    user = User.find_by_credentials(
      params[:user][:user_name],
      params[:user][:password]
    )
    if user
      login!(user)
      redirect_to cats_url
    else
      render json: "bad credentials"
    end
  end

  def destroy
    logout!
    redirect_to cats_url
  end
end
