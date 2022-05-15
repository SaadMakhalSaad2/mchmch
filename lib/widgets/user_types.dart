import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mchmch/my_firebase_services.dart';
import 'package:mchmch/widgets/login_button.dart';
import 'package:mchmch/widgets/primary_button.dart';
import 'package:page_transition/page_transition.dart';
import '../resources/colors.dart';
import '../screens/home.dart';
import '../screens/wrapper.dart';

class UserTypes extends StatefulWidget {
  const UserTypes({Key? key}) : super(key: key);

  @override
  State<UserTypes> createState() => _UserTypesState();
}

class _UserTypesState extends State<UserTypes> {
  int userType = -1;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 16,
        ),
        GestureDetector(
          onTap: () => setState(() {
            userType = 1;
          }),
          child: LoginButton(
            bgColor: userType == 1 ? MyColors().primaryColor : Colors.white,
            icon: const SizedBox.shrink(),
            text: 'متبني   |   عايز اتبني قطة ',
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        GestureDetector(
          onTap: () => setState(() {
            userType = 2;
          }),
          child: LoginButton(
            bgColor: userType == 2 ? MyColors().primaryColor : Colors.white,
            icon: const SizedBox.shrink(),
            text: 'عارض   |   عندي قطط للتبني ',
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
        ),
        PrimaryButton(
          text: 'تــم',
          onClick: _moveHome,
        )
      ],
    );
  }

  _moveHome() {
    if (userType == -1) {
      MyFirebaseServices().snack(context, 'اختر نوع المستخدم');
      return;
    }

    MyFirebaseServices().updateData({'type': userType},
        'users/${FirebaseAuth.instance.currentUser!.uid}').then((value) {
      if (value) {
        Navigator.push(
            context,
            PageTransition(
                type: PageTransitionType.leftToRight,
                duration: const Duration(milliseconds: 300),
                child: Wrapper()));
      } else {
        MyFirebaseServices().snack(context, 'Failed to update profile');
      }
    });
  }
}
