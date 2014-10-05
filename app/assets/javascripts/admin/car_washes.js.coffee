# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


# $(document).on 'click', 'input#videoned', (e) ->
#   if $('input#videoned').prop('checked')
#     $('input#blink').prop('checked', true)
#     $('input#blink').prop('value', 1)
#     $('input#blink').prop('disabled', true)
#   else
#     $('input#blink').prop('checked', false)
#     $('input#blink').prop('value', 0)
#     $('input#blink').prop('disabled', false)

$ ->
	fun = ->
		if $('.hours').is(':checked')
			$('input[name=car_wash\\[working_time_string\\]]').nextAll('select').prop('disabled',false)
		else
			$('input[name=car_wash\\[working_time_string\\]]').nextAll('select').prop('disabled',true)

	fun()
	$('input[name=car_wash\\[working_time_string\\]]').change ->
		fun()

	$('.car_wash_edit_details').submit ->
		$('.hours').val()