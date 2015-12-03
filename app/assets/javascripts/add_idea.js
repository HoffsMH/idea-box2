function add_idea(idea_data, row) {
  idea_data.body = trim_body(idea_data.body)

  idea_template()
  .done(function (data) {
    $idea = $(_.template(data)(idea_data))
    row.after($idea).hide().slideDown("fast");
  })
}
