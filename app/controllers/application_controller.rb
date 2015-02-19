class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

 #this makes the current parent available in every view
	helper_method :current_parent 

#this makes the current parent available to ALL controllers, but NOT view templates
	def current_parent
	  Parent.where(id: session["parent_id"]).first
	end
end
