$ ->
	$('.bettertabs').bettertabs()
	$('a#show_auth').click ->
		window.history.pushState('users/sign_in',"Вход", '/users/sign_in');
		$('#auth').show()