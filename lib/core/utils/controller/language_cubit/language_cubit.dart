import 'package:bloc/bloc.dart';

import 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(LanguageInitial());

  bool isArabic = true;

  String language = 'ar';

  void languageToggle() {
    if (language == 'ar') {
      language = 'en';
      isArabic = false;
      emit(LanguageChanged());
    } else {
      language = 'ar';
      isArabic = true;
      emit(LanguageChanged());
    }
  }

  void setEnglish() {
    language = 'en';
    isArabic = false;
    emit(LanguageChanged());
  }

  void setArabic() {
    language = 'ar';
    isArabic = true;
    emit(LanguageChanged());
  }
}
