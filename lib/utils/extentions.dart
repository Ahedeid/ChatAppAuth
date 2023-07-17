import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';

extension EditString on String {
  // Replace all Phone num after 4 with Start

  String replaceStringPhone() {
    String replacedText =
    this.replaceRange(4, this.indexOf(RegExp(r'([0-9]){3}$')), "*****");
    return replacedText;
  }

// Replace all email Suffix - 2 with Start
  String replaceStringEmail() {
    String replacedText = this.replaceRange(0, this.indexOf("@") - 2, "*****");
    return replacedText;
  }

// Remove Square Brackets
  String replaceStringSquare() {
    String replacedText = this.replaceAll("[\\(\\)\\[\\]\\{\\}]", "");
    return replacedText;
  }

// Timer HH:SS
  String formatHHMMSS(int seconds) {
    final hours = (seconds / 3600).truncate();
    seconds = (seconds % 3600).truncate();
    final minutes = (seconds / 60).truncate();
    final hoursStr = (hours).toString().padLeft(2, '0');
    final minutesStr = (minutes).toString().padLeft(2, '0');
    final secondsStr = (seconds % 60).toString().padLeft(2, '0');
    if (hours == 0) {
      return '$minutesStr:$secondsStr';
    }
    return '$hoursStr:$minutesStr:$secondsStr';
  }

// Replace HH:MM a
  String replaceHHMMa() {
    String replacedText = DateFormat.jm()
        .format(DateFormat("hh:mm:ss").parse("${this.split("T")[1]}"));
    return replacedText;
  }

// Replace HH:MM a
  String replaceYYMMDD() {
    String replacedText = this.split("T")[0];
    return replacedText;
  }

  // Replace Tue, Jan 25, 2022
  String replaceNewDate() {
    // TimeStamp Example
    // var date = '2021-01-26T03:17:00.000000Z';
    DateTime parseDate =
    new DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(this);
    var inputDate = DateTime.parse(parseDate.toString());
    var outputFormat = DateFormat('MMM d hh:mm a');
    var outputDate = outputFormat.format(inputDate);
    return outputDate;
  }

  String replaceDMY() {
    // TimeStamp Example
    // var date = '2021-01-26T03:17:00.000000Z';
    DateTime parseDate =
    new DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(this);
    var inputDate = DateTime.parse(parseDate.toString());
    var outputFormat = DateFormat('d MMM y');
    var outputDate = outputFormat.format(inputDate);
    return outputDate;
  }

  String replaceDMYDPicker() {
    // TimeStamp Example
    // var date = '2021-01-26T03:17:00.000000Z';
    DateTime parseDate =
    new DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(this);
    var inputDate = DateTime.parse(parseDate.toString());
    var outputFormat = DateFormat('yMd');
    var outputDate = outputFormat.format(inputDate);
    return outputDate;
  }

  String replaceDMYDPickerZ() {
    // TimeStamp Example
    // var date = '2021-01-26T03:17:00.000000';
    DateTime parseDate =
    new DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS").parse(this);
    var inputDate = DateTime.parse(parseDate.toString());
    var outputFormat = DateFormat('dd/MM/yyyy');
    var outputDate = outputFormat.format(inputDate);
    return outputDate;
  }

  String replaceDMYDPickerISO() {
    // TimeStamp Example
    // var date = '2021-01-26T03:17:00.000000Z';
    DateTime parseDate =
    new DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(this);
    var inputDate = DateTime.parse(parseDate.toString());
    var outputFormat = DateFormat('yMd');
    var outputDate = outputFormat.format(inputDate);
    return outputDate;
  }

  String replaceDays() {
    final dataaa = Jiffy(this).fromNow(); // a few seconds ago

    return dataaa;
  }

  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }
}
