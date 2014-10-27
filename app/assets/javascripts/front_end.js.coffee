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

  $('.video_thumb').each ->
    id = $(this).data('id')
    thumb_url = "http://img.youtube.com/vi/"+id+"/maxresdefault.jpg"
    $('<img width="100%" src="'+thumb_url+'" />').appendTo($(this))

  $('.video_thumb').click ->
    src = $(this).data('src')
    $(this).html('<iframe width="100%" height="315" src="'+src+'&autoplay=1" frameborder="0" allowfullscreen></iframe>').css('background', 'none');
    $(this).parent().find('.video_thumb_text').hide()
