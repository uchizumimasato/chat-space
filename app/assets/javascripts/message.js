$(function() {
  // メッセージを追加
  function buildHTML(message) {
    var name       = `<div class="chat-body-message__name"> ${ message.name } </div>`;
    var created_at = `<div class="chat-body-message__time"> ${ message.created_at } </div>`;
    var body       = `<div class="chat-body-message__text"> ${ message.body } </div>`;
    var image      = `<div class="chat-body-message__text"> <img src="${ message.image }" class="chat-image"></div>`;
    if (message.image == undefined) {
      $('.chat-body').append(name, created_at, body);
    } else if (message.body == undefined) {
      $('.chat-body').append(name, created_at, image);
    } else {
      $('.chat-body').append(name, created_at, body, image);
    }
  }

  // 自動更新の挙動
  setInterval(update, 1000*10);
  function update(){
    $.ajax({
      type:        'GET',
      data:        { message_id: $('.messages:last').data('id') },
      url:         location.href,
      dataType:    'json',
    })
    .done(function(data) {
      $.each(data, function(i, data){
        buildHTML(data);
      })
    })
    .fail(function() {
      alert('error')
    });
  }

  // ボタンを押すと発火する
  $('#new_message').on('submit', function(e) {
    e.preventDefault();
    var formdata  = new FormData($('#new_message').get(0));
    $('.chat-footer-button').removeAttr('data-disable-with');
    $.ajax({
      type:        'POST',
      data:        formdata,
      url:         location.href,
      dataType:    'json',
      processData: false,
      contentType: false
    })
    .done(function(data) {
      buildHTML(data);
      $('#message_body').val('');
      $('input[type="file"]').val('');
    })
    .fail(function() {
      alert('error');
    });
  });
});
