import "package:atk/pages/menu/admin/approved.dart";
import "package:atk/pages/menu/admin/retrieveitem.dart";
import "package:atk/pages/user/admin/error.dart";
import "package:atk/pages/user/admin/fpassword.dart";
import "package:atk/pages/menu/admin/additem.dart";
import "package:atk/pages/menu/admin/orderstatus.dart";
import "package:atk/pages/menu/user/itemrequest.dart";
import "package:atk/pages/menu/user/stockitem.dart";
import "package:atk/pages/menu/admin/rejected.dart";
// import "package:atk/pages/user/admin/settings.dart";
import "package:atk/router/routernamed.dart";
import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "../pages/menu/admin/dashboard.dart";
import "../pages/menu/admin/itemdetail.dart";
import "../pages/menu/user/approved.dart";
import "../pages/menu/user/dashboard.dart";
import "../pages/menu/admin/itemrequests.dart";
import "../pages/user/admin/login.dart";
import "../pages/user/admin/mainpage.dart";
import "../pages/menu/admin/stockitem.dart";
import "../pages/menu/user/itemdetail.dart";
import "../pages/menu/user/rejected.dart";
import "../pages/user/admin/register.dart";
// import "../providers/user.dart";

class MyRouter {
  GoRouter router = GoRouter(
      initialLocation: "/dashboard_admin",
      routes: [
        GoRoute(
          path: "/",
          name: RouterName.mainPageName,
          builder: (context, state) => const MainPage(),
        ),
        GoRoute(
          path: "/login",
          name: RouterName.loginPageName,
          pageBuilder: (context, state) {
            return const MaterialPage(child: LoginPage());
          },
        ),
        GoRoute(
            path: "/register",
            name: RouterName.registerPageName,
            pageBuilder: (context, state) {
              return const MaterialPage(child: RegisterPage());
            }),
        GoRoute(
            path: "/forgot_password",
            name: RouterName.forgotPassPage,
            pageBuilder: (context, state) {
              return const MaterialPage(child: ForgotPage());
            }),
        GoRoute(
            path: "/dashboard_admin",
            name: RouterName.dashboardAdminPage,
            pageBuilder: (context, state) {
              return MaterialPage(child: DashboardAdminPage());
            }),
        GoRoute(
            path: "/dashboard_user",
            name: RouterName.dashboardUserPage,
            pageBuilder: (context, state) {
              return MaterialPage(child: DashboardUserPage());
            }),
        // GoRoute(
        //     path: "/settings",
        //     name: RouterName.settingsPage,
        //     pageBuilder: (context, state) {
        //       return const MaterialPage(child: Settings());
        //     }),
        GoRoute(
            path: "/stock_item_admin",
            name: RouterName.stockItemAdminPage,
            pageBuilder: (context, state) {
              return const MaterialPage(child: StockItemAdmin());
            }),
        GoRoute(
            path: "/stock_item_user",
            name: RouterName.stockItemUserPage,
            pageBuilder: (context, state) {
              return const MaterialPage(child: StockItemUser());
            }),
        GoRoute(
            path: "/add_item",
            name: RouterName.addItemAdminPage,
            pageBuilder: (context, state) {
              return const MaterialPage(child: AddItem());
            }),
        GoRoute(
            path: "/item_request_user",
            name: RouterName.itemRequestsUserPage,
            pageBuilder: (context, state) {
              return const MaterialPage(child: ItemRequest());
            }),
        GoRoute(
            path: "/approved_order_admin",
            name: RouterName.approvedOrderAdminPage,
            pageBuilder: (context, state) {
              return const MaterialPage(child: AprrovedOrderAdmin());
            }),
        GoRoute(
            path: "/rejected_order_admin",
            name: RouterName.rejectedOrderAdminPage,
            pageBuilder: (context, state) {
              return const MaterialPage(child: RejectedOrderAdmin());
            }),
        GoRoute(
            path: "/order_status_admin",
            name: RouterName.orderStatusAdminPage,
            pageBuilder: (context, state) {
              return const MaterialPage(child: OrderStatusAdmin());
            }),
        GoRoute(
            path: "/approved_order_user",
            name: RouterName.approvedOrderUserPage,
            pageBuilder: (context, state) {
              return const MaterialPage(child: AprrovedOrderUser());
            }),
        GoRoute(
            path: "/rejected_order_user",
            name: RouterName.rejectedOrderUserPage,
            pageBuilder: (context, state) {
              return const MaterialPage(child: RejectedOrderUser());
            }),
        GoRoute(
            path: "/item_request_admin",
            name: RouterName.itemRequestsAdminPage,
            pageBuilder: (context, state) {
              return const MaterialPage(child: ItemRequestAdmin());
            }),
        GoRoute(
            path: "/item_retrieve_admin",
            name: RouterName.itemRetrieveAdminPage,
            pageBuilder: (context, state) {
              return const MaterialPage(child: ItemRetrieveAdmin());
            }),
        GoRoute(
          path: "/item_details_admin/:index",
          name: RouterName.itemDetailAdminPage,
          pageBuilder: (context, state) {
            final int index = int.parse(state.pathParameters['index']!);
            return MaterialPage(
              child: ItemDetailsAdmin(
                itemIndex: index,
              ),
            );
          },
        ),
        GoRoute(
          path: "/item_details_user/:index",
          name: RouterName.itemDetailUserPage,
          pageBuilder: (context, state) {
            final int index = int.parse(state.pathParameters['index']!);
            return MaterialPage(
              child: ItemDetailsUser(itemIndex: index),
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
