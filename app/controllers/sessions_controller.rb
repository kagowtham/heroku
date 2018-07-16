class SessionsController < ApplicationController

  def create

    @user = User.find_by(email: params[:email])
    print(params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      render json: session_payload(@user)
    else
      render json: {error: "Email or password was incorrect"}, status: 401

    end
  end
  def destroy
    session[:user_id] = nil
    render json: {}, status: 204

  end

  private

  def session_payload(user)
    {
        user: { id: user.id, email: user.email, types: user.types },
        csrf_token: form_authenticity_token
    }
  end

end