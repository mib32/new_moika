$ ->
	 $("label.toggle").click ->
      label = $(this)
      input = label.prev('input')
      
      if !input.prop('checked')
        $(this).parent().find("label.checked.toggle").removeClass('checked')
        label.addClass('checked')
        input.prop('checked', true)

  $("input[checked=checked].toggle").each ->
      # $("label[for=" + $(this).attr('id') + "]").addClass('checked');
      $(this).next('label').addClass('checked')

  $("[data-show-that]").click ->
    hidden = $(this).nextAll($(this).data('showThat'))

    $(hidden).show()

    $(this).hide()
    
  $('.flash').hover ->
    $(this).fadeOut()

  $('.expand-categories').click -> 
    height = $('#video_tabs .tabs li').first().outerHeight(true) * $('#video_tabs .tabs li').length
    $('#video_tabs .tabs').css('height',height)

  # myScroll = new IScroll('#m', {mouseWheel: true,scrollbars: true })
