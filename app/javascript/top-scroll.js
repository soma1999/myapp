// $(document).on('turbolinks:load', function() {
//   $('.famous-index').jscroll({
//     // 無限に追加する要素は、どこに入れる？
//     contentSelector: '.famous-index', 
//     // 次のページにいくためのリンクの場所は？ ＞aタグの指定
//     nextSelector: 'a.next',
//     // 読み込み中の表示はどうする？
//     loadingHtml: '読み込み中'
//   });
// });

// $(document).on("turbolinks:load", function() {
//   if ($("nav.pagination a[rel=next]").length){
//     $('.famous-index').infiniteScroll({
//     path: "nav.pagination a[rel=next]"
//     append: ".celebs-lists"
//     history: false
//     prefill: true
//     status: '.page-load-status'
//   })}
// })