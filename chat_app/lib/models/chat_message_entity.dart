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

  factory ChatMessageEntity.fromJson(Map<String, dynamic> json) {
    return ChatMessageEntity(
        text: json['text'],
        createdAt: json['createdAt'],
        id: json['id'],
        imageUrl: json['image'],
        author: Author.fromJson(json['author']));
  }
}

class Author {
  String userName;

  Author({required this.userName});

  // this is factory method, which takes Map named json and returns
  // Author objects created from json['']
  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(userName: json['username']);
  }
}

/* class ClassName {
  // Fields, constructors, and other methods can be defined here

  factory ClassName.factoryMethodName() {
    // Factory method implementation
    // Code logic here
    return instance; // Return an instance of ClassName or its subclass
  }
}
*/
