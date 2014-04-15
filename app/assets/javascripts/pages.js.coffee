jQuery ->
  if $('#infinite-scrolling').size() > 0
    $(window).on 'scroll', ->
      more_albums_url = $('.pagination .next_page a').attr('href')
      if more_albums_url && $(window).scrollTop() > $(document).height() - $(window).height() - 300
        $('.pagination').html('<img src="/assets/page_loader.png" alt="Loading..." title="Loading..." />')
        $.getScript more_albums_url
      return
    return
