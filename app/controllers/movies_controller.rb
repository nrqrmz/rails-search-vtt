class MoviesController < ApplicationController
  def index
    if params[:query].present?
      sql_query = "title ILIKE :query OR synopsis ILIKE :query"
      @movies = Movie.where(sql_query, query: "%#{params[:query]}%")
    else
      @movies = Movie.all
    end
  end
end
