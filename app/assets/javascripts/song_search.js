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
     $(".content2s").empty();
 
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

  var search_list = $(".content2s.row");
  function appendSong(song) {

    var html = `
      <div style="padding: 15px; margin: 15px 0 0 0; background: linear-gradient(90deg, rgba(22, 135, 237, 0.6), rgba(20, 55, 90, 0.9));">
        <div class="flex">
          <div><img src="${song.image_id}"></div>
          <div>
            <span style="font-size: 30px;">
              <a href="/public/songs/${song.id}" style="color: gold; text-decoration: none;">${song.name}</a>
              (${song.sale_year})
            </span>
            <br><br>
            <span style="color: white;">${song.detail}</span>
          </div>
        </div>
      </div>
    `

    $(".content2s").append(html);
  }

  function appendErrMsgToHTML(msg) {
    var html = `<div class='name'>${ msg }</div>`
    search_list.append(html);
  }