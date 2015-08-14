# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$ ->
	$('#menu_home,#menu_profile,#menu_order,#menu_make_order').hover(
		(ev) -> 
			$(this).attr('src', '/assets/' + $(this).attr('id') + '_over.png')
		(ev) -> 
			$(this).attr('src', '/assets/' + $(this).attr('id') + '.png')
	)
