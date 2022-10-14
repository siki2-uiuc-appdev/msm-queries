Rails.application.routes.draw do
  get("/", { :controller => "application", :action => "homepage" })

  get("/directors", { :controller => "directors", :action => "index"})
  get("/directors/eldest", { :controller => "directors", :action => "wisest"})
  get("/directors/youngest", { :controller => "directors", :action => "youngest"})
  get("/directors/create_director", { :controller => "directors", :action => "create_director"})
  get("/directors/:an_id", { :controller => "directors", :action => "director_details"})
  get("/delete_director/:id", { :controller => "directors", :action => "delete_director"})

  get("/movies", { :controller => "movies", :action => "index"})
  get("/movies/:id", { :controller => "movies", :action => "movie_details"})
  get("/delete_movie/:id", { :controller => "movies", :action => "delete_movie"})

  get("/actors", { :controller => "actors", :action => "index"})
  get("/actors/:id", { :controller => "actors", :action => "actor_details"})
  get("/delete_actor/:id", { :controller => "actors", :action => "delete_actor" })
  
end
