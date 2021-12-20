class Account {
  final String accountName;
  final String accountType;
  final String balance;
  final String bankId;
  final String bankLogo;
  final String bankName;
  final String cardNumber;
  final String clientId;
  final String color;
  final String currency;

  final String iban;

  String id;

  Account(
    this.accountName,
    this.accountType,
    this.balance,
    this.bankId,
    this.bankLogo,
    this.bankName,
    this.cardNumber,
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
      map['bank_logo'],
      map['bank_name'],
      map['card_number'],
      map['client_id'],
      map['color'],
      map['currency'],
      map['iban'],
      map['id'],
    );
  }
}
