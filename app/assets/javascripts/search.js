$(function() {
  $(".search-input").on("keyup", function() {
    var input = $(".search-input").val(); //キーを離したら処理する
    $.ajax({
      type: 'GET',                       //HTTPメソッドはGET
      url: '/front/artists/search',    //rails routesで確認
      data: { keyword: input },
      dataType: 'json'
    })
     .done(function(artists) {
     $(".contents").empty();
 
      if (artists.length !== 0) {         //artistsの数が0でない時、
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

    var html = `
      <div style="padding: 15px; margin: 15px 0 0 0; background: linear-gradient(90deg, rgba(22, 135, 237, 0.6), rgba(20, 55, 90, 0.9));">
        <div class="flex">
          <div><img src="${artist.image_id}"></div>
          <div>
            <span style="font-size: 30px;">
              <a href="/front/artists/${artist.id}" style="color: gold; text-decoration: none;">${artist.name}</a>
            </span>
            <br><br>
            <span style="color: white;">${artist.detail}</span>
          </div>
        </div>
      </div>
    `

    $(".contents").append(html);
  }

  function appendErrMsgToHTML(msg) {
    var html = `<div class='name'>${ msg }</div>`
    search_list.append(html);
  }