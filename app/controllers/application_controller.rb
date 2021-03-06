class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, "public"
    set :views, "app/views"
    enable :sessions
    set :session_secret, "#{ENV['SESSION_SECRET']}"
  end

  get '/' do
    redirect '/projects'
  end

  helpers do

    def current_user
      @current_user ||= User.find_by(:email => session[:email]) if session[:email]
    end

    def logged_in?
      !!current_user
    end

    def login(email, password)
      user = User.find_by(:email => email)
      if user && user.authenticate(password)
        session[:email] = user.email
      else
        redirect '/login'
      end
    end

    def logout!
      session.clear
    end
  end


end
