document.addEventListener 'DOMContentLoaded', ->
  ready = ->
    wrapper = document.getElementById('js-wrapper')
    wrapper.classList.add('ready')

  setTimeout ready, 500
