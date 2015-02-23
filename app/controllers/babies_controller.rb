class BabiesController < ApplicationController
  def index
  	  @babies = Baby.all
    
  end

  def new
  	  @baby = Baby.new
  end

  def create
  		# no need for it to be an instance variable (have an @), b/c we're not rendering a view
  	  baby = Baby.new(params.require(:baby).permit(:name, :age, :gender, :avatar))
      baby.parent = current_parent
      #parent.babies << baby
  	 
      if baby.save
  	  	  redirect_to new_baby_entry_path(baby_id: baby.id)
  	  	else 
          raise "else called"
  	  		render 'new'
  	  end
  end

  def show
    @baby = Baby.where(id: params[:id]).first
    @babies = Baby.where(id: params[:id])
   # @entries = @baby.entries
    #@entry = @baby.entries
    @entries = Entry.where(baby_id: params[:id])
    @entries = Entry.where(params[:id])
  end

  def edit
    @baby = Baby.find(params[:id])
  end

  def update
    @baby = Baby.find(params[:id])
    if @baby.update_attributes(params.require(:baby).permit(:name, :age, :gender, :avatar))
       redirect_to baby_path
      # if something goes wrong (internet is being weird or whatever)
    else
       render 'edit' 
    end
  end
end