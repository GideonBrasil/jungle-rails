class SessionsController < ApplicationController
  def new
  end

  def create

    user = User.authenticate_with_credentials(session_params[:email].downcase, session_params[:password])
    # If the user exists AND the password entered is correct.
    if user #&& user.authenticate(session_params[:password])
      # Save the user id inside the browser cookie. This is how we keep the user 
      # logged in when they navigate around our website.
      session[:user_id] = user.id
      redirect_to :root, notice: 'You have logged into Jungle!'
    else
      flash.now[:errors] = ['Email or password are incorrect']
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to :root
  end

  private

  def session_params
    params.require(:session).permit(
      :email,
      :password
    )
  end
end
