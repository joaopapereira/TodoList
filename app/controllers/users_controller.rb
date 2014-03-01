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
    @user = @user || User.new
    @editing = false
    @url_action = user_create_path
    render 'new'
  end

  # GET /users/1/edit
  def edit
    @user = current_user
    @editing = true
    @url_action = user_update_path(@user)
    render 'edit'
  end

  # POST /users
  # POST /users.json
  def create
    @user_session = UserSession.find || UserSession.new
    puts "User paramters: #{params[:user]}"
    @user = User.new(user_params)

    
    if @user.save
      fredirect_to root_path
      gflash :success => "User '#{@user.email}' created correctly"
    else
      handle_errors
      new
    end

  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @user_session = UserSession.find || UserSession.new
    if @user.update(user_params)
      gflash :success => "User '#{@user.email}' updated correctly"
      redirect_to root_path
      
    else
      handle_errors
      edit
      
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    redirect_to users_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end
    def handle_errors
      @user.errors.full_messages.each do |msg|
        gflash :error => msg
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation, :password_salt, :persistence_token)
    end
end
