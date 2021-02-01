class ClimbsController < ApplicationController

  before_action :find_climb, only: [:show, :edit, :update, :destroy]

  def index
    @climbs = Climb.all
  end

  def show 
  end

  def new 
    @climb = Climb.new
  end

  def create
    @climb = Climb.create(climb_params)
    if @climb.save 
      redirect_to climb_path(@climb)
    else
      flash.now[:error] = @climb.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def update
    @climb.update(climb_params)
    if @climb.save
      redirect_to climb_path(@climb)
    else
      render :edit
    end
  end

  def destroy
    @climb.destroy
    redirect_to climbs_path
  end

  private   
    def climb_params
      params.require(:climb).permit(:name, :difficulty, :location, :climb_type_id, comments_attributes: [:user_id, :climb_id, :content])
    end

    def find_climb
      @climb = Climb.find(params[:id])
    end
end