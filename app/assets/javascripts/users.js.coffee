# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  toDoOnload = undefined
  toDoOnload = ->
    $("#user_category_id").change ->
      $.get "/categories/" + $(this).val() + ".json", (jsonObjCategory) ->
        sub_category_options = ""
        $.each jsonObjCategory.sub_category_groups, (key, sub_category_group) ->
          sub_category_options += '<optgroup label="'+sub_category_group.name+'" >'
          $.each sub_category_group.sub_categories, (key_c, sub_category) ->
            if key == 0 and key_c == 0
              sub_category_options += '<option value="'+sub_category.id+'" seleted="selected">'+sub_category.name+'</option>'
            else
              sub_category_options += '<option value="'+sub_category.id+'">'+sub_category.name+'</option>'
          sub_category_options += "</optgroup>"
        $("#user_sub_category_id").html sub_category_options
    return

  
    
  $(document).ready toDoOnload
  $(document).on "page:load", toDoOnload
  return
