function add_idea(idea_data) {
    idea_template().done(function (data) {
    $(".first-content-row").append(_.template(data)(idea_data))
  })
}
