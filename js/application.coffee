itsDay = ->
  $('.night').removeClass 'night'
  $('body').addClass 'day'

itsNight = ->
  $('.day').removeClass 'day'
  $('body').addClass 'night'

checkTime = () ->
  now = moment()
  hour = now.hour()
  console.log 'now', now.hour()
  time = switch
    when hour < 5  or hour > 20 then itsNight()
    when hour > 5 and hour < 20 then itsDay()
    else
      console.log 'TIME TRAP'

lullabyEvents = ->
  lullaby = document.getElementById "lullaby"
  $(".music-trigger").on 'click', ->
    if !lullaby.paused
      lullaby.pause()
    else 
      lullaby.play()
$(document).ready ->
  checkTime()
  lullabyEvents()
  checkTimeInterval = setInterval(checkTime, 60000)
