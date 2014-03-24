# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  toDoOnload = undefined
  toDoOnload = ->
    $("#user_category_id").change ->
      $.get "/categories/" + $(this).val() + ".json", (jsonObjCategory) ->
        sub_category_options = ""
        $.each jsonObjCategory.sub_categories, (key, sub_category) ->
          sub_category_options += "<option value='" + sub_category.id + "'>" + sub_category.name + "</option>"
          $("#user_sub_category_id").html sub_category_options
          return
        return
      return
    return

  $(document).ready toDoOnload
  $(document).on "page:load", toDoOnload
  return
