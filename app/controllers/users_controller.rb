class UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end

  def show
    if @user = User.find_by(id: params[:id])
      render json: @user
    else
      render json: 'User not found'
    end
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render json: 'User created successfully'
    else
      render json: 'User creation failed'
    end
  end

  def new
    @user = User.new
    render json: 'In new method'
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user
      if @user.update(user_params)
        render json: @user
      else
        render json: 'Update unsuccessful'
      end
    else
      render json: 'User not found'
    end
  end

  def destroy
    @user = User.find_by(id: params[:id])
    if @user
      @user.destroy
      render json: 'User deleted successfully'
    else
      render json: 'User not found'
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name)
  end
end
