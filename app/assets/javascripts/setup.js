const $FIRST_ROW = $(".first-content-row")

$(document).ready(function () {
  $.ajaxSetup({
    url: "api/v1/ideas",
    headers: {
      // you got me :(  I got this from stack overflow
      // as I understand it
      // $.ajax doesn't set the authenticity token in the headers of its request by default
      // so we are setting it
      // from the meta tags of our document
      // we need this in out headers
      // or rails believes its under a cross site request forgery attack
      'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
    }
  });
  refresh_ideas();
  bind_buttons();

})
