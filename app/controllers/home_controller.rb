class HomeController < ApplicationController
	before_action :not_authenticate_user,only:[:top]

  def top
  	render :layout => false
  end


  private
   def not_authenticate_user
   	if !current_user.nil?
   		redirect_to books_url
   	end
   end
end
