$ ->
	$('.bettertabs').bettertabs()
	$('a#show_auth').click ->
		window.history.pushState('users/sign_in',"Вход", '/users/sign_in');
		$('#auth').show()

	console.log 'sign in text'
	$('.expander').change (e) ->
		console.log 'and test'
		if $(this).is(":checked")
			$('.form-signin #cw_owner').removeClass('hidden')
			$('.form-signin input[name=commit]').prop('disabled',true)
			$('.form-signin #cw_owner input').prop('disabled',false)
		else
			$('.form-signin #cw_owner').addClass('hidden')
			$('.form-signin input[name=commit]').prop('disabled',false)
			$('.form-signin #cw_owner input').prop('disabled',true)

	$('input[type="checkbox"]#agreement').change ->
		if $(this).prop('checked')
			$('input[type="submit"]').prop('disabled',false)
		else
			$('input[type="submit"]').prop('disabled',true)