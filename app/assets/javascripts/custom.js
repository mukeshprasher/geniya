    var emojis = ["smile", "iphone", "girl", "smiley", "heart", "kiss", "copyright", "coffee", "a", "ab", "airplane", "alien", "ambulance", "angel", "anger", "angry", "arrow_forward", "arrow_left", "arrow_lower_left", "arrow_lower_right", "arrow_right", "arrow_up", "arrow_upper_left", "arrow_upper_right", "art", "astonished", "atm", "b", "baby", "baby_chick", "baby_symbol", "balloon", "bamboo", "bank", "barber", "baseball", "basketball", "bath", "bear", "beer", "beers", "beginner", "bell", "bento", "bike", "bikini", "bird", "birthday", "blue_car", "blue_heart", "blush", "boar", "boat", "bomb", "book", "boot", "bouquet", "bow", "bowtie", "boy", "bread", "briefcase", "broken_heart", "bug", "bulb", "person_with_blond_hair", "phone", "pig", "pill", "pisces", "point_down", "point_left", "point_right", "point_up", "point_up_2", "police_car", "poop", "post_office", "postbox", "pray", "princess", "punch", "purple_heart", "question", "rabbit", "racehorse", "radio", "up", "us", "v", "vhs", "vibration_mode", "virgo", "vs", "walking", "warning", "watermelon", "wave", "wc", "wedding", "whale", "wheelchair", "wind_chime", "wink", "wolf", "woman", "womans_hat", "womens", "x", "yellow_heart", "zap", "zzz", "+1", "-1", "mooning", "finger", "swear", "rock", "smoking", "drunk", "poolparty", "toivo", "bandit", "headbang", "dont_know", "not_listening", "cow", "puppy", "monkey", "chicken", "red_rose", "pumpkin", "bigsmile", "brokenheart", "cake", "call", "cash", "clapping", "cool", "crying", "dance", "devil", "doh", "drink", "dull", "emo", "envy", "evilgrin", "flower", "fubar", "giggle", "handshake", "happy", "heidy", "hi", "inlove", "itwasntme", "lipssealed", "mail", "makeup", "middlefinger", "mmm", "movie", "muscle", "music", "nerd", "ninja", "no", "nod", "party", "pizza", "puke", "rain", "rofl", "sadsmile", "shake", "skype", "sleepy", "smirk", "smoke", "speechless", "star", "sun", "sweating", "talking", "thinking", "time", "tmi", "tongueout", "wait", "whew", "wondering", "worried", "yawn", "yes"]
    
    var emojis_list = $.map(emojis, function(value, i) {
      return {'id':i, 'name':value};
    });

function open_smiley(id){
  
  $('#'+ id )
  .atwho({
    at: ":", 
    tpl: "<li data-value=':${name}:'><img src='/assets/smileys/${name}.png' height='20' width='20'/> ${name} </li>",
    data: emojis_list
  })
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

  
}





function open_album_modal(album_id){

  var $modal3 = $('#ajax-portfolio-detail-homepage');
  // create the backdrop and wait for next modal to be triggered

  $('body').modalmanager('loading');
   
  setTimeout(function(){
    $modal3.load('/ajax/portfolio_detail/'+ album_id, '', function(){
      $modal3.modal();
      //$modal3.append("<span type='button' data-dismiss='modal' class='album_model_close'>Close</span>");
      $('.album_model_close').show();
    });
  }, 1000);
}

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
 function mu()
 {
 console.log('dsf')
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


//    var tag= ["Bold","Beautiful","Awesome","Understanding","unique","Loving","Abstract","Nature","Complex","Socialate"]
//    
//    var tag_list = $.map(tag, function(value, i) {
//      return {'id':i, 'name':value};
//    });    





    $('.smiley')
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
              $('#loading_img_for_srhorgn').show(); 
              $.getJSON("/organizations.json", {q: query}, function(data) {
                callback(data)
              $('.orgn-data').click(function(){
              $('#loading_img_for_srhorgn').show();  
              var org_data = $(this).attr( "data" )
              $.get("/organizations/"+ org_data+ ".js", {}, function(data) {
//                callback(data)
              });              
              }); 
              
              $('#srch_org').keydown(function(event) {
               if (event.keyCode == 13){
                $('#loading_img_for_srhorgn').show(); 
                 var org_data = $('.orgn-data.cur').attr( "data" );
              $.get("/organizations/"+ org_data+ ".js", {}, function(data) {
//                callback(data)
              });  
               
               }
              });
              
                            
              
                             
              });
            }
          }
        });         



        $("#srch_profile")
        .atwho({
          at: "", 
          tpl: "<li data-value='${slug}' class='profile-data' data='${slug}' onkeypress='mu()'><div class='profile_img_container'><img src=\"${headshot}\"  width=\"50px\" /></div><div class='profile_container'><span class='profile_username'>${name}</span><p class='profile_followers'>${followers} followers</p></div></li>",
          callbacks: {
            /*
             It function is given, At.js will invoke it if local filter can not find any data
             @param query [String] matched query
             @param callback [Function] callback to render page.
            */
            remote_filter: function(query, callback) {
               $.getJSON("/users.json", {q: $("#srch_profile").val()}, function(data) {
                callback(data)
              $('.profile-data').click(function(){
                  var user_slug = $(this).attr( "data" );
                  window.location.href = "/users/"+user_slug;
              });
              $('#srch_profile').keydown(function(event) {
               if (event.keyCode == 13){
                 var user_slug = $('.profile-data.cur').attr( "data" );
                 var srch_txt = $('#srch_profile').val();
                 var complete_txt = $.trim(srch_txt);
                 if (user_slug == complete_txt)
                 {
                    window.location.href = "/users/"+user_slug;
                 }
                 else
                 {
                  $('#no_srch_content').show('slow');
                  event.stopPropagation();
                 }
               }
              });
              
              
              $('#profile-srch-btn').click(function(event) {
                 var user_slug = $('.profile-data.cur').attr( "data" );
                 var srch_txt = $('#srch_profile').val();
                 var complete_txt = $.trim(srch_txt);
                 if (user_slug == complete_txt)
                 {
                    window.location.href = "/users/"+user_slug;
                 }
                 else
                 {
                  $('#no_srch_content').show('slow');
                  event.stopPropagation();
                 }
              });                  
              });
            }
          }
        }); 


        $("#srch_job").keyup(function(){
              var srch_val =  $(this).val();
              if(srch_val!='')
              {

               $.getJSON("/jobs.json", {q: $("#srch_job").val()}, function(data) {
                //alert(data[0].title);
                //$('#srch_container').show('slow');    
                //$('#srch_container').html('<ul><li >dsdf</li></ul>')
                var html = "";

                for (var i = 0; i < data.length; i++) {
                    $('#srch_container').show('slow');
                    html += "<a href="+"/jobs/"+data[i].id+">";
                    html += "<li>";
                    html += "<div class='jb_img_container'>";
                    html += "<img src="+data[i].image_url+" width='50px' />";
                    html += "</div>";
                    html += "<div class='jb_detail_container'><span class='profile_username'>"+data[i].title+"</span><p>"+data[i].category+"</p><p>Job</p></div>";                    
                    html += "</li>";
                    html += "</a>";
                    //alert(data[i].title);
                } 
              $('#atwho-ground-srch_job ul').show('slow');    
                $('#atwho-ground-srch_job ul').html(html);

              });
               $.getJSON("/advertisements.json", {q: $("#srch_job").val()}, function(data) {
                //alert(data[0].title);
                //$('#srch_container').show('slow');    
                //$('#srch_container').html('<ul><li >dsdf</li></ul>')
                var html = "";

                for (var i = 0; i < data.length; i++) {
                    $('#srch_container').show('slow');
                    html += "<a href="+"/advertisements/"+data[i].id+">";
                    html += "<li>";
                    html += "<div class='jb_img_container'>";
                    html += "<img src="+data[i].image_url+" width='50px' />";
                    html += "</div>";
                    html += "<div class='jb_detail_container'><span class='profile_username'>"+data[i].title+"</span><p>"+data[i].category+"</p><p>Advertisement</p></div>";                    
                    html += "</li>";
                    html += "</a>";
                    //alert(data[i].title);
                } 
              $('#atwho-ground-srch_job ul').show('slow');    
                $('#atwho-ground-srch_job ul').append(html);

              });              
              }
              else
              {

                $('#srch_container').hide('slow');           
              }
          

 
        }); 

        $(function() {
            $(document).on('click', function(e) {
             $('#atwho-ground-srch_job ul').hide('slow');
            })
        });
        

/////////// Validation For Email existance in database    
        $('#user_email').blur(function(){
          $('#user_form_email_error').css('display','none');
          var srch_email =  $(this).val();
          var re = /[A-Z0-9._%+-]+@[A-Z0-9.-]+.[A-Z]{2,4}/igm;
          $.getJSON("/members/get_user.json", {q: srch_email}, function(data) {
            if(data == null)
            {
              if(srch_email=="")
              {
                $('#user_email').css('border','1px solid #CCCCCC');
                $('#user_form_email_img').css('display','none');
                $('#user_form_email_error').css('display','none');
              }
              else if(!re.test(srch_email))
              {
                $('#user_email').css('border','1px solid red');
                $('#user_form_email_img').css('display','none');
                $('#user_form_email_error').css('display','none');              
              }
              else
              {
                $('#user_email').css('border','1px solid #CCCCCC');
                $('#user_form_email_img').css('display','block');
                $('#user_form_email_error').css('display','none');              
              
              }
            }
            else
            {
              $('#user_email').val('');
              $('#user_email').css('border','1px solid #CCCCCC');
              $('#user_form_email_img').css('display','none');
              $('#user_form_email_error').css('display','block');
            }
          });
        });
      $('#user_email').click(function(){
        $('#user_email').css('border','none');
        $('#user_form_email_img').css('display','none');
        $('#user_form_email_error').css('display','none');      
      });

/////////// Validation For Username existance in database    

        $('#user_username').blur(function(){
          $('#user_form_username_error').css('display','none');
          var srch_email =  $(this).val();
          
          $.getJSON("/members/get_username.json", {q: srch_email}, function(data) {
            if(data == null)
            {
              if(srch_email=="")
              {
                $('#user_form_username_img').css('display','none');
                $('#user_form_username_error').css('display','none');
              }
              else
              {
                $('#user_form_username_img').css('display','block');
                $('#user_form_username_error').css('display','none');              
              
              }
            }
            else
            {
              $('#user_username').val('');
              $('#user_form_username_img').css('display','none');
              $('#user_form_username_error').css('display','block');
            }
          });
        });
      $('#user_username').click(function(){
        $('#user_form_username_img').css('display','none');
        $('#user_form_username_error').css('display','none');      
      });


/////////// Validation For Category existance in database    
        $('#work_cat #user_category_id').blur(function(){
          $('#user_form_work_area_error').css('display','none');
          var srch_category =  $(this).val();
          $.getJSON("/members/get_cat.json", {q: srch_category}, function(data) {

            if(data.length == 0)
            {
              if(srch_category=="")
              {
                $('#work_cat #user_category_id').css('border','1px solid #CCCCCC');
                $('#user_form_work_area_img').css('display','none');
                $('#user_form_work_area_error').css('display','none');
              }
              else
              {
                $('#work_cat #user_category_id').css('border','1px solid #CCCCCC');
                
                 $('#user_form_work_area_img').css('display','block');
                $('#user_form_work_area_error').css('display','none');              
              
              }
            }
            else
            {
              $('#work_cat #user_category_id').css('border','1px solid #CCCCCC');
              $('#work_cat #user_category_id').val('');
              $('#user_form_work_area_img').css('display','none');
              $('#user_form_work_area_error').css('display','block');
            }
          });
        });
      $('#work_cat #user_category_id').click(function(){
       $('#work_cat #user_category_id').css('border','none');
        $('#user_form_work_area_img').css('display','none');
        $('#user_form_work_area_error').css('display','none');      
      });

//// append a option value in work area

      $("#user_category_id").append('<option value="no">Others</option>'); 
      
      $("#user_category_id").on('change', function() {
        var dropdown_value = this.value;
          $('#user_form_work_area_img').css('display','none');
          $('#user_form_work_area_error').css('display','none');
        if(dropdown_value == 'no')
        {
          $('#work_cat').show();
          $('#select_proff').css('display','none');
          $('#text_proff').css('display','block');
          $('#work_cat #user_category_id').val(''); 
          $('#text_proff #user_sub_category_id').val('');           
        }
        else
        {
          var ss = $("#user_category_id option:selected").val();
          var dd = $("#select_proff #user_sub_category_id option:selected").val();
          $('#work_cat').css('display','none');
          $('#select_proff').css('display','block');
          $('#text_proff').css('display','none');        
          $('#work_cat #user_category_id').val(ss); 

        }
      });               

    $("#user_category_id").blur(function(){
      var dd = $("#select_proff #user_sub_category_id option:selected").val();
          $('#text_proff #user_sub_category_id').val(dd); 
    });

    $("#user_sub_category_id").blur(function(){
      var dd = $("#select_proff #user_sub_category_id option:selected").val();
          $('#text_proff #user_sub_category_id').val(dd); 
    });


//////////// function for the registration for submission

      $("#new_user").submit(function(){
      var work_field = $("#work_cat #user_category_id").val();
      var prf_field = $("#text_proff #user_sub_category_id").val();
      var email_field = $("#reg_email_container #user_email").val();   
      var username_field = $("#reg_username_container #user_username").val();   
      var pass_field = $("#user_password").val();  
      var confirm_pass_field = $("#user_password_confirmation").val(); 
      var re = /[A-Z0-9._%+-]+@[A-Z0-9.-]+.[A-Z]{2,4}/igm;
      if( work_field == "")
      {
        alert('Enter New Work Category');
        return false;
      }    
      else if( prf_field == "")
      {
        alert('Enter New Profession');
        return false;
      }
      else if( email_field == "")
      {
        alert('Enter complete email address');
        return false;
      } 
      else if(!re.test(email_field))
      {
        alert('Enter valid email address');
        return false;
      }       
      else if( username_field == "")
      {
        alert('Enter your username');
        return false;
      } 
      else if( pass_field == "")
      {
        alert('Enter your password');
        return false;
      } 
      else if( confirm_pass_field == "")
      {
        alert('Enter your confirm password');
        return false;
      } 
      else if( pass_field != confirm_pass_field)
      {
        alert('Password is not match with confirm password');
        return false;
      }                                     
      else
      {
        return true;
      
      }
                
      });


///////// function for categories dropdown_value

        $(function() {
            $(document).ready(function(e) {
              var ss = $("#user_category_id option:selected").val();
              var dd = $("#select_proff #user_sub_category_id option:selected").val();
                  $("#work_cat #user_category_id").val(ss);
                  $("#text_proff #user_sub_category_id").val(dd);              
            })
        });



      $.getJSON("https://graph.facebook.com/GeniyaNetwork?callback=?", function(data) { 
        $('#facbook_count').html(data.likes) 
      });

      $.getJSON("http://gdata.youtube.com/feeds/api/users/UCaAogg8feczTPSpvcd-T6dg?alt=json", function(data) { 
        $('#subscribe_youtube').html(data['entry']['yt$statistics']['subscriberCount'])
      });      


      $.getJSON("http://query.yahooapis.com/v1/public/yql?q=SELECT%20*%20from%20html%20where%20url=%22http://twitter.com/GeniyaNetwork%22%20AND%20xpath=%22//span[@class=%27ProfileNav-value%27]%22&format=json", function(data) { 
        var count = data['query']['results']['span']
        var new_count = count[2]
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

    //Ajax Modal
    //var $chat_all_modal = $('#chat_all_modal');
     
    $('#chat_all_trigger').on('click', function(){
      $(this).hide();
      $('#chat_all_cont').show();
      $.get('/conversations', {}, function(data){
        $('#chat_all_body').html(data);
      });   
    });

    $('#chat_box_head').on('click', function(){
      $('#chat_all_cont').hide();
      $('#chat_all_trigger').show();
      $.get('/conversations', {}, function(data){
        $('#chat_all_body').html(data);
      });   
    });

//    $('#header_wrapper li').on("keydown", function () {
//      alert("hh")
////      if (event.keyCode == 13) { 
////        alert('hello');
////    }
//    }); 
     
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
//    var $modal = $('#ajax-portfolio-detail-homepage');
//    $('.ajax-portfolio-detail-homepage-modal-trigger .albm-img').on('click', function(){
//      album_id = $(this).attr('data')
//      // create the backdrop and wait for next modal to be triggered
//      $('body').modalmanager('loading');
//       
//      setTimeout(function(){
//        $modal.load('/ajax/portfolio_detail/'+ album_id, '', function(){
//          $modal.modal();
//        });
//      }, 1000);
//    });
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


  $("#form_category_id").change(function() {
    return $.get("/categories/" + $(this).val() + ".json", function(jsonObjCategory) {
      var sub_category_options;
      sub_category_options = "";
      $.each(jsonObjCategory.sub_category_groups, function(key, sub_category_group) {
        sub_category_options += '<optgroup label="' + sub_category_group.name + '" >';
        $.each(sub_category_group.sub_categories, function(key_c, sub_category) {
          if (key === 0 && key_c === 0) {
            return sub_category_options += '<option value="' + sub_category.id + '" seleted="selected">' + sub_category.name + '</option>';
          } else {
            return sub_category_options += '<option value="' + sub_category.id + '">' + sub_category.name + '</option>';
          }
        });
        return sub_category_options += "</optgroup>";
      });
      return $("#form_sub_category_id").html(sub_category_options);
    });
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
          $(element).html('<img class="event_user_img" src="'+ event.user.headshot +'" width="30px" height="30px" /> ' + event.user.name + $(element).html())
        else
          $(element).html( event.user.name + $(element).html())
    }
//    title: {
//      month: 'MMM YY', // September 2009
//      week: "MMM D YY", // Sep 13 2009
//      day: 'MMM D YY'  // September 8 2009    
//    }

  });


  function supports_input_placeholder() {
          var i = document.createElement('input');
          return 'placeholder' in i;
      }

  if (!supports_input_placeholder()) {
      var fields = document.getElementsByTagName('INPUT');
      for (var i = 0; i < fields.length; i++) {
          if (fields[i].hasAttribute('placeholder')) {
              fields[i].defaultValue = fields[i].getAttribute('placeholder');
              fields[i].onfocus = function () { if (this.value == this.defaultValue) this.value = ''; }
              fields[i].onblur = function () { if (this.value == '') this.value = this.defaultValue; }
          }
      }
  }  
  

  $(document).ready(toDoOnload);
  $(document).on('page:load', toDoOnload);
});
