import 'package:flutter/material.dart';
import 'package:mvvm_add_user_project/constants/colors.dart';
import 'package:mvvm_add_user_project/constants/strings.dart';
import 'package:mvvm_add_user_project/users_list/view_models/user_view_model.dart';
import 'package:provider/provider.dart';

class AddUserPopupCard extends StatelessWidget {

  const AddUserPopupCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UsersViewModel usersViewModel = context.watch<UsersViewModel>();
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Hero(
          tag: Strings.heroAddUser,
          child: Material(
            color: CustomColors.primaryTextColor,
            elevation: 2,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          hintText: "Name",
                          fillColor: Colors.white,
                          border: InputBorder.none),
                      onChanged: (val) async {
                        usersViewModel.addingUser.name = val;
                      },
                    ),
                    const Divider(
                      color: Colors.white,
                      thickness: 0.2,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          hintText: "email",
                          fillColor: Colors.white,
                          border: InputBorder.none),
                      onChanged: (val) async {
                        usersViewModel.addingUser.email = val;
                      },
                    ),
                    const Divider(
                      color: Colors.white,
                      thickness: 0.2,
                    ),
                    FlatButton(
                      onPressed: () async {
                        bool userAdded = await usersViewModel.addUsers();
                        if (!userAdded) {
                          return;
                        }
                        Navigator.pop(context);
                      },
                      child: const Text('Add'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
