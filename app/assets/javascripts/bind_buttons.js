function bind_buttons() {
  //creation and deletion
  $(document).on("click", "#submit-idea-btn", function () {submit_idea()})
  $(document).on("click", ".delete-idea-btn", function () {delete_idea(this)})

  //changing idea quality
  $(document).on("click", ".rate-btn-up", function () {upgrade_idea(this)})
  $(document).on("click", ".rate-btn-down", function () {downgrade_idea(this)})
}
