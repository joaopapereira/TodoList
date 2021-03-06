class UserSessionsController < ApplicationController
 
  # GET /user_sessions/new
  # GET /user_sessions/new.xml
  def new
    @user_session = UserSession.new
    puts @user_session
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user_session }
    end
  end
 
  # POST /user_sessions
  # POST /user_sessions.xml
  def create
    puts params
    @user_session = UserSession.new(params[:user_session])
 
    respond_to do |format|
      if @user_session.save
        gflash :success => "Login Successful!!!"
        format.html { redirect_to(root_path, :flash => {:login => {:success => 'Login Successful'}}) }
        format.xml  { render :xml => @user_session, :status => :created, :location => @user_session }
      else
        gflash :error => "Email and password do not match!!"
        format.html { redirect_to(root_path, :flash => {:login => {:error => 'Email and password do not match'}}) }
        format.xml  { render :xml => @user_session.errors, :status => :unprocessable_entity }
      end
    end
  end
 
  # DELETE /user_sessions/1
  # DELETE /user_sessions/1.xml
  def destroy
    @user_session = UserSession.find
    @user_session.destroy
 
    redirect_to(root_path,  :flash => {:login => {:success => 'Logout Successful'}}) 
  end
end
