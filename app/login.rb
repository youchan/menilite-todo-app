require 'hyalite'
require 'menilite'
require_relative 'models/user'

class LoginView
  include Hyalite::Component

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
      p({class: 'control'}, button({class: 'button is-primary'}, 'Login'))
    )
  end
end

Hyalite.render(Hyalite.create_element(LoginView), $document['.content'])

