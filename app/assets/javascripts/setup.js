$(document).ready(function () {
  $("#submit-idea-btn").on("click", function () {submit_idea()})
  $("#delete-idea-btn").on("click", function () {delete_idea(this)})
  $.ajaxSetup({
    url: "api/v1/ideas",
    headers: {
      // you got me:  I got this from stack overflow
      // as I understand it
      // $.ajax doesn't set the authenticity token in the headers of its request
      // by default right here so we are setting it
      // from the meta tags of our document
      'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
    }
  });
  refresh_ideas();

})
const $FIRST_ROW = $(".first-content-row")
