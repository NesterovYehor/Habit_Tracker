String todaysDateFormatted() {
  var dateTimeObject = DateTime.now();

  String year = dateTimeObject.year.toString();

  String month = dateTimeObject.month.toString();
  if (month.length == 1) {
    month = "0$month";
  }

  String day = dateTimeObject.day.toString();
  if (day.length == 1) {
    day = "0$day";
  }

  String yyyymmdd = "$year-$month-$day"; 

  return yyyymmdd;
}

DateTime createDateTimeObject(String yyyymmdd) {
  int yyyy = int.parse(yyyymmdd.substring(0, 4));
  int month = int.parse(yyyymmdd.substring(5, 7)); 
  int day = int.parse(yyyymmdd.substring(8, 10)); 

  DateTime dateTimeObject = DateTime(yyyy, month, day);

  return dateTimeObject;
}

String convertDateTimeToString(DateTime dateTime) {
  String year = dateTime.year.toString();

  String month = dateTime.month.toString();
  if (month.length == 1) {
    month = "0$month";
  }

  String day = dateTime.day.toString();
  if (day.length == 1) {
    day = "0$day";
  }

  String yyyymmdd = "$year-$month-$day"; 

  return yyyymmdd;
}
