import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_add_user_project/components/hero_dialog_route.dart';
import 'package:mvvm_add_user_project/users_list/views/user_details_screen.dart';
import 'package:mvvm_add_user_project/users_list/views/add_users_card.dart';

void openUserDetails(BuildContext context) async {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => UserDetailsScreen(),
    ),
  );
}

void openAddUser(BuildContext context) async {
  Navigator.push(
    context,
    HeroDialogRoute(
      builder: (context) => AddUserPopupCard(),
    ),
  );
}