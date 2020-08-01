$(function() {
  $(".search-input").on("keyup", function() {
    var input = $(".search-input").val(); //キーを離したら処理する
    $.ajax({
      type: 'GET',                       //HTTPメソッドはGET
      url: '/public/songs/search',    //rails routesで確認
      data: { keyword: input },
      dataType: 'json'
    })
     .done(function(songs) {
     $(".contents").empty();
 
      if (songs.length !== 0) {         //musicの数が0でない時
        songs.forEach(function(song){ //forEachメソッド
          appendSong(song);
        });
      }
      else {
        appendErrMsgToHTML("一致する楽曲がありません");
      }
    })
    .fail(function() {                   //error時のaleart実装
      alert('error');
    });
  });
});

  var search_list = $(".contents.row");
  function appendSong(song) {
    var html = `<div><span style="font-size: 100px; color: red;">${song.name}</span></div>`
    $(".contents").append(html);
  }
  function appendErrMsgToHTML(msg) {
    var html = `<div class='name'>${ msg }</div>`
    search_list.append(html);
  }