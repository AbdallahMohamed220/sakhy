class Report {
  final String accountId;
  final String amount;
  final String creationTime;
  final String currency;
  final String from;
  final bool isIn;
  final bool isOut;
  final String reason;
  final String to;
  final String transactionType;

  Report(
      {required this.accountId,
      required this.amount,
      required this.creationTime,
      required this.currency,
      required this.from,
      required this.isIn,
      required this.isOut,
      required this.reason,
      required this.to,
      required this.transactionType});

  Map<String, dynamic> toMap() {
    return {
      'accountId': accountId,
      'amount': amount,
      'creation_time': creationTime,
      'currency': currency,
      'from': from,
      'isIn': isIn,
      'isOut': isOut,
      'reason': reason,
      'to': to,
      'transaction_type': transactionType,
    };
  }

  factory Report.fromMap(Map<String, dynamic> map) {
    return Report(
      accountId: map['account_id'] ?? '',
      amount: map['amount'] ?? '',
      creationTime: map['creation_time'] ?? '',
      currency: map['currency'] ?? '',
      from: map['from'] ?? '',
      isIn: map['isIn'] ?? '',
      isOut: map['isOut'] ?? '',
      reason: map['reason'] ?? '',
      to: map['to'] ?? '',
      transactionType: map['transaction_type'] ?? '',
    );
  }
}
