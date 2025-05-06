import 'package:intl/intl.dart';

extension StringCasingExtension on String {
  String get capitalizeEachWord {
    return split(' ').map((word) {
      if (word.isEmpty) return word;
      return word[0].toUpperCase() + word.substring(1);
    }).join(' ');
  }

  String get firstName {
    String name = split(' ')[0];
    return name[0].toUpperCase() + name.substring(1);
  }

  String get formatDate {
    DateTime dateTime = DateTime.parse(this);
    return DateFormat('MMMM d, y - HH:mm').format(dateTime);
  }
}
