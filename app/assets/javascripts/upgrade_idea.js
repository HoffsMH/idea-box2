function upgrade_idea(button) {
  var id = $(button).closest(".idea").attr("id")
  $.ajax({
    url: "api/v1/ideas/" + id,
    method: "patch",
    data: "up"
  })
  .then(function(data) {
    $(".idea#" + data.id + " .quality").html(data.quality)
  })
  .fail(function() {
    console.log("fail")
  });
}
