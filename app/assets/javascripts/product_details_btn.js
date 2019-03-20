$(document).on('turbolinks:load', function(){
  var DarkGrey = '#efefef'

  $('.item-container__purchase-btn').hover(
    function(){
      $(this).css('background-color', DarkGrey)
    },
    function(){
      $(this).css('background-color', '')
    }
  )
  $('.item-container__purchase-btn--sold').hover(
    function(){
      $(this).css('background-color', DarkGrey)
    },
    function(){
      $(this).css('background-color', '')
    }
  )
})
