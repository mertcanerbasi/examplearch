import 'package:flutter/material.dart';

Future<T?> showCustomBottomSheet<T>(
        {required BuildContext context,
        required Widget Function(BuildContext) builder,
        bool useRootNavigator = false,
        RouteSettings? routeSettings}) =>
    showModalBottomSheet(
        context: context,
        constraints: BoxConstraints(
            maxWidth: 600, maxHeight: MediaQuery.of(context).size.height - 56),
        isScrollControlled: true,
        routeSettings: routeSettings,
        useRootNavigator: useRootNavigator,
        builder: (c) => SafeArea(
            left: false,
            right: false,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FractionallySizedBox(
                  widthFactor: 0.25,
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 24,
                    ),
                    child: Container(
                      height: 5,
                      decoration: BoxDecoration(
                        color: Theme.of(context).dividerColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(2.5)),
                      ),
                    ),
                  ),
                ),
                builder.call(c),
                SizedBox(
                  height: MediaQuery.of(c).viewInsets.bottom,
                )
              ],
            )));
