import 'package:flashcards_learning_app/core/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FilterButtonWidget extends StatelessWidget {
  const FilterButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 35.0, horizontal: 22),
      child: Row(
        children: [
          SizedBox(
            height: 40,
            width: 140,
            child: DecoratedBox(
              decoration: BoxDecoration(
                border: Border.all(color: AppConst.primary, width: 2),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 12),
                  Expanded(
                    child: SvgPicture.asset(
                      'assets/iconss/sort.svg',
                      colorFilter: const ColorFilter.mode(
                        AppConst.black,
                        BlendMode.srcIn,
                      ),
                      height: 20,
                      width: 20,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: FittedBox(
                      child: Text('Сортировать', style: AppConst.text),
                    ),
                  ),
                  SizedBox(width: 12),
                ],
              ),
            ),
          ),
          SizedBox(width: 4),
          SizedBox(
            height: 40,
            width: 48,
            child: DecoratedBox(
              decoration: BoxDecoration(
                border: Border.all(color: AppConst.primary, width: 2),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: SvgPicture.asset(
                    'assets/iconss/unfold.svg',
                    colorFilter: const ColorFilter.mode(
                      AppConst.black,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
