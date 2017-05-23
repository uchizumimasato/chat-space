$(document).on('turbolinks:load', function() {
  function buildHTML(names) {

    // インクリメンタルサーチを動かす
    $(names).each(function(i, name) {
      var list = `<div class="list">
                    ${ name.name }
                    <div class="button button${i}" data_user_name = "${ name.name }" data_user_id = "${ name.id }">
                      追加
                    </div>
                  </div>`
      $("#lists").append(list)
        addButton(i, name, list);
    })

    // 追加ボタンが押されたときの挙動
    function addButton(i, name, list) {
      $(`.button${i}`).on('click', function(e) {
        e.preventDefault();
        var parent = $(this).parent()
        $(parent).remove()
        var member = `<div class="member">
                      ${ name.name }
                      <div class="delete_button button${i}" data_user_name = "${ name.name }" data_user_id = "${ name.id }">
                        削除
                      </div>
                      <input type="hidden" name="group[user_ids][]" value="${name.id}">
                    </div>`
          $('.ol').append(member)
          removeButton(i, name, list);
      })
    }

    // 削除ボタンが押されたときの挙動
    function removeButton(i, name, list) {
      $(`.button${i}`).on('click', function(e) {
        e.preventDefault();
        $('#lists').append(list)
        var parent = $(this).parent()
        $(parent).remove()
        addButton(i, name);
      })
    }

  }

  // 非同期通信を発火させる
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
      .done(function(data, da) {
        buildHTML(data);
      })
      .fail(function() {
        console.log("失敗")
        alert('error');
      })
    };
  });

});
