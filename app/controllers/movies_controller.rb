class MoviesController < ApplicationController
  def index
    matching_movies = Movie.all
    @list_of_movies = matching_movies.order({ :created_at => :desc })

    render({ :template => "movie_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_movies = Movie.where({ :id => the_id })
    @the_movie = matching_movies.at(0)

    render({ :template => "movie_templates/show" })
  end

  def create
    new_movie = Movie.new
    new_movie.title = params.fetch("query_title")
    new_movie.year = params.fetch("query_release")
    new_movie.duration = params.fetch("query_duration")
    new_movie.description = params.fetch("query_description")
    new_movie.image = params.fetch("query_image")
    new_movie.director_id = params.fetch("query_director_id")

    new_movie.save
    redirect_to("/movies")
  end
end
