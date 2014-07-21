function open_chat_modal(user_id){
  var $modal2 = $('#send_message');
  //create the backdrop and wait for next modal to be triggered
  $('body').modalmanager('loading');
  //user_id = $(this).attr('data')
   
  setTimeout(function(){
    $modal2.load('/ajax/chat/' + user_id, '', function(){
      $modal2.modal();
      $("#chat_modal_body").animate({ scrollTop: $("#chat_modal_body")[0].scrollHeight}, 1000);
    });
  }, 1000);
}

function myFunction()
{
alert("hello");
}


function open_event_modal(event_id){
  var $modal_event = $('#event_modal');
  //create the backdrop and wait for next modal to be triggered
  $('body').modalmanager('loading');
  //user_id = $(this).attr('data')
   
  setTimeout(function(){
    $modal_event.load('/events/' + event_id + '.js', '', function(){
      $modal_event.modal();
    });
  }, 1000);
}
function get_fb(user_id){
    var uid = user_id
    //console.log($('#last_msg_id_' + uid).val())
    if ( $('#last_msg_id_' + user_id).length  ){
      var lid = $('#last_msg_id_' + uid).val()
      //console.log(uid)
      var feedback = $.ajax({
          type: "POST",
          url: "/ajax/new_chats",
          data: {uid: uid, lid: lid},
          async: false
      }).complete(function(){
          //var last_id = $('#chat_show_table_' + uid + ' div:last-child').attr('id').split('_').last();
          //$('#last_msg_id_' + uid).val(last_id)
          setTimeout(function(){get_fb(uid);}, 4000);
      }).responseText;
    
      console.log(feedback)
      $('#chat_show_table_' + user_id).append(feedback);
    } else{
      return false;
    }
}

$(function() {
  var toDoOnload;
  toDoOnload = function() {
    $('.datepicker, .datetimepicker').append('<span class="add-on"><i data-time-icon="icon-time" data-date-icon="icon-calendar"></i></span>')

    $('.datetimepicker').datetimepicker({
      format: 'yyyy-MM-dd HH:mm:ss'
    });

    $('.datepicker').datetimepicker({
      format: 'yyyy-MM-dd',
      pickTime: false
    });

    
    $('video').mediaelementplayer({
        // if the <video width> is not specified, this is the default
        defaultVideoWidth: 480,
        // if the <video height> is not specified, this is the default
        defaultVideoHeight: 270,
        // if set, overrides <video width>
        videoWidth: -1,
        // if set, overrides <video height>
        videoHeight: -1,
        // width of audio player
        audioWidth: 400,
        // height of audio player
        audioHeight: 30,
        // initial volume when the player starts
        startVolume: 0.8,
        // useful for <audio> player loops
        loop: false,
        // enables Flash and Silverlight to resize to content size
        enableAutosize: true,
        // the order of controls you want on the control bar (and other plugins below)
        features: ['playpause','progress','current','duration','tracks','volume','fullscreen'],
        // Hide controls when playing and mouse is not over the video
        alwaysShowControls: false,
        // force iPad's native controls
        iPadUseNativeControls: false,
        // force iPhone's native controls
        iPhoneUseNativeControls: false,
        // force Android's native controls
        AndroidUseNativeControls: false,
        // forces the hour marker (##:00:00)
        alwaysShowHours: false,
        // show framecount in timecode (##:00:00:00)
        showTimecodeFrameCount: false,
        // used when showTimecodeFrameCount is set to true
        framesPerSecond: 25,
        // turns keyboard support on and off for this instance
        enableKeyboard: true,
        // when this player starts, it will pause other players
        pauseOtherPlayers: true,
        // array of keyboard commands
        keyActions: []
     
    });

    var emojis = ["smile", "iphone", "girl", "smiley", "heart", "kiss", "copyright", "coffee", "a", "ab", "airplane", "alien", "ambulance", "angel", "anger", "angry", "arrow_forward", "arrow_left", "arrow_lower_left", "arrow_lower_right", "arrow_right", "arrow_up", "arrow_upper_left", "arrow_upper_right", "art", "astonished", "atm", "b", "baby", "baby_chick", "baby_symbol", "balloon", "bamboo", "bank", "barber", "baseball", "basketball", "bath", "bear", "beer", "beers", "beginner", "bell", "bento", "bike", "bikini", "bird", "birthday", "blue_car", "blue_heart", "blush", "boar", "boat", "bomb", "book", "boot", "bouquet", "bow", "bowtie", "boy", "bread", "briefcase", "broken_heart", "bug", "bulb", "person_with_blond_hair", "phone", "pig", "pill", "pisces", "point_down", "point_left", "point_right", "point_up", "point_up_2", "police_car", "poop", "post_office", "postbox", "pray", "princess", "punch", "purple_heart", "question", "rabbit", "racehorse", "radio", "up", "us", "v", "vhs", "vibration_mode", "virgo", "vs", "walking", "warning", "watermelon", "wave", "wc", "wedding", "whale", "wheelchair", "wind_chime", "wink", "wolf", "woman", "womans_hat", "womens", "x", "yellow_heart", "zap", "zzz", "+1", "-1", "mooning", "finger", "swear", "rock", "smoking", "drunk", "poolparty", "toivo", "bandit", "headbang", "dont_know", "not_listening", "cow", "puppy", "monkey", "chicken", "red_rose", "pumpkin", "bigsmile", "brokenheart", "cake", "call", "cash", "clapping", "cool", "crying", "dance", "devil", "doh", "drink", "dull", "emo", "envy", "evilgrin", "flower", "fubar", "giggle", "handshake", "happy", "heidy", "hi", "inlove", "itwasntme", "lipssealed", "mail", "makeup", "middlefinger", "mmm", "movie", "muscle", "music", "nerd", "ninja", "no", "nod", "party", "pizza", "puke", "rain", "rofl", "sadsmile", "shake", "skype", "sleepy", "smirk", "smoke", "speechless", "star", "sun", "sweating", "talking", "thinking", "time", "tmi", "tongueout", "wait", "whew", "wondering", "worried", "yawn", "yes"]
    
    var emojis_list = $.map(emojis, function(value, i) {
      return {'id':i, 'name':value};
    });
//    var tag= ["Bold","Beautiful","Awesome","Understanding","unique","Loving","Abstract","Nature","Complex","Socialate"]
//    
//    var tag_list = $.map(tag, function(value, i) {
//      return {'id':i, 'name':value};
//    });    

    $('textarea')
      .atwho({
        at: "@",
        tpl: "<li data-value='${atwho-at}${username}'><img src=\"${headshot}\"  width=\"50px\" />${name}</li>",
        callbacks: {
          /*
           It function is given, At.js will invoke it if local filter can not find any data
           @param query [String] matched query
           @param callback [Function] callback to render page.
          */
          remote_filter: function(query, callback) {
            $.getJSON("/users.json", {q: query}, function(data) {
              callback(data)
            });
          }
        }
      })
      .atwho({
        at: ":", 
        tpl: "<li data-value=':${name}:'><img src='/assets/smileys/${name}.png' height='20' width='20'/> ${name} </li>",
        data: emojis_list
      })
      .atwho({
        at: "#", 
        tpl: "<li data-value='${atwho-at}${name}'>${name}</li>",
        callbacks: {
          /*
           It function is given, At.js will invoke it if local filter can not find any data
           @param query [String] matched query
           @param callback [Function] callback to render page.
          */
          remote_filter: function(query, callback) {
            $.getJSON("/tags.json", {q: query}, function(data) {
              callback(data)
            });
          }
        }
      }); 
      
      $("#tag_name")
      .atwho({
        at: "", 
        tpl: "<li data-value='${atwho-at}${name},'>${name}</li>",
        callbacks: {
          remote_filter: function(query, callback) {
            $.getJSON("/tags.json", {q: query}, function(data) {
              callback(data)
            });
            }
          }
        });

//      $("#search_city")
//      .atwho({
//        at: "", 
//        tpl: "<li data-value='${name}'>${name}</li>",
//        callbacks: {
//          remote_filter: function(query, callback) {
//            $.getJSON("/cities.json", {country: $('#country_search_select').val()}, function(data) {
//              callback(data)
//            });
//            }
//          }
//        });
      

      $("#job_skills_text, #skill_name")
      .atwho({
        at: "", 
        tpl: "<li data-value='${name},'>${name}</li>",
        callbacks: {
          remote_filter: function(query, callback) {
            $.getJSON("/skills.json", {q: query}, function(data) {
              callback(data)
            });
            }
          }
        })


        $("#srch_org")
        .atwho({
          at: "", 
          tpl: "<li data-value='${atwho-at}${name}' class='orgn-data' data='${id}'>${name}</li>",
          callbacks: {
            /*
             It function is given, At.js will invoke it if local filter can not find any data
             @param query [String] matched query
             @param callback [Function] callback to render page.
            */
            remote_filter: function(query, callback) {
              $.getJSON("/organizations.json", {q: query}, function(data) {
                callback(data)
              $('.orgn-data').click(function(){
              
              var org_data = $(this).attr( "data" )
              $.get("/organizations/"+ org_data+ ".js", {}, function(data) {
//                callback(data)
              });              
              });                
              });
            }
          }
        });         



        $("#srch_profile")
        .atwho({
          at: "", 
          tpl: "<li data-value='${atwho-at}${name}' class='profile-data' data='${slug}' ><div class='profile_img_container'><img src=\"${headshot}\"  width=\"50px\" /></div><div class='profile_container'><span class='profile_username'>${name}</span><p class='profile_followers'>${followers} followers</p></div></li>",
          callbacks: {
            /*
             It function is given, At.js will invoke it if local filter can not find any data
             @param query [String] matched query
             @param callback [Function] callback to render page.
            */
            remote_filter: function(query, callback) {
              $.getJSON("/users.json", {q: query}, function(data) {
                callback(data)
              $('.profile-data').click(function(){
                  var user_slug = $(this).attr( "data" );
                  window.location.href = "/users/"+user_slug;
              });
              $('.profile-data').keyup(function(e){
                alert('hh');
//                if (e.keyCode == 13) { 
//                  alert('hello');
//              }
              });
              });
            }
          }
        }); 

      $.getJSON("https://graph.facebook.com/GeniyaNetwork?callback=?", function(data) { 
        $('#facbook_count').html(data.likes) 
      });

      $.getJSON("http://gdata.youtube.com/feeds/api/users/UCaAogg8feczTPSpvcd-T6dg?alt=json", function(data) { 
        $('#subscribe_youtube').html(data['entry']['yt$statistics']['subscriberCount'])
      });      


      $.getJSON("http://query.yahooapis.com/v1/public/yql?q=SELECT%20*%20from%20html%20where%20url=%22http://twitter.com/GeniyaNetwork%22%20AND%20xpath=%22//span[@class=%27ProfileNav-value%27]%22&format=json", function(data) { 
        var count = data['query']['results']['span']
        var new_count = count[1]
        var followers_count = new_count['content']
        $('#twitter_follower').html(followers_count);
      }); 
      
      
      jQuery(".best_in_place").best_in_place();      

      $.datepicker.setDefaults({
        dateFormat: 'yy-mm-dd'
      });

      $('#new_subscription').on('ajax:success',function(data, status, xhr){
        $('#response_subscription').text('Successfully subscribed');
        $('#subscription_email').val('');
        
      }).on('ajax:error',function(xhr, status, error){
        $('#response_subscription').text('Invalid entry');
      });
      
      $('#portfolio_search_trigger').click(function(){
        $('#portfolio_sub_cat_box').toggle()
      })


    //Ajax Modal
    var $modal = $('#ajax-modal');
     
    $('#ajax').on('click', function(){
      // create the backdrop and wait for next modal to be triggered
      $('body').modalmanager('loading');
       
      setTimeout(function(){
        $modal.load('/albums/1', '', function(){
          $modal.modal();
        });
      }, 1000);
    });

     
    $modal.on('click', '.update', function(){
      $modal.modal('loading');
      
      setTimeout(function(){
        $modal
        .modal('loading')
        .find('.modal-body')
        .prepend('<div class="alert alert-info fade in">' +
        'Updated!<button type="button" class="close" data-dismiss="alert">&times;</button>' +
        '</div>');
      }, 1000);
    });


    //Portfolio modal homepage
    var $modal = $('#ajax-portfolio-detail-homepage');
    $('.ajax-portfolio-detail-homepage-modal-trigger .albm-img').on('click', function(){
      album_id = $(this).attr('data')
      // create the backdrop and wait for next modal to be triggered
      $('body').modalmanager('loading');
       
      setTimeout(function(){
        $modal.load('/ajax/portfolio_detail/'+ album_id, '', function(){
          $modal.modal();
        });
      }, 1000);
    });
  };

  $('#header_response_notifications_trigger').click(function(){
    $('#header_response_notifications').html('<img src="/assets/loader.gif" alt="loading" />');
    $.get('/ajax/mark_notifications_as_seen', {}, function(data){
      $('#header_response_notifications').html(data);
    });
  });

  $('#network_response_notifications_trigger').click(function(){
    $('#network_response_notifications').html('<img src="/assets/loader.gif" alt="loading" />');
    $.get('/ajax/mark_network_notifications_as_seen', {}, function(data){
      $('#network_response_notifications').html(data);
    });
  });

  $('#message_response_notifications_trigger').click(function(){
    $('#message_response_notifications').html('<img src="/assets/loader.gif" alt="loading" />');
    $.get('/ajax/mark_message_notifications_as_seen', {}, function(data){
      $('#message_response_notifications').html(data);
    });
  });

   $('.dropdown-menu').click(function(e){
       e.stopPropagation();
   });

  //$("#chat_modal_body").animate({ scrollTop: $("#chat_modal_body")[0].scrollHeight}, 1000);
  $('#event_calendar').fullCalendar({
    header: {
        //left: 'prev,next,today',
        //center: 'title'
        //right: 'month,agendaDay,agendaWeek'
    },
    events: '/events.json',
    eventRender: function (event, element) {
        element.attr('href', 'javascript:void(0);');
        element.attr('onclick', 'open_event_modal("' + event.id + '");');
        element.attr('title', 'By: ' + event.user.name + '\n' + event.title + '\n' + event.start + '\n' + event.end + '\n'  + event.location);
        $(element).html(event.user.name + $(element).html())
    }
  });    

  $('#event_calendar_full').fullCalendar({
    header: {
        //left: 'prev,next,today',
        //center: 'title'
        //right: 'month,agendaDay,agendaWeek'
    },
    events: '/events.json',
    eventRender: function (event, element) {
        element.attr('href', 'javascript:void(0);');
        element.attr('onclick', 'open_event_modal("' + event.id + '");');
        element.attr('title', 'By: ' + event.user.name + '\n' + event.title + '\n' + event.start + '\n' + event.end + '\n'  + event.location);
        if(event.user.headshot.length > 0)
          $(element).html('<img src="'+ event.user.headshot +'" width="30px" height="30px" /> ' + event.user.name + $(element).html())
        else
          $(element).html( event.user.name + $(element).html())
    }
//    title: {
//      month: 'MMM YY', // September 2009
//      week: "MMM D YY", // Sep 13 2009
//      day: 'MMM D YY'  // September 8 2009    
//    }

  });

  $(document).ready(toDoOnload);
  $(document).on('page:load', toDoOnload);
});
