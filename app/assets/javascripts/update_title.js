function update_title() {
  var id = $(this).closest(".idea").attr("id")
  var idea_id = id.replace("idea-", "")
  var new_value = $(this).val()

  $(this).replaceWith(new_progress_bar())
  $.ajax({
    url: "api/v1/ideas/" + idea_id,
    method: "patch",
    data: {
            title: new_value
          }
  })
  .then(function(data) {
    progressbar().replaceWith(data.title)
  })
  .fail(function() {
    progressbar().replaceWith(data.title)
  });
}

function new_progress_bar() {
  return $("<div class='progress title-progress'> <div class='indeterminate'></div> </div>")
}

function progressbar() {
  return $(".progress.title-progress")
}
