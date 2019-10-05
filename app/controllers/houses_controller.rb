class HousesController < ApplicationController
  def index
    @houses = House.all
  end

  def show
    @house = House.find_by(id: params[:id])
    # 「year」カラムの値を取得し、昇順に並び替え
    years = Energy.all.group(:year).pluck(:year).sort
    @chart_energies = years.map {|year| [year, Energy.chart_by_year(year, params[:id]).sum(:energy_production)]}.to_h
    @chart_energies_avg = years.map {|year| [year, Energy.group(:month).average(:energy_production)]}.to_h
    @chart_daylights = years.map {|year| [year, Energy.chart_by_year(year, params[:id]).sum(:daylight)]}.to_h
  end

  def import
    House.import(params[:file])
    redirect_to energies_path
  end
end
