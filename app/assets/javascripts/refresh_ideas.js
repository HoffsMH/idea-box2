$(document).ready(function () {
  $.getJSON("api/v1/ideas").then(function (data) {
    add_idea();
  })
  $(".rate-btn-down").on("click", function () {
    console.log($(this).closest(".idea").attr("id"));
  })
});
