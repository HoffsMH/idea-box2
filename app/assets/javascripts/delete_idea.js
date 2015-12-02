function delete_idea(button) {
  console.log(button)
  var id = $(button).closest(".idea").attr("id")
  $.ajax({
    url: "api/v1/ideas/" + id,
    method: "delete"
  })
  .then(function(data) {
    $(".idea#" + data.id).remove();
  })
  .fail(function() {
    console.log("fail")
  });
}
