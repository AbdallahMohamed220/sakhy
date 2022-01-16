class ClientAccount {
  final String accountId;
  final String bankId;
  final String clientId;
  final String id;
  final String userId;

  ClientAccount(
      this.accountId, this.bankId, this.clientId, this.id, this.userId);

  Map<String, dynamic> toMap() {
    return {
      'account_id': accountId,
      'bank_id': bankId,
      'client_id': clientId,
      'id': id,
      'user_id': userId,
    };
  }

  factory ClientAccount.fromMap(Map<String, dynamic> map) {
    return ClientAccount(
      map['account_id'],
      map['bank_id'],
      map['client_id'],
      map['id'],
      map['user_id'],
    );
  }
}
