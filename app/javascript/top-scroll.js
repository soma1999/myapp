import InfiniteScroll from "infinite-scroll"
$(document).on("turbolinks:load", function() {
  if ($(".pagination a[rel=next]").length){
    new InfiniteScroll( '.famous-index', {
    path: ".pagination a[rel=next]",
    append: ".celebs-lists",
    history: false,
    prefill: true,
    status: '.page-load-status'
    
  })
}});
