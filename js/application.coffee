itsDay = ->
  $('.night').removeClass 'night'
  $('body').addClass 'day'
  return
itsNight = ->
  $('.day').removeClass 'day'
  $('body').addClass 'night'
  return
checkTime = () ->
  now = moment()
  hour = now.hour()
  time = switch
    when hour < 5  or hour > 20 then itsNight()
    when hour > 5 and hour < 20 then itsDay()
    else
      console.log 'TIME TRAP'
  return

lullabyEvents = ->
  lullaby = document.getElementById "lullaby"
  $(".music-trigger").on 'click', ->
    if !lullaby.paused
      lullaby.pause()
    else 
      lullaby.play()
    return
$(document).ready ->
  checkTime()
  lullabyEvents()
  checkTimeInterval = setInterval(checkTime, 60000)
return
