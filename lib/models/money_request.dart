import 'dart:convert';

class MoneyRequest {
  final String amount;
  final String clientId;
  final String creationDate;
  final String from;
  final String id;
  final String modifiedDate;
  final String reason;
  final String status;

  MoneyRequest(this.amount, this.clientId, this.creationDate, this.from,
      this.id, this.modifiedDate, this.reason, this.status);

  Map<String, dynamic> toMap() {
    return {
      'amount': amount,
      'client_id': clientId,
      'creation_date': creationDate,
      'from': from,
      'id': id,
      'modified_date': modifiedDate,
      'reason': reason,
      'status': status,
    };
  }

  factory MoneyRequest.fromMap(Map<String, dynamic> map) {
    return MoneyRequest(
      map['amount'],
      map['client_id'],
      map['creation_date'],
      map['from'],
      map['id'],
      map['modified_date'],
      map['reason'],
      map['status'],
    );
  }
}
