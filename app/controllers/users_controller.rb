class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: t('success.messages.user.create') }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, alert: t('errors.messages.user.create') }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: t('success.messages.user.update') }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, alert: t('errors.messages.user.update') }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      if @user.destroyed?
        format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
        format.json { head :no_content }
      else
        format.html { redirect_to users_url, alert: 'Failed to destroy user.' }
        format.json { render json: { error: 'Failed to destroy user.' }, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = t('errors.messages.user.not_found')
    redirect_to users_path
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :city, :phone_number, :email)
  end
end
