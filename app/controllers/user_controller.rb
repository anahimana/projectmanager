class UserController < ApplicationController
  get '/signup' do
    erb :"users/new"
  end

  post '/users' do
    @user = User.create(params[:user])
    if @user.valid?
      redirect '/login'
    else
      erb :"users/new"
    end
  end
end
