class DonationTransaction {
  final String amount;
  final String clientId;
  final String creationDate;
  final String id;
  final String name;

  DonationTransaction(
      this.amount, this.clientId, this.creationDate, this.id, this.name);

  Map<String, dynamic> toMap() {
    return {
      'amount': amount,
      'client_id': clientId,
      'creation_date': creationDate,
      'id': id,
      'name': name,
    };
  }

  factory DonationTransaction.fromMap(Map<String, dynamic> map) {
    return DonationTransaction(
      map['amount'],
      map['client_id'],
      map['creation_date'],
      map['id'],
      map['name'],
    );
  }
}
