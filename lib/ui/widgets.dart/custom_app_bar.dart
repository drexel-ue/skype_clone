import 'package:flutter/material.dart';
import 'package:skype_clone/utils/skype_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key key,
    @required this.title,
    @required this.actions,
    @required this.leading,
    @required this.centerTitle,
  }) : super(key: key);

  final Widget title;

  final List<Widget> actions;

  final Widget leading;

  final bool centerTitle;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 10);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: SkypeColors.blackColor,
        border: Border(
          bottom: BorderSide(
            color: SkypeColors.separatorColor,
            width: 1.4,
          ),
        ),
      ),
      child: AppBar(
        backgroundColor: SkypeColors.blackColor,
        elevation: 0,
        title: title,
        actions: actions,
        leading: leading,
        centerTitle: centerTitle,
      ),
    );
  }
}
