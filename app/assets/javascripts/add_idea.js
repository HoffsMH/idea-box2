function add_idea(idea_data, row) {
    idea_template().done(function (data) {
    row.after(_.template(data)(idea_data))
  })
}
