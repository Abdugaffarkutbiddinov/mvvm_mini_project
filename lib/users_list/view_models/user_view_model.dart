import 'package:flutter/cupertino.dart';
import 'package:mvvm_add_user_project/users_list/models/user_error.dart';
import 'package:mvvm_add_user_project/users_list/models/users_list_model.dart';
import 'package:mvvm_add_user_project/users_list/repo/api_status.dart';
import 'package:mvvm_add_user_project/users_list/repo/user_services.dart';

class UsersViewModel extends ChangeNotifier {
  bool _loading = false;
  List<UsersListModel> _usersListModel = [];
  late UserError _userError;
  late UsersListModel _selectedUser;
  UsersListModel _addingUser = UsersListModel();
  UsersViewModel() {
    getUsers();
  }
  bool get loading => _loading;

  List<UsersListModel> get userListModel => _usersListModel;

  UserError get userError => _userError;
  UsersListModel get selectedUser => _selectedUser;
  UsersListModel get addingUser => _addingUser;
  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setUsersListModel(List<UsersListModel> usersListModel) {
    _usersListModel = usersListModel;
  }

  setUserError(UserError userError) {
    _userError = userError;
  }
  setSelectedUser(UsersListModel usersListModel) {
    _selectedUser = usersListModel;
  }
  addUsers() async{
    if(!isValid()) {
      return;
    }
    _usersListModel.add(addingUser);
    print(addingUser);
    _addingUser = UsersListModel();
    notifyListeners();
    return true;
  }
  isValid() {
  if(addingUser.name.isEmpty) {
    return false;
  }
  if(addingUser.email.isEmpty) {
    return false;
  }
    return true;
  }

  getUsers() async {
    setLoading(true);
    var response = await UserServices.getUsers();
    if (response is Success) {
      setUsersListModel(response.response as List<UsersListModel>);
    }
    if (response is Failure) {
      UserError userError = UserError(
          code: response.code, message: response.errorResponse);
      setUserError(userError);
    }
    setLoading(false);
  }
}