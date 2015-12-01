function refresh_ideas () {
  $.getJSON("api/v1/ideas").then(function (data) {
    data.forEach(function (idea) {
    add_idea(idea);
    })
  })
  $(".rate-btn-down").on("click", function () {
    console.log($(this).closest(".idea").attr("id"));
  })
}
