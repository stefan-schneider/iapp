$(document).ready ->
  $('#micropost_content').on("change keyup keydown keypress paste drop", updateCount)

updateCount = ->
  rem = 160 - $('#micropost_content').val().length
  $('#remaining').attr('class','')

  if rem < 1
    $('#remaining').text "#{rem} letters left"  
    $('#remaining').addClass 'alert alert-error'
  if rem < 20
    $('#remaining').text "#{rem} letters left"
    $('#remaining').addClass 'alert'
  else
    $('#remaining').text "#{rem} letters left"
    $('#remaining').addClass 'alert alert-success'   
    
  if rem is 1 or rem is -1 
    $('#remaining').text "#{rem} letter left"  
    $('#remaining').addClass 'alert alert-error'    