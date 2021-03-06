# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  toDoOnload = undefined
  toDoOnload = ->
    if $("#job_category_id").val()
      $.get "/categories/" + $("#job_category_id").val() + ".json", (jsonObjCategory) ->
        sub_category_options = ""
        $.each jsonObjCategory.sub_category_groups, (key, sub_category_group) ->
          sub_category_options += '<optgroup class="sub_category_select_optgroup" label="'+sub_category_group.name+'" >'
          $.each sub_category_group.sub_categories, (key, sub_category) ->
            sub_category_options += '<option value="'+sub_category.id+'">'+sub_category.name+'</option>'
          sub_category_options += "</optgroup>"
        $("#job_sub_category_id").html sub_category_options

    $("#job_category_id").change ->
      $.get "/categories/" + $(this).val() + ".json", (jsonObjCategory) ->
        sub_category_options = ""
        $.each jsonObjCategory.sub_category_groups, (key, sub_category_group) ->
          sub_category_options += '<optgroup class="sub_category_select_optgroup" label="'+sub_category_group.name+'" >'
          $.each sub_category_group.sub_categories, (key, sub_category) ->
            sub_category_options += '<option value="'+sub_category.id+'">'+sub_category.name+'</option>'
          sub_category_options += "</optgroup>"
        $("#job_sub_category_id").html sub_category_options
    return
    
  $(document).ready toDoOnload
  $(document).on "page:load", toDoOnload
  return
