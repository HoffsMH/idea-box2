function edit_title_form() {
    var current_value = $(this).html()
    var input_length = current_value.length

    $edit = $("<input type='text' name='title' class='edit-title edit-idea' value='"+ current_value + "'>")
    $(this).html($edit)
    $(this).find("input").focus()
    $(this).find("input")[0].setSelectionRange(input_length, input_length);
}


function edit_body_form() {
    var current_value = $(this).html()
    var input_length = current_value.length

    $edit_form = $("<textarea type='text' name='body' class='materialize-textarea edit-body edit-idea'>"+ current_value+"</textarea>")
    $(this).html($edit_form)
    $(this).find("textarea").focus()
    $(this).find("textarea")[0].setSelectionRange(input_length, input_length);
}

function check_for_enter(event) {
  // https://css-tricks.com/snippets/javascript/javascript-keycodes/
  if ( event.keyCode === 13 ) { $(this).blur()}
}
