import 'package:flutter/material.dart';
import 'package:mvvm_add_user_project/constants/colors.dart';
import 'package:mvvm_add_user_project/constants/strings.dart';
import 'package:mvvm_add_user_project/users_list/utils/navigation_utils.dart';
import 'package:mvvm_add_user_project/users_list/views/add_users_card.dart';

import 'hero_dialog_route.dart';

class AddUserButton extends StatelessWidget {
  const AddUserButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: GestureDetector(
        onTap: () {
          openAddUser(context);
        },
        child: Hero(
          tag: Strings.heroAddUser,
          child: Material(
            color: CustomColors.primaryTextColor,
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
            child: const Icon(
              Icons.add_rounded,
              size: 56,
            ),
          ),
        ),
      ),
    );
  }
}

