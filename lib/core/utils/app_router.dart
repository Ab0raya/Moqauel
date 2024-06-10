
import 'package:go_router/go_router.dart';
import 'package:shoghl/features/laborers_feature/presentation/views/laborers_view.dart';
import '../../features/home_feature/presentation/views/account_details_view.dart';
import '../../features/home_feature/presentation/views/home_view.dart';
import '../../features/laborers_feature/presentation/views/laborer_attendance_view.dart';

abstract class AppRouter{
  static String homeViewPath ='/HomeView';
  static String accountDetailsViewPath ='/accountDetailsView';
  static String laborerViewPath ='/laborerView';
  static String laborerAttendanceViewPath ='/attendanceView';
  static GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeView(),
      ), GoRoute(
        path: homeViewPath,
        builder: (context, state) => const HomeView(),
      ),GoRoute(
        path: accountDetailsViewPath,
        builder: (context, state) =>  AccountDetailsView(accountData: state.extra as  Map<String, dynamic>,),
      ),GoRoute(
        path: laborerAttendanceViewPath,
        builder: (context, state) =>  LaborerAttendanceView(laborerId: state.extra as int,),
      ),
      GoRoute(
        path: laborerViewPath,
        builder: (context, state) =>  LaborersView(),
      ),
    ],
  );
}