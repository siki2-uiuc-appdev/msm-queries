class MoviesController < ApplicationController

  def index
    @list_of_movies = Movie.all

    render({ :template => "movie_templates/index.html.erb"})
  end

  def movie_details
    movie_id = params.fetch("id")

    @the_movie = Movie.where( {:id => movie_id }).first
    @the_director = Director.where({ :id => @the_movie.director_id}).first

    render({ :template => "movie_templates/show.html.erb"})
  end

  def delete_movie
    movie_id = params.fetch("id")

    movie_to_delete = Movie.where({ :id => movie_id }).first

    if(movie_to_delete)
      movie_to_delete.destroy
    end

    index

  end
  

end
