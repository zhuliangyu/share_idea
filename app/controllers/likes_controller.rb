class LikesController < ApplicationController
  before_action :my_authentication
  before_action :permission, only:[:create]

  def create
    # render plain:"create"


    @like=Like.new
    @like.user= current_user
    @like.idea=@idea

    if @like.save
      redirect_to ideas_path, notice: "You like a idea"
    else
      redirect_to ideas_path, alert: error_message(@like)

    end


  end

  def destroy
    @like=Like.find(params[:id])

    # @like=@idea.likes.find_by(user: current_user)

    if @like
      @like.destroy
      redirect_to ideas_path, notice: "You unlike a idea"
    else
      redirect_to ideas_path, notice: "sth wrong when you dislike a idea"

    end


    # render plain:"destroy"


  end

  private
  def permission
    @idea=Idea.find(params[:idea_id])
    redirect_to root_path, alert: "You can't like yourself idea." unless can? :like, @idea


  end


end
