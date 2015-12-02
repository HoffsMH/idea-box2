function downgrade_idea(button) {
  var id = $(button).closest(".idea").attr("id")
  var idea_id = id.replace("idea-", "");
  console.log(idea_id)
  $.ajax({
    url: "api/v1/ideas/" + idea_id,
    method: "patch",
    data: {
            direction: "down"
          }
  })
  .then(function(data) {
    $(".idea#" + "idea-" + data.id + " .quality").html(data.quality)
  })
  .fail(function() {
    console.log("fail")
  });
}
