# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
document.addEventListener 'turbolinks:load', ->
$ ->
	$('.change_language').on 'click', ->
		options = 
			url: $(this).data 'url'
			data: abbreviation: $(this).data 'abbr'
			functions: done: (data) ->
				location.reload()
				return
		
		callCustomAjax.ajax_request options
		return
