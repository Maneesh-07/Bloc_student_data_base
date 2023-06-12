
String ErrorCheck(List data) {
  String field = "";
  
  if (data[0].isEmpty &&
      data[1].isEmpty &&
      data[2].isEmpty &&
      data[3].isEmpty) {
    field = "Every field";
    return field;
  } else if (data[0].isEmpty) {
    return field = "name";
  } else if (data[1].isEmpty) {
    return field = "Age";
  } else if (data[2].isEmpty) {
    return field = "Number";
  } else if (data[3].isEmpty) {
    return field = "Division";
  } else if (data[4]==null) {
    return field = "Image";
  } else {
    return field = "success";
  }
}
