class UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end

  def show
    if @user = User.find_by(id: params[:id])
      render json: @user
    else
      render json: I18n.t('users.not_found')
    end
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render json: I18n.t('users.created_successfully')
    else
      render json: I18n.t('users.creation_failed')
    end
  end

  def new
    @user = User.new
    render json: 'In new method'
  end

  def update
    @user = User.find_by(id: params[:id])

    if @user&.update(user_params)
      render json: @user
    elsif @user
      render json: I18n.t('users.update_unsuccessful')
    else
      render json: I18n.t('users.not_found')
    end
  end

  def destroy
    @user = User.find_by(id: params[:id])

    if @user&.destroy
      render json: I18n.t('users.deleted_successfully')
    else
      render json: I18n.t('users.not_found')
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name)
  end
end
