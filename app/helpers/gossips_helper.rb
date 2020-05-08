module GossipsHelper
 def current_user
    User.find_by(id: session[:user_id])
  end
  def logged_in?
  	session[:user_id]/=nil
  end
  def creator?
    logged_in? && current_user.id==Gossip.user
  end
end
