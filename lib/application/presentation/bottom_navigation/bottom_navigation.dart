import 'package:ader/application/presentation/home/home_screen.dart';
import 'package:ader/application/presentation/leads/leads_screen.dart';
import 'package:ader/application/presentation/marketing/marketing_screen.dart';
import 'package:ader/application/presentation/search/search.dart';
import 'package:ader/design/design_screen.dart';
import 'package:ader/domain/core/color/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavigationWidget extends StatefulWidget {
  const BottomNavigationWidget({super.key});

  @override
  _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget>
    with SingleTickerProviderStateMixin {
  late int currentPage;
  late TabController tabController;

  @override
  void initState() {
    currentPage = 0;
    tabController = TabController(length: 5, vsync: this);
    tabController.animation!.addListener(
      () {
        final value = tabController.animation!.value.round();
        if (value != currentPage && mounted) {
          changePage(value);
        }
      },
    );
    super.initState();
  }

  void changePage(int newPage) {
    setState(() {
      currentPage = newPage;
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    late double sWidth;
    final size = MediaQuery.of(context).size;
    sWidth = size.width;

    Color getColor(int index) {
      return currentPage == index ? AppColors.kPink : AppColors.kGrey;
    }

    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: BottomBar(
        fit: StackFit.expand,
        icon: (width, height) => Center(
          child: IconButton(
            padding: EdgeInsets.zero,
            onPressed: null,
            icon: Icon(
              Icons.arrow_upward_rounded,
              color: AppColors.kBlack,
              size: width,
            ),
          ),
        ),
        borderRadius: BorderRadius.circular(500),
        duration: const Duration(seconds: 1),
        curve: Curves.decelerate,
        showIcon: true,
        barColor: AppColors.kWhite,
        start: 2,
        end: 0,
        offset: 10,
        barAlignment: Alignment.bottomCenter,
        iconHeight: 35,
        iconWidth: 35,
        reverse: false,
        iconDecoration: BoxDecoration(
          color: AppColors.kPink,
          borderRadius: BorderRadius.circular(500),
        ),
        hideOnScroll: true,
        scrollOpposite: false,
        onBottomBarHidden: () {},
        onBottomBarShown: () {},
        body: (context, controller) => TabBarView(
          controller: tabController,
          dragStartBehavior: DragStartBehavior.down,
          physics: const BouncingScrollPhysics(),
          children: const [
            HomeScreen(),
            SearchScreen(),
            DesignScreen(),
            LeadsScreen(),
            MarketingScreen()
          ],
        ),
        child: SizedBox(
          height: sWidth * 0.17,
          child: TabBar(
            controller: tabController,
            unselectedLabelColor: AppColors.kGrey,
            indicatorColor: Colors.transparent,
            tabs: [
              Tab(
                icon: Icon(
                  Icons.home,
                  color: getColor(0),
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.search,
                  color: getColor(1),
                ),
              ),
              Tab(
                icon: FaIcon(
                  FontAwesomeIcons.arrowUp19,
                  color: getColor(2),
                ),
              ),
              Tab(
                icon: FaIcon(
                  FontAwesomeIcons.userTag,
                  color: getColor(3),
                ),
              ),
             Tab(
  icon: CircleAvatar(
    radius: 50,
    backgroundColor: AppColors.kPink,
    child: Icon(
      Icons.rocket_launch,
      color: AppColors.kWhite,
    ),
  ),
),

            ],
          ),
        ),
      ),
    );
  }
}
