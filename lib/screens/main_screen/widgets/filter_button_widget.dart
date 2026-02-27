import 'package:flashcards_learning_app/core/app_constants.dart';
import 'package:flashcards_learning_app/data/local/topic_summary.dart';
import 'package:flashcards_learning_app/screens/main_screen/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FilterButtonWidget extends StatefulWidget {
  final TopicSortOption selectedSort;
  final ValueChanged<TopicSortOption> onSortChanged;

  const FilterButtonWidget({
    super.key,
    required this.selectedSort,
    required this.onSortChanged,
  });

  @override
  State<FilterButtonWidget> createState() => _FilterButtonWidgetState();
}

class _FilterButtonWidgetState extends State<FilterButtonWidget> {
  bool _isExpanded = false;

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  void _selectSort(TopicSortOption option) {
    widget.onSortChanged(option);
    setState(() {
      _isExpanded = false;
    });
  }

  String _sortLabel(TopicSortOption option) {
    switch (option) {
      case TopicSortOption.titleAsc:
        return 'По названию (A-Z)';
      case TopicSortOption.colorAsc:
        return 'По цвету';
      case TopicSortOption.createdDesc:
        return 'Сначала новые';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 35.0, horizontal: 22.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                height: 40,
                width: 140,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border.all(color: AppConst.primary, width: 2),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      topLeft: Radius.circular(20),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(width: 12),
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
                      const SizedBox(width: 12),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 4),
              InkWell(
                onTap: _toggleExpanded,
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: SortButtonSecondPart(isExpanded: _isExpanded),
              ),
            ],
          ),
          AnimatedSize(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            child: _isExpanded
                ? SortMenuWidget(
                    selectSort: _selectSort,
                    selectedSort: widget.selectedSort,
                  )
                : const SizedBox.shrink(),
          ),
          const SizedBox(height: 8.0),
          Text(
            'Текущая сортировка: ${_sortLabel(widget.selectedSort)}',
            style: AppConst.additionalText.copyWith(
              fontWeight: FontWeight.w100,
            ),
          ),
        ],
      ),
    );
  }
}
