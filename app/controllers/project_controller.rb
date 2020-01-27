class ProjectController < ApplicationController
  get '/projects' do
    if logged_in?
      @projects = current_user.projects.all
      erb :'/projects/list'
    else
      redirect '/login'
    end
  end

  get '/projects/new' do
    if logged_in?
      erb :'/projects/new'
    else
      redirect '/login'
    end
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
