class SessionController < ApplicationController
  get '/login' do
    erb :'sessions/login'
  end

  post '/sessions' do
    login(params[:id])
    redirect '/posts'
  end


  get '/logout' do
    logout!
    redirect '/login'
  end


end
