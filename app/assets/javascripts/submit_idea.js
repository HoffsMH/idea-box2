function submit_idea() {
  var title = $("#idea_title").val();
  var body = $("#idea_body").val();
  var tags = $("#idea_tags").val();

  $.ajax({
    method: "post",
    data: {
      idea: {
        title: title,
        body: body,
        tags: tags
      }
    }
  })
  .then(function (data){
    clear_fields();
    add_idea(data, $FIRST_ROW);
  })
  .fail(function (data) {
    var error_text = JSON.parse(data.responseText).errors
    $("#errors-row").html(error_text)
    refresh_ideas();
  })
}
