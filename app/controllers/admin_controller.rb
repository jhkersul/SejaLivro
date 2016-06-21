class AdminController < ApplicationController

  def index
    if !user_signed_in? || !current_user.admin
      redirect_to root_path
    end
  end

  def packages
  	@users = User.all 
  end

end
