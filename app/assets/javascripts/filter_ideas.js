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
    body_content  = $(this).find(".body-content").html().toUpperCase();
    title_content  = $(this).find(".title-content").html().toUpperCase();
    return body_content.includes(value) || title_content.includes(value)
  })
}
