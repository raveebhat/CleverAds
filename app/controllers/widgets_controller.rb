class WidgetsController < ApplicationController
  # GET /widgets
  # GET /widgets.json
  def show
    @widget = Widget.find(params[:id])
  end
  def index
    
    
   end
end
