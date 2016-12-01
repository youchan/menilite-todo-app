require 'hyalite'
require 'menilite'
require_relative 'models/entry'
require_relative 'views/todo_view'

class AppView
  include Hyalite::Component

  def render
    TodoView.el
  end
end
Hyalite.render(Hyalite.create_element(AppView), $document['.content'])
