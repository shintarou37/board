$(function(){
  var url = location.href ;
  if (url === "http://3.131.108.243/collects/new"){
    $('.test').on('click', function() {
      $('.search_hidden').show()
    });
 };
});