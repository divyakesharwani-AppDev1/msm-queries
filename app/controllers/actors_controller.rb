class ActorsController < ApplicationController

  def index

    @list_of_actors = Actor.all


    render({:template => "/actor_template/index.html.erb"})
  

  end

  def actor_details
    #Parameters: {"an_id"=>"1"}

    @the_actor_id = params.fetch("an_id")
    @the_actor = Actor.all.where({:id => @the_actor_id}).at(0)

    @list_of_character = Character.all.where({:actor_id => @the_actor_id})
  


    render({:template => "/actor_template/adetail.html.erb"})
  end
end
