import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yipl_app/provider/user_provider.dart';
import 'package:yipl_app/widgets/user_detail_view.dart';

// ignore: must_be_immutable
class UserDetailScreen extends StatelessWidget {
  static const String routeId = '/user_detail_screen';

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments;
    return UserDetailView(id);
  }
}
