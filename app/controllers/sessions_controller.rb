class SessionsController < ApplicationController
  def index
   @sessions = Session.all
  end
  def new
  end

 def create
   
=begin
    #render :text => request.env['omniauth.auth'].to_yaml
     auth_hash ||= request.env['omniauth.auth']
    @session = Session.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
     if @session
       #render :text => "Welcome back #{@session.user.name}! You have already signed up."
       redirect_to users_path
     else
       user = User.new :name => auth_hash["info"]["name"], :email => auth_hash["info"]["email"]
       user.sessions.build :provider => auth_hash["provider"], :uid => auth_hash["uid"]
       user.save
       #render :text => "Hi #{user.name}! You've signed up."
       redirect_to users_path
    end
=end    
  auth = request.env["omniauth.auth"]
  
    @user = User.find_by_email(auth["info"]["email"]) 
    if(@user)
      session[:user_id] = @user.id
      redirect_to root_url
    else
      user = User.new :name => auth["info"]["name"], :email => auth["info"]["email"]
      user.sessions.build :provider => auth["provider"], :uid => auth["uid"]
      user.save
      session[:user_id] = user.id
      redirect_to root_url, :notice => "Signed in!"
    end
        
 end
   
  def failure
    redirect_to root_url, alert: "Authentication failed, please try again."
  end
  
  def destroy
=begin
    @session = current_user.sessions.find(params[:id])
    @session.destroy
    flash[:notice] = "Successfully destroyed session."
    redirect to sessions_url
=end
    session[:user_id] = nil
    redirect_to root_url, :notice => "Signed out!" 
  end
  
 
end 

def show
    @session = Session.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @session}
    end
  end
