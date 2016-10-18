$(document).ready( ->
  setupDocument()
)

setupDocument = ->
  $('#todo-form-create-container').html(HandlebarsTemplates['todos/todo_form_create']())
  $('#todo-form-create').submit((e) ->
    e.preventDefault()
    $.ajax({
      url: $(this).attr('action'),
      method: 'post',
      dataType: 'json',
      data: $(this).serialize(),
    }).success((data) ->
      loadTodos()
    )
  )

  loadTodos()

loadTodos = ->
  $.ajax({
    url: '/',
    dataType: 'json',
  }).success((data) ->
    $('#todo-table-container').html(HandlebarsTemplates['todos/todo_table'](data))
    $('.todo-form-toggle').each((i) ->
      $(this).submit((e) ->
        e.preventDefault()
        $.ajax({
          url: $(this).attr('action'),
          method: 'post',
          dataType: 'json'
        }).success((data) ->
          loadTodos()
        )
      )
    )
  )
