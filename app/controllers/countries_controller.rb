class CountriesController < ApplicationController
  def index
    if params[:query].present?
      @countries = Country.search(params[:query])
    else
      @countries = Country.all
    end
    flash[:alert] = "No countries found" if @countries.empty?
  end

  def show
    @country = Country.find_by_code(params[:id])
    if @country.nil?
      redirect_to countries_path, alert: "Country not found"
    end
  end
end
