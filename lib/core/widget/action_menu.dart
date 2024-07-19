// Flutter imports:

import 'package:flutter/material.dart';
import 'package:examplearch/core/widget/sheet.dart';

Future<T?> showActionMenu2<T>(BuildContext context,
    {required List<Widget> Function(BuildContext) actionsBuilder,
    bool useRootNavigator = true}) {
  return showCustomBottomSheet(
      context: context,
      useRootNavigator: useRootNavigator,
      builder: (c) => ListView(
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            children: ListTile.divideTiles(
                    context: context, tiles: actionsBuilder.call(c))
                .toList(),
          ));
}
