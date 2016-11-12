class IdeasController < ApplicationController
  before_action 'my_authentication', except: [:show, :index]


  def new
    @idea=Idea.new

  end

  def create
    @idea=Idea.new(get_idea_params)
    @idea.user= current_user

    if @idea.save

      redirect_to idea_path(@idea), notice: "You have saved a new idea."
    else
      render plain: "no saved"

    end


  end

  def edit
    @idea=find_idea_by_id
    redirect_to idea_path(@idea), notice: 'You can not modify a idea if you are not a author' unless can? :edit_idea, @idea

  end

  def update
    # @user=current_user
    @idea=find_idea_by_id

    if can? :edit_idea, @idea || @idea.update(get_idea_params)
      redirect_to idea_path(@idea), notice: "You have updated"
    else
      redirect_to :back

    end


  end

  def destroy
    @idea=find_idea_by_id

    if can? :delete_idea, @idea
      @idea.destroy
      redirect_to ideas_path, notice: "You have deleted a post!"

    else
      redirect_to idea_path(@idea), notice: "You can't deleted a post if you are not an author!"
    end


  end

  def show
    @idea=find_idea_by_id
    @comment=Comment.new
    @comments=find_comments_by_idea(@idea)


  end

  def index
    @ideas=Idea.order('updated_at DESC')

  end

  private
  def get_idea_params
    params.require(:idea).permit([:body, :title])

  end

  def find_idea_by_id
    Idea.find(params[:id])

  end

  def find_comments_by_idea(idea)
    idea.comments

  end


end
