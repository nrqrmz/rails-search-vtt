class MoviesController < ApplicationController
  def index
    if params[:query].present?
      sql_query = <<~SQL
        title ILIKE :query
        OR synopsis ILIKE :query
        OR first_name ILIKE :query
        OR last_name ILIKE :query
      SQL
      @movies = Movie.joins(:director).where(sql_query, query: "%#{params[:query]}%")
    else
      @movies = Movie.all
    end
  end
end
