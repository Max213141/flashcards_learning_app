import 'package:flashcards_learning_app/core/app_constants.dart';
import 'package:flashcards_learning_app/data/local/topic_summary.dart';
import 'package:flashcards_learning_app/screens/main_screen/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SortMenuWidget extends StatelessWidget {
  final void Function(TopicSortOption) selectSort;
  final TopicSortOption selectedSort;

  const SortMenuWidget({
    super.key,
    required this.selectSort,
    required this.selectedSort,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 192,
      margin: const EdgeInsets.only(top: 8.0),
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppConst.primary, width: 2),
      ),
      child: Column(
        children: [
          SortOptionTile(
            title: 'Сначала новые',
            isSelected: selectedSort == TopicSortOption.createdDesc,
            onTap: () => selectSort(TopicSortOption.createdDesc),
          ),
          SortOptionTile(
            title: 'По имени (А-Я)',
            isSelected: selectedSort == TopicSortOption.titleAsc,
            onTap: () => selectSort(TopicSortOption.titleAsc),
          ),
          SortOptionTile(
            title: 'По цвету',
            isSelected: selectedSort == TopicSortOption.colorAsc,
            onTap: () => selectSort(TopicSortOption.colorAsc),
          ),
        ],
      ),
    );
  }
}
