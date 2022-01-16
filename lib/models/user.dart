import 'dart:convert';

class User {
  final String address;
  final String email;
  final String firstName;
  final String id;
  final String lastName;
  final String mobile;
  final String nationalId;
  final String password;

  User(this.address, this.email, this.firstName, this.id, this.lastName,
      this.mobile, this.nationalId, this.password);

  Map<String, dynamic> toMap() {
    return {
      'address': address,
      'email': email,
      'first_name': firstName,
      'id': id,
      'last_name': lastName,
      'mobile': mobile,
      'national_id': nationalId,
      'password': password,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      map['address'],
      map['email'],
      map['first_name'],
      map['id'],
      map['last_name'],
      map['mobile'],
      map['national_id'],
      map['password'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
