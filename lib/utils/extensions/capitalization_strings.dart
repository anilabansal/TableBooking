import 'package:intl/intl.dart';

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}
/// convert booking date in service summary
extension BookingDate on String {
  String convertBookingTimeToFormat() {
    var goalDateTime = DateFormat("yyyy-MM-ddTHH:mm:ss").parse(this,true).toLocal();
//var now = DateFormat().parse(widget.bookingdetails![0].bookingDate.toString());
    var formatterDate = DateFormat('MMM d,y');
    String formatGoalDateTime = formatterDate.format(goalDateTime);
    return formatGoalDateTime;
  }
}

/// convert booking date in edit table
extension EditBookingDate on String {
  String convertEditBookingDateToFormat() {
    var goalDateTime = DateFormat("yyyy-MM-ddTHH:mm:ss").parse(this,true).toLocal();
//var now = DateFormat().parse(widget.bookingdetails![0].bookingDate.toString());
    var formatterDate = DateFormat('yyyy-MM-dd');
    String formatGoalDateTime = formatterDate.format(goalDateTime);
    return formatGoalDateTime;
  }
}

/// convert d.o.b in edit profile
extension EditProfileDateBirth on String {
  String convertEditProfileDateBirthToFormat() {
    var dateBirthTime = DateFormat("yyyy-MM-ddTHH:mm:ss").parse(this,true).toLocal();
//var now = DateFormat().parse(widget.bookingdetails![0].bookingDate.toString());
    var formatterDate = DateFormat('MM-dd-yyyy');
    String formatGoalDateTime = formatterDate.format(dateBirthTime);
    return formatGoalDateTime;
  }
}