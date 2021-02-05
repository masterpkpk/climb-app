class GradesController < ApplicationController

  def index 
   @climbs = Climb.all
  end
end
