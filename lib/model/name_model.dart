// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class NameModel {
  final String nameSchool;
  final String address;
  final String phone;
  NameModel({
    required this.nameSchool,
    required this.address,
    required this.phone,
  });

  NameModel copyWith({
    String? nameSchool,
    String? address,
    String? phone,
  }) {
    return NameModel(
      nameSchool: nameSchool ?? this.nameSchool,
      address: address ?? this.address,
      phone: phone ?? this.phone,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nameSchool': nameSchool,
      'address': address,
      'phone': phone,
    };
  }

  factory NameModel.fromMap(Map<String, dynamic> map) {
    return NameModel(
      nameSchool: map['nameSchool'] as String,
      address: map['address'] as String,
      phone: map['phone'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory NameModel.fromJson(String source) => NameModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'NameModel(nameSchool: $nameSchool, address: $address, phone: $phone)';

  @override
  bool operator ==(covariant NameModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.nameSchool == nameSchool &&
      other.address == address &&
      other.phone == phone;
  }

  @override
  int get hashCode => nameSchool.hashCode ^ address.hashCode ^ phone.hashCode;
}
