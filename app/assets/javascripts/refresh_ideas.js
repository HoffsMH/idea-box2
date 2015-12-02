function refresh_ideas () {
  $.getJSON("api/v1/ideas").then(function (data) {
    $first_row = $(".first-content-row")
    data.forEach(function (idea) {
    add_idea(idea, $first_row);
    })
  })
  $(".rate-btn-down").on("click", function () {
    console.log($(this).closest(".idea").attr("id"));
  })
}
