import "package:atk/pages/error.dart";
import "package:atk/pages/menu/additem.dart";
import "package:atk/pages/menu/stockitem.dart";
import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "../pages/dashboard.dart";
import "../pages/login.dart";
import "../pages/mainpage.dart";
import "package:provider/provider.dart";
import "../providers/user.dart";

class MyRouter {
  GoRouter router = GoRouter(
      routes: [
        GoRoute(
          path: "/",
          name: "main",
          builder: (context, state) => const MainPage(),
        ),
        GoRoute(
          path: "/login",
          name: "login",
          pageBuilder: (context, state) {
            return const MaterialPage(child: LoginPage());
          },
        ),
        GoRoute(
            path: "/dashboard_admin",
            name: "dashboard-admin",
            pageBuilder: (context, state) {
              return MaterialPage(child: DashboardAdminPage());
            }),
        GoRoute(
            path: "/dashboard_user",
            name: "dashboard-user",
            pageBuilder: (context, state) {
              return MaterialPage(child: DashboardUserPage());
            }),
        GoRoute(
            path: "/stock_item_user",
            name: "stock-item-user",
            pageBuilder: (context, state) {
              return MaterialPage(child: StockItemUser());
            }),
        GoRoute(
            path: "/stock_item_admin",
            name: "stock-item-admin",
            pageBuilder: (context, state) {
              return MaterialPage(child: StockItemAdmin());
            }),
        GoRoute(
            path: "/add_item",
            name: "add-item",
            pageBuilder: (context, state) {
              return MaterialPage(child: AddItem());
            }),
      ],
      // redirect: (BuildContext context, GoRouterState state) {
      //   if (Provider.of<User>(context, listen: false).isLogin) {
      //     return null;
      //   } else {
      //     return '/login';
      //   }
      // },
      errorPageBuilder: (context, state) {
        return MaterialPage(child: ErrorPage(key: state.pageKey));
      });
}
