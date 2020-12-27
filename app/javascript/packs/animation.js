$(function(){
  var url = location.href ;
  if (url === "http://localhost:3000/"){
    // "http://3.131.108.243/"("本番環境")
    $(".typed").fadeIn(2700);
  };
});