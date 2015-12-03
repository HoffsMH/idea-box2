function downgrade_idea() {
  var id = $(this).closest(".idea").attr("id")
  var idea_id = id.replace("idea-", "");
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
