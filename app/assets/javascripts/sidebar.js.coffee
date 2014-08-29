$ ->
	$("*").on("ajax:success", (e, data, status, xhr) ->
		alert(123);
	)