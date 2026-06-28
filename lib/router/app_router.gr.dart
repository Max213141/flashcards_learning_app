// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [EditWordScreen]
class EditWordRoute extends PageRouteInfo<EditWordRouteArgs> {
  EditWordRoute({Key? key, Word? word, List<PageRouteInfo>? children})
    : super(
        EditWordRoute.name,
        args: EditWordRouteArgs(key: key, word: word),
        initialChildren: children,
      );

  static const String name = 'EditWordRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<EditWordRouteArgs>(
        orElse: () => const EditWordRouteArgs(),
      );
      return EditWordScreen(key: args.key, word: args.word);
    },
  );
}

class EditWordRouteArgs {
  const EditWordRouteArgs({this.key, this.word});

  final Key? key;

  final Word? word;

  @override
  String toString() {
    return 'EditWordRouteArgs{key: $key, word: $word}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! EditWordRouteArgs) return false;
    return key == other.key && word == other.word;
  }

  @override
  int get hashCode => key.hashCode ^ word.hashCode;
}

/// generated route for
/// [ExamScreen]
class ExamRoute extends PageRouteInfo<ExamRouteArgs> {
  ExamRoute({Key? key, required int topicId, List<PageRouteInfo>? children})
    : super(
        ExamRoute.name,
        args: ExamRouteArgs(key: key, topicId: topicId),
        initialChildren: children,
      );

  static const String name = 'ExamRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ExamRouteArgs>();
      return ExamScreen(key: args.key, topicId: args.topicId);
    },
  );
}

class ExamRouteArgs {
  const ExamRouteArgs({this.key, required this.topicId});

  final Key? key;

  final int topicId;

  @override
  String toString() {
    return 'ExamRouteArgs{key: $key, topicId: $topicId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ExamRouteArgs) return false;
    return key == other.key && topicId == other.topicId;
  }

  @override
  int get hashCode => key.hashCode ^ topicId.hashCode;
}

/// generated route for
/// [MainScreen]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
    : super(MainRoute.name, initialChildren: children);

  static const String name = 'MainRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MainScreen();
    },
  );
}

/// generated route for
/// [OnboardingScreen]
class OnboardingRoute extends PageRouteInfo<void> {
  const OnboardingRoute({List<PageRouteInfo>? children})
    : super(OnboardingRoute.name, initialChildren: children);

  static const String name = 'OnboardingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const OnboardingScreen();
    },
  );
}

/// generated route for
/// [TestScreen]
class TestRoute extends PageRouteInfo<TestRouteArgs> {
  TestRoute({
    Key? key,
    required int topicId,
    required Color topicColor,
    List<PageRouteInfo>? children,
  }) : super(
         TestRoute.name,
         args: TestRouteArgs(
           key: key,
           topicId: topicId,
           topicColor: topicColor,
         ),
         initialChildren: children,
       );

  static const String name = 'TestRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TestRouteArgs>();
      return TestScreen(
        key: args.key,
        topicId: args.topicId,
        topicColor: args.topicColor,
      );
    },
  );
}

class TestRouteArgs {
  const TestRouteArgs({
    this.key,
    required this.topicId,
    required this.topicColor,
  });

  final Key? key;

  final int topicId;

  final Color topicColor;

  @override
  String toString() {
    return 'TestRouteArgs{key: $key, topicId: $topicId, topicColor: $topicColor}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! TestRouteArgs) return false;
    return key == other.key &&
        topicId == other.topicId &&
        topicColor == other.topicColor;
  }

  @override
  int get hashCode => key.hashCode ^ topicId.hashCode ^ topicColor.hashCode;
}

/// generated route for
/// [TopicScreen]
class TopicRoute extends PageRouteInfo<TopicRouteArgs> {
  TopicRoute({
    Key? key,
    required String topicName,
    required int topicId,
    required Color topicColor,
    List<PageRouteInfo>? children,
  }) : super(
         TopicRoute.name,
         args: TopicRouteArgs(
           key: key,
           topicName: topicName,
           topicId: topicId,
           topicColor: topicColor,
         ),
         initialChildren: children,
       );

  static const String name = 'TopicRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TopicRouteArgs>();
      return TopicScreen(
        key: args.key,
        topicName: args.topicName,
        topicId: args.topicId,
        topicColor: args.topicColor,
      );
    },
  );
}

class TopicRouteArgs {
  const TopicRouteArgs({
    this.key,
    required this.topicName,
    required this.topicId,
    required this.topicColor,
  });

  final Key? key;

  final String topicName;

  final int topicId;

  final Color topicColor;

  @override
  String toString() {
    return 'TopicRouteArgs{key: $key, topicName: $topicName, topicId: $topicId, topicColor: $topicColor}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! TopicRouteArgs) return false;
    return key == other.key &&
        topicName == other.topicName &&
        topicId == other.topicId &&
        topicColor == other.topicColor;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      topicName.hashCode ^
      topicId.hashCode ^
      topicColor.hashCode;
}

/// generated route for
/// [WordDefinitionScreen]
class WordDefinitionRoute extends PageRouteInfo<WordDefinitionRouteArgs> {
  WordDefinitionRoute({
    Key? key,
    required Word wordData,
    required String topicName,
    required Color topicColor,
    List<PageRouteInfo>? children,
  }) : super(
         WordDefinitionRoute.name,
         args: WordDefinitionRouteArgs(
           key: key,
           wordData: wordData,
           topicName: topicName,
           topicColor: topicColor,
         ),
         initialChildren: children,
       );

  static const String name = 'WordDefinitionRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<WordDefinitionRouteArgs>();
      return WordDefinitionScreen(
        key: args.key,
        wordData: args.wordData,
        topicName: args.topicName,
        topicColor: args.topicColor,
      );
    },
  );
}

class WordDefinitionRouteArgs {
  const WordDefinitionRouteArgs({
    this.key,
    required this.wordData,
    required this.topicName,
    required this.topicColor,
  });

  final Key? key;

  final Word wordData;

  final String topicName;

  final Color topicColor;

  @override
  String toString() {
    return 'WordDefinitionRouteArgs{key: $key, wordData: $wordData, topicName: $topicName, topicColor: $topicColor}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! WordDefinitionRouteArgs) return false;
    return key == other.key &&
        wordData == other.wordData &&
        topicName == other.topicName &&
        topicColor == other.topicColor;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      wordData.hashCode ^
      topicName.hashCode ^
      topicColor.hashCode;
}
