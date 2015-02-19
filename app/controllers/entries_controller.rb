class EntriesController < ApplicationController
  def index
  	  @entries = Entry.all
  end

  def new
  	  @entry = Entry.new
  end

  def create
  		# no need for it to be an instance variable (have an @), b/c we're not rendering a view
  	  entry = Entry.new(params.require(:entry).permit(:date, :bedtime, :awake, :asleep, :wake_up))
  	  if entry.save
  	  	 redirect_to entry_path(current_parent)
  	  	# else 
  	  	# 	render 'show'
  	  end
  end

  def show
    @entry = Entry.where(id: params[:id]).first
  end

  def edit
  end

  def update
    @entry = Entry.find(params[:id])
    if @entry.update_attributes(params.require(:entry).permit(:date, :bedtime, :awake, :asleep, :wake_up))
      # send back to parent's show page
      redirect_to parent_path(current_parent)
    else
      render 'edit'
    end
  end
end