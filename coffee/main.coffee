document.addEventListener 'DOMContentLoaded', ->
  wrapper = document.getElementById('js-wrapper')
  form = document.getElementById('js-form')
  letterbox = document.getElementById('js-letterbox')

  ready = ->
    wrapper.classList.add('ready')

  close_form = ->
    letterbox.classList.add('closed')

  submit_form = ->
    form.submit()

  setTimeout ready, 500

  if form
    form.addEventListener 'submit', (e) ->
      e.preventDefault()
      close_form()
      setTimeout submit_form, 500
