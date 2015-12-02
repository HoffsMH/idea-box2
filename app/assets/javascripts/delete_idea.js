function delete_idea(button) {
  var id = $(button).closest(".idea").attr("id")
  var num = id.replace("idea-", "");
  $.ajax({
    url: "api/v1/ideas/" + num,
    method: "delete"
  })
  .then(function(data) {
    $(".idea#" + "idea-" + data.id).remove();
  })
  .fail(function() {
    console.log("fail")
  });
}
