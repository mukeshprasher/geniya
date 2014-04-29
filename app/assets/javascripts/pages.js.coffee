jQuery ->
  toDoOnload = undefined
  toDoOnload = ->  
    if $('#infinite-scrolling').size() > 0
      $(window).on 'scroll', ->
        more_albums_url = $('.pagination .next_page a').attr('href')
        if more_albums_url && $(window).scrollTop() > $(document).height() - $(window).height() - 300
          $('.pagination').html('<div class="page_loader"><img src="/assets/page_loader.gif" alt="Loading..." title="Loading..." /></div>')
          $.getScript more_albums_url
        return
      return
  $(document).ready toDoOnload
  $(document).on "page:load", toDoOnload
  return    
  

