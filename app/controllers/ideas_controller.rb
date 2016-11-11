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
  end

  def update
    # @user=current_user
    @idea=find_idea_by_id

    if @idea.update(get_idea_params)
      redirect_to idea_path(@idea),notice: "You have updated"
    else
      redirect_to :back

    end


  end

  def destroy
    @idea=find_idea_by_id
    @idea.destroy
    redirect_to ideas_path,notice: "You have deleted a post!"


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
