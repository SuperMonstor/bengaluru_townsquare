import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class TownsquareShimmer extends StatelessWidget {
  const TownsquareShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      duration: const Duration(seconds: 1), //Default value
      interval:
          const Duration(seconds: 1), //Default value: Duration(seconds: 0)
      color: Colors.white, //Default value
      colorOpacity: 0, //Default value
      enabled: true, //Default value
      direction: const ShimmerDirection.fromLTRB(),
      child: Center(
        child: SizedBox(
          height: 150,
          child: Image.asset(
            'assets/images/townsquaresplash.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
