class CommentsController < ApplicationController

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
    if comment_params[:content] == ""
      render :'climbs/show' 
    else
      @comment.save
      redirect_to climb_path(@comment.climb)
    end
  end

  # def edit
  #   @comment = Comment.find(params[:id])
  # end

  # def update
  #   @comment = Comment.find(params[:id])
  #   @comment.update(comment_params)
  #   if @comment.save
  #     redirect_to comment_path(@comment)
  #   else
  #     render :edit
  #   end
  # end

  # def destroy
  #   @comment = Comment.find(params[:id])
  #   @comment.destroy
  #   redirect_to comments_path
  # end

  private   
    def comment_params
      params.require(:comment).permit(:content, :climb_id, :user_id)
    end
end
