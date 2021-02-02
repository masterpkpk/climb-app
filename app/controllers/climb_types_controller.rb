class ClimbTypesController < ApplicationController

  
  
  def show
    @climb_type = ClimbType.find(params[:id])
  end 

end
