import 'dart:convert';

class Donation {
  final String amount;
  final String clientId;
  final String currency;
  final String id;
  final String organization;

  Donation(
      this.amount, this.clientId, this.currency, this.id, this.organization);

  Map<String, dynamic> toMap() {
    return {
      'amount': amount,
      'client_id': clientId,
      'currency': currency,
      'id': id,
      'organization': organization,
    };
  }

  factory Donation.fromMap(Map<String, dynamic> map) {
    return Donation(
      map['amount'],
      map['client_id'],
      map['currency'],
      map['id'],
      map['organization'],
    );
  }
}
