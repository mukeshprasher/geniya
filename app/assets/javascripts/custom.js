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

    $('textarea').atwho({
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
            
            users =new Array();
            data.forEach(function(user) {
                user.name = user.name.split(' ').join('_')
                users.push(user)
                //$('textarea').atwho({at:":", 'data':names});
            });
            //console.log(names)
            callback(users)
          });
        }
      }
    });

  };

  $(document).ready(toDoOnload);
  $(document).on('page:load', toDoOnload);
});
