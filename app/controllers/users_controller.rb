class UsersController < ApplicationController

  def new
    @user=User.new
  end

  def create

    @user=User.create(get_user_params)

    if @user.save
      session[:user_id]=@user.id

      redirect_to root_path, notice: "You successfully register"


    else

      # flash.now[:alert]=@user.errors.full_messages.join(',')
      flash.now[:alert]=error_message(@user)
      render :new


    end


  end

  private
  def get_user_params
    params.require(:user).permit([:first_name, :last_name, :email, :password, :password_confirmation])
  end

end
