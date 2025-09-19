import 'package:flutter/material.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_function.dart';
import 'rounded_container.dart';

class SearchContainer extends StatelessWidget {
  const SearchContainer({
    required this.width,
    super.key,
    this.text,
    this.icon,
    this.showBackground = true,
    this.showBorder = true,
    this.onTap,
    this.padding = const EdgeInsets.symmetric(horizontal: 0),
  });

  final double width;
  final String? text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    final dark = HelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Container(
          height: screenHeight * 0.07,
          width: width,
          decoration: BoxDecoration(
            color: showBackground
                ? (dark ? Colors.white.withValues(alpha: 0.1) : Colors.black.withValues(alpha: 0.1))
                : Colors.transparent,
            borderRadius: BorderRadius.circular(Sizes.cardRadiusLg),
          ),
          child: Row(
            children: [
              /// Search field
              Expanded(
  child: TextFormField(
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: CustomColors.primary,
        size: Sizes.iconM,
      ),
      hintText: text,
      hintStyle: Theme.of(context).textTheme.labelSmall,
      border: InputBorder.none,
      enabledBorder: InputBorder.none,
      focusedBorder: InputBorder.none,
      contentPadding: const EdgeInsets.symmetric(vertical: 14),
    ),
  ),
),


              /// Location dropdown
              SizedBox(
                width: 85,
                child: Padding(
                  padding: const EdgeInsets.only(right: Sizes.xs),
                  child: RoundedContainer(
                    padding: const EdgeInsets.all(Sizes.sm),
                    backgroundColor: dark ? Colors.black : Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'All India',
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall!
                              .copyWith(
                                color: CustomColors.primary,
                                fontSize: 10,
                              ),
                        ),
                        const SizedBox(width: 2,),
                        const Icon(
                          Icons.keyboard_arrow_down_sharp,
                          size: Sizes.iconSm,
                          color: CustomColors.primary,
                        ),
                      ],
                    ),
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
