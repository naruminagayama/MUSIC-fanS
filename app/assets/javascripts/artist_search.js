$(function() {
  $(".artistsearch_input").on("keyup", function() {
    var input = $(".artistsearch_input").val(); //キーを離したら処理する
    $.ajax({
      type: 'GET',                       //HTTPメソッドはGET
      url: '/public/artists/search',    //rails routesで確認
      data: { keyword: input },
      dataType: 'json'
    })
     .done(function(artists) {
     $(".contents").empty();
 
      if (artists.length !== 0) {         //artistsの数が0でない時
        artists.forEach(function(artist){ //forEachメソッド
          appendArtist(artist);
        });
      }
      else {
        appendErrMsgToHTML("一致するアーティストがありません");
      }
    })
    .fail(function() {                   //error時のaleart実装
      alert('error');
    });
  });
});

  var search_list = $(".contents.row");
  function appendArtist(artist) {
    var html = `<div><span style="font-size: 100px; color: red;">${artist.name}</span></div>`
    $(".contents").append(html);
  }
  function appendErrMsgToHTML(msg) {
    var html = `<div class='name'>${ msg }</div>`
    search_list.append(html);
  }