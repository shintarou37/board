$(function(){
  var url = location.href ;
  if (url === "http://localhost:3000/collects/new"){
    // http://3.131.108.243/collects/new(本番環境)
    $('.test').on('click', function() {
      $('.search_hidden').show()
    });
 };
});