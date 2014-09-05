add_class = (el, class_name) ->
  if (el.classList)
    el.classList.add(class_name)
  else
    el.className += " #{class_name}"

add_event = (el, event_name, handler) ->
  if (el.addEventListener)
    el.addEventListener(event_name, handler)
  else
    el.attachEvent "on#{event_name}", ->
      handler.call(el)

add_event document, 'DOMContentLoaded', ->
  wrapper = document.getElementById('js-wrapper')
  form = document.getElementById('js-form')
  letterbox = document.getElementById('js-letterbox')

  ready = ->
    add_class(wrapper, 'ready')

  close_form = ->
    add_class(letterbox, 'closed')

  submit_form = ->
    form.submit()

  setTimeout ready, 500

  if form
    add_event form, 'submit', (e) ->
      e.preventDefault()
      close_form()
      setTimeout submit_form, 500
