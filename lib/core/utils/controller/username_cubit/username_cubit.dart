import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../SQlite/local_database/local_db.dart';

part 'username_state.dart';

class UsernameCubit extends Cubit<UsernameState> {
  UsernameCubit() : super(UsernameInitial());
  LocalDatabase sqlDB = LocalDatabase();

  void addUsername({required String username, required int avatar}) async {
    int insert = await sqlDB.insertUsername(username: username, avatar: avatar);
    if (insert > 1) {
      emit(UsernameAddedSuccessfully());
    }
  }

  void editUsername({required String newUsername, required int userId}) async {
    int update =
        await sqlDB.editUserName(newUsername: newUsername, userId: userId);
    if (update > 0) {
      emit(UsernameEditedSuccessfully());
    } else {}
  }

  void editUserAvatar({required int newAvatar, required int userId}) async {
    int update =
        await sqlDB.editUserAvatar(newAvatar: newAvatar, userId: userId);
    if (update > 0) {
      emit(UserAvatarEditedSuccessfully());
    } else {}
  }

  getUsername() async {
    var username = await sqlDB.getUsername();
    return username[0]['username'];
  }

  getAvatar() async {
    var username = await sqlDB.getUsername();
    return username[0]['avatar'];
  }


  void addInitialViewValueInserted({required bool isOpened}) async {
    int insert = await sqlDB.insertOpenOnboarding(isOpened: isOpened);
    if (insert > 1) {
      emit(InitialViewValueInserted());
    }
  }

   getInitialViewValue()async{
    var isOpened = await sqlDB.getOpenOnboarding();
    return isOpened[0]['onboardingOpened'];
    print('is opened================${isOpened[0]}');
  }
}
