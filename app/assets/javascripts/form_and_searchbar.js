function hide_form() {
  $(".first-content-row").slideUp("fast")
}

function show_results_or_form() {
  if (!$("#search").val()) {
   show_all_ideas()
   $(".first-content-row").slideDown("fast")
   $(".search-bar-icon").html("search")

 } else {
    $(".search-bar-icon").html("clear")
 }
}

function clear_search_bar() {
  $("#search").val("")
  $("#search").blur()
}
