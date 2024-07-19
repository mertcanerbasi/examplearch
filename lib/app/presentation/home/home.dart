import 'package:flutter/material.dart';
import 'package:examplearch/app/presentation/home/home.vm.dart';
import 'package:examplearch/core/base/base_widget.dart';

import 'package:route_map/route_map.dart';

@RouteMap()
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends BaseState<HomeViewModel, HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
