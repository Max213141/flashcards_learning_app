import 'package:auto_route/auto_route.dart';
import 'package:flashcards_learning_app/data/local/topic_summary.dart';
import 'package:flashcards_learning_app/core/app_constants.dart';
import 'package:flashcards_learning_app/l10n/l10n.dart';
import 'package:flashcards_learning_app/router/app_router.dart';
import 'package:flashcards_learning_app/screens/main_screen/widgets/widgets.dart';
import 'package:flashcards_learning_app/utils/analytics_service.dart';
import 'package:flashcards_learning_app/utils/service_locator.dart';
import 'package:flashcards_learning_app/utils/utils.dart';
import 'package:flutter/material.dart';

class TopicsListWidget extends StatefulWidget {
  final List<TopicSummary> topics;
  const TopicsListWidget({super.key, required this.topics});

  static const double cardHeight = 175;
  static const double overlap = 100;

  @override
  State<TopicsListWidget> createState() => _TopicsListWidgetState();
}

class _TopicsListWidgetState extends State<TopicsListWidget> {
  static const double _cardOffset =
      TopicsListWidget.cardHeight - TopicsListWidget.overlap;

  final ScrollController _scrollController = ScrollController();
  double _scrollOffset = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_handleScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_handleScroll)
      ..dispose();
    super.dispose();
  }

  void _handleScroll() {
    final nextOffset = _scrollController.hasClients
        ? _scrollController.offset
        : 0.0;
    if (nextOffset == _scrollOffset) {
      return;
    }

    setState(() {
      _scrollOffset = nextOffset;
    });
  }

  @override
  Widget build(BuildContext context) {
    final topics = widget.topics;

    if (topics.isEmpty) {
      return Padding(
        padding: const EdgeInsets.only(top: 150.0),
        child: Text(l10nOf(context).topicsListEmpty, style: AppConst.text),
      );
    }

    final totalHeight =
        TopicsListWidget.cardHeight + (topics.length - 1) * _cardOffset;
    final viewportHeight = MediaQuery.sizeOf(context).height * .45;
    final visibleCards = _visibleCards(
      topics: topics,
      viewportHeight: viewportHeight,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22.0),
      child: SizedBox(
        height: viewportHeight,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: SizedBox(
            height: totalHeight,
            child: Stack(
              children: visibleCards.map(_buildPositionedTopic).toList(),
            ),
          ),
        ),
      ),
    );
  }

  Iterable<({int index, TopicSummary topic})> _visibleCards({
    required List<TopicSummary> topics,
    required double viewportHeight,
  }) sync* {
    final firstVisibleIndex = _firstVisibleIndex(topics.length);
    final lastVisibleIndex = _lastVisibleIndex(topics.length, viewportHeight);

    for (var index = firstVisibleIndex; index <= lastVisibleIndex; index++) {
      yield (index: index, topic: topics[index]);
    }
  }

  int _firstVisibleIndex(int topicCount) {
    final firstPaintedOffset = _scrollOffset - TopicsListWidget.cardHeight;
    final firstIndex = (firstPaintedOffset / _cardOffset).floor();

    return _clampTopicIndex(firstIndex, topicCount);
  }

  int _lastVisibleIndex(int topicCount, double viewportHeight) {
    final lastPaintedOffset = _scrollOffset + viewportHeight;
    final lastIndex = (lastPaintedOffset / _cardOffset).ceil();

    return _clampTopicIndex(lastIndex, topicCount);
  }

  int _clampTopicIndex(int index, int topicCount) {
    if (index < 0) {
      return 0;
    }

    final lastIndex = topicCount - 1;
    if (index > lastIndex) {
      return lastIndex;
    }

    return index;
  }

  Widget _buildPositionedTopic(({int index, TopicSummary topic}) visibleCard) {
    final topic = visibleCard.topic;
    final color = topic.colorValue != null
        ? Color(topic.colorValue!)
        : Colors.white;

    return Positioned(
      top: visibleCard.index * _cardOffset,
      left: 0,
      right: 0,
      child: RepaintBoundary(
        child: GestureDetector(
          onTap: () {
            getIt<AnalyticsService>().logTopicOpened(topic: topic);
            AutoRouter.of(context).push(
              TopicRoute(
                topicName: topic.topicName,
                topicId: topic.id,
                topicColor: color,
              ),
            );
          },
          child: CustomPaint(
            isComplex: true,
            willChange: false,
            painter: MyPainter(initialColor: color),
            child: TopicBodyWidget(
              topic: topic,
              color: color,
              cardHeight: TopicsListWidget.cardHeight,
            ),
          ),
        ),
      ),
    );
  }
}
