jQuery ->
  # Create a comment
  comments = ->
    ie = false
    ie = true  if $.browser.msie

    #current album/image displayed 
    enableshow = true
    current = -1
    album = -1

    #windows width
    w_width = $(window).width()

    #caching
    $albums = $("#pp_thumbContainer div.album")
    $loader = $("#pp_loading")
    $next = $("#pp_next")
    $prev = $("#pp_prev")
    $images = $("#pp_thumbContainer div.content img")
    $back = $("#pp_back")
    nmb_albums = $albums.length
    spaces = w_width / (nmb_albums + 1)
    cnt = 0

    #preload all the images (thumbs)
    nmb_images = $images.length
    loaded = 0
    $images.each (i) ->
      $image = $(this)
      
      #let's spread the albums equally on the bottom of the page
      
      #$this.css('left',left+'px');
      #$this.stop().animate({'bottom':'0px'},500);
      
      #also rotate each picture of an album with a random number of degrees
      $("<img />").load(->
        ++loaded
        if loaded is nmb_images
          $albums.each(->
            $this = $(this)
            ++cnt
            left = spaces * cnt - $this.width() / 2
          ).unbind("click").bind "click", spreadPictures
          $images.each ->
            $this = $(this)
            r = Math.floor(Math.random() * 21) -5
            $this.transform rotate: r + "deg"

      ).attr "src", $image.attr("src")
    #function for right key to slide images
    rightArrowKeyFunction = (e) ->
      showImage 1  if e.keyCode is 37

    #function for left arrow to slide images
    leftArrowKeyFunction = (e) ->
      if e.keyCode is 39
        current += 2
        showImage 1

    #function for spread images
    spreadPictures = ->
      $newpreview = $("<div />",
        id: "wrapper_preview1"
        class: "wrapper_preview1"
        style: "visibility:hidden;"
      )
      $('.album-content').hide();
      $('.content img').css({'width':'300px','height':'200px'})
      $("#pp_gallery").prepend $newpreview
      $newpreview.css
        width: "102%"
        height: "100%"
        visibility: "visible"
        position: "fixed"
        background: "#1A1A1A"
        top: "0"
        "z-index": "1"
        right: "23%"
        left: "0"

      $album = $(this)
      
      #track which album is opened
      album = $album.index()
      
      #hide all the other albums
      $albums.not($album).hide()
      
      #	$albums.not($album).stop().animate({'z-index':'-1'});
      $album.unbind "click"
      
      #now move the current album to the left 
      #and at the same time spread its images through 
      #the window, rotating them randomly. Also hide the description of the album
      
      #store the current left for the reverse operation
      $("#pp_thumbContainer img").css
        position: "fixed"
        bottom: "0"

      $(".wrapper-footer-content").css
        position: "absolute"
        "z-index": "-1"

      $(".album").css border: "none"
      $(".album_title-single-profile").hide()
      $(".portfolio_author_name").hide()
      $(".album_category").hide()
      $album.data("left", $album.css("left")).stop().animate(
        left: "-120px"
        "z-index": "9999"
      , 500).find(".descr").stop().animate position: "fixed"
      total_pic = $album.find(".content").length
      cnt = 0
      
      #each picture
      $album.find(".content").each ->
        $content = $(this)
        ++cnt
        
        #window width
        w_width = $(window).width()
        spaces = w_width / (total_pic + 1)
        left = (spaces * cnt) - (140 / 2)
        r = Math.floor(Math.random() * 41) - 20
        
        #var r = Math.floor(Math.random()*81)-80;
        $content.stop().animate(
          left: left + "px"
        , 500, ->
          $(this).unbind("click").bind("click", showImage).unbind("mouseenter").bind("mouseenter", upImage).unbind("mouseleave").bind "mouseleave", downImage
        ).find("img").stop().animate
          rotate: "0deg"
        , 300
        $back.stop().animate
          left: "0px"
        , 300


    #back to albums
    #the current album gets its innitial left position
    #all the other albums slide up
    #the current image slides out
    #				$back.bind('click',function(){
    #					$back.stop().animate({'left':'-100px'},300);
    #					hideNavigation();
    #					//there's a picture being displayed
    #					//lets slide the current one up
    #					$(".wrapper-profile").fadeTo(1000,1);
    #					if(current != -1){
    #						hideCurrentPicture();
    #					}
    #					
    #					var $current_album = $('#pp_thumbContainer div.album:nth-child('+parseInt(album+1)+')');
    #					$current_album.stop()
    #								  .animate({'left':$current_album.data('left')},500)
    #								  .find('.descr')
    #								  .stop()
    #								  .animate({'bottom':'0px'},500);
    #					
    #					$current_album.unbind('click')
    #								  .bind('click',spreadPictures);
    #					
    #					$current_album.find('.content')
    #							  .each(function(){
    #								var $content = $(this);
    #								$content.unbind('mouseenter mouseleave click');
    #								$content.stop().animate({'left':'0px'},500);
    #								});
    #								
    #					$albums.not($current_album).stop().animate({'bottom':'0px'},500);
    #				});

    #displays an image (clicked thumb) in the center of the page
    #if nav is passed, then displays the next / previous one of the 
    #current album
    showImage = (nav) ->
      return  unless enableshow
      enableshow = false
      if nav is 1
        
        #reached the first one
        if current is 0
          enableshow = true
          return
        $content = $("#pp_thumbContainer div.album:nth-child(" + parseInt(album + 1) + ")").find(".content:nth-child(" + parseInt(current) + ")")
        
        #reached the last one
        if $content.length is 0
          enableshow = true
          current -= 2
          return
      else
        $content = $(this)
      
      #show ajax loading image
      $loader.show()
      
      #there's a picture being displayed
      #lets slide the current one up
      unless current is -1
        hideCurrentPicture()
        $(".wrapper_preview").remove()
      current = $content.index()
      $thumb = $content.find("img")
      imgL_source = $thumb.attr("alt")
      imgL_description = $thumb.next().html()
      imgL_id = $thumb.next().html()
      
      #preload the large image to show
      
      #						  $('.album').hide();
      #resize the image based on the windows size
      
      #create an element to include the large image
      #and its description
      
      #'html'  : '<div class="pp_descr"><span>'+imgL_description+'</span></div>',
      
      #click left arrow
      
      # click right arrow
      
      # mouse scroll up and down events
      
      # scroll up
      
      # scroll down
      
      #remove the wrapper-preview divs
      
      #$(window).unbind('mousewheel DOMMouseScroll')
      
      #change the properties of the wrapping div 
      #to fit the large image sizes
      
      #show navigation
      
      #hide the ajax image loading
      
      #slide up (also rotating) the large image
      
      #error loading image. Maybe show a message : 'no preview available'?
      $("<img style=\"\"/>").load(->
        $(".wrapper_preview1").remove()
        $imgL = $(this)
        $('.content').hide();
        $('.album-content').hide();
        resize $imgL
        $preview = $("<div />",
          id: "pp_preview"
          class: "pp_preview"
          style: "visibility:hidden;"
        )
        $newpreview = $("<div />",
          id: "wrapper_preview"
          class: "wrapper_preview"
          style: "visibility:hidden;"
        )
        $preview.prepend $imgL
        $("#pp_gallery").prepend $newpreview
        $("#wrapper_preview").prepend $preview
        $(document).keyup (e) ->
          leftArrowKeyFunction e

        $(document).keyup (e) ->
          rightArrowKeyFunction e

        $(window).bind "mousewheel DOMMouseScroll", (event) ->
          if event.originalEvent.wheelDelta > 0 or event.originalEvent.detail < 0
            current += 2
            showImage 1
          else
            showImage 1

        $(".wrapper_preview").click ->
          $(document).unbind "keyup", rightArrowKeyFunction
          $(document).unbind "keyup", leftArrowKeyFunction
          $(".wrapper_preview").hide()
          $(".wrapper_preview").remove()
          backtoalbum()

        largeW = $imgL.width() + 20
        largeH = $imgL.height() + 10 + 45
        $newpreview.css
          width: "102%"
          height: "100%"
          visibility: "visible"
          position: "fixed"
          background: "#1A1A1A"
          top: "0"
          "z-index": "1"
          right: "23%"
          left: "0"

        $preview.css
          width: "660px"
          height: "481px"
          "margin-top": "-20%"
          marginLeft: "-330px"
          "z-index": "999"
          visibility: "visible"

        Cufon.replace ".pp_descr"
        showNavigation()
        $loader.hide()
        r = Math.floor(Math.random() * 41) - 30
        if ie
          param = top: "50%"
        else
          param =
            top: "58%"
            rotate: "0deg"
        $preview.stop().animate param, 500, ->
          enableshow = true

      ).error(->
      ).attr "src", imgL_source

    #click next image

    #click previous image

    # function back to album
    backtoalbum = ->
      hideNavigation()
      
      #there's a picture being displayed
      #lets slide the current one up
      $(".album").show()
      $('.content').show()
      $('.content img').css({'width':'auto','height':'auto'})
      $('.album-content').show()
      $("#pp_thumbContainer img").css
        position: "none"
        bottom: "none"

      $(".wrapper-footer-content").css
        position: "none"
        "z-index": "none"

      $(".album").css position: "none"
      $(".album_title-single-profile").show()
      $(".portfolio_author_name").show()
      $(".album_category").show()
      $(".album").css
        left: "none"
        'z-index': 'none'
      $(".content").css
        "margin-top:": "none"
        left: "none"

      $(".wrapper_preview").hide()
      $(".wrapper_preview1").hide()
      hideCurrentPicture()  unless current is -1
      $current_album = $("#pp_thumbContainer div.album:nth-child(" + parseInt(album + 1) + ")")
      $current_album.stop().animate().find(".descr").stop().animate()
      $current_album.unbind("click").bind "click", spreadPictures
      $current_album.find(".content").each ->
        $content = $(this)
        $content.unbind "mouseenter mouseleave click"
        $content.stop().animate()

      
      #$albums.not($current_album).stop().animate({'bottom':'0px'},500);
      #$albums.not($current_album).stop().animate({'z-index':'9999'});
      $(window).unbind "mousewheel DOMMouseScroll"

    #slides up the current picture
    hideCurrentPicture = ->
      current = -1
      r = Math.floor(Math.random() * 41) - 40
      if ie
        param = top: "-150%"
      else
        param =
          top: "-150%"
          rotate:"0deg"
      $("#pp_preview").stop().animate param, 500, ->
        $(this).remove()


    #shows the navigation buttons
    showNavigation = ->
      $next.stop().animate
        right: "0px"
      , 100
      $prev.stop().animate
        left: "0px"
      , 100

    #hides the navigation buttons
    hideNavigation = ->
      $next.stop().animate
        right: "-40px"
      , 300
      $prev.stop().animate
        left: "-40px"
      , 300

    #mouseenter event on each thumb
    upImage = ->
      $content = $(this)
      $content.stop().animate(
        marginTop: "-70px"
      , 400).find("img").stop().animate
        rotate: "0deg"
      , 400

    #mouseleave event on each thumb
    downImage = ->
      $content = $(this)
      r = Math.floor(Math.random() * 41) - 40
      $content.stop().animate(
        marginTop: "0px"
      , 400).find("img").stop().animate
        rotate:"0deg"
      , 400

    #resize function based on windows size
    resize = ($image) ->
      widthMargin = 50
      heightMargin = 200
      windowH = $(window).height() - heightMargin
      windowW = $(window).width() - widthMargin
      theImage = new Image()
      theImage.src = $image.attr("src")
      imgwidth = theImage.width
      imgheight = theImage.height
      if (imgwidth > windowW) or (imgheight > windowH)
        if imgwidth > imgheight
          newwidth = windowW
          ratio = imgwidth / windowW
          newheight = imgheight / ratio
          theImage.height = newheight
          theImage.width = newwidth
          if newheight > windowH
            newnewheight = windowH
            newratio = newheight / windowH
            newnewwidth = newwidth / newratio
            theImage.width = newnewwidth
            theImage.height = newnewheight
        else
          newheight = windowH
          ratio = imgheight / windowH
          newwidth = imgwidth / ratio
          theImage.height = newheight
          theImage.width = newwidth
          if newwidth > windowW
            newnewwidth = windowW
            newratio = newwidth / windowW
            newnewheight = newheight / newratio
            theImage.height = newnewheight
            theImage.width = newnewwidth
      $image.css
        width: theImage.width + "px"
        height: theImage.height + "px"

    $next.bind "click", ->
      current += 2
      showImage 1

    $prev.bind "click", ->
      showImage 1

    $(document).keyup (e) ->
      backtoalbum()  if e.keyCode is 27
  

  $(document)
    .ready comments
    .on "page:load", comments
      
