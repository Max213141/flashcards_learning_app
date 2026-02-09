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
/// [TestScreen]
class TestRoute extends PageRouteInfo<void> {
  const TestRoute({List<PageRouteInfo>? children})
    : super(TestRoute.name, initialChildren: children);

  static const String name = 'TestRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const TestScreen();
    },
  );
}

/// generated route for
/// [TopicScreen]
class TopicRoute extends PageRouteInfo<TopicRouteArgs> {
  TopicRoute({
    Key? key,
    required String topicName,
    required List<Word> words,
    List<PageRouteInfo>? children,
  }) : super(
         TopicRoute.name,
         args: TopicRouteArgs(key: key, topicName: topicName, words: words),
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
        words: args.words,
      );
    },
  );
}

class TopicRouteArgs {
  const TopicRouteArgs({
    this.key,
    required this.topicName,
    required this.words,
  });

  final Key? key;

  final String topicName;

  final List<Word> words;

  @override
  String toString() {
    return 'TopicRouteArgs{key: $key, topicName: $topicName, words: $words}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! TopicRouteArgs) return false;
    return key == other.key &&
        topicName == other.topicName &&
        const ListEquality<Word>().equals(words, other.words);
  }

  @override
  int get hashCode =>
      key.hashCode ^
      topicName.hashCode ^
      const ListEquality<Word>().hash(words);
}

/// generated route for
/// [WordDefinitionScreen]
class WordDefinitionRoute extends PageRouteInfo<WordDefinitionRouteArgs> {
  WordDefinitionRoute({
    Key? key,
    required Word wordData,
    List<PageRouteInfo>? children,
  }) : super(
         WordDefinitionRoute.name,
         args: WordDefinitionRouteArgs(key: key, wordData: wordData),
         initialChildren: children,
       );

  static const String name = 'WordDefinitionRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<WordDefinitionRouteArgs>();
      return WordDefinitionScreen(key: args.key, wordData: args.wordData);
    },
  );
}

class WordDefinitionRouteArgs {
  const WordDefinitionRouteArgs({this.key, required this.wordData});

  final Key? key;

  final Word wordData;

  @override
  String toString() {
    return 'WordDefinitionRouteArgs{key: $key, wordData: $wordData}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! WordDefinitionRouteArgs) return false;
    return key == other.key && wordData == other.wordData;
  }

  @override
  int get hashCode => key.hashCode ^ wordData.hashCode;
}
