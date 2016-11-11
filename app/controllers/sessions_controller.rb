class SessionsController < ApplicationController

  def new

  end

  def create
    password=

        @user=User.find_by(email: params[:email])


    if @user && @user.authenticate(params[:password])
      session[:user_id]=@user.id
      redirect_to root_path, notice: "You have loged in!"

    else
      render :new
      flash[:alert]="Email or password wrong!"

    end


  end

  def destroy


    session[:user_id]=nil
    redirect_to root_path, notice: "You have log out"


  end

end
