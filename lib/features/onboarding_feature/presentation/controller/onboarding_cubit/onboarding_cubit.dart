import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../generated/l10n.dart';
import 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial());
getOnboardingData({required BuildContext context}){return  [
  {
    'index': 0,
    'title': S.of(context).accounts,
    'Description':S.of(context).description0,
  },
  {
    'index': 1,
    'title': S.of(context).laborers,
    'Description':S.of(context).description1,
  },
  {
    'index': 2,
    'title': S.of(context).invoice,
    'Description':S.of(context).description2,
  },
  {
    'index': 3,
    'title': S.of(context).archive,
    'Description':S.of(context).description3,
  },
];}

  int currentIndex = 0;
  int avatarIndex = 1;

  void changeAvatarINde(int index){
    avatarIndex = index;
    emit(IndexChangedSuccessfully());
  }

  void changeIndex(int page) {
    currentIndex = page;
    emit(IndexChangedSuccessfully());
  }



}
