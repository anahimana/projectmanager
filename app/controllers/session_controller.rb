class SessionController < ApplicationController
  get '/login' do
    erb :'sessions/login'
  end

  post '/sessions' do
    login(params[:user][:email])
    redirect '/projects'
  end


  get '/logout' do
    logout!
    redirect '/login'
  end


end
