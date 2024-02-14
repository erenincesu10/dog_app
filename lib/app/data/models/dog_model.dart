// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:equatable/equatable.dart';

final class Dog extends Equatable {
  String? name;
  String? imagePath;
  Dog({
    this.name,
    this.imagePath,
  });

  Dog copyWith({
    String? name,
    String? imagePath,
  }) {
    return Dog(
      name: name ?? this.name,
      imagePath: imagePath ?? this.imagePath,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'imagePath': imagePath,
    };
  }

  factory Dog.fromMap(Map<String, dynamic> map) {
    return Dog(
      name: map['name'] != null ? map['name'] as String : null,
      imagePath: map['imagePath'] != null ? map['imagePath'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Dog.fromJson(String source) =>
      Dog.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [name, imagePath];
}
