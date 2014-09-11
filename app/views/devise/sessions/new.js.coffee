$("<%= escape_javascript(render 'devise/sessions/form') %>").appendTo("body");
jQuery('.bettertabs').bettertabs(); # apply bettertabs to any element with the bettertabs css class
$ -> 
	$('#expander').change (e) ->
		if $('#expander').is(":checked")
			$('.form-signin #cw_owner').removeClass('hidden')
			$('.form-signin input[name=commit]').prop('disabled',true)
			$('.form-signin #cw_owner input').prop('disabled',false)
		else
			$('.form-signin #cw_owner').addClass('hidden')
			$('.form-signin input[name=commit]').prop('disabled',false)
			$('.form-signin #cw_owner input').prop('disabled',true)
	# console.log('urur')
	$('input[type="checkbox"]#agreement').change ->
		if $('input[type="checkbox"]#agreement').prop('checked')
			$('input[type="submit"]').prop('disabled',false)
		else
			$('input[type="submit"]').prop('disabled',true)
	# window.form_is_checked = false
	# $('.form-signin#login').submit (e) ->
	# 	if !window.form_is_checked
	# 		data = {'email':$('#login #user_email').val()}
	# 		$.getJSON '/get_user', data, (json) ->
	# 			if json.scope != 'user'
	# 				$('#login').prop('action','/'+json.scope+'s/sign_in')
	# 				$('#login input').each ->
	# 					$(this).prop('name',$(this).prop('name').replace('user',json.scope))
	# 			window.form_is_checked = true
	# 			$('.form-signin#login').submit()
	# 		e.preventDefault()
	$('.form-signin#new_normal_user').submit (e) ->
		if $('input[type="checkbox"]#agreement').prop('checked')
			$('.form-signin#new_normal_user').prop('action','/users')
			$('#new_normal_user input').each ->
				$(this).prop('name',$(this).prop('name').replace('normal_user','user'))
			$('#new_normal_user input#normal_user_name').prop('name','user[contact_person]')

return false;



