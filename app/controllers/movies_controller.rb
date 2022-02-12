class MoviesController < ApplicationController

  def index

    @list_of_movies = Movie.all


    render({:template => "/movie_template/index.html.erb"})
  

  end

  def movie_details
    #Parameters: {"an_id"=>"1"}

    @the_movie_id = params.fetch("an_id")
    @the_movie = Movie.all.where({:id => @the_movie_id}).at(0)

    render({:template => "/movie_template/mdetail.html.erb"})
  end
end


