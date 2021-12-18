import 'package:flutter/material.dart';
import 'package:mvvm_add_user_project/constants/colors.dart';
import 'package:mvvm_add_user_project/users_list/models/users_list_model.dart';

import 'app_title.dart';

class UserListRow extends StatelessWidget {
  final UsersListModel usersListModel;
  final Function()? onTap;
  const UserListRow({required this.usersListModel, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
            ),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          color: CustomColors.boxColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTitle(text: usersListModel.name,),
              Text(usersListModel.email,style: TextStyle(color: CustomColors.primaryTextColor),),
            ],
          ),
        ),
      ),
    );
  }
}
