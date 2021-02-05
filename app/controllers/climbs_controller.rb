class ClimbsController < ApplicationController

  before_action :find_climb, only: [:show, :edit, :update, :destroy]
  before_action :find_climb_type, only: [:index, :new, :create]

  def index
    if @climb_type
      @climbs = @climb_type.climbs
    else
      @climbs = Climb.all
    end
  end

  def show 
  end

  def new 
    if @climb_type
      @climb = @climb_type.climbs.build
      render :new_climb_type_climb
    else
      @climb = Climb.new
    end
  end

  def create
    
    @climb = Climb.create(climb_params)
    if @climb.save 
      redirect_to climb_path(@climb)
    else
      flash.now[:error] = @climb.errors.full_messages
      if @climb_type
        render :new_climb_type_climb
      else
        render :new
      end
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
      params.require(:climb).permit(:name, :grade_id, :location, :climb_type_id, comments_attributes: [:user_id, :climb_id, :content])
    end

    def find_climb
      @climb = Climb.find(params[:id])
    end

    def find_climb_type
      if params[:climb_type_id]
        @climb_type = ClimbType.find_by_id(params[:climb_type_id])
      end
    end
end