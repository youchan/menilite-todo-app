require 'sinatra'
require 'opal'
require 'opal/sprockets'
require 'sinatra/activerecord'

if development?
  require 'sinatra/reloader'
end

class Server < Sinatra::Base
  OPAL = Opal::Server.new do |server|
    server.append_path 'app'
    server.append_path 'assets'
    Opal.use_gem 'hyalite'
    Opal.use_gem 'menilite'
    Opal.paths.each {|path| server.append_path path }

    server.main = 'application'
  end

  configure do
    set opal: OPAL
    enable :sessions
  end

  def login?
    if session[:user_id]
      user = User[session[:user_id]]
      if user
        return true
      end
    end
    false
  end

  get '/' do
    if login?
      haml :index
    else
      redirect to('/login')
    end
  end

  get '/signup' do
    haml :signup
  end

  get '/login' do
    haml :login
  end

  get "/favicon.ico" do
  end
end

