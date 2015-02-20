class EntriesController < ApplicationController
  def index
      baby = Baby.where(id: params[:baby_id]).first
  	  @entries = baby.entries.all
  end

  def new
      @baby = Baby.where(id: params[:baby_id]).first
  	  @entry = Entry.new
      @entry = @baby.entries.new

  end

  def create

    raise "error"
    baby = Baby.find(params[:baby_id])
  	# no need for it to be an instance variable (have an @), b/c we're not rendering a view
  	baby.entries << Entry.new(params.require(:entry).permit(:night_number, :bedtime, :awake, :asleep, :wake_up))
  	  if baby.save
          raise params.inspect 
  	  	  redirect_to baby_url(:id => baby.id)
  	  else 
          raise params.inspect
  	  		render 'show'
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