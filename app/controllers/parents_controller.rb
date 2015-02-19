class ParentsController < ApplicationController
  def index
  	  @parents = Parent.all
  end

  def new
  	  @parent = Parent.new
      ParentMailer.visit_happened("Denise").deliver
  end

  def create
  		# no need for it to be an instance variable (have an @), b/c we're not rendering a view
  	  parent = Parent.new(params.require(:parent).permit(:name, :email, :password, :password_confirmation))
  	  if parent.save
  	  	  session["parent_id"] = parent.id.to_s
  	  	  redirect_to new_baby_path
  	  	else 
  	  		render 'new'
  	  end
  end

  def show
    @parent = Parent.where(id: params[:id]).first
      # shows all the babies for the parent
      @babies = @parent.babies
      

      if @parent != nil
      else
       #redirects parent to new session path if no parent is logged in
       redirect_to new_sessions_path 
      end
  end

  def edit
    @parent = Parent.find(params[:id])
  end

  def update
    @parent = Parent.find(params[:id])
    if @parent.update_attributes(params.require(:parent).permit(:name, :email, :password, :password_confirmation))
      redirect_to parent_path(current_parent)
    else
      render 'edit'
    end
  end

  def parent_params
   params.require(:parent).permit(:email, :avatar, baby_ids: [])
  end
end


