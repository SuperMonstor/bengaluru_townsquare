enum FriendshipStatus {
  pending,
  accepted,
  rejected;

  String toJson() => name;
  static FriendshipStatus fromJson(String json) => values.byName(json);
}

class Friend {
  String id;
  FriendshipStatus status;
  String? sentAt;
  String? receivedAt;
  String? acceptedAt;
  String? rejectedAt;

  Friend(
      {required this.id,
      required this.status,
      this.sentAt,
      this.receivedAt,
      this.acceptedAt,
      this.rejectedAt}) {
    sentAt = sentAt;
    acceptedAt = acceptedAt;
    receivedAt = receivedAt;
    rejectedAt = rejectedAt;
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "status": status.toJson(),
      "sentAt": sentAt,
      "receivedAt": receivedAt,
      "acceptedAt": acceptedAt,
      "rejectedAt": rejectedAt
    };
  }

  Friend accept() {
    status = FriendshipStatus.accepted;
    acceptedAt = DateTime.now().toString();
    return this;
  }

  Friend reject() {
    status = FriendshipStatus.rejected;
    rejectedAt = DateTime.now().toString();
    return this;
  }

  factory Friend.fromJson(Map<String, dynamic> attributes) {
    return Friend(
        id: attributes['id'],
        status: FriendshipStatus.fromJson(attributes['status']),
        sentAt: attributes['sentAt'],
        acceptedAt: attributes['acceptedAt'],
        receivedAt: attributes['receivedAt'],
        rejectedAt: attributes['rejectedAt']);
  }
}
