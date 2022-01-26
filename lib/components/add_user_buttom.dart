import 'package:flutter/material.dart';
import 'package:mvvm_add_user_project/constants/colors.dart';
import 'package:mvvm_add_user_project/constants/strings.dart';
import 'package:mvvm_add_user_project/users_list/utils/navigation_utils.dart';

class AddUserButton extends StatelessWidget {
  const AddUserButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        openAddUser(context);
      },
      heroTag: Strings.heroAddUser,
      child: Material(
        color: CustomColors.primaryTextColor,
        elevation: 2,
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        child: const Icon(
          Icons.add_rounded,
          color: Color(0xff1F1B24),
          size: 56,
        ),
      ),
    );
  }
}