class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @user_session = UserSession.find || UserSession.new
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user_session = UserSession.find || UserSession.new
  end

  # GET /users/new
  def new
    @user_session = UserSession.find || UserSession.new
    @user = User.new
    @editing = false
  end

  # GET /users/1/edit
  def edit
    @editing = true
  end

  # POST /users
  # POST /users.json
  def create
    @user_session = UserSession.find || UserSession.new
    puts "User paramters: #{params[:user]}"
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @user_session = UserSession.find || UserSession.new
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation, :password_salt, :persistence_token)
    end
end
