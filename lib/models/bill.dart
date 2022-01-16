class Bill {
  final String amount;
  final String creationDate;
  final String currency;
  final String dueDate;
  final String id;
  final String status;
  final String title;
  final String to;
  final String userId;

  Bill(this.amount, this.creationDate, this.currency, this.dueDate, this.id,
      this.status, this.title, this.to, this.userId);

  Map<String, dynamic> toMap() {
    return {
      'amount': amount,
      'creation_date': creationDate,
      'currency': currency,
      'dueDate': dueDate,
      'id': id,
      'status': status,
      'title': title,
      'to': to,
      'user_id': userId,
    };
  }

  factory Bill.fromMap(Map<String, dynamic> map) {
    return Bill(
      map['amount'],
      map['creation_date'],
      map['currency'],
      map['dueDate'],
      map['id'],
      map['status'],
      map['title'],
      map['to'],
      map['user_id'],
    );
  }
}
