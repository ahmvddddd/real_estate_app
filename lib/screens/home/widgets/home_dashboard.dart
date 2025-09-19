import 'package:flutter/material.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../common/widgets/layouts/listvew.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_function.dart';

class HomeDashboard extends StatelessWidget {
  const HomeDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    final dark = HelperFunctions.isDarkMode(context);
    final List<Map<String, dynamic>> dashboardDetails = [
      {
        'icon': Images.dollar,
        'text': 'Buy'
      },
      {
        'icon': Images.key,
        'text': 'Rent'
      },
      {
        'icon': Images.security,
        'text': 'Agents'
      },
      {
        'icon': Images.security,
        'text': 'Projects'
      }
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       
        const  SizedBox(height: Sizes.spaceBtwItems,),
        HomeListView(
          sizedBoxHeight: screenHeight * 0.05,
         scrollDirection: Axis.horizontal,
         itemCount: dashboardDetails.length, 
         seperatorBuilder: (context, index) => const SizedBox(width: Sizes.md,), 
         itemBuilder: (context, index) {
          return RoundedContainer(
            height: screenHeight * 0.05,
            padding: const EdgeInsetsGeometry.symmetric(horizontal: Sizes.md, vertical: Sizes.xs),
            showBorder: false,
            radius: Sizes.cardRadiusLg,
            backgroundColor: dark ? Colors.white.withValues(alpha: 0.1) : Colors.black.withValues(alpha: 0.1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Image.asset(dashboardDetails[index]['icon'],
              height: 22,
              width: 22,
              ),
              
              const SizedBox(width: Sizes.xs,),
              Text(dashboardDetails[index]['text'],
              style: Theme.of(context).textTheme.labelSmall,)
            ],),
          );
         }
         ),
    
         const SizedBox(height: Sizes.spaceBtwSections,),
         Row(
          children: [
             Text('Explore',
        style: Theme.of(context).textTheme.bodyMedium,),
        Text(' Property In India',
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),),
          ],
         ),
    
         const SizedBox(height: Sizes.spaceBtwSections,),
         Text('Find your property in your preffered city',
         style: Theme.of(context).textTheme.labelMedium,)
      ],
    );
  }
}