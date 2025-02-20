class CountriesController < ApplicationController
  def index
    @countries = Country.all
    flash[:alert] = "Failed to load countries" if @countries.empty?
  end
end
