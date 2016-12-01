class TodoView
  include Hyalite::Component

  state :entries, [ 'Entry 1', 'Entry 2' ]

  def handle_keydown(event)
    if event.code == 13
      input = @refs[:entry]
      unless input.value.empty?
        @state.entries << input.value
        input.value = ''
        force_update
      end
    end
  end

  def render
    div({class: 'todo-view'},
      p({class: 'controll'},
        input({class: 'input', ref: 'entry', type: 'text', placeholder: 'Input todo', onKeyDown: self.method(:handle_keydown)})
      ),
      ul({class: 'todo-list'}, @state.entries.map{|entry| li({}, entry)})
    )
  end
end
