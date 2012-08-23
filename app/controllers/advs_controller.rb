class AdvsController < ApplicationController
  # GET /advs
  # GET /advs.json
  def index
    if current_user
      @advs = Adv.all
     
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @advs }
    end
    else 
       flash[:notice] = "Please login to see your ad"
       redirect_to root_url
     end
  end

  # GET /advs/1
  # GET /advs/1.json
  def show
    @adv = Adv.find(params[:id])
    

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @adv }
    end
  end

  # GET /advs/new
  # GET /advs/new.json
  def new
    
    @adv = Adv.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @adv }
    end
  end

  # GET /advs/1/edit
  def edit
    @adv = Adv.find(params[:id])
  end

  # POST /advs
  # POST /advs.json
  def create
    
    @adv = Adv.new(params[:adv])
    @adv.user_id = current_user.id

    respond_to do |format|
      if @adv.save
        format.html { redirect_to @adv, notice: 'Adv was successfully created.' }
        format.json { render json: @adv, status: :created, location: @adv }
      else
        format.html { render action: "new" }
        format.json { render json: @adv.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /advs/1
  # PUT /advs/1.json
  def update
   
    @adv = Adv.find(params[:id])

    respond_to do |format|
      if @adv.update_attributes(params[:adv])
        format.html { redirect_to @adv, notice: 'Adv was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @adv.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /advs/1
  # DELETE /advs/1.json
  def destroy
    @adv = Adv.find(params[:id])
    @adv.destroy

    respond_to do |format|
      format.html { redirect_to advs_url }
      format.json { head :no_content }
    end
  end
end

