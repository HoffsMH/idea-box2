function delete_idea(button) {
  var id = $(button).closest(".idea").attr("id")
  console.log(id)
  $.ajax({
    url: "api/v1/ideas/" +
    method: "delete"
  })
}
