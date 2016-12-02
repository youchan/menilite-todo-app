require 'hyalite'
require 'menilite'
require 'browser/location'
require_relative 'models/user'

class SignupView
  include Hyalite::Component

  state :validation_error, nil

  def signup
    user = User.new(name: @refs[:name].value)
    user.signup(@refs[:password].value) do |status, res|
      case status
      when :success
        $window.location.assign('/')
      when :validation_error
        @state.validation_error = res.message
      end
    end
  end

  def render
    div({class: 'signup-view'},
      @state.validation_error && p({class: 'notification is-danger'}, @state.validation_error),
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

