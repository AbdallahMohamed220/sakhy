class Transaction {
  final String accountId;
  final String amount;
  final String creationTime;
  final String currency;
  final String from;
  final String id;
  final String reason;
  final String to;
  final String transactionType;

  Transaction(this.accountId, this.amount, this.creationTime, this.currency,
      this.from, this.id, this.reason, this.to, this.transactionType);

  Map<String, dynamic> toMap() {
    return {
      'account_id': accountId,
      'amount': amount,
      'creation_time': creationTime,
      'currency': currency,
      'from': from,
      'id': id,
      'reason': reason,
      'to': to,
      'transaction_type': transactionType,
    };
  }

  factory Transaction.fromMap(Map<String, dynamic> map) {
    return Transaction(
      map['account_id'],
      map['amount'],
      map['creation_time'],
      map['currency'],
      map['from'],
      map['id'],
      map['reason'],
      map['to'],
      map['transaction_type'],
    );
  }
}
