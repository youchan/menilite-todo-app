class TodoView
  include Hyalite::Component

  state :entries, [ 'Entry 1', 'Entry 2' ]

  def render
    div({class: 'todo-view'},
        input({type: 'text'}),
        ul({}, @state.entries.map{|entry| li({}, entry)})
    )
  end
end
