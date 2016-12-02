require 'hyalite'
require 'menilite'
require 'browser/location'
require_relative 'models/user'

class SignupView
  include Hyalite::Component

  def signup
    user = User.new(name: @refs[:name].value)
    user.signup(@refs[:password].value) do
      $window.location.assign('/')
    end
  end

  def render
    div({class: 'signup-view'},
      p({class: 'control has-icon'},
        input({class: 'input', type: 'text', ref: 'name', placeholder: 'User name'}),
        i({class: 'fa fa-user'})
      ),
      p({class: 'control has-icon'},
        input({class: 'input', type: 'text', ref: 'password', placeholder: 'Password'}),
        i({class: 'fa fa-lock'})
      ),
      p({class: 'control'}, button({class: 'button is-primary', onClick: self.method(:signup)}, 'Signup'))
    )
  end
end
Hyalite.render(Hyalite.create_element(SignupView), $document['.content'])

