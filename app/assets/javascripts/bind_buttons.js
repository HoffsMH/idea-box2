function bind_buttons() {
  //creation and deletion
  $(document).on("click", "#submit-idea-btn", function () {submit_idea()})
  $(document).on("click", ".delete-idea-btn", function () {delete_idea(this)})

  //changing idea quality
  $(document).on("click", ".rate-btn-up", function () {upgrade_idea(this)})
  $(document).on("click", ".rate-btn-down", function () {downgrade_idea(this)})

  //filtering
  $(document).on("focusin", "#search", function () {$(".first-content-row").slideUp("fast")})

  $(document).on("focusout", "#search", function () {
     if (!$("#search").val()) {
      show_all_ideas()
      $(".first-content-row").slideDown("fast")
    }
  })

  $(document).on("keyup", "#search", function () {filter_ideas($("#search").val());})

}
