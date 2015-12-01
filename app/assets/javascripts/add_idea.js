function add_idea(idea_data) {
  idea_data = {
    "name": "poop",
    "login": "hi"
  }
    $(".first-content-row").append(_.template('Hello <%= name %> (logins: <%= login.length %>)')(idea_data))
}
