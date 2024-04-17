import 'dart:async';

import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  const Notifications({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  State<Notifications> createState() => _NotificationsState();

  static _NotificationsState of(BuildContext context) {
    return context.findAncestorStateOfType<_NotificationsState>()!;
  }
}

class _NotificationsState extends State<Notifications>
    with TickerProviderStateMixin {
  final _container = _NotificationsContainer();

  @override
  void dispose() {
    _container.dispose();
    super.dispose();
  }

  void removeNotification(_NotificationDescription desc) {
    _container.removeNotification(desc, animate: true);
  }

  void showNotification(
    String content, {
    duration = const Duration(seconds: 2),
    slideDuration = const Duration(milliseconds: 550),
    Widget button = const SizedBox(),
    bool showClose = true,
    VoidCallback? onTap,
  }) {
    _container.addNotification(
      _NotificationDescription(
        content,
        controller: AnimationController(
          vsync: this,
          duration: slideDuration,
          lowerBound: 0.0,
          upperBound: 1.0,
        ),
        duration: duration,
        parentContainer: _container,
        button: button,
        showClose: showClose,
        onTap: onTap,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _container,
      builder: (_, child) {
        return Stack(
          textDirection: TextDirection.ltr,
          children: [
            child!,
            ..._container.notifications.map(
              (e) => _NotificationWidget(
                notification: e,
              ),
            ),
          ],
        );
      },
      child: SizedBox.expand(child: widget.child),
    );
  }
}

class _NotificationDescription {
  final _NotificationsContainer parentContainer;
  final String content;
  final AnimationController controller;
  final Duration duration;
  final Widget button;
  final bool showClose;
  final VoidCallback? onTap;
  Timer? timer;

  _NotificationDescription(
    this.content, {
    required this.controller,
    required this.duration,
    required this.parentContainer,
    required this.button,
    required this.showClose,
    this.onTap,
  }) {
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        timer = Timer(duration, controller.reverse);
      } else if (status == AnimationStatus.dismissed) {
        parentContainer.removeNotification(this);
      }
    });
    controller.forward();
  }

  void dispose() {
    timer?.cancel();
    controller.dispose();
  }

  void forceCloseAnimation() {
    timer?.cancel();
    controller.reverse();
  }
}

class _NotificationWidget extends StatefulWidget {
  final _NotificationDescription notification;

  const _NotificationWidget({Key? key, required this.notification})
      : super(key: key);

  @override
  State<_NotificationWidget> createState() => __NotificationWidgetState();
}

class __NotificationWidgetState extends State<_NotificationWidget> {
  final globalKey = GlobalKey();
  double? height;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        height = globalKey.currentContext?.size?.height;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final h = height;

    if (h == null) {
      return Offstage(offstage: true, child: not(key: globalKey));
    }

    final c = widget.notification.controller;

    return AnimatedBuilder(
      animation: c,
      builder: (ctx, child) {
        return Positioned(
          top: h * (Curves.easeOutCubic.transform(c.value) - 1),
          height: h,
          left: 0,
          right: 0,
          child: Material(
            child: child!,
          ),
        );
      },
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: widget.notification.onTap,
        child: not(),
      ),
    );
  }

  Widget not({Key? key}) {
    return Container(
      key: key,
      padding: const EdgeInsets.only(
        left: 20.0,
        right: 20.0,
        bottom: 10.0,
      ),
      color: Theme.of(context).colorScheme.primary,
      child: MediaQuery(
        data: MediaQueryData.fromView(View.of(context)),
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: SafeArea(
            bottom: false,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          widget.notification.content.trim(),
                        ),
                      ),
                    ),
                    if (widget.notification.showClose)
                      GestureDetector(
                        onTap: () {
                          Notifications.of(context)
                              .removeNotification(widget.notification);
                        },
                        child: const SizedBox.square(
                          dimension: 45.0,
                          child: Icon(
                            Icons.close,
                            color: Colors.white,
                          ),
                        ),
                      )
                  ],
                ),
                widget.notification.button,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NotificationsContainer with ChangeNotifier {
  final List<_NotificationDescription> _notifications = [];

  List<_NotificationDescription> get notifications => _notifications;

  void addNotification(_NotificationDescription desc) {
    _notifications.add(desc);
    notifyListeners();
  }

  void removeNotification(
    _NotificationDescription desc, {
    bool animate = false,
  }) {
    if (animate) {
      desc.forceCloseAnimation();
    } else {
      _notifications.remove(desc);
      desc.dispose();
      notifyListeners();
    }
  }
}
