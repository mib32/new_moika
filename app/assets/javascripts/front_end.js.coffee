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
    hidden = $(this).data('showThat')

    $(hidden).show()

    $(this).hide()