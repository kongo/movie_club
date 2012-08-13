class MovieFinderController < ApplicationController
  respond_to :json
  def search
    movie = MovieFinder.find_by_url params[:query]
    respond_to do |format|
      format.json do
        render json: movie, only: [:id, :title, :year, :imdb_id]
      end
    end
  end
end