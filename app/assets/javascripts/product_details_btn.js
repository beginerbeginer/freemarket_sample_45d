$(document).on('turbolinks:load', function(){
  $('.item-container__purchase-btn').hover(
    function(){
      $(this).css('background-color', '#efefef')
    },
    function(){
      $(this).css('background-color', '')
    }
  )
  $('.item-container__purchase-btn--sold').hover(
    function(){
      $(this).css('background-color', '#efefef')
    },
    function(){
      $(this).css('background-color', '')
    }
  )
})
