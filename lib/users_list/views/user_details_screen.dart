import 'package:flutter/material.dart';
import 'package:mvvm_add_user_project/components/app_title.dart';
import 'package:mvvm_add_user_project/constants/colors.dart';
import 'package:mvvm_add_user_project/users_list/view_models/user_view_model.dart';
import 'package:provider/provider.dart';

class UserDetailsScreen extends StatelessWidget {
  const UserDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UsersViewModel usersViewModel = context.watch<UsersViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(usersViewModel.selectedUser.name,style: TextStyle(color: CustomColors.primaryTextColor),)),
        backgroundColor: CustomColors.appBarColor,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTitle(
              text: usersViewModel.selectedUser.name,
            ),
            Text(usersViewModel.selectedUser.email),
          ],
        ),
      ),
    );
  }
}
