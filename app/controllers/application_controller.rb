class ApplicationController < Menilite::Controller
  action :login do |username, password|
    user = User.find(name: username)
    if user && user.auth(password)
      session[:user_id] = user.id
    else
      raise Menilite::Unauthorized.new
    end
  end
end
