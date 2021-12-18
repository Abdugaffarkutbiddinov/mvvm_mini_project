import 'package:flutter/material.dart';
import 'package:mvvm_add_user_project/components/add_user_buttom.dart';
import 'package:mvvm_add_user_project/components/app_loading.dart';
import 'package:mvvm_add_user_project/components/app_title.dart';
import 'package:mvvm_add_user_project/components/user_list_row.dart';
import 'package:mvvm_add_user_project/constants/colors.dart';
import 'package:mvvm_add_user_project/users_list/models/users_list_model.dart';
import 'package:mvvm_add_user_project/users_list/utils/navigation_utils.dart';
import 'package:mvvm_add_user_project/users_list/view_models/user_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UsersViewModel usersViewModel = context.watch<UsersViewModel>();
    return Scaffold(
      backgroundColor: CustomColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: CustomColors.appBarColor,
        title: Center(
          child: Text(
            "AddUser",
            style: TextStyle(color: CustomColors.primaryTextColor),
          ),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [_ui(usersViewModel)],
            ),
          ),
          const Align(
            alignment: Alignment.bottomRight,
            child: AddUserButton(),
          )
        ],
      ),
    );
  }

  _ui(UsersViewModel usersViewModel) {
    if (usersViewModel.loading) {
      return AppLoading();
    }
    return Expanded(
      child: ListView.separated(
          itemBuilder: (context, index) {
            UsersListModel userModel = usersViewModel.userListModel[index];
            return UserListRow(
              usersListModel: userModel,
              onTap: () async {
                usersViewModel.setSelectedUser(userModel);
                openUserDetails(context);
              },
            );
          },
          separatorBuilder: (context, index) => Divider(),
          itemCount: usersViewModel.userListModel.length),
    );
  }
}
