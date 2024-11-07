import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sophie_messenger_app/services/myprofile/pages/user_profile.dart';
import 'package:sophie_messenger_app/utilities/theme/text_styles.dart';

class SearchPeopleScreen extends StatefulWidget {
  SearchPeopleScreen({super.key});

  @override
  State<SearchPeopleScreen> createState() => _SearchPeopleScreenState();
}

class _SearchPeopleScreenState extends State<SearchPeopleScreen> {
  final TextEditingController searchController = TextEditingController();

  bool isShowUsers = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppTextStyles.maincolor,
          title: Form(
            child: TextFormField(
              controller: searchController,
              decoration:
                  const InputDecoration(labelText: 'Search for a user...'),
              onFieldSubmitted: (String _) {
                setState(() {
                  isShowUsers = true;
                });
              },
            ),
          ),
        ),
        body: isShowUsers
            ? FutureBuilder(
                future: FirebaseFirestore.instance
                    .collection('users')
                    .where(
                      'name',
                      isGreaterThanOrEqualTo: searchController.text,
                    )
                    .get(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView.builder(
                    itemCount: (snapshot.data! as dynamic).docs.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => UsersProfile(
                              uid: (snapshot.data! as dynamic).docs[index]['uid'],
                            ),
                          ),
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                              (snapshot.data! as dynamic).docs[index]
                                  ['image'],
                            ),
                            radius: 16,
                          ),
                          title: Text(
                            (snapshot.data! as dynamic).docs[index]['name'],
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      );
                    },
                  );
                },
              )
            : Text('No Result'));
  }
}
