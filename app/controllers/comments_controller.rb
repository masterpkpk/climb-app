class CommentsController < ApplicationController

  before_action :find_climb, only: [:edit, :update, :destroy]
  def index
    @comments = Comment.all
  end

  # def show 
  #   @comment = Comment.find(params[:id]) 
  # end

  # def new 
  #   @comment = Comment.new
  # end

  def create
    @comment = Comment.new(comment_params)
    @climb = @comment.climb
    if @comment.save
        redirect_to climb_path(@comment.climb)
    else
      flash.now[:error] = @comment.errors.full_messages
      render :'climbs/show'
    end
  end

  def edit
    
    @comment = Comment.find(params[:id])
  end

  def update
    
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    if @comment.save
      redirect_to climb_path(@climb)
    else
      flash.now[:error] = @comment.errors.full_messages
      render :edit
    end
  end

  def destroy
   
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to climb_path(@climb)
  end

  private   
    def comment_params
      params.require(:comment).permit(:content, :climb_id, :user_id)
    end

    def find_climb
      @comment = Comment.find_by_id(params[:id])
      @climb = Climb.find_by_id(@comment.climb.id)
    end

    
end
