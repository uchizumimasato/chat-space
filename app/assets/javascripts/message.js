$(function() {
  function buildHTML(message) {
    var name       = `<div class="chat-body-name"> ${ message.name } </div>`;
    var created_at = `<div class="chat-body-time"> ${ message.created_at } </div>`;
    var body       = `<div class="chat-body-text"> ${ message.body } </div>`;
    $('.chat-body').append(name, created_at, body);
  }

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
    })
    .fail(function() {
      alert('error');
    });
  });
});
