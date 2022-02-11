class DirectorsController < ApplicationController

  def index
    @list_of_directors = Director.all 

    render({:template => "director_templates/index.html.erb"})
  end

  def wisest

    @wisedirname = Director.where({:dob => Director.minimum(:dob)}).at(0)["name"]
    @wisedirdob = Director.where({:dob => Director.minimum(:dob)}).at(0)["dob"]
    render({:template => "director_templates/eldest.html.erb"})
  end


  def nicest

    @nicedirname = Director.where({:dob => Director.maximum(:dob)}).at(0)["name"]
    @nicedirdob = Director.where({:dob => Director.maximum(:dob)}).at(0)["dob"]
    render({:template => "director_templates/youngest.html.erb"})
  end

  def director_details

    #  Parameters: {"an_id"=>"42"}

    @the_id = params.fetch("an_id")

    @the_director = Director.all.where({:id => @the_id}).at(0)



    render({:template => "director_templates/show.html.erb"})

  end


end

