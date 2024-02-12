
import 'package:flutter/material.dart';
import 'package:onlineforum_fe/views/account_page.dart';


class AccountRoute {
  static Widget Function(BuildContext context) init(BuildContext context) {
    return (context)  {
      return const AccountPage();
    };
  }
}