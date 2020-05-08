class GossipsController < ApplicationController
before_action :authenticate_user, only: [:index]
  def index
  	@gossips =Gossip.all
  end

  def show
  	@gossip =Gossip.find(params[:id])
  end
  def new
  	@gossip =Gossip.new
  end

  def create
  	@gossip =Gossip.create(gossip_params)
      @gossip.user = User.find_by(id: session[:user_id])
  if @gossip.save
    flash[:success] = "Potin bien créé !"
    redirect_to gossips_path
  else
    render :new
  end
end
  def edit
  end
  def update
    if creator?
  	@gossip =Gossip.find(params[:id])
  	@gossip.update(gossip_params)
  	redirect_to gossips_path
  else
    puts "you don't have the authorization to update it"
  end
  end
  def destroy
    if creator?
  	@gossip = Gossip.find(params[:id])
  	@gossip.destroy
  	redirect_to gossips_path
  else 
    puts "you don't have the authorization to delete it"
  end
  end
  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to sessions_new_path
    end
  end
  private
  def gossip_params
  	params.require(:gossip).permit (:title :content)
  end
end
