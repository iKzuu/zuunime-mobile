import 'package:zuunimelist/utils/formatter.dart';

class AiredModel {
  final String? from;
  final String? to;
  final AiredProp? prop;

  AiredModel({this.from, this.to, this.prop});

  factory AiredModel.fromJson(Map<String, dynamic> json) {
    return AiredModel(
      from: json["from"],
      to: json["to"],
      prop: json["prop"] != null ? AiredProp.fromJson(json["prop"]) : null,
    );
  }
}

class AiredProp {
  final AiredDate? from;
  final AiredDate? to;
  final String? string;

  AiredProp({this.from, this.to, this.string});

  factory AiredProp.fromJson(Map<String, dynamic> json) {
    return AiredProp(
      from: json["from"] != null ? AiredDate.fromJson(json["from"]) : null,
      to: json["to"] != null ? AiredDate.fromJson(json["to"]) : null,
      string: json["string"],
    );
  }
}

class AiredDate {
  final int? day;
  final int? month;
  final int? year;

  AiredDate({this.day, this.month, this.year});

  factory AiredDate.fromJson(Map<String, dynamic> json) {
    return AiredDate(
      day: json["day"],
      month: json["month"],
      year: json["year"],
    );
  }

  DateTime? get date {
    if (year == null || month == null || day == null) return null;
    return DateTime(year!, month!, day!);
  }

  String get formattedDate => formatDate(date);
}
