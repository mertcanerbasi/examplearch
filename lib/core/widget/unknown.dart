// Flutter imports:

import 'package:flutter/material.dart';
import 'package:examplearch/core/res/text_style.dart';
import 'package:examplearch/core/util/context_ex.dart';
import 'package:examplearch/core/widget/loading.dart';

class UnknownPage extends StatefulWidget {
  const UnknownPage({Key? key}) : super(key: key);

  @override
  UnknownPageState createState() => UnknownPageState();
}

class UnknownPageState extends State<UnknownPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Expanded(
              child: LoadingView(
                width: 200,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 24),
              child: Column(
                children: [
                  Text(
                    context.appLocalizations.pageNotFound,
                    textAlign: TextAlign.center,
                    style: AppTextStyle.headlineRegular,
                  ),
                  Text(
                    context.appLocalizations.sadPageNotFound,
                    textAlign: TextAlign.center,
                    style: AppTextStyle.bodyMedium,
                  ),
                ],
              ),
            ),
            if (Navigator.canPop(context))
              ElevatedButton(
                  onPressed: () {
                    Navigator.maybePop(context);
                  },
                  child: Text(context.appLocalizations.back)),
          ],
        ),
      ),
    );
  }
}
