function idea_template() {
    return $.ajax({
    url: "idea_template.html.erb",
    success: function (data) {
      return data
    },
    fail: function (data) {
      return "failed to retrieve template"
    }
  })
};
