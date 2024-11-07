import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sophie_messenger_app/routers/navigator.dart';
import 'package:sophie_messenger_app/routers/routers.dart';
import 'package:sophie_messenger_app/services/message/pages/Screens/Calls/pages/calls.dart';
import 'package:sophie_messenger_app/services/message/pages/Screens/Groups/pages/groups.dart';
import 'package:sophie_messenger_app/services/message/pages/Screens/Messages/bloc/messages/chat_cubit.dart';
import 'package:sophie_messenger_app/services/message/pages/Screens/Messages/pages/chats.dart';
import 'package:sophie_messenger_app/services/message/pages/Screens/Messages/pages/search_poeple.dart';
import 'package:sophie_messenger_app/utilities/theme/text_styles.dart';

import '../bloc/message/cubit/message_navigation_cubit.dart';

class MessageNavigatorScreen extends StatefulWidget {
  @override
  State<MessageNavigatorScreen> createState() => _MessageNavigatorScreenState();
}

class _MessageNavigatorScreenState extends State<MessageNavigatorScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MessageNavigationCubit(),
        ),
        BlocProvider(
          create: (context) => ChatCubit(),
        ),
      ],
      child: BlocConsumer<MessageNavigationCubit, MessageNavigationState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = context.read<MessageNavigationCubit>();
          var index = cubit.currentIndex;
          return DefaultTabController(
            length: 3,
            // initialIndex: index,
            child: Scaffold(
              appBar: AppBar(
                centerTitle: false,
                automaticallyImplyLeading: false,
                title: Text(
                  cubit.appBar[index],
                  style: AppTextStyles.appBar.copyWith(fontSize: 28),
                ),
                actions: index == 0
                    ? [
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                            onTap: () {
                              CustomNavigator.push(Routes.searchPerson);
                            },
                            child: Icon(Icons.person_add)),
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                            onTap: () {}, child: Icon(Icons.search)),
                        SizedBox(
                          width: 10,
                        ),
                      ]
                    : index == 1
                        ? [
                            Icon(Icons.search),
                            SizedBox(
                              width: 10,
                            ),
                          ]
                        : [
                            Icon(Icons.search),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                // leading: index ==0 ?Row(
                //   children: [
                //     Icon(Icons.person_add),
                //     Icon(Icons.search)
                //   ],
                // ):index ==1?Icon(Icons.search):Icon(Icons.search),
                bottom: TabBar(
                    indicatorWeight: 3,
                    // dividerHeight: 5,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorPadding: EdgeInsets.symmetric(horizontal: 12),
                    labelPadding: EdgeInsets.symmetric(horizontal: 20),
                    tabAlignment: TabAlignment.fill,
                    physics: BouncingScrollPhysics(),
                    splashBorderRadius: BorderRadius.circular(1),
                    overlayColor: MaterialStatePropertyAll(Colors.transparent),
                    indicatorColor: Colors.white,
                    dividerColor: Colors.white,
                    onTap: (value) {
                      cubit.currentIndex = value;
                      cubit.changeIndex(value);
                      print(value);
                    },
                    tabs: <Tab>[
                      Tab(
                        child: Row(
                          children: [
                            Text(
                              "Message",
                              style: AppTextStyles.w400
                                  .copyWith(color: Colors.white),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Icon(
                              Icons.circle,
                              color: Colors.white,
                              size: 10,
                            ),
                          ],
                        ),
                      ),
                      Tab(
                        child: Text("Group", style: AppTextStyles.w400),
                      ),
                      Tab(
                        child: Text("Calls", style: AppTextStyles.w400),
                      ),
                    ]),
                // ...rest of your AppBar code...
              ),
              body: TabBarView(
                children: <Widget>[
                  ChatsScreen(),
                  GroupsScreen(),
                  CallsScreen(),
                ],
              ),
              // ...rest of your Scaffold code...
            ),
          );
        },
      ),
    );
  }
}
