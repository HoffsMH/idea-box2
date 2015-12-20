function refresh_ideas () {
  $.getJSON("api/v1/ideas").then(function (data) {
    $FIRST_ROW.nextAll().remove()
    data.forEach(function (idea) {
    add_idea(idea, $FIRST_ROW);
    })
  })
  $(".rate-btn-down").on("click", function () {
    console.log($(this).closest(".idea").attr("id"));
  })
}
