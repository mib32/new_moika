$ -> 
	$('#expander').change (e) ->
		if $('#expander').is(":checked")
			$('.form-signin #cw_owner').removeClass('hidden')
			$('.form-signin input[name=commit]').prop('disabled',true)
		else
			$('.form-signin #cw_owner').addClass('hidden')
			$('.form-signin input[name=commit]').prop('disabled',false)
