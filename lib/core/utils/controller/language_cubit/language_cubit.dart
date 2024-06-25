import 'package:bloc/bloc.dart';

import 'language_state.dart';



class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(LanguageInitial());
  String language = 'ar';
  void changeLanguage(){
    if(language == 'ar'){
      language = 'en';
      emit(LanguageChanged());
    }else{
      language = 'ar';
      emit(LanguageChanged());
    }
  }
}
