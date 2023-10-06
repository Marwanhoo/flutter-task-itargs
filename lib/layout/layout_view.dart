import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task/views/home_view.dart';
import 'package:flutter_task/views/more_view.dart';
import '../components/components.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: wavyTextAnimation,
          bottom: TabBar(
            tabs: [
              buildTabWithIconAndText(
                  text: translateText(context: context, textJson: "home"),
                  icon: CupertinoIcons.home),
              buildTabWithIconAndText(
                  text: translateText(context: context, textJson: "more"),
                  icon: Icons.more_horiz),
            ],
          ),
        ),
        body: const TabBarView(
          children: [HomeView(), MoreView()],
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(
            Icons.add,
          ),
          onPressed: () {
           showCustomAlertDialog(context);
          },
        ),
      ),
    );
  }
}
