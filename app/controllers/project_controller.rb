class ProjectController < ApplicationController
  get '/projects' do
    (logged_in?) ? ("List of projects") : (redirect '/login')
  end

  get '/projects/new' do
    (logged_in?) ? ("New post form") : (redirect '/login')
  end

  get '/projects/:id/edit' do
    if !logged_in?
      redirect '/login'
    else
      # Retrieve project for current user
      @project = current_user.projects.find_by(id: params[:id])
      if @project
        "Editing project #{@project.name}"
      else
        redirect '/projects'
      end
    end

  end

end
