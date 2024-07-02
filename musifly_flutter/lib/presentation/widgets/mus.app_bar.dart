import 'package:flutter/material.dart';

class MusAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MusAppBar({
    super.key,
    this.actions,
    this.showBottomBorder = true,
    this.centerTitle,
    this.bgColor = const Color(0x0002ef5b),
  });
  final List<Widget>? actions;
  final bool showBottomBorder;
  final bool? centerTitle;
  final Color? bgColor;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              height: 119,
              width: 150,
              // padding: const EdgeInsets.only(left: 130),
              child: AppBar(
                title: const Text('MUSIFLY',
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                        fontSize: 30)),
                backgroundColor: bgColor,
              )),
        ],
      ),
    );
  }

  @override // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
