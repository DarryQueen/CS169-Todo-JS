$(document).ready( ->
  setupDocument()
)

setupDocument = ->
  $('#todo-form-create-container').html(HandlebarsTemplates['todos/todo_form_create']())
  loadTodos()

loadTodos = ->
  $.ajax({
    url: '/',
    dataType: 'json',
  }).success((data) ->
    $('#todo-table-container').html(HandlebarsTemplates['todos/todo_table'](data))
  )
