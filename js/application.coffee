itsDay = ->
  $('.night').removeClass 'night'
  $('body').addClass 'day'
itsNight = ->
  $('.day').removeClass 'day'
  $('body').addClass 'night'

checkTime = () ->
  now = moment()
  console.log 'now', now.hour()
  time = switch
    when now.hour() < 5  and now.hour() > 20 then itsNight()
    when now.hour() < 20 and now.hour() > 5 then itsDay()
    else
      console.log 'your guess is as good as mine'

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
