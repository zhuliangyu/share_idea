class CommentsController < ApplicationController


  def create
    # render plain:"asd"

    @comment=Comment.new(get_comment_params)
    @comment.user=current_user

    idea_id=params[:idea_id]
    @comment.idea_id=idea_id

    if @comment.save
      redirect_to idea_path(idea_id)
    else
      redirect_to idea_path(idea_id),notice: error_message(@comment)

    end


  end

  def destroy
    # render plain:"asd"

    comment_id=params[:id]

    @comment=Comment.find(comment_id)
    @idea=@comment.idea
    @comment.destroy
    redirect_to idea_path(@idea)

  end

  private
  def get_comment_params
    params.require(:comment).permit(:body)
  end
end
