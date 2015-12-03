function delete_idea() {
  var id = $(this).closest(".idea").attr("id")
  var num = id.replace("idea-", "");
  $.ajax({
    url: "api/v1/ideas/" + num,
    method: "delete"
  })
  .then(function(data) {
    $(".idea#" + "idea-" + data.id).slideUp("fast", function(){$(this).remove()})
  })
  .fail(function() {
    console.log("fail")
  });
}
