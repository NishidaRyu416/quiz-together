document.querySelector('.audioButton').onclick = ->
  document.querySelector('#audio').play()
  alert 'You answered'
  return