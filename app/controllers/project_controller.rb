class ProjectController < ApplicationController
  get '/projects' do
    (logged_in?) ? ("List of projects") : (redirect '/login')
  end

  get '/projects/new' do
    (logged_in?) ? ("New post form") : (redirect '/login')
  end

  get '/projects/:id/edit' do
    (logged_in?) ? ("Edit post form") : (redirect '/login')
  end

end
