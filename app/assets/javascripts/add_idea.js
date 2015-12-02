function add_idea(idea_data, row) {
  idea_data.body = trim_body(idea_data.body)
  console.log(idea_data)
  idea_template().done(function (data) {
    row.after(_.template(data)(idea_data));
  })
}
