import 'dart:convert';

class CreditCard {
  final String cardNumber;
  final String clientId;
  final String color;
  final String cvv;
  final String expDate;
  final String name;

  CreditCard({
    required this.cardNumber,
    required this.clientId,
    required this.color,
    required this.cvv,
    required this.expDate,
    required this.name,
  });

  factory CreditCard.fromMap(Map<String, dynamic> map) {
    return CreditCard(
      cardNumber: map['card_number'],
      clientId: map['client_id'],
      color: map['color'],
      cvv: map['cvv'],
      expDate: map['exp_date'],
      name: map['name'],
    );
  }
}
