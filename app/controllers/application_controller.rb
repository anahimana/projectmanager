class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, "public"
    set :views, "app/views"
    enable :sessions
    set :session_secret, "#{ENV['SESSION_SECRET']}"
  end

  helpers do
    def logged_in?
      !!session[:id]
    end

    def login(id)
      session[:id] = id
    end

    def logout!
      session.clear
    end
  end


end
