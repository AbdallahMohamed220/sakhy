import 'dart:convert';

class Account {
  final String accountName;
  final String accountType;
  final String balance;
  final String bankId;
  final String bankName;
  final String clientId;
  final String color;
  final String currency;

  final String iban;

  final String id;

  Account(
    this.accountName,
    this.accountType,
    this.balance,
    this.bankId,
    this.bankName,
    this.clientId,
    this.color,
    this.currency,
    this.iban,
    this.id,
  );

  Map<String, dynamic> toMap() {
    return {
      'account_name': accountName,
      'account_type': accountType,
      'balance': balance,
      'bank_id': bankId,
      'bank_name': bankName,
      'client_id': clientId,
      'color': color,
      'currency': currency,
      'iban': iban,
      'id': id,
    };
  }

  factory Account.fromMap(Map<String, dynamic> map) {
    return Account(
      map['account_name'],
      map['account_type'],
      map['balance'],
      map['bank_id'],
      map['bank_name'],
      map['client_id'],
      map['color'],
      map['currency'],
      map['iban'],
      map['id'],
    );
  }
}
