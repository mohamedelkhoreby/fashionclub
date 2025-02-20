import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../app/app_prefs.dart';
import '../../app/dependency_injection.dart';
import '../resources/assets_manager.dart';
import '../resources/constant_manager.dart';
import '../resources/routes_manager.dart';

class ShimmerView extends StatefulWidget {
  const ShimmerView({super.key});

  @override
  ShimmerViewState createState() => ShimmerViewState();
}

class ShimmerViewState extends State<ShimmerView> {
  Timer? _timer;
  final AppPreferences _appPreferences = instance<AppPreferences>();

  _startDelay() {
    _timer = Timer(const Duration(seconds: AppConstants.shimmerDelay), _goNext);
  }

  Future<void> _goNext() async {
    bool isOnBoardingScreenViewed =
        await _appPreferences.isOnBoardingScreenViewed();
    if (isOnBoardingScreenViewed) {
      replacement(Routes.mainRoute);
    } else {
      replacement(Routes.boarding);
    }
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: FutureBuilder<bool>(
          future: _appPreferences.isOnBoardingScreenViewed(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Text('Error loading preferences');
            } else {
              return snapshot.data == true
                  ? mainShimmer(context)
                  : boardingShimmer();
            }
          },
        ),
      ),
    );
  }

  boardingShimmer() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: SizedBox(
              width: 350.0,
              height: 400.0,
              child: SvgPicture.asset(ImageAssets.boarding),
            ),
          ),
        ],
      ),
    );
  }

  mainShimmer(BuildContext context) {
    return Container();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
