import 'package:ader/application/bussiness_logic/cubit/initial_cubit.dart';
import 'package:ader/domain/core/color/colors.dart';
import 'package:ader/domain/core/constants/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    sizeFinder(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      String nextRoute = await context.read<InitialCubit>().nextScreenRoute();
      Future.delayed(
        const Duration(seconds: 2),
        () {
          Navigator.of(context).pushReplacementNamed(nextRoute);
        },
      );
    });
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: sWidth * 0.5,
              height: sWidth * 0.5,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                'assets/ader white.png',
              ))),
            ),
          ),
        ],
      ),
    );
  }
}
