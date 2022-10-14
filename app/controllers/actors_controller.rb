class ActorsController < ApplicationController

  def index 

    @list_of_actors = Actor.all

    render({ :template => "actor_templates/index.html.erb"})
  end

  def actor_details
    actor_id = params.fetch("id")

    @the_actor = Actor.where({ :id => actor_id}).first
    @characters = Character.where({:actor_id => actor_id })

    render({ :template => "actor_templates/show.html.erb"})
  end

  def delete_actor
    @id = params.fetch("id")
    
    actor_to_delete = Actor.where( {:id => @id}).first

    if(actor_to_delete)
      actor_to_delete.destroy
    end

    index
  end
  
end
