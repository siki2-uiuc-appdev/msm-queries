class DirectorsController < ApplicationController

  def index
    @list_of_directors = Director.all

    render({ :template => "director_templates/index.html.erb"})
  end

  def wisest
  @oldest_director = Director.where.not({ :dob => nil }).order({ :dob => :asc }).first

  render({ :template => "director_templates/eldest.html.erb"})
  end

  def youngest

    @youngest_director = Director.where.not( { :dob => nil}).order( { :dob => :desc }).first

    render( { :template => "director_templates/youngest.html.erb"})
  end

  def director_details
    # params looks like {"an_id"=>"42"}

    the_id = params.fetch("an_id")

    @the_director = Director.where({ :id => the_id}).first
    @filmography = Movie.where({ :director_id => @the_director.id })

    render({ :template => "director_templates/show.html.erb"})
  end

  def delete_director
    director_id = params.fetch("id")
    director_to_delete = Director.where({:id => director_id}).first

    if director_to_delete
      director_to_delete.destroy
    end
    index
  end

  def create_director
    new_director = Director.new
    new_director.name = params.fetch("query_name")
    new_director.dob = params.fetch("query_dob")
    new_director.bio = params.fetch("query_bio")
    new_director.image = params.fetch("query_image")

    already_exists = Director.where({ :name => new_director.name}).where({:dob => new_director.dob}).first
    
    if !(already_exists)
      new_director.save
    end

    index
  end

end
