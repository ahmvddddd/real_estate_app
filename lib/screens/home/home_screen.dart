import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../common/widgets/appbar/appbar.dart';
import '../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../utils/constants/sizes.dart';
import 'widgets/category_grid.dart';
import 'widgets/home_dashboard.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: TAppBar(
          title: Text('RealEstateIndia',
          style: Theme.of(context).textTheme.headlineSmall),
          actions: [
            Icon(Icons.menu),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(Sizes.spaceBtwItems),
            child: Column(
              children: [
                HomeDashboard(),

                const SizedBox(height: Sizes.spaceBtwItems,),
                SearchContainer(
                  width: screenWidth * 0.90,
                  icon: Iconsax.search_normal,
                  text: 'Search locally',
                ),

                const SizedBox(height: Sizes.spaceBtwSections,),
                CategoryGrid(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
