
import 'package:go_router/go_router.dart';
import '../../features/home_feature/presentation/views/account_details_view.dart';
import '../../features/home_feature/presentation/views/home_view.dart';

abstract class AppRouter{
  static String homeViewPath ='/HomeView';
  static String accountDetailsViewPath ='/accountDetailsView';
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
      ),
    ],
  );
}