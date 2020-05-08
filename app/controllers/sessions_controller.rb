class SessionsController < ApplicationController
	include SessionsHelper
  def new
  end

  def create
  # cherche s'il existe un utilisateur en base avec l’e-mail
  user = User.find_by(params[:email])
  # on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe 
  if user && user.authenticate(params[:password])
  	flash[:success] = "Vous êtes connecté(e) !"
    session[:user_id] = user.id
    redirect_to gossips_path

  else
    flash.now[:danger] = 'Invalid email/password combination'
    render 'new'
  end
  end

  def destroy
  	@session = Session.current_user
  	@session.destroy
  	flash[:success] = "Vous êtes déconnecté(e), à la prochaine!"
  	redirect_to gossips_path
  end
end
