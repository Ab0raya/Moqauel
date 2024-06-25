part of 'theme_cubit.dart';

@immutable
class ThemeState {
  final Color primaryColor;
  final Color bgColor;
  final Color whiteColor;

  const ThemeState({
    required this.primaryColor,
    required this.bgColor,
    required this.whiteColor,
  });

  factory ThemeState.initial() {
    return const ThemeState(
      primaryColor: Color(0xffd2f446),
      bgColor: Color(0xff161616),
      whiteColor: Color(0xffffffff),
    );
  }

  ThemeState copyWith({
    Color? primaryColor,
    Color? bgColor,
    Color? whiteColor,
  }) {
    return ThemeState(
      primaryColor: primaryColor ?? this.primaryColor,
      bgColor: bgColor ?? this.bgColor,
      whiteColor: whiteColor ?? this.whiteColor,
    );
  }
}
