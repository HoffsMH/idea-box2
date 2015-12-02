function trim_body (body) {
  char_count = body.split("").length;
  if (char_count > 100) {
    var index = 100;
    var last_char;
    while (last_char !== " " && index  < char_count ) {
      last_char = body.charAt(index);
      index += 1;
    }
    body = body.substring(0, index).concat(" ...");
  }

  return body
}
