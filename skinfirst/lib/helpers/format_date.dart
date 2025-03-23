import 'package:intl/intl.dart';


String formattoDesireDate(String date) {
  
  String year = date.split("-")[0];
  int month = int.parse(date.split("-")[1]);
  String day = date.split("-")[2];

  String monthName = getMonth(month);

  return "$monthName $day $year";
}

String formatedDateWithDateAndMont(String serverDate) {

  DateTime pareseDate = DateTime.parse(serverDate);

  String date = DateFormat('yyyy-MM-dd').format(pareseDate);

  String day = date.split("-")[2];
  int month = int.parse(date.split("-")[1]);

  String monthName = getMonth(month);

  return "$day $monthName";
}

String getMonth(int month) {
  String monthName = "";

  switch(month) {
    case 1:
      monthName = "January";
      break;
    case 2:
      monthName = "February";
      break;
    case 3:
      monthName = "March";
      break;
    case 4:
      monthName = "April";
      break;
    case 5:
      monthName = "May";
      break;
    case 6:
      monthName = "June";
      break;
    case 7:
      monthName = "July";
      break;
    case 8:
      monthName = "August";
      break;
    case 9:
      monthName = "September";
      break;
    case 10:
      monthName = "October";
      break;
    case 11:
      monthName = "November";
      break;
    case 12:
      monthName = "December";
      break;
  }

  return monthName;
}