class EntriesController < ApplicationController
  def index
  	  @entries = Entry.all
  end

  def new
  	  @entry = Entry.new
  end

  def create
  	# no need for it to be an instance variable (have an @), b/c we're not rendering a view
  	entry = Entry.new(params.require(:entry).permit(:night_number, :bedtime, :awake, :asleep, :wake_up))
  	  if entry.save
  	  	 redirect_to entry_path(current_parent)
  	  	# else 
  	  	# 	render 'show'
  	  end
  end

  def show
    @entry = Entry.where(id: params[:id])
  end

  def edit
      @entry = Entry.find(params[:id])
  end

  def update
    @entry = Entry.find(params[:id])
    if @entry.update_attributes(params.require(:entry).permit(:night_number, :bedtime, :awake, :asleep, :wake_up))
      # send back to parent's show page
      redirect_to baby_path
    else
      render 'edit'
    end
  end
end