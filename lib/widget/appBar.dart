import 'package:assignment/constants/colors.dart';
import 'package:flutter/material.dart';

AppBar mainAppBar(BuildContext context,
        {required String title,
        List<Widget>? actions,
        Widget? leading,
        bool automaticallyImplyLeading = true}) =>
    AppBar(
      title: Text(
        title,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      leading: leading ?? (automaticallyImplyLeading ? null : Container()),
      automaticallyImplyLeading: automaticallyImplyLeading,
      // elevation: 12.0,
      // shadowColor: Colors.black12,
      actions: actions,
    );
