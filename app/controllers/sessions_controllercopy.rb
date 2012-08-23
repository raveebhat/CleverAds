class SessionsController < ApplicationController
  # GET /sessions
  # GET /sessions.json
  def index
    @sessions = Session.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sessions }
    end
  end

  # GET /sessions/1
  # GET /sessions/1.json
  def show
    @session = Session.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @session }
    end
  end

  # GET /sessions/new
  # GET /sessions/new.json
  def new
    @session = Session.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @session }
    end
  end

  # GET /sessions/1/edit
  def edit
    @session = Session.find(params[:id])
  end

  # POST /sessions
  # POST /sessions.json
  def create
    #render :text => request.env['omniauth.auth'].to_yaml
    auth_hash ||= request.env['omniauth.auth']
    @session = Session.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
     if @session
       render :text => "Welcome back #{@session.user.name}! You have already signed up."
       #redirect_to root_url
     else
       user = User.new :name => auth_hash["info"]["name"], :email => auth_hash["info"]["email"]
       user.sessions.build :provider => auth_hash["provider"], :uid => auth_hash["uid"]
       user.save
       render :text => "Hi #{user.name}! You've signed up."
       #redirect_to root_url
    
    
    
    #@session = Session.new(params[:session])

    #respond_to do |format|
     # if @session.save
      #  format.html { redirect_to @session, notice: 'Session was successfully created.' }
       # format.json { render json: @session, status: :created, location: @session }
      #else
       # format.html { render action: "new" }
        #format.json { render json: @session.errors, status: :unprocessable_entity }
      #end
    #end
  end

  # PUT /sessions/1
  # PUT /sessions/1.json
  def update
    @session = Session.find(params[:id])

    respond_to do |format|
      if @session.update_attributes(params[:session])
        format.html { redirect_to @session, notice: 'Session was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sessions/1
  # DELETE /sessions/1.json
  def destroy
    @session = Session.find(params[:id])
    @session.destroy

    respond_to do |format|
      format.html { redirect_to sessions_url }
      format.json { head :no_content }
    end
  end
end
