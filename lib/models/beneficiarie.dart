class Beneficiarie {
  final String accountId;
  final String address;
  final String beneficiaryAlias;
  final String beneficiaryName;
  final String comment;
  final String email;
  final String iban;
  final bool isLocal;
  final String mobile;
  final String userId;
  String id;
  final String bankName;

  Beneficiarie(
      this.accountId,
      this.address,
      this.bankName,
      this.beneficiaryAlias,
      this.beneficiaryName,
      this.comment,
      this.email,
      this.iban,
      this.id,
      this.isLocal,
      this.mobile,
      this.userId);

  Map<String, dynamic> toMap() {
    return {
      'account_id': accountId,
      'address': address,
      'bank_name': bankName,
      'beneficiary_alias': beneficiaryAlias,
      'beneficiary_name': beneficiaryName,
      'comment': comment,
      'email': email,
      'iban': iban,
      'id': id,
      'is_local': isLocal,
      'mobile': mobile,
      'user_id': userId,
      'bankName': bankName,
    };
  }

  factory Beneficiarie.fromMap(Map<String, dynamic> map) {
    return Beneficiarie(
      map['account_id'],
      map['address'],
      map['bank_name'],
      map['beneficiary_alias'],
      map['beneficiary_name'],
      map['comment'],
      map['email'],
      map['iban'],
      map['id'],
      map['is_local'],
      map['mobile'],
      map['user_id'],
    );
  }
}
