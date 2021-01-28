class ClimbsController < ApplicationController

  def index
    @climbs = Climb.all
  end

  def show 
    @climb = Climb.find(params[:id]) 
  end

  def new 
    @climb = Climb.new
  end

  def create
    @climb = Climb.new(climb_params)
    
    if @climb.save 
      redirect_to climb_path(@climb)
    else
      binding.pry
      flash.now[:error] = @climb.errors.full_messages
      render :new
    end
  end

  def edit
    @climb = Climb.find(params[:id])
  end

  def update
    @climb = Climb.find(params[:id])
    @climb.update(climb_params)
    if @climb.save
      redirect_to climb_path(@climb)
    else
      render :edit
    end
  end

  def destroy
    @climb = Climb.find(params[:id])
    @climb.destroy
    redirect_to climbs_path
  end

  private   
    def climb_params
      params.require(:climb).permit(:name, :difficulty, :location, :climb_type_id, comments_attributes: [:user_id, :climb_id, :content])
    end
end