// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $TopicsTable extends Topics with TableInfo<$TopicsTable, TopicEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TopicsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _colorValueMeta = const VerificationMeta(
    'colorValue',
  );
  @override
  late final GeneratedColumn<int> colorValue = GeneratedColumn<int>(
    'color_value',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, colorValue];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'topics';
  @override
  VerificationContext validateIntegrity(
    Insertable<TopicEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('color_value')) {
      context.handle(
        _colorValueMeta,
        colorValue.isAcceptableOrUnknown(data['color_value']!, _colorValueMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TopicEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TopicEntry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      colorValue: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}color_value'],
      ),
    );
  }

  @override
  $TopicsTable createAlias(String alias) {
    return $TopicsTable(attachedDatabase, alias);
  }
}

class TopicEntry extends DataClass implements Insertable<TopicEntry> {
  final int id;
  final String name;
  final int? colorValue;
  const TopicEntry({required this.id, required this.name, this.colorValue});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || colorValue != null) {
      map['color_value'] = Variable<int>(colorValue);
    }
    return map;
  }

  TopicsCompanion toCompanion(bool nullToAbsent) {
    return TopicsCompanion(
      id: Value(id),
      name: Value(name),
      colorValue: colorValue == null && nullToAbsent
          ? const Value.absent()
          : Value(colorValue),
    );
  }

  factory TopicEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TopicEntry(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      colorValue: serializer.fromJson<int?>(json['colorValue']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'colorValue': serializer.toJson<int?>(colorValue),
    };
  }

  TopicEntry copyWith({
    int? id,
    String? name,
    Value<int?> colorValue = const Value.absent(),
  }) => TopicEntry(
    id: id ?? this.id,
    name: name ?? this.name,
    colorValue: colorValue.present ? colorValue.value : this.colorValue,
  );
  TopicEntry copyWithCompanion(TopicsCompanion data) {
    return TopicEntry(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      colorValue: data.colorValue.present
          ? data.colorValue.value
          : this.colorValue,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TopicEntry(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('colorValue: $colorValue')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, colorValue);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TopicEntry &&
          other.id == this.id &&
          other.name == this.name &&
          other.colorValue == this.colorValue);
}

class TopicsCompanion extends UpdateCompanion<TopicEntry> {
  final Value<int> id;
  final Value<String> name;
  final Value<int?> colorValue;
  const TopicsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.colorValue = const Value.absent(),
  });
  TopicsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.colorValue = const Value.absent(),
  }) : name = Value(name);
  static Insertable<TopicEntry> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? colorValue,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (colorValue != null) 'color_value': colorValue,
    });
  }

  TopicsCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<int?>? colorValue,
  }) {
    return TopicsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      colorValue: colorValue ?? this.colorValue,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (colorValue.present) {
      map['color_value'] = Variable<int>(colorValue.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TopicsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('colorValue: $colorValue')
          ..write(')'))
        .toString();
  }
}

class $WordsTable extends Words with TableInfo<$WordsTable, WordEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _topicIdMeta = const VerificationMeta(
    'topicId',
  );
  @override
  late final GeneratedColumn<int> topicId = GeneratedColumn<int>(
    'topic_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES topics (id)',
    ),
  );
  static const VerificationMeta _wordMeta = const VerificationMeta('word');
  @override
  late final GeneratedColumn<String> word = GeneratedColumn<String>(
    'word',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _translationMeta = const VerificationMeta(
    'translation',
  );
  @override
  late final GeneratedColumn<String> translation = GeneratedColumn<String>(
    'translation',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _topicNameMeta = const VerificationMeta(
    'topicName',
  );
  @override
  late final GeneratedColumn<String> topicName = GeneratedColumn<String>(
    'topic_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _transcriptionMeta = const VerificationMeta(
    'transcription',
  );
  @override
  late final GeneratedColumn<String> transcription = GeneratedColumn<String>(
    'transcription',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _partOfSpeechMeta = const VerificationMeta(
    'partOfSpeech',
  );
  @override
  late final GeneratedColumn<String> partOfSpeech = GeneratedColumn<String>(
    'part_of_speech',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _usageMeta = const VerificationMeta('usage');
  @override
  late final GeneratedColumn<String> usage = GeneratedColumn<String>(
    'usage',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _learnedMeta = const VerificationMeta(
    'learned',
  );
  @override
  late final GeneratedColumn<bool> learned = GeneratedColumn<bool>(
    'learned',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("learned" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    topicId,
    word,
    translation,
    topicName,
    transcription,
    partOfSpeech,
    usage,
    learned,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'words';
  @override
  VerificationContext validateIntegrity(
    Insertable<WordEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('topic_id')) {
      context.handle(
        _topicIdMeta,
        topicId.isAcceptableOrUnknown(data['topic_id']!, _topicIdMeta),
      );
    }
    if (data.containsKey('word')) {
      context.handle(
        _wordMeta,
        word.isAcceptableOrUnknown(data['word']!, _wordMeta),
      );
    } else if (isInserting) {
      context.missing(_wordMeta);
    }
    if (data.containsKey('translation')) {
      context.handle(
        _translationMeta,
        translation.isAcceptableOrUnknown(
          data['translation']!,
          _translationMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_translationMeta);
    }
    if (data.containsKey('topic_name')) {
      context.handle(
        _topicNameMeta,
        topicName.isAcceptableOrUnknown(data['topic_name']!, _topicNameMeta),
      );
    } else if (isInserting) {
      context.missing(_topicNameMeta);
    }
    if (data.containsKey('transcription')) {
      context.handle(
        _transcriptionMeta,
        transcription.isAcceptableOrUnknown(
          data['transcription']!,
          _transcriptionMeta,
        ),
      );
    }
    if (data.containsKey('part_of_speech')) {
      context.handle(
        _partOfSpeechMeta,
        partOfSpeech.isAcceptableOrUnknown(
          data['part_of_speech']!,
          _partOfSpeechMeta,
        ),
      );
    }
    if (data.containsKey('usage')) {
      context.handle(
        _usageMeta,
        usage.isAcceptableOrUnknown(data['usage']!, _usageMeta),
      );
    }
    if (data.containsKey('learned')) {
      context.handle(
        _learnedMeta,
        learned.isAcceptableOrUnknown(data['learned']!, _learnedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WordEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WordEntry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      topicId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}topic_id'],
      ),
      word: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}word'],
      )!,
      translation: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}translation'],
      )!,
      topicName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}topic_name'],
      )!,
      transcription: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}transcription'],
      ),
      partOfSpeech: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}part_of_speech'],
      ),
      usage: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}usage'],
      ),
      learned: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}learned'],
      )!,
    );
  }

  @override
  $WordsTable createAlias(String alias) {
    return $WordsTable(attachedDatabase, alias);
  }
}

class WordEntry extends DataClass implements Insertable<WordEntry> {
  final int id;
  final int? topicId;
  final String word;
  final String translation;
  final String topicName;
  final String? transcription;
  final String? partOfSpeech;
  final String? usage;
  final bool learned;
  const WordEntry({
    required this.id,
    this.topicId,
    required this.word,
    required this.translation,
    required this.topicName,
    this.transcription,
    this.partOfSpeech,
    this.usage,
    required this.learned,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || topicId != null) {
      map['topic_id'] = Variable<int>(topicId);
    }
    map['word'] = Variable<String>(word);
    map['translation'] = Variable<String>(translation);
    map['topic_name'] = Variable<String>(topicName);
    if (!nullToAbsent || transcription != null) {
      map['transcription'] = Variable<String>(transcription);
    }
    if (!nullToAbsent || partOfSpeech != null) {
      map['part_of_speech'] = Variable<String>(partOfSpeech);
    }
    if (!nullToAbsent || usage != null) {
      map['usage'] = Variable<String>(usage);
    }
    map['learned'] = Variable<bool>(learned);
    return map;
  }

  WordsCompanion toCompanion(bool nullToAbsent) {
    return WordsCompanion(
      id: Value(id),
      topicId: topicId == null && nullToAbsent
          ? const Value.absent()
          : Value(topicId),
      word: Value(word),
      translation: Value(translation),
      topicName: Value(topicName),
      transcription: transcription == null && nullToAbsent
          ? const Value.absent()
          : Value(transcription),
      partOfSpeech: partOfSpeech == null && nullToAbsent
          ? const Value.absent()
          : Value(partOfSpeech),
      usage: usage == null && nullToAbsent
          ? const Value.absent()
          : Value(usage),
      learned: Value(learned),
    );
  }

  factory WordEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WordEntry(
      id: serializer.fromJson<int>(json['id']),
      topicId: serializer.fromJson<int?>(json['topicId']),
      word: serializer.fromJson<String>(json['word']),
      translation: serializer.fromJson<String>(json['translation']),
      topicName: serializer.fromJson<String>(json['topicName']),
      transcription: serializer.fromJson<String?>(json['transcription']),
      partOfSpeech: serializer.fromJson<String?>(json['partOfSpeech']),
      usage: serializer.fromJson<String?>(json['usage']),
      learned: serializer.fromJson<bool>(json['learned']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'topicId': serializer.toJson<int?>(topicId),
      'word': serializer.toJson<String>(word),
      'translation': serializer.toJson<String>(translation),
      'topicName': serializer.toJson<String>(topicName),
      'transcription': serializer.toJson<String?>(transcription),
      'partOfSpeech': serializer.toJson<String?>(partOfSpeech),
      'usage': serializer.toJson<String?>(usage),
      'learned': serializer.toJson<bool>(learned),
    };
  }

  WordEntry copyWith({
    int? id,
    Value<int?> topicId = const Value.absent(),
    String? word,
    String? translation,
    String? topicName,
    Value<String?> transcription = const Value.absent(),
    Value<String?> partOfSpeech = const Value.absent(),
    Value<String?> usage = const Value.absent(),
    bool? learned,
  }) => WordEntry(
    id: id ?? this.id,
    topicId: topicId.present ? topicId.value : this.topicId,
    word: word ?? this.word,
    translation: translation ?? this.translation,
    topicName: topicName ?? this.topicName,
    transcription: transcription.present
        ? transcription.value
        : this.transcription,
    partOfSpeech: partOfSpeech.present ? partOfSpeech.value : this.partOfSpeech,
    usage: usage.present ? usage.value : this.usage,
    learned: learned ?? this.learned,
  );
  WordEntry copyWithCompanion(WordsCompanion data) {
    return WordEntry(
      id: data.id.present ? data.id.value : this.id,
      topicId: data.topicId.present ? data.topicId.value : this.topicId,
      word: data.word.present ? data.word.value : this.word,
      translation: data.translation.present
          ? data.translation.value
          : this.translation,
      topicName: data.topicName.present ? data.topicName.value : this.topicName,
      transcription: data.transcription.present
          ? data.transcription.value
          : this.transcription,
      partOfSpeech: data.partOfSpeech.present
          ? data.partOfSpeech.value
          : this.partOfSpeech,
      usage: data.usage.present ? data.usage.value : this.usage,
      learned: data.learned.present ? data.learned.value : this.learned,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WordEntry(')
          ..write('id: $id, ')
          ..write('topicId: $topicId, ')
          ..write('word: $word, ')
          ..write('translation: $translation, ')
          ..write('topicName: $topicName, ')
          ..write('transcription: $transcription, ')
          ..write('partOfSpeech: $partOfSpeech, ')
          ..write('usage: $usage, ')
          ..write('learned: $learned')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    topicId,
    word,
    translation,
    topicName,
    transcription,
    partOfSpeech,
    usage,
    learned,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WordEntry &&
          other.id == this.id &&
          other.topicId == this.topicId &&
          other.word == this.word &&
          other.translation == this.translation &&
          other.topicName == this.topicName &&
          other.transcription == this.transcription &&
          other.partOfSpeech == this.partOfSpeech &&
          other.usage == this.usage &&
          other.learned == this.learned);
}

class WordsCompanion extends UpdateCompanion<WordEntry> {
  final Value<int> id;
  final Value<int?> topicId;
  final Value<String> word;
  final Value<String> translation;
  final Value<String> topicName;
  final Value<String?> transcription;
  final Value<String?> partOfSpeech;
  final Value<String?> usage;
  final Value<bool> learned;
  const WordsCompanion({
    this.id = const Value.absent(),
    this.topicId = const Value.absent(),
    this.word = const Value.absent(),
    this.translation = const Value.absent(),
    this.topicName = const Value.absent(),
    this.transcription = const Value.absent(),
    this.partOfSpeech = const Value.absent(),
    this.usage = const Value.absent(),
    this.learned = const Value.absent(),
  });
  WordsCompanion.insert({
    this.id = const Value.absent(),
    this.topicId = const Value.absent(),
    required String word,
    required String translation,
    required String topicName,
    this.transcription = const Value.absent(),
    this.partOfSpeech = const Value.absent(),
    this.usage = const Value.absent(),
    this.learned = const Value.absent(),
  }) : word = Value(word),
       translation = Value(translation),
       topicName = Value(topicName);
  static Insertable<WordEntry> custom({
    Expression<int>? id,
    Expression<int>? topicId,
    Expression<String>? word,
    Expression<String>? translation,
    Expression<String>? topicName,
    Expression<String>? transcription,
    Expression<String>? partOfSpeech,
    Expression<String>? usage,
    Expression<bool>? learned,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (topicId != null) 'topic_id': topicId,
      if (word != null) 'word': word,
      if (translation != null) 'translation': translation,
      if (topicName != null) 'topic_name': topicName,
      if (transcription != null) 'transcription': transcription,
      if (partOfSpeech != null) 'part_of_speech': partOfSpeech,
      if (usage != null) 'usage': usage,
      if (learned != null) 'learned': learned,
    });
  }

  WordsCompanion copyWith({
    Value<int>? id,
    Value<int?>? topicId,
    Value<String>? word,
    Value<String>? translation,
    Value<String>? topicName,
    Value<String?>? transcription,
    Value<String?>? partOfSpeech,
    Value<String?>? usage,
    Value<bool>? learned,
  }) {
    return WordsCompanion(
      id: id ?? this.id,
      topicId: topicId ?? this.topicId,
      word: word ?? this.word,
      translation: translation ?? this.translation,
      topicName: topicName ?? this.topicName,
      transcription: transcription ?? this.transcription,
      partOfSpeech: partOfSpeech ?? this.partOfSpeech,
      usage: usage ?? this.usage,
      learned: learned ?? this.learned,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (topicId.present) {
      map['topic_id'] = Variable<int>(topicId.value);
    }
    if (word.present) {
      map['word'] = Variable<String>(word.value);
    }
    if (translation.present) {
      map['translation'] = Variable<String>(translation.value);
    }
    if (topicName.present) {
      map['topic_name'] = Variable<String>(topicName.value);
    }
    if (transcription.present) {
      map['transcription'] = Variable<String>(transcription.value);
    }
    if (partOfSpeech.present) {
      map['part_of_speech'] = Variable<String>(partOfSpeech.value);
    }
    if (usage.present) {
      map['usage'] = Variable<String>(usage.value);
    }
    if (learned.present) {
      map['learned'] = Variable<bool>(learned.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WordsCompanion(')
          ..write('id: $id, ')
          ..write('topicId: $topicId, ')
          ..write('word: $word, ')
          ..write('translation: $translation, ')
          ..write('topicName: $topicName, ')
          ..write('transcription: $transcription, ')
          ..write('partOfSpeech: $partOfSpeech, ')
          ..write('usage: $usage, ')
          ..write('learned: $learned')
          ..write(')'))
        .toString();
  }
}

class $UserGoalsTableTable extends UserGoalsTable
    with TableInfo<$UserGoalsTableTable, UserGoalsEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserGoalsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _overallGoalMeta = const VerificationMeta(
    'overallGoal',
  );
  @override
  late final GeneratedColumn<int> overallGoal = GeneratedColumn<int>(
    'overall_goal',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dailyGoalMeta = const VerificationMeta(
    'dailyGoal',
  );
  @override
  late final GeneratedColumn<int> dailyGoal = GeneratedColumn<int>(
    'daily_goal',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, overallGoal, dailyGoal];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_goals_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<UserGoalsEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('overall_goal')) {
      context.handle(
        _overallGoalMeta,
        overallGoal.isAcceptableOrUnknown(
          data['overall_goal']!,
          _overallGoalMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_overallGoalMeta);
    }
    if (data.containsKey('daily_goal')) {
      context.handle(
        _dailyGoalMeta,
        dailyGoal.isAcceptableOrUnknown(data['daily_goal']!, _dailyGoalMeta),
      );
    } else if (isInserting) {
      context.missing(_dailyGoalMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserGoalsEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserGoalsEntry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      overallGoal: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}overall_goal'],
      )!,
      dailyGoal: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}daily_goal'],
      )!,
    );
  }

  @override
  $UserGoalsTableTable createAlias(String alias) {
    return $UserGoalsTableTable(attachedDatabase, alias);
  }
}

class UserGoalsEntry extends DataClass implements Insertable<UserGoalsEntry> {
  final int id;
  final int overallGoal;
  final int dailyGoal;
  const UserGoalsEntry({
    required this.id,
    required this.overallGoal,
    required this.dailyGoal,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['overall_goal'] = Variable<int>(overallGoal);
    map['daily_goal'] = Variable<int>(dailyGoal);
    return map;
  }

  UserGoalsTableCompanion toCompanion(bool nullToAbsent) {
    return UserGoalsTableCompanion(
      id: Value(id),
      overallGoal: Value(overallGoal),
      dailyGoal: Value(dailyGoal),
    );
  }

  factory UserGoalsEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserGoalsEntry(
      id: serializer.fromJson<int>(json['id']),
      overallGoal: serializer.fromJson<int>(json['overallGoal']),
      dailyGoal: serializer.fromJson<int>(json['dailyGoal']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'overallGoal': serializer.toJson<int>(overallGoal),
      'dailyGoal': serializer.toJson<int>(dailyGoal),
    };
  }

  UserGoalsEntry copyWith({int? id, int? overallGoal, int? dailyGoal}) =>
      UserGoalsEntry(
        id: id ?? this.id,
        overallGoal: overallGoal ?? this.overallGoal,
        dailyGoal: dailyGoal ?? this.dailyGoal,
      );
  UserGoalsEntry copyWithCompanion(UserGoalsTableCompanion data) {
    return UserGoalsEntry(
      id: data.id.present ? data.id.value : this.id,
      overallGoal: data.overallGoal.present
          ? data.overallGoal.value
          : this.overallGoal,
      dailyGoal: data.dailyGoal.present ? data.dailyGoal.value : this.dailyGoal,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserGoalsEntry(')
          ..write('id: $id, ')
          ..write('overallGoal: $overallGoal, ')
          ..write('dailyGoal: $dailyGoal')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, overallGoal, dailyGoal);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserGoalsEntry &&
          other.id == this.id &&
          other.overallGoal == this.overallGoal &&
          other.dailyGoal == this.dailyGoal);
}

class UserGoalsTableCompanion extends UpdateCompanion<UserGoalsEntry> {
  final Value<int> id;
  final Value<int> overallGoal;
  final Value<int> dailyGoal;
  const UserGoalsTableCompanion({
    this.id = const Value.absent(),
    this.overallGoal = const Value.absent(),
    this.dailyGoal = const Value.absent(),
  });
  UserGoalsTableCompanion.insert({
    this.id = const Value.absent(),
    required int overallGoal,
    required int dailyGoal,
  }) : overallGoal = Value(overallGoal),
       dailyGoal = Value(dailyGoal);
  static Insertable<UserGoalsEntry> custom({
    Expression<int>? id,
    Expression<int>? overallGoal,
    Expression<int>? dailyGoal,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (overallGoal != null) 'overall_goal': overallGoal,
      if (dailyGoal != null) 'daily_goal': dailyGoal,
    });
  }

  UserGoalsTableCompanion copyWith({
    Value<int>? id,
    Value<int>? overallGoal,
    Value<int>? dailyGoal,
  }) {
    return UserGoalsTableCompanion(
      id: id ?? this.id,
      overallGoal: overallGoal ?? this.overallGoal,
      dailyGoal: dailyGoal ?? this.dailyGoal,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (overallGoal.present) {
      map['overall_goal'] = Variable<int>(overallGoal.value);
    }
    if (dailyGoal.present) {
      map['daily_goal'] = Variable<int>(dailyGoal.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserGoalsTableCompanion(')
          ..write('id: $id, ')
          ..write('overallGoal: $overallGoal, ')
          ..write('dailyGoal: $dailyGoal')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $TopicsTable topics = $TopicsTable(this);
  late final $WordsTable words = $WordsTable(this);
  late final $UserGoalsTableTable userGoalsTable = $UserGoalsTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    topics,
    words,
    userGoalsTable,
  ];
}

typedef $$TopicsTableCreateCompanionBuilder =
    TopicsCompanion Function({
      Value<int> id,
      required String name,
      Value<int?> colorValue,
    });
typedef $$TopicsTableUpdateCompanionBuilder =
    TopicsCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<int?> colorValue,
    });

final class $$TopicsTableReferences
    extends BaseReferences<_$AppDatabase, $TopicsTable, TopicEntry> {
  $$TopicsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$WordsTable, List<WordEntry>> _wordsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.words,
    aliasName: $_aliasNameGenerator(db.topics.id, db.words.topicId),
  );

  $$WordsTableProcessedTableManager get wordsRefs {
    final manager = $$WordsTableTableManager(
      $_db,
      $_db.words,
    ).filter((f) => f.topicId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_wordsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$TopicsTableFilterComposer
    extends Composer<_$AppDatabase, $TopicsTable> {
  $$TopicsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get colorValue => $composableBuilder(
    column: $table.colorValue,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> wordsRefs(
    Expression<bool> Function($$WordsTableFilterComposer f) f,
  ) {
    final $$WordsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.words,
      getReferencedColumn: (t) => t.topicId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WordsTableFilterComposer(
            $db: $db,
            $table: $db.words,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TopicsTableOrderingComposer
    extends Composer<_$AppDatabase, $TopicsTable> {
  $$TopicsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get colorValue => $composableBuilder(
    column: $table.colorValue,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TopicsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TopicsTable> {
  $$TopicsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get colorValue => $composableBuilder(
    column: $table.colorValue,
    builder: (column) => column,
  );

  Expression<T> wordsRefs<T extends Object>(
    Expression<T> Function($$WordsTableAnnotationComposer a) f,
  ) {
    final $$WordsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.words,
      getReferencedColumn: (t) => t.topicId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WordsTableAnnotationComposer(
            $db: $db,
            $table: $db.words,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TopicsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TopicsTable,
          TopicEntry,
          $$TopicsTableFilterComposer,
          $$TopicsTableOrderingComposer,
          $$TopicsTableAnnotationComposer,
          $$TopicsTableCreateCompanionBuilder,
          $$TopicsTableUpdateCompanionBuilder,
          (TopicEntry, $$TopicsTableReferences),
          TopicEntry,
          PrefetchHooks Function({bool wordsRefs})
        > {
  $$TopicsTableTableManager(_$AppDatabase db, $TopicsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TopicsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TopicsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TopicsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int?> colorValue = const Value.absent(),
              }) => TopicsCompanion(id: id, name: name, colorValue: colorValue),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<int?> colorValue = const Value.absent(),
              }) => TopicsCompanion.insert(
                id: id,
                name: name,
                colorValue: colorValue,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$TopicsTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({wordsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (wordsRefs) db.words],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (wordsRefs)
                    await $_getPrefetchedData<
                      TopicEntry,
                      $TopicsTable,
                      WordEntry
                    >(
                      currentTable: table,
                      referencedTable: $$TopicsTableReferences._wordsRefsTable(
                        db,
                      ),
                      managerFromTypedResult: (p0) =>
                          $$TopicsTableReferences(db, table, p0).wordsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.topicId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$TopicsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TopicsTable,
      TopicEntry,
      $$TopicsTableFilterComposer,
      $$TopicsTableOrderingComposer,
      $$TopicsTableAnnotationComposer,
      $$TopicsTableCreateCompanionBuilder,
      $$TopicsTableUpdateCompanionBuilder,
      (TopicEntry, $$TopicsTableReferences),
      TopicEntry,
      PrefetchHooks Function({bool wordsRefs})
    >;
typedef $$WordsTableCreateCompanionBuilder =
    WordsCompanion Function({
      Value<int> id,
      Value<int?> topicId,
      required String word,
      required String translation,
      required String topicName,
      Value<String?> transcription,
      Value<String?> partOfSpeech,
      Value<String?> usage,
      Value<bool> learned,
    });
typedef $$WordsTableUpdateCompanionBuilder =
    WordsCompanion Function({
      Value<int> id,
      Value<int?> topicId,
      Value<String> word,
      Value<String> translation,
      Value<String> topicName,
      Value<String?> transcription,
      Value<String?> partOfSpeech,
      Value<String?> usage,
      Value<bool> learned,
    });

final class $$WordsTableReferences
    extends BaseReferences<_$AppDatabase, $WordsTable, WordEntry> {
  $$WordsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $TopicsTable _topicIdTable(_$AppDatabase db) => db.topics.createAlias(
    $_aliasNameGenerator(db.words.topicId, db.topics.id),
  );

  $$TopicsTableProcessedTableManager? get topicId {
    final $_column = $_itemColumn<int>('topic_id');
    if ($_column == null) return null;
    final manager = $$TopicsTableTableManager(
      $_db,
      $_db.topics,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_topicIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$WordsTableFilterComposer extends Composer<_$AppDatabase, $WordsTable> {
  $$WordsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get word => $composableBuilder(
    column: $table.word,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get translation => $composableBuilder(
    column: $table.translation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get topicName => $composableBuilder(
    column: $table.topicName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get transcription => $composableBuilder(
    column: $table.transcription,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get partOfSpeech => $composableBuilder(
    column: $table.partOfSpeech,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get usage => $composableBuilder(
    column: $table.usage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get learned => $composableBuilder(
    column: $table.learned,
    builder: (column) => ColumnFilters(column),
  );

  $$TopicsTableFilterComposer get topicId {
    final $$TopicsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.topicId,
      referencedTable: $db.topics,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TopicsTableFilterComposer(
            $db: $db,
            $table: $db.topics,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$WordsTableOrderingComposer
    extends Composer<_$AppDatabase, $WordsTable> {
  $$WordsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get word => $composableBuilder(
    column: $table.word,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get translation => $composableBuilder(
    column: $table.translation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get topicName => $composableBuilder(
    column: $table.topicName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get transcription => $composableBuilder(
    column: $table.transcription,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get partOfSpeech => $composableBuilder(
    column: $table.partOfSpeech,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get usage => $composableBuilder(
    column: $table.usage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get learned => $composableBuilder(
    column: $table.learned,
    builder: (column) => ColumnOrderings(column),
  );

  $$TopicsTableOrderingComposer get topicId {
    final $$TopicsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.topicId,
      referencedTable: $db.topics,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TopicsTableOrderingComposer(
            $db: $db,
            $table: $db.topics,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$WordsTableAnnotationComposer
    extends Composer<_$AppDatabase, $WordsTable> {
  $$WordsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get word =>
      $composableBuilder(column: $table.word, builder: (column) => column);

  GeneratedColumn<String> get translation => $composableBuilder(
    column: $table.translation,
    builder: (column) => column,
  );

  GeneratedColumn<String> get topicName =>
      $composableBuilder(column: $table.topicName, builder: (column) => column);

  GeneratedColumn<String> get transcription => $composableBuilder(
    column: $table.transcription,
    builder: (column) => column,
  );

  GeneratedColumn<String> get partOfSpeech => $composableBuilder(
    column: $table.partOfSpeech,
    builder: (column) => column,
  );

  GeneratedColumn<String> get usage =>
      $composableBuilder(column: $table.usage, builder: (column) => column);

  GeneratedColumn<bool> get learned =>
      $composableBuilder(column: $table.learned, builder: (column) => column);

  $$TopicsTableAnnotationComposer get topicId {
    final $$TopicsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.topicId,
      referencedTable: $db.topics,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TopicsTableAnnotationComposer(
            $db: $db,
            $table: $db.topics,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$WordsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $WordsTable,
          WordEntry,
          $$WordsTableFilterComposer,
          $$WordsTableOrderingComposer,
          $$WordsTableAnnotationComposer,
          $$WordsTableCreateCompanionBuilder,
          $$WordsTableUpdateCompanionBuilder,
          (WordEntry, $$WordsTableReferences),
          WordEntry,
          PrefetchHooks Function({bool topicId})
        > {
  $$WordsTableTableManager(_$AppDatabase db, $WordsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WordsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WordsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WordsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> topicId = const Value.absent(),
                Value<String> word = const Value.absent(),
                Value<String> translation = const Value.absent(),
                Value<String> topicName = const Value.absent(),
                Value<String?> transcription = const Value.absent(),
                Value<String?> partOfSpeech = const Value.absent(),
                Value<String?> usage = const Value.absent(),
                Value<bool> learned = const Value.absent(),
              }) => WordsCompanion(
                id: id,
                topicId: topicId,
                word: word,
                translation: translation,
                topicName: topicName,
                transcription: transcription,
                partOfSpeech: partOfSpeech,
                usage: usage,
                learned: learned,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> topicId = const Value.absent(),
                required String word,
                required String translation,
                required String topicName,
                Value<String?> transcription = const Value.absent(),
                Value<String?> partOfSpeech = const Value.absent(),
                Value<String?> usage = const Value.absent(),
                Value<bool> learned = const Value.absent(),
              }) => WordsCompanion.insert(
                id: id,
                topicId: topicId,
                word: word,
                translation: translation,
                topicName: topicName,
                transcription: transcription,
                partOfSpeech: partOfSpeech,
                usage: usage,
                learned: learned,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$WordsTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({topicId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (topicId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.topicId,
                                referencedTable: $$WordsTableReferences
                                    ._topicIdTable(db),
                                referencedColumn: $$WordsTableReferences
                                    ._topicIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$WordsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $WordsTable,
      WordEntry,
      $$WordsTableFilterComposer,
      $$WordsTableOrderingComposer,
      $$WordsTableAnnotationComposer,
      $$WordsTableCreateCompanionBuilder,
      $$WordsTableUpdateCompanionBuilder,
      (WordEntry, $$WordsTableReferences),
      WordEntry,
      PrefetchHooks Function({bool topicId})
    >;
typedef $$UserGoalsTableTableCreateCompanionBuilder =
    UserGoalsTableCompanion Function({
      Value<int> id,
      required int overallGoal,
      required int dailyGoal,
    });
typedef $$UserGoalsTableTableUpdateCompanionBuilder =
    UserGoalsTableCompanion Function({
      Value<int> id,
      Value<int> overallGoal,
      Value<int> dailyGoal,
    });

class $$UserGoalsTableTableFilterComposer
    extends Composer<_$AppDatabase, $UserGoalsTableTable> {
  $$UserGoalsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get overallGoal => $composableBuilder(
    column: $table.overallGoal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get dailyGoal => $composableBuilder(
    column: $table.dailyGoal,
    builder: (column) => ColumnFilters(column),
  );
}

class $$UserGoalsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $UserGoalsTableTable> {
  $$UserGoalsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get overallGoal => $composableBuilder(
    column: $table.overallGoal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get dailyGoal => $composableBuilder(
    column: $table.dailyGoal,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UserGoalsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserGoalsTableTable> {
  $$UserGoalsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get overallGoal => $composableBuilder(
    column: $table.overallGoal,
    builder: (column) => column,
  );

  GeneratedColumn<int> get dailyGoal =>
      $composableBuilder(column: $table.dailyGoal, builder: (column) => column);
}

class $$UserGoalsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UserGoalsTableTable,
          UserGoalsEntry,
          $$UserGoalsTableTableFilterComposer,
          $$UserGoalsTableTableOrderingComposer,
          $$UserGoalsTableTableAnnotationComposer,
          $$UserGoalsTableTableCreateCompanionBuilder,
          $$UserGoalsTableTableUpdateCompanionBuilder,
          (
            UserGoalsEntry,
            BaseReferences<_$AppDatabase, $UserGoalsTableTable, UserGoalsEntry>,
          ),
          UserGoalsEntry,
          PrefetchHooks Function()
        > {
  $$UserGoalsTableTableTableManager(
    _$AppDatabase db,
    $UserGoalsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserGoalsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserGoalsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserGoalsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> overallGoal = const Value.absent(),
                Value<int> dailyGoal = const Value.absent(),
              }) => UserGoalsTableCompanion(
                id: id,
                overallGoal: overallGoal,
                dailyGoal: dailyGoal,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int overallGoal,
                required int dailyGoal,
              }) => UserGoalsTableCompanion.insert(
                id: id,
                overallGoal: overallGoal,
                dailyGoal: dailyGoal,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$UserGoalsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UserGoalsTableTable,
      UserGoalsEntry,
      $$UserGoalsTableTableFilterComposer,
      $$UserGoalsTableTableOrderingComposer,
      $$UserGoalsTableTableAnnotationComposer,
      $$UserGoalsTableTableCreateCompanionBuilder,
      $$UserGoalsTableTableUpdateCompanionBuilder,
      (
        UserGoalsEntry,
        BaseReferences<_$AppDatabase, $UserGoalsTableTable, UserGoalsEntry>,
      ),
      UserGoalsEntry,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$TopicsTableTableManager get topics =>
      $$TopicsTableTableManager(_db, _db.topics);
  $$WordsTableTableManager get words =>
      $$WordsTableTableManager(_db, _db.words);
  $$UserGoalsTableTableTableManager get userGoalsTable =>
      $$UserGoalsTableTableTableManager(_db, _db.userGoalsTable);
}
