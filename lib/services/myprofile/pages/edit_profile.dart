import 'package:flutter/material.dart';
import 'package:sophie_messenger_app/routers/navigator.dart';
import 'package:sophie_messenger_app/utilities/theme/text_styles.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController NameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
        leading: GestureDetector(
            onTap: () {
              CustomNavigator.pop();
            },
            child: Icon(Icons.arrow_back_ios)),
      ),
      body: SafeArea(
          child: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 80),
              width: 110,
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 54,
                    foregroundImage: AssetImage('assets/images/person1.jpg'),
                  ),
                  Positioned(
                      bottom: 8,
                      right: 0,
                      child: Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                              color: AppTextStyles.maincolor,
                              border: Border.all(color: Colors.white, width: 2),
                              shape: BoxShape.circle),
                          child: Icon(
                            Icons.camera_alt_sharp,
                            color: Colors.white,
                            size: 20,
                          ))),
                ],
              ),
            ),
            TextField(
              controller: NameController,
              autofocus: false,
              textAlign: TextAlign.center,
              scrollPadding:EdgeInsets.only(left: 100) ,

              

              
              
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 100),
                isCollapsed: true,
                isDense: true,
                constraints: BoxConstraints.loose(Size.fromHeight(35)),
            
                  prefixIcon: Text(
                    'Name',
                    style: AppTextStyles.unreadmessage,
                    textAlign:TextAlign.center,
                    softWrap: true,
                    textDirection: TextDirection.rtl,
                  ),
                  enabledBorder:UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)) ,
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey))),
                  
            )
          ],
        ),
      )),
    );
  }
}
