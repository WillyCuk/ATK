import "package:atk/pages/error.dart";
import "package:atk/pages/fpassword.dart";
import "package:atk/pages/menu/additem.dart";
import "package:atk/pages/menu/itemrequest.dart";
import "package:atk/pages/menu/stockitem.dart";
import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "../pages/dashboard.dart";
import "../pages/login.dart";
import "../pages/mainpage.dart";
import "package:provider/provider.dart";
import "../pages/menu/itemdetails.dart";
import "../pages/register.dart";
import "../providers/itemlist.dart";
import "../providers/user.dart";

class MyRouter {
  GoRouter router = GoRouter(
      initialLocation: "/item_request",
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
            path: "/register",
            name: "register",
            pageBuilder: (context, state) {
              return const MaterialPage(child: RegisterPage());
            }),
        GoRoute(
            path: "/forgot_password",
            name: "forgot-password",
            pageBuilder: (context, state) {
              return const MaterialPage(child: ForgotPage());
            }),
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
              return const MaterialPage(child: StockItemUser());
            }),
        GoRoute(
            path: "/stock_item_admin",
            name: "stock-item-admin",
            pageBuilder: (context, state) {
              return const MaterialPage(child: StockItemAdmin());
            }),
        GoRoute(
            path: "/add_item",
            name: "add-item",
            pageBuilder: (context, state) {
              return const MaterialPage(child: AddItem());
            }),
        GoRoute(
            path: "/item_request",
            name: "item-request",
            pageBuilder: (context, state) {
              return const MaterialPage(child: ItemRequest());
            }),
        GoRoute(
          path: "/item_details_admin/:index",
          name: "item-details_admin",
          pageBuilder: (context, state) {
            final int index =
                int.tryParse(state.pathParameters['index'] ?? '') ?? -1;
            final item = context.watch<ItemList>().items[index];
            return MaterialPage(
              child: ItemDetailsAdmin(
                item: item,
                index: index,
              ),
            );
          },
        ),
        GoRoute(
          path: "/item_details_user/:index",
          name: "item-details_user",
          pageBuilder: (context, state) {
            debugPrint(state.pathParameters['index'].toString());
            final int index =
                int.tryParse(state.pathParameters['index'] ?? '') ?? -1;
            final item = context.watch<ItemList>().items[index];
            return MaterialPage(
              child: ItemDetailsUser(
                item: item,
              ),
            );
          },
        ),
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
