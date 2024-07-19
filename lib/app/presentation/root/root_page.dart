import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:examplearch/app/presentation/root/root_page.vm.dart';
import 'package:examplearch/core/base/base_widget.dart';
import 'package:examplearch/core/util/context_ex.dart';
import 'package:route_map/route_map.dart';

@RouteMap(name: "/")
class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);
  @override
  _RootState createState() => _RootState();
}

class _RootState extends BaseState<RootPageViewModel, RootPage> {
  @override
  void initState() {
    super.initState();
    viewModel.getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //BottomNavigationBar with 5 items
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: viewModel.currentIndex,
        onTap: (index) {
          viewModel.changePage(index);
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: context.appLocalizations.home,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.fitness_center,
            ),
            label: context.appLocalizations.workout,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: context.appLocalizations.logs,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_events_outlined),
            label: context.appLocalizations.achievements,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: context.appLocalizations.profile,
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
        child: PageView(
          onPageChanged: (index) {
            viewModel.changePage(index);
          },
          children: viewModel.pages,
        ),
      ),
    );
  }
}
