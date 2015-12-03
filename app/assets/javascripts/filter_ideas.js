function filter_ideas(value) {
    if (value) {
      hide_all_ideas()
      // console.log($(".idea .title-content:contains('" + value + "')").closest(".idea"))
      // console.log($(".idea .body-content:contains('" + value + "')").closest(".idea").show())
      matched_ideas = $(".idea").filter(function (index) {
        content  = $(this).find(".body-content").html().toUpperCase();
        value = value.toUpperCase();
        return content.includes(value)
      })
      matched_ideas.show();
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
