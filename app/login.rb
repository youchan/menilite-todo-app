require 'hyalite'
require 'menilite'
require 'browser/location'
require_relative 'models/user'
require_relative 'controllers/application_controller'

class LoginView
  include Hyalite::Component

  def login
    name = @refs[:name].value
    password = @refs[:password].value
    ApplicationController.login(name, password) do |status, res|
      if status == :success
        $window.location.assign('/')
      end
    end
  end

  def render
    div({class: 'login-view'},
      p({class: 'control has-icon'},
        input({class: 'input', type: 'text', ref: 'name', placeholder: 'User name'}),
        i({class: 'fa fa-user'})
      ),
      p({class: 'control has-icon'},
        input({class: 'input', type: 'text', ref: 'password', placeholder: 'Password'}),
        i({class: 'fa fa-lock'})
      ),
      p({class: 'control'}, button({class: 'button is-primary', onClick: self.method(:login)}, 'Login'))
    )
  end
end

Hyalite.render(Hyalite.create_element(LoginView), $document['.content'])

