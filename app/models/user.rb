unless RUBY_ENGINE == 'opal'
  require 'bcrypt'
end

class User < Menilite::Model
  field :name
  field :password

  action :signup, save: true do |password|
    self.password = BCrypt::Password.create(password)
  end
end

