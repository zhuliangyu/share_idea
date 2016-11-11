class JoinsController < ApplicationController
  before_action :my_authentication

  def create
    # render plain:"create"
    @join=Join.new
    @join.user= current_user
    @join.idea=Idea.find(params[:idea_id])

    if @join.save
      redirect_to ideas_path, notice: "You join a idea"
    else
      redirect_to ideas_path, alert: error_message(@join)

    end


  end

  def destroy
    @join=Join.find(params[:id])

    # @join=@idea.joins.find_by(user: current_user)

    if @join
      @join.destroy
      redirect_to ideas_path, notice: "You unjoin a idea"
    else
      redirect_to ideas_path, notice: "sth wrong when you disjoin a idea"

    end


    # render plain:"destroy"


  end

  private




end
