class ChatMessageEntity {
  String text;
  String? imageUrl; // Image is not necessary in all chat message
  String id;
  int createdAt;
  Author author;

  ChatMessageEntity(
      {required this.text,
      required this.id,
      required this.createdAt,
      this.imageUrl,
      required this.author});
}

class Author {
  String userName;

  Author({required this.userName});
}
