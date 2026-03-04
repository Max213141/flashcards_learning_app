import 'dart:math' as math;

import 'package:flashcards_learning_app/entities/entities.dart';
import 'package:flashcards_learning_app/screens/exam_screen/widgets/widgets.dart';
import 'package:flashcards_learning_app/utils/utils.dart';
import 'package:flutter/material.dart';

class ExamScreenBodyWidget extends StatefulWidget {
  final List<Word> wordList;
  const ExamScreenBodyWidget({super.key, required this.wordList});

  @override
  State<ExamScreenBodyWidget> createState() => _ExamScreenBodyWidgetState();
}

class _ExamScreenBodyWidgetState extends State<ExamScreenBodyWidget>
    with SingleTickerProviderStateMixin {
  static const int _batchSize = 6;

  final List<int> _matchedIds = [];
  late final AnimationController _shakeController;
  List<Word> _rightColumnBatch = [];
  int _batchStartIndex = 0;
  int? leftId;
  int? rightId;
  int? _shakingLeftId;
  int? _shakingRightId;

  @override
  void initState() {
    super.initState();
    _rightColumnBatch = _buildRightColumnBatch();
    _shakeController =
        AnimationController(
          vsync: this,
          duration: const Duration(milliseconds: 420),
        )..addStatusListener((status) {
          if (status != AnimationStatus.completed || !mounted) {
            return;
          }

          setState(() {
            leftId = null;
            rightId = null;
            _shakingLeftId = null;
            _shakingRightId = null;
          });

          _shakeController.reset();
        });
  }

  @override
  void dispose() {
    _shakeController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant ExamScreenBodyWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.wordList != widget.wordList) {
      _batchStartIndex = 0;
      leftId = null;
      rightId = null;
      _shakingLeftId = null;
      _shakingRightId = null;
      _matchedIds.clear();
      _rightColumnBatch = _buildRightColumnBatch();
    }
  }

  List<Word> get _currentBatch {
    if (_batchStartIndex >= widget.wordList.length) {
      return const [];
    }

    final endIndex = (_batchStartIndex + _batchSize).clamp(
      0,
      widget.wordList.length,
    );

    return widget.wordList.sublist(_batchStartIndex, endIndex);
  }

  void _onLeftTap(int? wordId) {
    if (wordId == null ||
        _matchedIds.contains(wordId) ||
        _shakeController.isAnimating) {
      return;
    }
    setState(() {
      leftId = wordId;
    });
    _tryCompletePair();
  }

  void _onRightTap(int? wordId) {
    if (wordId == null ||
        _matchedIds.contains(wordId) ||
        _shakeController.isAnimating) {
      return;
    }
    setState(() {
      rightId = wordId;
    });
    _tryCompletePair();
  }

  void _tryCompletePair() {
    if (leftId == null || rightId == null) {
      return;
    }
    if (leftId != rightId) {
      _startIncorrectPairAnimation();
      return;
    }
    final matchedId = leftId!;

    if (!_matchedIds.contains(matchedId)) {
      _matchedIds.add(matchedId);
    }

    leftId = null;
    rightId = null;

    final currentBatchIds = _currentBatch
        .map((word) => word.id)
        .whereType<int>();

    final isBatchCompleted =
        currentBatchIds.isNotEmpty &&
        currentBatchIds.every(_matchedIds.contains);

    if (!isBatchCompleted) {
      return;
    }

    _batchStartIndex += _currentBatch.length;
    _matchedIds.clear();
    _rightColumnBatch = _buildRightColumnBatch();
  }

  List<Word> _buildRightColumnBatch() {
    return shuffleWithoutSamePositions(_currentBatch);
  }

  void _startIncorrectPairAnimation() {
    if (leftId == null || rightId == null) {
      return;
    }

    _shakingLeftId = leftId;
    _shakingRightId = rightId;
    _shakeController.forward(from: 0);
  }

  double _shakeOffset(bool shouldShake) {
    if (!shouldShake) {
      return 0;
    }

    final progress = _shakeController.value;
    return math.sin(progress * math.pi * 8) * 10 * (1 - progress);
  }

  @override
  Widget build(BuildContext context) {
    final currentBatch = _currentBatch;

    return Column(
      children: [
        Center(child: Clock()),
        Spacer(),
        Expanded(
          flex: 6,
          child: currentBatch.isEmpty
              ? ExamFinishedWidget(wordsListLength: widget.wordList.length)
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: _rightColumnBatch.length,
                          itemBuilder: (context, index) {
                            final word = _rightColumnBatch[index];
                            final isMatched =
                                word.id != null &&
                                _matchedIds.contains(word.id);

                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: AnimatedBuilder(
                                animation: _shakeController,
                                child: ExamMatchOptionTile(
                                  text: word.word,
                                  onTap: _shakeController.isAnimating
                                      ? null
                                      : () => _onLeftTap(word.id),
                                  isSelected: !isMatched && leftId == word.id,
                                  isMatched: isMatched,
                                ),
                                builder: (context, child) {
                                  return Transform.translate(
                                    offset: Offset(
                                      _shakeOffset(_shakingLeftId == word.id),
                                      0,
                                    ),
                                    child: child,
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: currentBatch.length,
                          itemBuilder: (context, index) {
                            final word = currentBatch[index];
                            final isMatched =
                                word.id != null &&
                                _matchedIds.contains(word.id);

                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: AnimatedBuilder(
                                animation: _shakeController,
                                child: ExamMatchOptionTile(
                                  text: word.translation,
                                  onTap: _shakeController.isAnimating
                                      ? null
                                      : () => _onRightTap(word.id),
                                  isSelected: !isMatched && rightId == word.id,
                                  isMatched: isMatched,
                                ),
                                builder: (context, child) {
                                  return Transform.translate(
                                    offset: Offset(
                                      _shakeOffset(_shakingRightId == word.id),
                                      0,
                                    ),
                                    child: child,
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
        ),
        Spacer(),
      ],
    );
  }
}
