import 'package:flashcards_learning_app/common_widgets/widgets.dart';
import 'package:flashcards_learning_app/core/app_constants.dart';
import 'package:flutter/material.dart';

class TopicsExpansionTile extends StatefulWidget {
  final void Function(String) onTap;
  final List<String> topicSuggestions;
  final double maxListHeight;
  final double itemExtent;
  const TopicsExpansionTile({
    super.key,
    required this.onTap,
    required this.topicSuggestions,
    this.maxListHeight = 180,
    this.itemExtent = 48,
  });

  @override
  State<TopicsExpansionTile> createState() => _TopicsExpansionTileState();
}

class _TopicsExpansionTileState extends State<TopicsExpansionTile> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        splashFactory: NoSplash.splashFactory,
        highlightColor: Colors.transparent,
      ),
      child: ExpansionTile(
        iconColor: AppConst.black,

        title: Text('Темы из JSON', style: AppConst.text),

        tilePadding: EdgeInsets.all(0),
        shape: Border(),
        onExpansionChanged: (value) => setState(() => _expanded = value),
        trailing: CustomFlipingIcon(isExpanded: _expanded),
        childrenPadding: EdgeInsets.all(0),
        children: [
          SizedBox(
            height: _listHeight(),
            child: Scrollbar(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemExtent: widget.itemExtent,
                itemCount: widget.topicSuggestions.length,
                itemBuilder: (context, index) {
                  final t = widget.topicSuggestions[index];
                  return ListTile(
                    dense: true,
                    contentPadding: EdgeInsets.symmetric(horizontal: 18),
                    minVerticalPadding: 0,
                    title: Text(t, style: AppConst.text.copyWith(height: 1)),
                    onTap: () => widget.onTap(t),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  double _listHeight() {
    final total = widget.topicSuggestions.length * widget.itemExtent;
    if (total < widget.itemExtent) return widget.itemExtent;
    return total > widget.maxListHeight ? widget.maxListHeight : total;
  }
}
