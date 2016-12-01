class TodoView
  include Hyalite::Component

  state :entries, [ 'Entry 1', 'Entry 2' ]

  def render
    div({class: 'todo-view'},
      p({class: 'controll'},
        input({class: 'input', type: 'text', placeholder: 'Input todo'})
      ),
      ul({class: 'todo-list'}, @state.entries.map{|entry| li({}, entry)})
    )
  end
end
