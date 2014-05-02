jQuery(document).ready(function(){
    jQuery('#followersuser').live('click', function(event) {        
         $('img', this).attr('src', function(i, oldSrc) {
          return oldSrc == '/assets/network_img2.png' ? '/assets/network_img3.png' : '/assets/network_img2.png';
         });
         jQuery('.social_user').toggle('show');
         return false;
    });
    
    jQuery('#followinguser').live('click', function(event) {        
         $('img', this).attr('src', function(i, oldSrc) {
          return oldSrc == '/assets/network_img2.png' ? '/assets/network_img3.png' : '/assets/network_img2.png';
         });         
         jQuery('.socail_share').toggle('show');
         return false;
    });
    
    jQuery('#connecteduser').live('click', function(event) {        
         $('img', this).attr('src', function(i, oldSrc) {
          return oldSrc == '/assets/network_img2.png' ? '/assets/network_img3.png' : '/assets/network_img2.png';
         });         
         jQuery('.connt_user').toggle('show');
         return false;
    });    
    jQuery('.txt').live('click', function(event) {        
         jQuery('.uiMenu').toggle('show');
         return false;
    }); 
    
    jQuery('.uiButtonText').live('click', function(event) {        
         jQuery('.uiMenucover').toggle('show');
         return false;
    });         
//   jQuery('#upload_file_attachment').live('click', function(event)
//   {
//   alert('hello');
//   });  
   
//   $("#upload_file_attachment").change(function (e) {
//    var file, img;
//    if ((file = this.files[0])) {
//        img = new Image();
//        img.onload = function () {
//            alert("Width:" + this.width + "   Height: " + this.height);//this will give you image width and height and you can easily validate here....
//        };
//    }
    

    
    
});







