class SessionsController < ApplicationController
  def new
  	# this is parent b/c it's a session based on a parent logging in
  	@parent = Parent.new
    # if session[:id] != nil 
    #   # go to parent's cookie
    #   redirect_to parent_path("current_parent")
    # end
    if params[:parent_created] == 'true'
      @parent_created_message = 'Parent successfully created!'
    end
  end

  def create
  	# find the parent by email
  	p = Parent.where(email: params[:parent][:email]).first
  	# if parent has an email & password is authenticated...
  	if p != nil && p.authenticate(params[:parent][:password])
  		# this saves the session as a cookie
  		session["parent_id"] = p.id.to_s
  		# go to parent's cookie
  		redirect_to parent_path(p)
    else 
      redirect_to parent_path
  	end
  end

  def destroy
  	session.destroy
    redirect_to new_sessions_path
  end
end