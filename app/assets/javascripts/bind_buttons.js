function bind_buttons() {
  //refresh-button
  $(document).on("click", "#refresh-btn", refresh_ideas )

  //creation and deletion
  $(document).on("click", "#submit-idea-btn", submit_idea )
  $(document).on("click", ".delete-idea-btn", delete_idea )

  //changing idea quality
  $(document).on("click", ".rate-btn-up", upgrade_idea )
  $(document).on("click", ".rate-btn-down", downgrade_idea )

  //filtering
  $(document).on("focusin", "#search", hide_form )
  $(document).on("focusout", "#search", show_results_or_form )

  $(document).on("keyup", "#search", filter_ideas )
  $(document).on("click", ".clear-search-bar", clear_search_bar )
  $(document).on("click", ".search-bar-icon", clear_search_bar )

}
