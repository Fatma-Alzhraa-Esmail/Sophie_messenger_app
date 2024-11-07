import 'package:sophie_messenger_app/services/message/pages/Screens/Messages/model/status_model.dart';

class Messages {
  final String? userName;
  final String? image;
  final String? lastMessage;
  final DateTime timeSent;
  final String? contactId;
  final UserStatus? userStatus;
  final MessageType? messageType;
  final bool? isSeen;
  final UserMessagesStatus? userMessagesStatus;
  final List<String>? messgaes;


  Messages({
    this.image,
    this.userName,
    this.isSeen,
    this.userMessagesStatus,
    this.messgaes,
    this.userStatus,
    this.messageType,
    this.lastMessage,
    required this.timeSent,
    this.contactId,
  });

  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'image': image,
      'contactId': contactId,
      'timeSent': timeSent.millisecondsSinceEpoch,
      'lastMessage': lastMessage,
      'isSeen': isSeen,
      'userMessagesStatus': userMessagesStatus,
      'messgaes': messgaes,
      'userStatus': userStatus,
      'messageType': messageType,
    };
  }

  factory Messages.fromMap(Map<String, dynamic> map) {
    return Messages(
      contactId: map['contactId'],
      timeSent: DateTime.fromMillisecondsSinceEpoch(map['timeSent']),
      lastMessage: map['lastMessage'],
      isSeen: map['isSeen'],
      image: map['image'],
      messageType: map['messageType'],
      messgaes: map['messgaes'],
      userMessagesStatus: map['userMessagesStatus'],
      userName: map['userName'],
      userStatus: map['userStatus'],
    );
  }
  static List<Messages> MessagesCard() {
    return [
      Messages(
        image: 'assets/images/person1.jpg',
        isSeen: false,
        userMessagesStatus: UserMessagesStatus.live,
        messgaes: ["Hello Iam Fatma?"],
        userName: "Fatma Alzhraa",
        userStatus: UserStatus.active,
        messageType: MessageType.text,
        timeSent: DateTime.now(),
      ),
      Messages(
        image: 'assets/images/person2.jpg',
        isSeen: true,
        userMessagesStatus: UserMessagesStatus.inactive,
        messgaes: ["", "Hey! What's up, long time no see?"],
        userName: "Eman Ahmed",
        userStatus: UserStatus.inactive,
        messageType: MessageType.text,
        timeSent: DateTime.now(),
      ),
      Messages(
        image: 'assets/images/person3.jpg',
        isSeen: true,
        userName: "Tamer Samir",
        userMessagesStatus: UserMessagesStatus.online,
        messgaes: ["You Missed a call"],
        userStatus: UserStatus.active,
        messageType: MessageType.call,
        timeSent: DateTime.now(),
      ),
      Messages(
        image: 'assets/images/person1.jpg',
        isSeen: false,
        userMessagesStatus: UserMessagesStatus.active,
        messgaes: ["we meet new user"],
        userName: "Ahmed yousry",
        userStatus: UserStatus.inactive,
        messageType: MessageType.text,
        timeSent: DateTime.now(),
      ),
      Messages(
        image: 'assets/images/person1.jpg',
        isSeen: true,
        userMessagesStatus: UserMessagesStatus.inactive,
        messgaes: ["she going to make it happened"],
        userName: "yassima Esmail",
        userStatus: UserStatus.online,
        messageType: MessageType.video,
        timeSent: DateTime.now(),
      ),
      Messages(
        image: 'assets/images/person1.jpg',
        isSeen: false,
        userMessagesStatus: UserMessagesStatus.online,
        messgaes: ["free for a quick call"],
        userName: "Ahlam somaa",
        userStatus: UserStatus.online,
        messageType: MessageType.text,
        timeSent: DateTime.now(),
      ),
      Messages(
        image: 'assets/images/person1.jpg',
        isSeen: true,
        userMessagesStatus: UserMessagesStatus.active,
        messgaes: ["lets join a video call"],
        userName: "Eyad Mazen",
        userStatus: UserStatus.online,
        messageType: MessageType.call,
        timeSent: DateTime.now(),
      ),
    ];
  }
}

enum UserMessagesStatus { active, inactive, online, live }

enum MessageType {
  text,
  call,
  video,
}
