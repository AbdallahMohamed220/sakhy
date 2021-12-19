class Client {
  final String address;
  final String avatar;
  final String birthdate;
  final String email;
  final String firstName;
  final String id;
  final String lastName;
  final String mobile;
  final String nationalId;
  final String password;

  Client(this.address, this.avatar, this.birthdate, this.email, this.lastName,
      this.id, this.firstName, this.mobile, this.nationalId, this.password);

  Map<String, dynamic> toMap() {
    return {
      'address': address,
      'avatar': avatar,
      'birthdate': birthdate,
      'email': email,
      'first_name': firstName,
      'id': id,
      'last_name': lastName,
      'mobile': mobile,
      'national_id': nationalId,
      'password': password,
    };
  }

  factory Client.fromMap(Map<String, dynamic> map) {
    return Client(
      map['address'],
      map['avatar'],
      map['birthdate'],
      map['email'],
      map['first_name'],
      map['id'],
      map['last_name'],
      map['mobile'],
      map['national_id'],
      map['password'],
    );
  }
}
