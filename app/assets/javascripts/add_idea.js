function add_idea(idea_data, $first_row) {
    idea_template().done(function (data) {
    $first_row.after(_.template(data)(idea_data))
  })
}
