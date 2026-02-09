import 'package:flashcards_learning_app/design/colors.dart';
import 'package:flutter/material.dart';

class TopicsExpansionTile extends StatelessWidget {
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

        // trailing: SvgPicture.asset(
        //   'assets/iconss/unfold.svg',
        //   height: 28,
        //   color: AppConst.black,
        // ),
        childrenPadding: EdgeInsets.all(0),
        children: [
          SizedBox(
            height: _listHeight(),
            child: Scrollbar(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemExtent: itemExtent,
                itemCount: topicSuggestions.length,
                itemBuilder: (context, index) {
                  final t = topicSuggestions[index];
                  return ListTile(
                    dense: true,
                    title: Text(t, style: AppConst.text),
                    onTap: () => onTap(t),
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
    final total = topicSuggestions.length * itemExtent;
    if (total < itemExtent) return itemExtent;
    return total > maxListHeight ? maxListHeight : total;
  }
}
