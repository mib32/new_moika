$ -> 
	$("a[data-remote]").on "ajax:send", (xhr) ->
		$('.nav li.active').removeClass('active');
		$('.nav').children().first().addClass('active');