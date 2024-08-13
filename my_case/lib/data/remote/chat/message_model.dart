class MessageModel {
  final String id;
  final String? textMessage;
  final String? createdAt;
  final bool? hasMedia;
  final String? senderRole;
  final List<dynamic>? media;

  MessageModel({
    required this.id,
    this.textMessage,
    this.createdAt,
    this.hasMedia,
    this.senderRole,
    this.media,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      id: json['ID'],
      textMessage: json['TextMessage'],
      createdAt: json['CreatedAt'],
      hasMedia: json['HasMedia'],
      senderRole: json['SenderRole'],
      media: json['Media'],
    );
  }
}
