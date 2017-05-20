$(document).on('turbolinks:load', function(){
  function buildHTML(names) {

    $(names).each(function(i, name) {
      var button = `<div class="button">追加</div>`
      var name   = `<div class="list"> ${ name.name } </div>`;
      $("#lists").append(name)
      $(".button").remove()
      $(".list").append(button)
    })

    $('.list').on('click', function(e) {
      e.preventDefault();
      $(this).removeClass("list")
      $(this).addClass("li")
      var button = $(this).find('.button')
      $(button).removeClass('butonn')
      $(button).addClass('deletebutton')
      var text = button.text('削除')
      var list = $(this)
      $(this).remove()
      $('ol').append(list)
      $('li').append(`<p class="text"></p>`)
    })
  }

  $('.chat-group-form__search').on('keyup', function(e) {
    $(".list").text('')
    $('.list').remove()
    var input = $('.chat-group-form__search').val()
    if (input.length != 0) {
      $.ajax({
          type:        'GET',
          data:        { name: input },
          url:         '/users/search',
          dataType:    'json',
      })
      .done(function(data) {
        buildHTML(data);
      })
      .fail(function() {
        console.log("失敗")
        alert('error');
      })
    };
  });
});
