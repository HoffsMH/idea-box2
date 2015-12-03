function update_body() {
  var id = $(this).closest(".idea").attr("id")
  var idea_id = id.replace("idea-", "")
  var new_value = $(this).val()

  $(this).replaceWith(new_progress_bar())
  $.ajax({
    url: "api/v1/ideas/" + idea_id,
    method: "patch",
    data: {
            body: new_value
          }
  })
  .then(function(data) {
    progressbar().replaceWith(data.body)
  })
  .fail(function() {
    console.log("fail")
  });
}

function new_progress_bar() {
  return $("<div class='progress body-progress'> <div class='indeterminate'></div> </div>")
}

function progressbar() {
  return $(".progress.body-progress")
}
