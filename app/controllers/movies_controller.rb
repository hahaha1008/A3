class MoviesController < ApplicationController
  def index
    if params[:query].present?
      @movies = Movie.search(params[:query])
    else
      @movies = Movie.popular
    end
    flash[:alert] = "No movies found" if @movies.nil? || @movies.empty?
  end

  def show
    @movie = Movie.find_by_id(params[:id])
    if @movie.nil?
      redirect_to movies_path, alert: "Movie not found"
    end
  end
end
