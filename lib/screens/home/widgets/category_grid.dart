import 'package:flutter/material.dart';
import 'package:myapp/utils/constants/image_strings.dart';
import '../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../common/widgets/layouts/grid_layout.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_function.dart';

class CategoryGrid extends StatefulWidget {
  const CategoryGrid({super.key});

  @override
  State<CategoryGrid> createState() => _CategoryGridState();
}

class _CategoryGridState extends State<CategoryGrid> {
  final List<String> categoryText = [
    "New Delhi", "Mumbai", "Gurgaon", "Noaida", "Bangalore", "Ahmedabad", "Kolkata", "Chennai", "Hyderabab" 
  ];

  
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    final dark = HelperFunctions.isDarkMode(context);
    return GridLayout(
      crossAxisCount: 3,
      itemCount: categoryText.length,
      mainAxisExtent: screenHeight * 0.14,
      itemBuilder: (context, index)  {
        return RoundedContainer(
          backgroundColor: dark ? Colors.white.withValues(alpha: 0.1) : Colors.black.withValues(alpha: 0.1),
          height: screenHeight * 0.14,
          width: screenHeight * 0.14,
          radius: Sizes.cardRadiusLg,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(Images.mask,
                height: 42,
                width: 42,),
                const SizedBox(height: Sizes.sm,),
                Text(categoryText[index],
                style: Theme.of(context).textTheme.labelMedium!.copyWith(fontWeight: FontWeight.bold),),
              ],
            ),
          )
        );
      }
    );
  }
}