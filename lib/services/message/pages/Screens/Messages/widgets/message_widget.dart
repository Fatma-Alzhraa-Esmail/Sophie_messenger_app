import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:sophie_messenger_app/handlers/icon_handler.dart';
import 'package:sophie_messenger_app/routers/navigator.dart';
import 'package:sophie_messenger_app/routers/routers.dart';
import 'package:sophie_messenger_app/services/message/pages/Screens/Messages/bloc/messages/chat_cubit.dart';
import 'package:sophie_messenger_app/services/message/pages/Screens/Messages/bloc/messages/chat_state.dart';
import 'package:sophie_messenger_app/services/message/pages/Screens/Messages/model/chats_model.dart';

import '../../../../../../utilities/theme/text_styles.dart';
import '../model/status_model.dart';

class MessageWidget extends StatefulWidget {
  final Messages messagescollection;
  const MessageWidget(
    BuildContext context,
    this.messagescollection,
  );

  @override
  State<MessageWidget> createState() => _MessageWidgetState();
}

class _MessageWidgetState extends State<MessageWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatCubit()..getMessages(),
      child: BlocBuilder<ChatCubit, ChatState>(
        builder: (context, state) {
          return InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () {
              // BlocProvider(
              //   create: (conntext) => ChatCubit()..messagesList,
              //   child: ChatScreen(),
              // );
              CustomNavigator.push(Routes.chatpersons);
            },
            child: Slidable(
              endActionPane: ActionPane(
                  motion: const BehindMotion(),
                  extentRatio: .2,
                  children: [
                    SlidableAction(
                      onPressed: (context) {},
                      icon: Icons.delete_outlined,
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                    )
                  ]),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Stack(
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage(
                                "${widget.messagescollection.image}",
                              ),
                              maxRadius: 28,
                            ),
                            Positioned(
                                right: -3,
                                bottom: 3,
                                child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    maxRadius: 9,
                                    child: CircleAvatar(
                                      backgroundColor: widget.messagescollection
                                                  .userStatus ==
                                              UserStatus.active
                                          ? AppTextStyles.maincolor
                                          : widget.messagescollection
                                                      .userStatus ==
                                                  UserStatus.inactive
                                              ? Colors.grey
                                              : Colors.amber,
                                      maxRadius: 6.5,
                                    ))),
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "${widget.messagescollection.userName}",
                                  style:
                                      widget.messagescollection.isSeen == true
                                          ? AppTextStyles.read
                                          : AppTextStyles.unread,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                widget.messagescollection.isSeen == true
                                    ? CircleAvatar(
                                        backgroundColor: Colors.white,
                                        maxRadius: 5,
                                      )
                                    : CircleAvatar(
                                        backgroundColor:
                                            AppTextStyles.maincolor,
                                        maxRadius: 5)
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            widget.messagescollection.messageType ==
                                    MessageType.call
                                ? Text(
                                    "You Missed a call",
                                    style: TextStyle(
                                        color: AppTextStyles.maincolor),
                                  )
                                : widget.messagescollection.messageType ==
                                        MessageType.video
                                    ? Text(
                                        "You Missed a Video call",
                                        style: TextStyle(color: Colors.red),
                                      )
                                    : Container(
                                      width: 200,
                                      child: Text(
                                          widget
                                              .messagescollection.messgaes!.last,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                          style:
                                              widget.messagescollection.isSeen ==
                                                      true
                                                  ? AppTextStyles.readmessage
                                                      .copyWith(
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                              
                                                              )
                                                             
                                                  : AppTextStyles.unreadmessage
                                                      .copyWith(
                                                          overflow: TextOverflow
                                                              .ellipsis),
                                        ),
                                    )
                          ],
                        ),
                      ],
                    ),
                    Row(
                      //  crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            widget.messagescollection.messageType ==
                                    MessageType.call
                                ? Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color.fromARGB(255, 216, 249, 248),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(7.0),
                                      child: drawSvgIcon('phone',
                                          iconColor: AppTextStyles.maincolor),
                                    ))
                                : widget.messagescollection.messageType ==
                                        MessageType.video
                                    ? Container(
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Color.fromARGB(
                                              255, 251, 197, 197),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(7.0),
                                          child: drawSvgIcon(
                                            'video',
                                            iconColor: Colors.red,
                                          ),
                                        ))
                                    : Container(
                                        width: 30,
                                        height: 30,
                                      ),
                          ],
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Column(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisAlignment: MainAxisAlignment.start,
                          children: [Text("3m ago",style: TextStyle(color: Colors.black),)],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
