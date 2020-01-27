class ProjectController < ApplicationController
  get '/projects' do
    if logged_in?
      @projects = current_user.projects.all
      erb :'/projects/list'
    else
      redirect '/login'
    end
  end

  post '/projects' do
    if logged_in?
      project = current_user.projects.build(params[:project])
      project.save # Save new project
      redirect '/projects'
    else
      redirect '/login'
    end
  end

  get '/projects/:id' do
    if logged_in?
      @project = current_user.projects.find_by(id: params[:id])
      erb :"projects/show"
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

  delete '/projects/:id/delete' do
      if logged_in?
        @project = current_user.projects.find_by(id: params[:id])
        @project.destroy
        redirect '/projects'
      else
        redirect '/login'
      end
  end

  get '/projects/:id/edit' do
    if logged_in?
      @project = current_user.projects.find_by(id: params[:id])
      erb :"projects/edit"
    else
      redirect '/login'
    end
  end

  put '/projects/:id/edit' do
    if logged_in?
      project = current_user.projects.find_by(id: params[:id])
      project.update(params[:project])
      redirect "/projects/#{project.id}"
    else
      redirect '/login'
    end
  end


end
