$(document).on('turbolinks:load', function(){          // この記述をすることで、「初回読み込み」「リロード」に加えて「ページ遷移」でもjavascriptが動くようにできる
  // (デフォルトでは、turbolinksのgemにより、「ページ遷移」が非同期通信になり、javascriptが動かない)
// ーーーー メッセージ追加 ＋ スクロール ーーーー
function buildHTML(message) {
var img = message.image ? `<img src=${message.image} >` : "";   // messageのimageが存在すれば、imgタグを代入。なければ何も入れない。
var cont = message.content ? message.content : "";              // messageのcontentが存在すれば、それを代入。なければ何も入れない。
var html = `<li class="message" data-id="${message.id}">
<div class="message__upper-info">
<p class="message__upper-info__talker">${ message.user_name }</p>
<p class="message__upper-info__date">${ message.date }</p>
</div>
<div class="message__text">
${ cont }
</div>
<div class="message__image">
${ img }
</div>
</li>`
return html;
}

// ーーーー スクロール ーーーー
function scroll(){
var position = $('.messages')[0].scrollHeight
$('.messages').animate({
scrollTop: position    // トップが、何px下に動くかを指定
}, 100);
}

$('#new_message').on('submit', function(e){
e.preventDefault();
var message = new FormData(this);
console.log(message);
var url = $(this).attr('action')
$.ajax({
url: url,
type: "POST",
data: message,
dataType: 'json',
processData: false,
contentType: false
})

// ーーーー値がjbuilderを通して返ってきてからの処理ーーーー
.done(function(message){
var html = buildHTML(message);     // 新しいメッセージのhtmlを取得し、40行目でmessagesクラスの中に追加している
$('.messages').append(html);
$('.form__submit').prop('disabled', '');
$('#new_message')[0].reset();
scroll();
})

.fail(function(){
alert('エラーが発生したためメッセージは送信されませんでした。')
$('.form__submit').prop('disabled', '');
})
})


// ーーーー 自動更新 ーーーー
function reloadMessages() {   // 87行目で呼ばれる
// カスタムデータ属性を利用し、ブラウザに表示されている最新メッセージのidを取得
last_message_id = $('.message:last-child').data('id') || 0;     // last_message_idに最新のメッセージを取得する記述を代入したい

$.ajax({
url: 'api/messages',
type: 'get',
dataType: 'json',
data: {id: last_message_id}   // ここではmessageそのものもdataとして送られている？
})

// ーーーー値がjbuilderを通して返ってきてからの処理ーーーー
.done(function(data) {
data.forEach(function(message) {
var html = buildHTML(message)  // buildHTMLメソッドに、最新messagesから一つずつ取り出したmessageを引数として渡す
$('.messages').append(html)     // messages要素に、上記で生成された新規message要素を追加
scroll();
})
})

.fail(function() {
alert('自動更新に失敗しました。')
});
};

if(window.location.href.match(/\/groups\/\d+\/messages/)){
// setInterval(reloadMessages, 5000);
}
});