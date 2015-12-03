function filter_ideas(value) {
  value = $(this).val().toUpperCase()
  if (value) {
    hide_all_ideas()
    matched_ideas(value).show();
  } else {
    show_all_ideas()
  }
}

function show_all_ideas() {
  $(".idea").show()
}

function hide_all_ideas() {
  $(".idea").hide()
}

function matched_ideas(value) {
  return $(".idea").filter(function (index) {
    content  = $(this).find(".body-content").html().toUpperCase();
    return content.includes(value)
  })
}
