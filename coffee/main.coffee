init = ->
  new ShareBar({'facebookAppId': '107114766046971'})

unless document.readyState is "loading"
  init()
else
  document.addEventListener "DOMContentLoaded", init
