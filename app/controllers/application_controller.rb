class ApplicationController < Menilite::Controller
  before_action(exclude: ['ApplicationController#login', 'User#signup']) do
    user = User[session[:user_id]]
    if user
      Menilite::PrivilegeService.current.privileges << UserPrivilege.new(user)
    else
      raise Menilite::Unauthorized.new
    end
  end

  action :login do |username, password|
    user = User.find(name: username)
    if user && user.auth(password)
      session[:user_id] = user.id
    else
      raise Menilite::Unauthorized.new
    end
  end
end
