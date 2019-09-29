class HousesController < ApplicationController
  def index
    @houses = House.all
  end

  def import
    House(params[:file])
    redirect_to energies_path
  end
end
