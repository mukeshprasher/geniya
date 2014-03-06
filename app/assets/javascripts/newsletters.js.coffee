# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  toDoOnload = undefined
  toDoOnload = ->
    $("#send_newsletter_button").click ->
      $(this).prop("disabled",true)
      $("#send_newsletter_button").val 'Sending ...'
    return

  $(document).ready toDoOnload
  $(document).on "page:load", toDoOnload
  return
