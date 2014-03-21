$(function() {
  var toDoOnloadComment;
  toDoOnloadComment = function() {
  //function addEventsToHTML(){
    $('#user_category_id').change(function(){
      $(".sub-category-select").hide();
      $("#sub-category-select-"+this.value).show();
    });

//    var category = document.getElementById('user_category_id');
//    category.onchange = changeHandler;
//      function changeHandler()
//        {

//            
//            
//        }
//     }
//    window.onload = addEventsToHTML;
  
  }
  
  $(document).ready(toDoOnloadComment);
  $(document).on('page:load', toDoOnloadComment);
});

