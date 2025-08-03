// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_database.dart';

// ignore_for_file: type=lint
class $EventTableTable extends EventTable
    with TableInfo<$EventTableTable, EventTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EventTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _pubkeyMeta = const VerificationMeta('pubkey');
  @override
  late final GeneratedColumn<String> pubkey = GeneratedColumn<String>(
      'pubkey', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
      'created_at', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _kindMeta = const VerificationMeta('kind');
  @override
  late final GeneratedColumn<int> kind = GeneratedColumn<int>(
      'kind', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  late final GeneratedColumnWithTypeConverter<List<List<String>>, String> tags =
      GeneratedColumn<String>('tags', aliasedName, false,
              type: DriftSqlType.string,
              requiredDuringInsert: false,
              defaultValue: const Constant('[]'))
          .withConverter<List<List<String>>>($EventTableTable.$convertertags);
  static const VerificationMeta _contentMeta =
      const VerificationMeta('content');
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
      'content', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sigMeta = const VerificationMeta('sig');
  @override
  late final GeneratedColumn<String> sig = GeneratedColumn<String>(
      'sig', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _currentUserMeta =
      const VerificationMeta('currentUser');
  @override
  late final GeneratedColumn<String> currentUser = GeneratedColumn<String>(
      'current_user', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> seenOn =
      GeneratedColumn<String>('seen_on', aliasedName, false,
              type: DriftSqlType.string,
              requiredDuringInsert: false,
              defaultValue: const Constant('[]'))
          .withConverter<List<String>>($EventTableTable.$converterseenOn);
  static const VerificationMeta _lastUpdatedMeta =
      const VerificationMeta('lastUpdated');
  @override
  late final GeneratedColumn<int> lastUpdated = GeneratedColumn<int>(
      'last_updated', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _subscriptionIdMeta =
      const VerificationMeta('subscriptionId');
  @override
  late final GeneratedColumn<String> subscriptionId = GeneratedColumn<String>(
      'subscription_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  late final GeneratedColumnWithTypeConverter<List<List<String>>, String>
      tTags = GeneratedColumn<String>('t_tags', aliasedName, false,
              type: DriftSqlType.string,
              requiredDuringInsert: false,
              defaultValue: const Constant('[]'))
          .withConverter<List<List<String>>>($EventTableTable.$convertertTags);
  @override
  late final GeneratedColumnWithTypeConverter<List<List<String>>, String>
      pTags = GeneratedColumn<String>('p_tags', aliasedName, false,
              type: DriftSqlType.string,
              requiredDuringInsert: false,
              defaultValue: const Constant('[]'))
          .withConverter<List<List<String>>>($EventTableTable.$converterpTags);
  @override
  late final GeneratedColumnWithTypeConverter<List<List<String>>, String>
      capitalpTags = GeneratedColumn<String>(
              'capitalp_tags', aliasedName, false,
              type: DriftSqlType.string,
              requiredDuringInsert: false,
              defaultValue: const Constant('[]'))
          .withConverter<List<List<String>>>(
              $EventTableTable.$convertercapitalpTags);
  @override
  late final GeneratedColumnWithTypeConverter<List<List<String>>, String>
      kTags = GeneratedColumn<String>('k_tags', aliasedName, false,
              type: DriftSqlType.string,
              requiredDuringInsert: false,
              defaultValue: const Constant('[]'))
          .withConverter<List<List<String>>>($EventTableTable.$converterkTags);
  @override
  late final GeneratedColumnWithTypeConverter<List<List<String>>, String>
      eTags = GeneratedColumn<String>('e_tags', aliasedName, false,
              type: DriftSqlType.string,
              requiredDuringInsert: false,
              defaultValue: const Constant('[]'))
          .withConverter<List<List<String>>>($EventTableTable.$convertereTags);
  @override
  late final GeneratedColumnWithTypeConverter<List<List<String>>, String>
      lTags = GeneratedColumn<String>('l_tags', aliasedName, false,
              type: DriftSqlType.string,
              requiredDuringInsert: false,
              defaultValue: const Constant('[]'))
          .withConverter<List<List<String>>>($EventTableTable.$converterlTags);
  @override
  late final GeneratedColumnWithTypeConverter<List<List<String>>, String>
      aTags = GeneratedColumn<String>('a_tags', aliasedName, false,
              type: DriftSqlType.string,
              requiredDuringInsert: false,
              defaultValue: const Constant('[]'))
          .withConverter<List<List<String>>>($EventTableTable.$converteraTags);
  @override
  late final GeneratedColumnWithTypeConverter<List<List<String>>, String>
      other = GeneratedColumn<String>('other', aliasedName, false,
              type: DriftSqlType.string,
              requiredDuringInsert: false,
              defaultValue: const Constant('[]'))
          .withConverter<List<List<String>>>($EventTableTable.$converterother);
  static const VerificationMeta _dTagMeta = const VerificationMeta('dTag');
  @override
  late final GeneratedColumn<String> dTag = GeneratedColumn<String>(
      'd_tag', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _rootMeta = const VerificationMeta('root');
  @override
  late final GeneratedColumn<String> root = GeneratedColumn<String>(
      'root', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _replyMeta = const VerificationMeta('reply');
  @override
  late final GeneratedColumn<String> reply = GeneratedColumn<String>(
      'reply', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        pubkey,
        createdAt,
        kind,
        tags,
        content,
        sig,
        currentUser,
        seenOn,
        lastUpdated,
        subscriptionId,
        tTags,
        pTags,
        capitalpTags,
        kTags,
        eTags,
        lTags,
        aTags,
        other,
        dTag,
        root,
        reply
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'event_table';
  @override
  VerificationContext validateIntegrity(Insertable<EventTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('pubkey')) {
      context.handle(_pubkeyMeta,
          pubkey.isAcceptableOrUnknown(data['pubkey']!, _pubkeyMeta));
    } else if (isInserting) {
      context.missing(_pubkeyMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('kind')) {
      context.handle(
          _kindMeta, kind.isAcceptableOrUnknown(data['kind']!, _kindMeta));
    } else if (isInserting) {
      context.missing(_kindMeta);
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('sig')) {
      context.handle(
          _sigMeta, sig.isAcceptableOrUnknown(data['sig']!, _sigMeta));
    } else if (isInserting) {
      context.missing(_sigMeta);
    }
    if (data.containsKey('current_user')) {
      context.handle(
          _currentUserMeta,
          currentUser.isAcceptableOrUnknown(
              data['current_user']!, _currentUserMeta));
    }
    if (data.containsKey('last_updated')) {
      context.handle(
          _lastUpdatedMeta,
          lastUpdated.isAcceptableOrUnknown(
              data['last_updated']!, _lastUpdatedMeta));
    }
    if (data.containsKey('subscription_id')) {
      context.handle(
          _subscriptionIdMeta,
          subscriptionId.isAcceptableOrUnknown(
              data['subscription_id']!, _subscriptionIdMeta));
    }
    if (data.containsKey('d_tag')) {
      context.handle(
          _dTagMeta, dTag.isAcceptableOrUnknown(data['d_tag']!, _dTagMeta));
    }
    if (data.containsKey('root')) {
      context.handle(
          _rootMeta, root.isAcceptableOrUnknown(data['root']!, _rootMeta));
    }
    if (data.containsKey('reply')) {
      context.handle(
          _replyMeta, reply.isAcceptableOrUnknown(data['reply']!, _replyMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  EventTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EventTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      pubkey: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}pubkey'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}created_at'])!,
      kind: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}kind'])!,
      tags: $EventTableTable.$convertertags.fromSql(attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tags'])!),
      content: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content'])!,
      sig: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sig'])!,
      currentUser: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}current_user'])!,
      seenOn: $EventTableTable.$converterseenOn.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}seen_on'])!),
      lastUpdated: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}last_updated']),
      subscriptionId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}subscription_id']),
      tTags: $EventTableTable.$convertertTags.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}t_tags'])!),
      pTags: $EventTableTable.$converterpTags.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}p_tags'])!),
      capitalpTags: $EventTableTable.$convertercapitalpTags.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}capitalp_tags'])!),
      kTags: $EventTableTable.$converterkTags.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}k_tags'])!),
      eTags: $EventTableTable.$convertereTags.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}e_tags'])!),
      lTags: $EventTableTable.$converterlTags.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}l_tags'])!),
      aTags: $EventTableTable.$converteraTags.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}a_tags'])!),
      other: $EventTableTable.$converterother.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}other'])!),
      dTag: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}d_tag']),
      root: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}root']),
      reply: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}reply']),
    );
  }

  @override
  $EventTableTable createAlias(String alias) {
    return $EventTableTable(attachedDatabase, alias);
  }

  static TypeConverter<List<List<String>>, String> $convertertags =
      const StringListOfListConverter();
  static TypeConverter<List<String>, String> $converterseenOn =
      const StringListConverter();
  static TypeConverter<List<List<String>>, String> $convertertTags =
      const StringListOfListConverter();
  static TypeConverter<List<List<String>>, String> $converterpTags =
      const StringListOfListConverter();
  static TypeConverter<List<List<String>>, String> $convertercapitalpTags =
      const StringListOfListConverter();
  static TypeConverter<List<List<String>>, String> $converterkTags =
      const StringListOfListConverter();
  static TypeConverter<List<List<String>>, String> $convertereTags =
      const StringListOfListConverter();
  static TypeConverter<List<List<String>>, String> $converterlTags =
      const StringListOfListConverter();
  static TypeConverter<List<List<String>>, String> $converteraTags =
      const StringListOfListConverter();
  static TypeConverter<List<List<String>>, String> $converterother =
      const StringListOfListConverter();
}

class EventTableData extends DataClass implements Insertable<EventTableData> {
  final String id;
  final String pubkey;
  final int createdAt;
  final int kind;
  final List<List<String>> tags;
  final String content;
  final String sig;
  final String currentUser;
  final List<String> seenOn;
  final int? lastUpdated;
  final String? subscriptionId;
  final List<List<String>> tTags;
  final List<List<String>> pTags;
  final List<List<String>> capitalpTags;
  final List<List<String>> kTags;
  final List<List<String>> eTags;
  final List<List<String>> lTags;
  final List<List<String>> aTags;
  final List<List<String>> other;
  final String? dTag;
  final String? root;
  final String? reply;
  const EventTableData(
      {required this.id,
      required this.pubkey,
      required this.createdAt,
      required this.kind,
      required this.tags,
      required this.content,
      required this.sig,
      required this.currentUser,
      required this.seenOn,
      this.lastUpdated,
      this.subscriptionId,
      required this.tTags,
      required this.pTags,
      required this.capitalpTags,
      required this.kTags,
      required this.eTags,
      required this.lTags,
      required this.aTags,
      required this.other,
      this.dTag,
      this.root,
      this.reply});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['pubkey'] = Variable<String>(pubkey);
    map['created_at'] = Variable<int>(createdAt);
    map['kind'] = Variable<int>(kind);
    {
      map['tags'] =
          Variable<String>($EventTableTable.$convertertags.toSql(tags));
    }
    map['content'] = Variable<String>(content);
    map['sig'] = Variable<String>(sig);
    map['current_user'] = Variable<String>(currentUser);
    {
      map['seen_on'] =
          Variable<String>($EventTableTable.$converterseenOn.toSql(seenOn));
    }
    if (!nullToAbsent || lastUpdated != null) {
      map['last_updated'] = Variable<int>(lastUpdated);
    }
    if (!nullToAbsent || subscriptionId != null) {
      map['subscription_id'] = Variable<String>(subscriptionId);
    }
    {
      map['t_tags'] =
          Variable<String>($EventTableTable.$convertertTags.toSql(tTags));
    }
    {
      map['p_tags'] =
          Variable<String>($EventTableTable.$converterpTags.toSql(pTags));
    }
    {
      map['capitalp_tags'] = Variable<String>(
          $EventTableTable.$convertercapitalpTags.toSql(capitalpTags));
    }
    {
      map['k_tags'] =
          Variable<String>($EventTableTable.$converterkTags.toSql(kTags));
    }
    {
      map['e_tags'] =
          Variable<String>($EventTableTable.$convertereTags.toSql(eTags));
    }
    {
      map['l_tags'] =
          Variable<String>($EventTableTable.$converterlTags.toSql(lTags));
    }
    {
      map['a_tags'] =
          Variable<String>($EventTableTable.$converteraTags.toSql(aTags));
    }
    {
      map['other'] =
          Variable<String>($EventTableTable.$converterother.toSql(other));
    }
    if (!nullToAbsent || dTag != null) {
      map['d_tag'] = Variable<String>(dTag);
    }
    if (!nullToAbsent || root != null) {
      map['root'] = Variable<String>(root);
    }
    if (!nullToAbsent || reply != null) {
      map['reply'] = Variable<String>(reply);
    }
    return map;
  }

  EventTableCompanion toCompanion(bool nullToAbsent) {
    return EventTableCompanion(
      id: Value(id),
      pubkey: Value(pubkey),
      createdAt: Value(createdAt),
      kind: Value(kind),
      tags: Value(tags),
      content: Value(content),
      sig: Value(sig),
      currentUser: Value(currentUser),
      seenOn: Value(seenOn),
      lastUpdated: lastUpdated == null && nullToAbsent
          ? const Value.absent()
          : Value(lastUpdated),
      subscriptionId: subscriptionId == null && nullToAbsent
          ? const Value.absent()
          : Value(subscriptionId),
      tTags: Value(tTags),
      pTags: Value(pTags),
      capitalpTags: Value(capitalpTags),
      kTags: Value(kTags),
      eTags: Value(eTags),
      lTags: Value(lTags),
      aTags: Value(aTags),
      other: Value(other),
      dTag: dTag == null && nullToAbsent ? const Value.absent() : Value(dTag),
      root: root == null && nullToAbsent ? const Value.absent() : Value(root),
      reply:
          reply == null && nullToAbsent ? const Value.absent() : Value(reply),
    );
  }

  factory EventTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EventTableData(
      id: serializer.fromJson<String>(json['id']),
      pubkey: serializer.fromJson<String>(json['pubkey']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      kind: serializer.fromJson<int>(json['kind']),
      tags: serializer.fromJson<List<List<String>>>(json['tags']),
      content: serializer.fromJson<String>(json['content']),
      sig: serializer.fromJson<String>(json['sig']),
      currentUser: serializer.fromJson<String>(json['currentUser']),
      seenOn: serializer.fromJson<List<String>>(json['seenOn']),
      lastUpdated: serializer.fromJson<int?>(json['lastUpdated']),
      subscriptionId: serializer.fromJson<String?>(json['subscriptionId']),
      tTags: serializer.fromJson<List<List<String>>>(json['tTags']),
      pTags: serializer.fromJson<List<List<String>>>(json['pTags']),
      capitalpTags:
          serializer.fromJson<List<List<String>>>(json['capitalpTags']),
      kTags: serializer.fromJson<List<List<String>>>(json['kTags']),
      eTags: serializer.fromJson<List<List<String>>>(json['eTags']),
      lTags: serializer.fromJson<List<List<String>>>(json['lTags']),
      aTags: serializer.fromJson<List<List<String>>>(json['aTags']),
      other: serializer.fromJson<List<List<String>>>(json['other']),
      dTag: serializer.fromJson<String?>(json['dTag']),
      root: serializer.fromJson<String?>(json['root']),
      reply: serializer.fromJson<String?>(json['reply']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'pubkey': serializer.toJson<String>(pubkey),
      'createdAt': serializer.toJson<int>(createdAt),
      'kind': serializer.toJson<int>(kind),
      'tags': serializer.toJson<List<List<String>>>(tags),
      'content': serializer.toJson<String>(content),
      'sig': serializer.toJson<String>(sig),
      'currentUser': serializer.toJson<String>(currentUser),
      'seenOn': serializer.toJson<List<String>>(seenOn),
      'lastUpdated': serializer.toJson<int?>(lastUpdated),
      'subscriptionId': serializer.toJson<String?>(subscriptionId),
      'tTags': serializer.toJson<List<List<String>>>(tTags),
      'pTags': serializer.toJson<List<List<String>>>(pTags),
      'capitalpTags': serializer.toJson<List<List<String>>>(capitalpTags),
      'kTags': serializer.toJson<List<List<String>>>(kTags),
      'eTags': serializer.toJson<List<List<String>>>(eTags),
      'lTags': serializer.toJson<List<List<String>>>(lTags),
      'aTags': serializer.toJson<List<List<String>>>(aTags),
      'other': serializer.toJson<List<List<String>>>(other),
      'dTag': serializer.toJson<String?>(dTag),
      'root': serializer.toJson<String?>(root),
      'reply': serializer.toJson<String?>(reply),
    };
  }

  EventTableData copyWith(
          {String? id,
          String? pubkey,
          int? createdAt,
          int? kind,
          List<List<String>>? tags,
          String? content,
          String? sig,
          String? currentUser,
          List<String>? seenOn,
          Value<int?> lastUpdated = const Value.absent(),
          Value<String?> subscriptionId = const Value.absent(),
          List<List<String>>? tTags,
          List<List<String>>? pTags,
          List<List<String>>? capitalpTags,
          List<List<String>>? kTags,
          List<List<String>>? eTags,
          List<List<String>>? lTags,
          List<List<String>>? aTags,
          List<List<String>>? other,
          Value<String?> dTag = const Value.absent(),
          Value<String?> root = const Value.absent(),
          Value<String?> reply = const Value.absent()}) =>
      EventTableData(
        id: id ?? this.id,
        pubkey: pubkey ?? this.pubkey,
        createdAt: createdAt ?? this.createdAt,
        kind: kind ?? this.kind,
        tags: tags ?? this.tags,
        content: content ?? this.content,
        sig: sig ?? this.sig,
        currentUser: currentUser ?? this.currentUser,
        seenOn: seenOn ?? this.seenOn,
        lastUpdated: lastUpdated.present ? lastUpdated.value : this.lastUpdated,
        subscriptionId:
            subscriptionId.present ? subscriptionId.value : this.subscriptionId,
        tTags: tTags ?? this.tTags,
        pTags: pTags ?? this.pTags,
        capitalpTags: capitalpTags ?? this.capitalpTags,
        kTags: kTags ?? this.kTags,
        eTags: eTags ?? this.eTags,
        lTags: lTags ?? this.lTags,
        aTags: aTags ?? this.aTags,
        other: other ?? this.other,
        dTag: dTag.present ? dTag.value : this.dTag,
        root: root.present ? root.value : this.root,
        reply: reply.present ? reply.value : this.reply,
      );
  EventTableData copyWithCompanion(EventTableCompanion data) {
    return EventTableData(
      id: data.id.present ? data.id.value : this.id,
      pubkey: data.pubkey.present ? data.pubkey.value : this.pubkey,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      kind: data.kind.present ? data.kind.value : this.kind,
      tags: data.tags.present ? data.tags.value : this.tags,
      content: data.content.present ? data.content.value : this.content,
      sig: data.sig.present ? data.sig.value : this.sig,
      currentUser:
          data.currentUser.present ? data.currentUser.value : this.currentUser,
      seenOn: data.seenOn.present ? data.seenOn.value : this.seenOn,
      lastUpdated:
          data.lastUpdated.present ? data.lastUpdated.value : this.lastUpdated,
      subscriptionId: data.subscriptionId.present
          ? data.subscriptionId.value
          : this.subscriptionId,
      tTags: data.tTags.present ? data.tTags.value : this.tTags,
      pTags: data.pTags.present ? data.pTags.value : this.pTags,
      capitalpTags: data.capitalpTags.present
          ? data.capitalpTags.value
          : this.capitalpTags,
      kTags: data.kTags.present ? data.kTags.value : this.kTags,
      eTags: data.eTags.present ? data.eTags.value : this.eTags,
      lTags: data.lTags.present ? data.lTags.value : this.lTags,
      aTags: data.aTags.present ? data.aTags.value : this.aTags,
      other: data.other.present ? data.other.value : this.other,
      dTag: data.dTag.present ? data.dTag.value : this.dTag,
      root: data.root.present ? data.root.value : this.root,
      reply: data.reply.present ? data.reply.value : this.reply,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EventTableData(')
          ..write('id: $id, ')
          ..write('pubkey: $pubkey, ')
          ..write('createdAt: $createdAt, ')
          ..write('kind: $kind, ')
          ..write('tags: $tags, ')
          ..write('content: $content, ')
          ..write('sig: $sig, ')
          ..write('currentUser: $currentUser, ')
          ..write('seenOn: $seenOn, ')
          ..write('lastUpdated: $lastUpdated, ')
          ..write('subscriptionId: $subscriptionId, ')
          ..write('tTags: $tTags, ')
          ..write('pTags: $pTags, ')
          ..write('capitalpTags: $capitalpTags, ')
          ..write('kTags: $kTags, ')
          ..write('eTags: $eTags, ')
          ..write('lTags: $lTags, ')
          ..write('aTags: $aTags, ')
          ..write('other: $other, ')
          ..write('dTag: $dTag, ')
          ..write('root: $root, ')
          ..write('reply: $reply')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        id,
        pubkey,
        createdAt,
        kind,
        tags,
        content,
        sig,
        currentUser,
        seenOn,
        lastUpdated,
        subscriptionId,
        tTags,
        pTags,
        capitalpTags,
        kTags,
        eTags,
        lTags,
        aTags,
        other,
        dTag,
        root,
        reply
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EventTableData &&
          other.id == this.id &&
          other.pubkey == this.pubkey &&
          other.createdAt == this.createdAt &&
          other.kind == this.kind &&
          other.tags == this.tags &&
          other.content == this.content &&
          other.sig == this.sig &&
          other.currentUser == this.currentUser &&
          other.seenOn == this.seenOn &&
          other.lastUpdated == this.lastUpdated &&
          other.subscriptionId == this.subscriptionId &&
          other.tTags == this.tTags &&
          other.pTags == this.pTags &&
          other.capitalpTags == this.capitalpTags &&
          other.kTags == this.kTags &&
          other.eTags == this.eTags &&
          other.lTags == this.lTags &&
          other.aTags == this.aTags &&
          other.other == this.other &&
          other.dTag == this.dTag &&
          other.root == this.root &&
          other.reply == this.reply);
}

class EventTableCompanion extends UpdateCompanion<EventTableData> {
  final Value<String> id;
  final Value<String> pubkey;
  final Value<int> createdAt;
  final Value<int> kind;
  final Value<List<List<String>>> tags;
  final Value<String> content;
  final Value<String> sig;
  final Value<String> currentUser;
  final Value<List<String>> seenOn;
  final Value<int?> lastUpdated;
  final Value<String?> subscriptionId;
  final Value<List<List<String>>> tTags;
  final Value<List<List<String>>> pTags;
  final Value<List<List<String>>> capitalpTags;
  final Value<List<List<String>>> kTags;
  final Value<List<List<String>>> eTags;
  final Value<List<List<String>>> lTags;
  final Value<List<List<String>>> aTags;
  final Value<List<List<String>>> other;
  final Value<String?> dTag;
  final Value<String?> root;
  final Value<String?> reply;
  final Value<int> rowid;
  const EventTableCompanion({
    this.id = const Value.absent(),
    this.pubkey = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.kind = const Value.absent(),
    this.tags = const Value.absent(),
    this.content = const Value.absent(),
    this.sig = const Value.absent(),
    this.currentUser = const Value.absent(),
    this.seenOn = const Value.absent(),
    this.lastUpdated = const Value.absent(),
    this.subscriptionId = const Value.absent(),
    this.tTags = const Value.absent(),
    this.pTags = const Value.absent(),
    this.capitalpTags = const Value.absent(),
    this.kTags = const Value.absent(),
    this.eTags = const Value.absent(),
    this.lTags = const Value.absent(),
    this.aTags = const Value.absent(),
    this.other = const Value.absent(),
    this.dTag = const Value.absent(),
    this.root = const Value.absent(),
    this.reply = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  EventTableCompanion.insert({
    required String id,
    required String pubkey,
    required int createdAt,
    required int kind,
    this.tags = const Value.absent(),
    required String content,
    required String sig,
    this.currentUser = const Value.absent(),
    this.seenOn = const Value.absent(),
    this.lastUpdated = const Value.absent(),
    this.subscriptionId = const Value.absent(),
    this.tTags = const Value.absent(),
    this.pTags = const Value.absent(),
    this.capitalpTags = const Value.absent(),
    this.kTags = const Value.absent(),
    this.eTags = const Value.absent(),
    this.lTags = const Value.absent(),
    this.aTags = const Value.absent(),
    this.other = const Value.absent(),
    this.dTag = const Value.absent(),
    this.root = const Value.absent(),
    this.reply = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        pubkey = Value(pubkey),
        createdAt = Value(createdAt),
        kind = Value(kind),
        content = Value(content),
        sig = Value(sig);
  static Insertable<EventTableData> custom({
    Expression<String>? id,
    Expression<String>? pubkey,
    Expression<int>? createdAt,
    Expression<int>? kind,
    Expression<String>? tags,
    Expression<String>? content,
    Expression<String>? sig,
    Expression<String>? currentUser,
    Expression<String>? seenOn,
    Expression<int>? lastUpdated,
    Expression<String>? subscriptionId,
    Expression<String>? tTags,
    Expression<String>? pTags,
    Expression<String>? capitalpTags,
    Expression<String>? kTags,
    Expression<String>? eTags,
    Expression<String>? lTags,
    Expression<String>? aTags,
    Expression<String>? other,
    Expression<String>? dTag,
    Expression<String>? root,
    Expression<String>? reply,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (pubkey != null) 'pubkey': pubkey,
      if (createdAt != null) 'created_at': createdAt,
      if (kind != null) 'kind': kind,
      if (tags != null) 'tags': tags,
      if (content != null) 'content': content,
      if (sig != null) 'sig': sig,
      if (currentUser != null) 'current_user': currentUser,
      if (seenOn != null) 'seen_on': seenOn,
      if (lastUpdated != null) 'last_updated': lastUpdated,
      if (subscriptionId != null) 'subscription_id': subscriptionId,
      if (tTags != null) 't_tags': tTags,
      if (pTags != null) 'p_tags': pTags,
      if (capitalpTags != null) 'capitalp_tags': capitalpTags,
      if (kTags != null) 'k_tags': kTags,
      if (eTags != null) 'e_tags': eTags,
      if (lTags != null) 'l_tags': lTags,
      if (aTags != null) 'a_tags': aTags,
      if (other != null) 'other': other,
      if (dTag != null) 'd_tag': dTag,
      if (root != null) 'root': root,
      if (reply != null) 'reply': reply,
      if (rowid != null) 'rowid': rowid,
    });
  }

  EventTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? pubkey,
      Value<int>? createdAt,
      Value<int>? kind,
      Value<List<List<String>>>? tags,
      Value<String>? content,
      Value<String>? sig,
      Value<String>? currentUser,
      Value<List<String>>? seenOn,
      Value<int?>? lastUpdated,
      Value<String?>? subscriptionId,
      Value<List<List<String>>>? tTags,
      Value<List<List<String>>>? pTags,
      Value<List<List<String>>>? capitalpTags,
      Value<List<List<String>>>? kTags,
      Value<List<List<String>>>? eTags,
      Value<List<List<String>>>? lTags,
      Value<List<List<String>>>? aTags,
      Value<List<List<String>>>? other,
      Value<String?>? dTag,
      Value<String?>? root,
      Value<String?>? reply,
      Value<int>? rowid}) {
    return EventTableCompanion(
      id: id ?? this.id,
      pubkey: pubkey ?? this.pubkey,
      createdAt: createdAt ?? this.createdAt,
      kind: kind ?? this.kind,
      tags: tags ?? this.tags,
      content: content ?? this.content,
      sig: sig ?? this.sig,
      currentUser: currentUser ?? this.currentUser,
      seenOn: seenOn ?? this.seenOn,
      lastUpdated: lastUpdated ?? this.lastUpdated,
      subscriptionId: subscriptionId ?? this.subscriptionId,
      tTags: tTags ?? this.tTags,
      pTags: pTags ?? this.pTags,
      capitalpTags: capitalpTags ?? this.capitalpTags,
      kTags: kTags ?? this.kTags,
      eTags: eTags ?? this.eTags,
      lTags: lTags ?? this.lTags,
      aTags: aTags ?? this.aTags,
      other: other ?? this.other,
      dTag: dTag ?? this.dTag,
      root: root ?? this.root,
      reply: reply ?? this.reply,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (pubkey.present) {
      map['pubkey'] = Variable<String>(pubkey.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (kind.present) {
      map['kind'] = Variable<int>(kind.value);
    }
    if (tags.present) {
      map['tags'] =
          Variable<String>($EventTableTable.$convertertags.toSql(tags.value));
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (sig.present) {
      map['sig'] = Variable<String>(sig.value);
    }
    if (currentUser.present) {
      map['current_user'] = Variable<String>(currentUser.value);
    }
    if (seenOn.present) {
      map['seen_on'] = Variable<String>(
          $EventTableTable.$converterseenOn.toSql(seenOn.value));
    }
    if (lastUpdated.present) {
      map['last_updated'] = Variable<int>(lastUpdated.value);
    }
    if (subscriptionId.present) {
      map['subscription_id'] = Variable<String>(subscriptionId.value);
    }
    if (tTags.present) {
      map['t_tags'] =
          Variable<String>($EventTableTable.$convertertTags.toSql(tTags.value));
    }
    if (pTags.present) {
      map['p_tags'] =
          Variable<String>($EventTableTable.$converterpTags.toSql(pTags.value));
    }
    if (capitalpTags.present) {
      map['capitalp_tags'] = Variable<String>(
          $EventTableTable.$convertercapitalpTags.toSql(capitalpTags.value));
    }
    if (kTags.present) {
      map['k_tags'] =
          Variable<String>($EventTableTable.$converterkTags.toSql(kTags.value));
    }
    if (eTags.present) {
      map['e_tags'] =
          Variable<String>($EventTableTable.$convertereTags.toSql(eTags.value));
    }
    if (lTags.present) {
      map['l_tags'] =
          Variable<String>($EventTableTable.$converterlTags.toSql(lTags.value));
    }
    if (aTags.present) {
      map['a_tags'] =
          Variable<String>($EventTableTable.$converteraTags.toSql(aTags.value));
    }
    if (other.present) {
      map['other'] =
          Variable<String>($EventTableTable.$converterother.toSql(other.value));
    }
    if (dTag.present) {
      map['d_tag'] = Variable<String>(dTag.value);
    }
    if (root.present) {
      map['root'] = Variable<String>(root.value);
    }
    if (reply.present) {
      map['reply'] = Variable<String>(reply.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EventTableCompanion(')
          ..write('id: $id, ')
          ..write('pubkey: $pubkey, ')
          ..write('createdAt: $createdAt, ')
          ..write('kind: $kind, ')
          ..write('tags: $tags, ')
          ..write('content: $content, ')
          ..write('sig: $sig, ')
          ..write('currentUser: $currentUser, ')
          ..write('seenOn: $seenOn, ')
          ..write('lastUpdated: $lastUpdated, ')
          ..write('subscriptionId: $subscriptionId, ')
          ..write('tTags: $tTags, ')
          ..write('pTags: $pTags, ')
          ..write('capitalpTags: $capitalpTags, ')
          ..write('kTags: $kTags, ')
          ..write('eTags: $eTags, ')
          ..write('lTags: $lTags, ')
          ..write('aTags: $aTags, ')
          ..write('other: $other, ')
          ..write('dTag: $dTag, ')
          ..write('root: $root, ')
          ..write('reply: $reply, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MetadataTableTable extends MetadataTable
    with TableInfo<$MetadataTableTable, MetadataTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MetadataTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _pubkeyMeta = const VerificationMeta('pubkey');
  @override
  late final GeneratedColumn<String> pubkey = GeneratedColumn<String>(
      'pubkey', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _displayNameMeta =
      const VerificationMeta('displayName');
  @override
  late final GeneratedColumn<String> displayName = GeneratedColumn<String>(
      'display_name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _pictureMeta =
      const VerificationMeta('picture');
  @override
  late final GeneratedColumn<String> picture = GeneratedColumn<String>(
      'picture', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _bannerMeta = const VerificationMeta('banner');
  @override
  late final GeneratedColumn<String> banner = GeneratedColumn<String>(
      'banner', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _websiteMeta =
      const VerificationMeta('website');
  @override
  late final GeneratedColumn<String> website = GeneratedColumn<String>(
      'website', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _aboutMeta = const VerificationMeta('about');
  @override
  late final GeneratedColumn<String> about = GeneratedColumn<String>(
      'about', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _nip05Meta = const VerificationMeta('nip05');
  @override
  late final GeneratedColumn<String> nip05 = GeneratedColumn<String>(
      'nip05', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _lud16Meta = const VerificationMeta('lud16');
  @override
  late final GeneratedColumn<String> lud16 = GeneratedColumn<String>(
      'lud16', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _lud06Meta = const VerificationMeta('lud06');
  @override
  late final GeneratedColumn<String> lud06 = GeneratedColumn<String>(
      'lud06', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
      'created_at', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _isDeletedMeta =
      const VerificationMeta('isDeleted');
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
      'is_deleted', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_deleted" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _refreshedTimestampMeta =
      const VerificationMeta('refreshedTimestamp');
  @override
  late final GeneratedColumn<int> refreshedTimestamp = GeneratedColumn<int>(
      'refreshed_timestamp', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        pubkey,
        name,
        displayName,
        picture,
        banner,
        website,
        about,
        nip05,
        lud16,
        lud06,
        createdAt,
        isDeleted,
        refreshedTimestamp
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'metadata_table';
  @override
  VerificationContext validateIntegrity(Insertable<MetadataTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('pubkey')) {
      context.handle(_pubkeyMeta,
          pubkey.isAcceptableOrUnknown(data['pubkey']!, _pubkeyMeta));
    } else if (isInserting) {
      context.missing(_pubkeyMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    if (data.containsKey('display_name')) {
      context.handle(
          _displayNameMeta,
          displayName.isAcceptableOrUnknown(
              data['display_name']!, _displayNameMeta));
    }
    if (data.containsKey('picture')) {
      context.handle(_pictureMeta,
          picture.isAcceptableOrUnknown(data['picture']!, _pictureMeta));
    }
    if (data.containsKey('banner')) {
      context.handle(_bannerMeta,
          banner.isAcceptableOrUnknown(data['banner']!, _bannerMeta));
    }
    if (data.containsKey('website')) {
      context.handle(_websiteMeta,
          website.isAcceptableOrUnknown(data['website']!, _websiteMeta));
    }
    if (data.containsKey('about')) {
      context.handle(
          _aboutMeta, about.isAcceptableOrUnknown(data['about']!, _aboutMeta));
    }
    if (data.containsKey('nip05')) {
      context.handle(
          _nip05Meta, nip05.isAcceptableOrUnknown(data['nip05']!, _nip05Meta));
    }
    if (data.containsKey('lud16')) {
      context.handle(
          _lud16Meta, lud16.isAcceptableOrUnknown(data['lud16']!, _lud16Meta));
    }
    if (data.containsKey('lud06')) {
      context.handle(
          _lud06Meta, lud06.isAcceptableOrUnknown(data['lud06']!, _lud06Meta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('is_deleted')) {
      context.handle(_isDeletedMeta,
          isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta));
    }
    if (data.containsKey('refreshed_timestamp')) {
      context.handle(
          _refreshedTimestampMeta,
          refreshedTimestamp.isAcceptableOrUnknown(
              data['refreshed_timestamp']!, _refreshedTimestampMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {pubkey};
  @override
  MetadataTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MetadataTableData(
      pubkey: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}pubkey'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      displayName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}display_name'])!,
      picture: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}picture'])!,
      banner: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}banner'])!,
      website: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}website'])!,
      about: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}about'])!,
      nip05: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nip05'])!,
      lud16: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}lud16'])!,
      lud06: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}lud06'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}created_at'])!,
      isDeleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_deleted'])!,
      refreshedTimestamp: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}refreshed_timestamp']),
    );
  }

  @override
  $MetadataTableTable createAlias(String alias) {
    return $MetadataTableTable(attachedDatabase, alias);
  }
}

class MetadataTableData extends DataClass
    implements Insertable<MetadataTableData> {
  final String pubkey;
  final String name;
  final String displayName;
  final String picture;
  final String banner;
  final String website;
  final String about;
  final String nip05;
  final String lud16;
  final String lud06;
  final int createdAt;
  final bool isDeleted;
  final int? refreshedTimestamp;
  const MetadataTableData(
      {required this.pubkey,
      required this.name,
      required this.displayName,
      required this.picture,
      required this.banner,
      required this.website,
      required this.about,
      required this.nip05,
      required this.lud16,
      required this.lud06,
      required this.createdAt,
      required this.isDeleted,
      this.refreshedTimestamp});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['pubkey'] = Variable<String>(pubkey);
    map['name'] = Variable<String>(name);
    map['display_name'] = Variable<String>(displayName);
    map['picture'] = Variable<String>(picture);
    map['banner'] = Variable<String>(banner);
    map['website'] = Variable<String>(website);
    map['about'] = Variable<String>(about);
    map['nip05'] = Variable<String>(nip05);
    map['lud16'] = Variable<String>(lud16);
    map['lud06'] = Variable<String>(lud06);
    map['created_at'] = Variable<int>(createdAt);
    map['is_deleted'] = Variable<bool>(isDeleted);
    if (!nullToAbsent || refreshedTimestamp != null) {
      map['refreshed_timestamp'] = Variable<int>(refreshedTimestamp);
    }
    return map;
  }

  MetadataTableCompanion toCompanion(bool nullToAbsent) {
    return MetadataTableCompanion(
      pubkey: Value(pubkey),
      name: Value(name),
      displayName: Value(displayName),
      picture: Value(picture),
      banner: Value(banner),
      website: Value(website),
      about: Value(about),
      nip05: Value(nip05),
      lud16: Value(lud16),
      lud06: Value(lud06),
      createdAt: Value(createdAt),
      isDeleted: Value(isDeleted),
      refreshedTimestamp: refreshedTimestamp == null && nullToAbsent
          ? const Value.absent()
          : Value(refreshedTimestamp),
    );
  }

  factory MetadataTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MetadataTableData(
      pubkey: serializer.fromJson<String>(json['pubkey']),
      name: serializer.fromJson<String>(json['name']),
      displayName: serializer.fromJson<String>(json['displayName']),
      picture: serializer.fromJson<String>(json['picture']),
      banner: serializer.fromJson<String>(json['banner']),
      website: serializer.fromJson<String>(json['website']),
      about: serializer.fromJson<String>(json['about']),
      nip05: serializer.fromJson<String>(json['nip05']),
      lud16: serializer.fromJson<String>(json['lud16']),
      lud06: serializer.fromJson<String>(json['lud06']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
      refreshedTimestamp: serializer.fromJson<int?>(json['refreshedTimestamp']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'pubkey': serializer.toJson<String>(pubkey),
      'name': serializer.toJson<String>(name),
      'displayName': serializer.toJson<String>(displayName),
      'picture': serializer.toJson<String>(picture),
      'banner': serializer.toJson<String>(banner),
      'website': serializer.toJson<String>(website),
      'about': serializer.toJson<String>(about),
      'nip05': serializer.toJson<String>(nip05),
      'lud16': serializer.toJson<String>(lud16),
      'lud06': serializer.toJson<String>(lud06),
      'createdAt': serializer.toJson<int>(createdAt),
      'isDeleted': serializer.toJson<bool>(isDeleted),
      'refreshedTimestamp': serializer.toJson<int?>(refreshedTimestamp),
    };
  }

  MetadataTableData copyWith(
          {String? pubkey,
          String? name,
          String? displayName,
          String? picture,
          String? banner,
          String? website,
          String? about,
          String? nip05,
          String? lud16,
          String? lud06,
          int? createdAt,
          bool? isDeleted,
          Value<int?> refreshedTimestamp = const Value.absent()}) =>
      MetadataTableData(
        pubkey: pubkey ?? this.pubkey,
        name: name ?? this.name,
        displayName: displayName ?? this.displayName,
        picture: picture ?? this.picture,
        banner: banner ?? this.banner,
        website: website ?? this.website,
        about: about ?? this.about,
        nip05: nip05 ?? this.nip05,
        lud16: lud16 ?? this.lud16,
        lud06: lud06 ?? this.lud06,
        createdAt: createdAt ?? this.createdAt,
        isDeleted: isDeleted ?? this.isDeleted,
        refreshedTimestamp: refreshedTimestamp.present
            ? refreshedTimestamp.value
            : this.refreshedTimestamp,
      );
  MetadataTableData copyWithCompanion(MetadataTableCompanion data) {
    return MetadataTableData(
      pubkey: data.pubkey.present ? data.pubkey.value : this.pubkey,
      name: data.name.present ? data.name.value : this.name,
      displayName:
          data.displayName.present ? data.displayName.value : this.displayName,
      picture: data.picture.present ? data.picture.value : this.picture,
      banner: data.banner.present ? data.banner.value : this.banner,
      website: data.website.present ? data.website.value : this.website,
      about: data.about.present ? data.about.value : this.about,
      nip05: data.nip05.present ? data.nip05.value : this.nip05,
      lud16: data.lud16.present ? data.lud16.value : this.lud16,
      lud06: data.lud06.present ? data.lud06.value : this.lud06,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
      refreshedTimestamp: data.refreshedTimestamp.present
          ? data.refreshedTimestamp.value
          : this.refreshedTimestamp,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MetadataTableData(')
          ..write('pubkey: $pubkey, ')
          ..write('name: $name, ')
          ..write('displayName: $displayName, ')
          ..write('picture: $picture, ')
          ..write('banner: $banner, ')
          ..write('website: $website, ')
          ..write('about: $about, ')
          ..write('nip05: $nip05, ')
          ..write('lud16: $lud16, ')
          ..write('lud06: $lud06, ')
          ..write('createdAt: $createdAt, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('refreshedTimestamp: $refreshedTimestamp')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      pubkey,
      name,
      displayName,
      picture,
      banner,
      website,
      about,
      nip05,
      lud16,
      lud06,
      createdAt,
      isDeleted,
      refreshedTimestamp);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MetadataTableData &&
          other.pubkey == this.pubkey &&
          other.name == this.name &&
          other.displayName == this.displayName &&
          other.picture == this.picture &&
          other.banner == this.banner &&
          other.website == this.website &&
          other.about == this.about &&
          other.nip05 == this.nip05 &&
          other.lud16 == this.lud16 &&
          other.lud06 == this.lud06 &&
          other.createdAt == this.createdAt &&
          other.isDeleted == this.isDeleted &&
          other.refreshedTimestamp == this.refreshedTimestamp);
}

class MetadataTableCompanion extends UpdateCompanion<MetadataTableData> {
  final Value<String> pubkey;
  final Value<String> name;
  final Value<String> displayName;
  final Value<String> picture;
  final Value<String> banner;
  final Value<String> website;
  final Value<String> about;
  final Value<String> nip05;
  final Value<String> lud16;
  final Value<String> lud06;
  final Value<int> createdAt;
  final Value<bool> isDeleted;
  final Value<int?> refreshedTimestamp;
  final Value<int> rowid;
  const MetadataTableCompanion({
    this.pubkey = const Value.absent(),
    this.name = const Value.absent(),
    this.displayName = const Value.absent(),
    this.picture = const Value.absent(),
    this.banner = const Value.absent(),
    this.website = const Value.absent(),
    this.about = const Value.absent(),
    this.nip05 = const Value.absent(),
    this.lud16 = const Value.absent(),
    this.lud06 = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.refreshedTimestamp = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MetadataTableCompanion.insert({
    required String pubkey,
    this.name = const Value.absent(),
    this.displayName = const Value.absent(),
    this.picture = const Value.absent(),
    this.banner = const Value.absent(),
    this.website = const Value.absent(),
    this.about = const Value.absent(),
    this.nip05 = const Value.absent(),
    this.lud16 = const Value.absent(),
    this.lud06 = const Value.absent(),
    required int createdAt,
    this.isDeleted = const Value.absent(),
    this.refreshedTimestamp = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : pubkey = Value(pubkey),
        createdAt = Value(createdAt);
  static Insertable<MetadataTableData> custom({
    Expression<String>? pubkey,
    Expression<String>? name,
    Expression<String>? displayName,
    Expression<String>? picture,
    Expression<String>? banner,
    Expression<String>? website,
    Expression<String>? about,
    Expression<String>? nip05,
    Expression<String>? lud16,
    Expression<String>? lud06,
    Expression<int>? createdAt,
    Expression<bool>? isDeleted,
    Expression<int>? refreshedTimestamp,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (pubkey != null) 'pubkey': pubkey,
      if (name != null) 'name': name,
      if (displayName != null) 'display_name': displayName,
      if (picture != null) 'picture': picture,
      if (banner != null) 'banner': banner,
      if (website != null) 'website': website,
      if (about != null) 'about': about,
      if (nip05 != null) 'nip05': nip05,
      if (lud16 != null) 'lud16': lud16,
      if (lud06 != null) 'lud06': lud06,
      if (createdAt != null) 'created_at': createdAt,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (refreshedTimestamp != null) 'refreshed_timestamp': refreshedTimestamp,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MetadataTableCompanion copyWith(
      {Value<String>? pubkey,
      Value<String>? name,
      Value<String>? displayName,
      Value<String>? picture,
      Value<String>? banner,
      Value<String>? website,
      Value<String>? about,
      Value<String>? nip05,
      Value<String>? lud16,
      Value<String>? lud06,
      Value<int>? createdAt,
      Value<bool>? isDeleted,
      Value<int?>? refreshedTimestamp,
      Value<int>? rowid}) {
    return MetadataTableCompanion(
      pubkey: pubkey ?? this.pubkey,
      name: name ?? this.name,
      displayName: displayName ?? this.displayName,
      picture: picture ?? this.picture,
      banner: banner ?? this.banner,
      website: website ?? this.website,
      about: about ?? this.about,
      nip05: nip05 ?? this.nip05,
      lud16: lud16 ?? this.lud16,
      lud06: lud06 ?? this.lud06,
      createdAt: createdAt ?? this.createdAt,
      isDeleted: isDeleted ?? this.isDeleted,
      refreshedTimestamp: refreshedTimestamp ?? this.refreshedTimestamp,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (pubkey.present) {
      map['pubkey'] = Variable<String>(pubkey.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (displayName.present) {
      map['display_name'] = Variable<String>(displayName.value);
    }
    if (picture.present) {
      map['picture'] = Variable<String>(picture.value);
    }
    if (banner.present) {
      map['banner'] = Variable<String>(banner.value);
    }
    if (website.present) {
      map['website'] = Variable<String>(website.value);
    }
    if (about.present) {
      map['about'] = Variable<String>(about.value);
    }
    if (nip05.present) {
      map['nip05'] = Variable<String>(nip05.value);
    }
    if (lud16.present) {
      map['lud16'] = Variable<String>(lud16.value);
    }
    if (lud06.present) {
      map['lud06'] = Variable<String>(lud06.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (refreshedTimestamp.present) {
      map['refreshed_timestamp'] = Variable<int>(refreshedTimestamp.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MetadataTableCompanion(')
          ..write('pubkey: $pubkey, ')
          ..write('name: $name, ')
          ..write('displayName: $displayName, ')
          ..write('picture: $picture, ')
          ..write('banner: $banner, ')
          ..write('website: $website, ')
          ..write('about: $about, ')
          ..write('nip05: $nip05, ')
          ..write('lud16: $lud16, ')
          ..write('lud06: $lud06, ')
          ..write('createdAt: $createdAt, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('refreshedTimestamp: $refreshedTimestamp, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ContactListTableTable extends ContactListTable
    with TableInfo<$ContactListTableTable, ContactListTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ContactListTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _pubkeyMeta = const VerificationMeta('pubkey');
  @override
  late final GeneratedColumn<String> pubkey = GeneratedColumn<String>(
      'pubkey', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> contacts =
      GeneratedColumn<String>('contacts', aliasedName, false,
              type: DriftSqlType.string,
              requiredDuringInsert: false,
              defaultValue: const Constant('[]'))
          .withConverter<List<String>>(
              $ContactListTableTable.$convertercontacts);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
      'created_at', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _loadedTimestampMeta =
      const VerificationMeta('loadedTimestamp');
  @override
  late final GeneratedColumn<int> loadedTimestamp = GeneratedColumn<int>(
      'loaded_timestamp', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> sources =
      GeneratedColumn<String>('sources', aliasedName, false,
              type: DriftSqlType.string,
              requiredDuringInsert: false,
              defaultValue: const Constant('[]'))
          .withConverter<List<String>>(
              $ContactListTableTable.$convertersources);
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String>
      followedCommunities = GeneratedColumn<String>(
              'followed_communities', aliasedName, false,
              type: DriftSqlType.string,
              requiredDuringInsert: false,
              defaultValue: const Constant('[]'))
          .withConverter<List<String>>(
              $ContactListTableTable.$converterfollowedCommunities);
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String>
      followedTags = GeneratedColumn<String>(
              'followed_tags', aliasedName, false,
              type: DriftSqlType.string,
              requiredDuringInsert: false,
              defaultValue: const Constant('[]'))
          .withConverter<List<String>>(
              $ContactListTableTable.$converterfollowedTags);
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String>
      followedEvents = GeneratedColumn<String>(
              'followed_events', aliasedName, false,
              type: DriftSqlType.string,
              requiredDuringInsert: false,
              defaultValue: const Constant('[]'))
          .withConverter<List<String>>(
              $ContactListTableTable.$converterfollowedEvents);
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String>
      contactRelays = GeneratedColumn<String>(
              'contact_relays', aliasedName, false,
              type: DriftSqlType.string,
              requiredDuringInsert: false,
              defaultValue: const Constant('[]'))
          .withConverter<List<String>>(
              $ContactListTableTable.$convertercontactRelays);
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> petnames =
      GeneratedColumn<String>('petnames', aliasedName, false,
              type: DriftSqlType.string,
              requiredDuringInsert: false,
              defaultValue: const Constant('[]'))
          .withConverter<List<String>>(
              $ContactListTableTable.$converterpetnames);
  @override
  List<GeneratedColumn> get $columns => [
        pubkey,
        contacts,
        createdAt,
        loadedTimestamp,
        sources,
        followedCommunities,
        followedTags,
        followedEvents,
        contactRelays,
        petnames
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'contact_list_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<ContactListTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('pubkey')) {
      context.handle(_pubkeyMeta,
          pubkey.isAcceptableOrUnknown(data['pubkey']!, _pubkeyMeta));
    } else if (isInserting) {
      context.missing(_pubkeyMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('loaded_timestamp')) {
      context.handle(
          _loadedTimestampMeta,
          loadedTimestamp.isAcceptableOrUnknown(
              data['loaded_timestamp']!, _loadedTimestampMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {pubkey};
  @override
  ContactListTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ContactListTableData(
      pubkey: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}pubkey'])!,
      contacts: $ContactListTableTable.$convertercontacts.fromSql(
          attachedDatabase.typeMapping
              .read(DriftSqlType.string, data['${effectivePrefix}contacts'])!),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}created_at'])!,
      loadedTimestamp: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}loaded_timestamp']),
      sources: $ContactListTableTable.$convertersources.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sources'])!),
      followedCommunities: $ContactListTableTable.$converterfollowedCommunities
          .fromSql(attachedDatabase.typeMapping.read(DriftSqlType.string,
              data['${effectivePrefix}followed_communities'])!),
      followedTags: $ContactListTableTable.$converterfollowedTags.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}followed_tags'])!),
      followedEvents: $ContactListTableTable.$converterfollowedEvents.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}followed_events'])!),
      contactRelays: $ContactListTableTable.$convertercontactRelays.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}contact_relays'])!),
      petnames: $ContactListTableTable.$converterpetnames.fromSql(
          attachedDatabase.typeMapping
              .read(DriftSqlType.string, data['${effectivePrefix}petnames'])!),
    );
  }

  @override
  $ContactListTableTable createAlias(String alias) {
    return $ContactListTableTable(attachedDatabase, alias);
  }

  static TypeConverter<List<String>, String> $convertercontacts =
      const StringListConverter();
  static TypeConverter<List<String>, String> $convertersources =
      const StringListConverter();
  static TypeConverter<List<String>, String> $converterfollowedCommunities =
      const StringListConverter();
  static TypeConverter<List<String>, String> $converterfollowedTags =
      const StringListConverter();
  static TypeConverter<List<String>, String> $converterfollowedEvents =
      const StringListConverter();
  static TypeConverter<List<String>, String> $convertercontactRelays =
      const StringListConverter();
  static TypeConverter<List<String>, String> $converterpetnames =
      const StringListConverter();
}

class ContactListTableData extends DataClass
    implements Insertable<ContactListTableData> {
  final String pubkey;
  final List<String> contacts;
  final int createdAt;
  final int? loadedTimestamp;
  final List<String> sources;
  final List<String> followedCommunities;
  final List<String> followedTags;
  final List<String> followedEvents;
  final List<String> contactRelays;
  final List<String> petnames;
  const ContactListTableData(
      {required this.pubkey,
      required this.contacts,
      required this.createdAt,
      this.loadedTimestamp,
      required this.sources,
      required this.followedCommunities,
      required this.followedTags,
      required this.followedEvents,
      required this.contactRelays,
      required this.petnames});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['pubkey'] = Variable<String>(pubkey);
    {
      map['contacts'] = Variable<String>(
          $ContactListTableTable.$convertercontacts.toSql(contacts));
    }
    map['created_at'] = Variable<int>(createdAt);
    if (!nullToAbsent || loadedTimestamp != null) {
      map['loaded_timestamp'] = Variable<int>(loadedTimestamp);
    }
    {
      map['sources'] = Variable<String>(
          $ContactListTableTable.$convertersources.toSql(sources));
    }
    {
      map['followed_communities'] = Variable<String>($ContactListTableTable
          .$converterfollowedCommunities
          .toSql(followedCommunities));
    }
    {
      map['followed_tags'] = Variable<String>(
          $ContactListTableTable.$converterfollowedTags.toSql(followedTags));
    }
    {
      map['followed_events'] = Variable<String>($ContactListTableTable
          .$converterfollowedEvents
          .toSql(followedEvents));
    }
    {
      map['contact_relays'] = Variable<String>(
          $ContactListTableTable.$convertercontactRelays.toSql(contactRelays));
    }
    {
      map['petnames'] = Variable<String>(
          $ContactListTableTable.$converterpetnames.toSql(petnames));
    }
    return map;
  }

  ContactListTableCompanion toCompanion(bool nullToAbsent) {
    return ContactListTableCompanion(
      pubkey: Value(pubkey),
      contacts: Value(contacts),
      createdAt: Value(createdAt),
      loadedTimestamp: loadedTimestamp == null && nullToAbsent
          ? const Value.absent()
          : Value(loadedTimestamp),
      sources: Value(sources),
      followedCommunities: Value(followedCommunities),
      followedTags: Value(followedTags),
      followedEvents: Value(followedEvents),
      contactRelays: Value(contactRelays),
      petnames: Value(petnames),
    );
  }

  factory ContactListTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ContactListTableData(
      pubkey: serializer.fromJson<String>(json['pubkey']),
      contacts: serializer.fromJson<List<String>>(json['contacts']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      loadedTimestamp: serializer.fromJson<int?>(json['loadedTimestamp']),
      sources: serializer.fromJson<List<String>>(json['sources']),
      followedCommunities:
          serializer.fromJson<List<String>>(json['followedCommunities']),
      followedTags: serializer.fromJson<List<String>>(json['followedTags']),
      followedEvents: serializer.fromJson<List<String>>(json['followedEvents']),
      contactRelays: serializer.fromJson<List<String>>(json['contactRelays']),
      petnames: serializer.fromJson<List<String>>(json['petnames']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'pubkey': serializer.toJson<String>(pubkey),
      'contacts': serializer.toJson<List<String>>(contacts),
      'createdAt': serializer.toJson<int>(createdAt),
      'loadedTimestamp': serializer.toJson<int?>(loadedTimestamp),
      'sources': serializer.toJson<List<String>>(sources),
      'followedCommunities':
          serializer.toJson<List<String>>(followedCommunities),
      'followedTags': serializer.toJson<List<String>>(followedTags),
      'followedEvents': serializer.toJson<List<String>>(followedEvents),
      'contactRelays': serializer.toJson<List<String>>(contactRelays),
      'petnames': serializer.toJson<List<String>>(petnames),
    };
  }

  ContactListTableData copyWith(
          {String? pubkey,
          List<String>? contacts,
          int? createdAt,
          Value<int?> loadedTimestamp = const Value.absent(),
          List<String>? sources,
          List<String>? followedCommunities,
          List<String>? followedTags,
          List<String>? followedEvents,
          List<String>? contactRelays,
          List<String>? petnames}) =>
      ContactListTableData(
        pubkey: pubkey ?? this.pubkey,
        contacts: contacts ?? this.contacts,
        createdAt: createdAt ?? this.createdAt,
        loadedTimestamp: loadedTimestamp.present
            ? loadedTimestamp.value
            : this.loadedTimestamp,
        sources: sources ?? this.sources,
        followedCommunities: followedCommunities ?? this.followedCommunities,
        followedTags: followedTags ?? this.followedTags,
        followedEvents: followedEvents ?? this.followedEvents,
        contactRelays: contactRelays ?? this.contactRelays,
        petnames: petnames ?? this.petnames,
      );
  ContactListTableData copyWithCompanion(ContactListTableCompanion data) {
    return ContactListTableData(
      pubkey: data.pubkey.present ? data.pubkey.value : this.pubkey,
      contacts: data.contacts.present ? data.contacts.value : this.contacts,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      loadedTimestamp: data.loadedTimestamp.present
          ? data.loadedTimestamp.value
          : this.loadedTimestamp,
      sources: data.sources.present ? data.sources.value : this.sources,
      followedCommunities: data.followedCommunities.present
          ? data.followedCommunities.value
          : this.followedCommunities,
      followedTags: data.followedTags.present
          ? data.followedTags.value
          : this.followedTags,
      followedEvents: data.followedEvents.present
          ? data.followedEvents.value
          : this.followedEvents,
      contactRelays: data.contactRelays.present
          ? data.contactRelays.value
          : this.contactRelays,
      petnames: data.petnames.present ? data.petnames.value : this.petnames,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ContactListTableData(')
          ..write('pubkey: $pubkey, ')
          ..write('contacts: $contacts, ')
          ..write('createdAt: $createdAt, ')
          ..write('loadedTimestamp: $loadedTimestamp, ')
          ..write('sources: $sources, ')
          ..write('followedCommunities: $followedCommunities, ')
          ..write('followedTags: $followedTags, ')
          ..write('followedEvents: $followedEvents, ')
          ..write('contactRelays: $contactRelays, ')
          ..write('petnames: $petnames')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      pubkey,
      contacts,
      createdAt,
      loadedTimestamp,
      sources,
      followedCommunities,
      followedTags,
      followedEvents,
      contactRelays,
      petnames);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ContactListTableData &&
          other.pubkey == this.pubkey &&
          other.contacts == this.contacts &&
          other.createdAt == this.createdAt &&
          other.loadedTimestamp == this.loadedTimestamp &&
          other.sources == this.sources &&
          other.followedCommunities == this.followedCommunities &&
          other.followedTags == this.followedTags &&
          other.followedEvents == this.followedEvents &&
          other.contactRelays == this.contactRelays &&
          other.petnames == this.petnames);
}

class ContactListTableCompanion extends UpdateCompanion<ContactListTableData> {
  final Value<String> pubkey;
  final Value<List<String>> contacts;
  final Value<int> createdAt;
  final Value<int?> loadedTimestamp;
  final Value<List<String>> sources;
  final Value<List<String>> followedCommunities;
  final Value<List<String>> followedTags;
  final Value<List<String>> followedEvents;
  final Value<List<String>> contactRelays;
  final Value<List<String>> petnames;
  final Value<int> rowid;
  const ContactListTableCompanion({
    this.pubkey = const Value.absent(),
    this.contacts = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.loadedTimestamp = const Value.absent(),
    this.sources = const Value.absent(),
    this.followedCommunities = const Value.absent(),
    this.followedTags = const Value.absent(),
    this.followedEvents = const Value.absent(),
    this.contactRelays = const Value.absent(),
    this.petnames = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ContactListTableCompanion.insert({
    required String pubkey,
    this.contacts = const Value.absent(),
    required int createdAt,
    this.loadedTimestamp = const Value.absent(),
    this.sources = const Value.absent(),
    this.followedCommunities = const Value.absent(),
    this.followedTags = const Value.absent(),
    this.followedEvents = const Value.absent(),
    this.contactRelays = const Value.absent(),
    this.petnames = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : pubkey = Value(pubkey),
        createdAt = Value(createdAt);
  static Insertable<ContactListTableData> custom({
    Expression<String>? pubkey,
    Expression<String>? contacts,
    Expression<int>? createdAt,
    Expression<int>? loadedTimestamp,
    Expression<String>? sources,
    Expression<String>? followedCommunities,
    Expression<String>? followedTags,
    Expression<String>? followedEvents,
    Expression<String>? contactRelays,
    Expression<String>? petnames,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (pubkey != null) 'pubkey': pubkey,
      if (contacts != null) 'contacts': contacts,
      if (createdAt != null) 'created_at': createdAt,
      if (loadedTimestamp != null) 'loaded_timestamp': loadedTimestamp,
      if (sources != null) 'sources': sources,
      if (followedCommunities != null)
        'followed_communities': followedCommunities,
      if (followedTags != null) 'followed_tags': followedTags,
      if (followedEvents != null) 'followed_events': followedEvents,
      if (contactRelays != null) 'contact_relays': contactRelays,
      if (petnames != null) 'petnames': petnames,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ContactListTableCompanion copyWith(
      {Value<String>? pubkey,
      Value<List<String>>? contacts,
      Value<int>? createdAt,
      Value<int?>? loadedTimestamp,
      Value<List<String>>? sources,
      Value<List<String>>? followedCommunities,
      Value<List<String>>? followedTags,
      Value<List<String>>? followedEvents,
      Value<List<String>>? contactRelays,
      Value<List<String>>? petnames,
      Value<int>? rowid}) {
    return ContactListTableCompanion(
      pubkey: pubkey ?? this.pubkey,
      contacts: contacts ?? this.contacts,
      createdAt: createdAt ?? this.createdAt,
      loadedTimestamp: loadedTimestamp ?? this.loadedTimestamp,
      sources: sources ?? this.sources,
      followedCommunities: followedCommunities ?? this.followedCommunities,
      followedTags: followedTags ?? this.followedTags,
      followedEvents: followedEvents ?? this.followedEvents,
      contactRelays: contactRelays ?? this.contactRelays,
      petnames: petnames ?? this.petnames,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (pubkey.present) {
      map['pubkey'] = Variable<String>(pubkey.value);
    }
    if (contacts.present) {
      map['contacts'] = Variable<String>(
          $ContactListTableTable.$convertercontacts.toSql(contacts.value));
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (loadedTimestamp.present) {
      map['loaded_timestamp'] = Variable<int>(loadedTimestamp.value);
    }
    if (sources.present) {
      map['sources'] = Variable<String>(
          $ContactListTableTable.$convertersources.toSql(sources.value));
    }
    if (followedCommunities.present) {
      map['followed_communities'] = Variable<String>($ContactListTableTable
          .$converterfollowedCommunities
          .toSql(followedCommunities.value));
    }
    if (followedTags.present) {
      map['followed_tags'] = Variable<String>($ContactListTableTable
          .$converterfollowedTags
          .toSql(followedTags.value));
    }
    if (followedEvents.present) {
      map['followed_events'] = Variable<String>($ContactListTableTable
          .$converterfollowedEvents
          .toSql(followedEvents.value));
    }
    if (contactRelays.present) {
      map['contact_relays'] = Variable<String>($ContactListTableTable
          .$convertercontactRelays
          .toSql(contactRelays.value));
    }
    if (petnames.present) {
      map['petnames'] = Variable<String>(
          $ContactListTableTable.$converterpetnames.toSql(petnames.value));
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ContactListTableCompanion(')
          ..write('pubkey: $pubkey, ')
          ..write('contacts: $contacts, ')
          ..write('createdAt: $createdAt, ')
          ..write('loadedTimestamp: $loadedTimestamp, ')
          ..write('sources: $sources, ')
          ..write('followedCommunities: $followedCommunities, ')
          ..write('followedTags: $followedTags, ')
          ..write('followedEvents: $followedEvents, ')
          ..write('contactRelays: $contactRelays, ')
          ..write('petnames: $petnames, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MuteListTableTable extends MuteListTable
    with TableInfo<$MuteListTableTable, MuteListTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MuteListTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _pubkeyMeta = const VerificationMeta('pubkey');
  @override
  late final GeneratedColumn<String> pubkey = GeneratedColumn<String>(
      'pubkey', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _mutesMeta = const VerificationMeta('mutes');
  @override
  late final GeneratedColumn<String> mutes = GeneratedColumn<String>(
      'mutes', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('[]'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
      'created_at', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _loadedTimestampMeta =
      const VerificationMeta('loadedTimestamp');
  @override
  late final GeneratedColumn<int> loadedTimestamp = GeneratedColumn<int>(
      'loaded_timestamp', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _sourcesMeta =
      const VerificationMeta('sources');
  @override
  late final GeneratedColumn<String> sources = GeneratedColumn<String>(
      'sources', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('[]'));
  @override
  List<GeneratedColumn> get $columns =>
      [pubkey, mutes, createdAt, loadedTimestamp, sources];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'mute_list_table';
  @override
  VerificationContext validateIntegrity(Insertable<MuteListTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('pubkey')) {
      context.handle(_pubkeyMeta,
          pubkey.isAcceptableOrUnknown(data['pubkey']!, _pubkeyMeta));
    } else if (isInserting) {
      context.missing(_pubkeyMeta);
    }
    if (data.containsKey('mutes')) {
      context.handle(
          _mutesMeta, mutes.isAcceptableOrUnknown(data['mutes']!, _mutesMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('loaded_timestamp')) {
      context.handle(
          _loadedTimestampMeta,
          loadedTimestamp.isAcceptableOrUnknown(
              data['loaded_timestamp']!, _loadedTimestampMeta));
    }
    if (data.containsKey('sources')) {
      context.handle(_sourcesMeta,
          sources.isAcceptableOrUnknown(data['sources']!, _sourcesMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {pubkey};
  @override
  MuteListTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MuteListTableData(
      pubkey: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}pubkey'])!,
      mutes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}mutes'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}created_at'])!,
      loadedTimestamp: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}loaded_timestamp']),
      sources: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sources'])!,
    );
  }

  @override
  $MuteListTableTable createAlias(String alias) {
    return $MuteListTableTable(attachedDatabase, alias);
  }
}

class MuteListTableData extends DataClass
    implements Insertable<MuteListTableData> {
  final String pubkey;
  final String mutes;
  final int createdAt;
  final int? loadedTimestamp;
  final String sources;
  const MuteListTableData(
      {required this.pubkey,
      required this.mutes,
      required this.createdAt,
      this.loadedTimestamp,
      required this.sources});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['pubkey'] = Variable<String>(pubkey);
    map['mutes'] = Variable<String>(mutes);
    map['created_at'] = Variable<int>(createdAt);
    if (!nullToAbsent || loadedTimestamp != null) {
      map['loaded_timestamp'] = Variable<int>(loadedTimestamp);
    }
    map['sources'] = Variable<String>(sources);
    return map;
  }

  MuteListTableCompanion toCompanion(bool nullToAbsent) {
    return MuteListTableCompanion(
      pubkey: Value(pubkey),
      mutes: Value(mutes),
      createdAt: Value(createdAt),
      loadedTimestamp: loadedTimestamp == null && nullToAbsent
          ? const Value.absent()
          : Value(loadedTimestamp),
      sources: Value(sources),
    );
  }

  factory MuteListTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MuteListTableData(
      pubkey: serializer.fromJson<String>(json['pubkey']),
      mutes: serializer.fromJson<String>(json['mutes']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      loadedTimestamp: serializer.fromJson<int?>(json['loadedTimestamp']),
      sources: serializer.fromJson<String>(json['sources']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'pubkey': serializer.toJson<String>(pubkey),
      'mutes': serializer.toJson<String>(mutes),
      'createdAt': serializer.toJson<int>(createdAt),
      'loadedTimestamp': serializer.toJson<int?>(loadedTimestamp),
      'sources': serializer.toJson<String>(sources),
    };
  }

  MuteListTableData copyWith(
          {String? pubkey,
          String? mutes,
          int? createdAt,
          Value<int?> loadedTimestamp = const Value.absent(),
          String? sources}) =>
      MuteListTableData(
        pubkey: pubkey ?? this.pubkey,
        mutes: mutes ?? this.mutes,
        createdAt: createdAt ?? this.createdAt,
        loadedTimestamp: loadedTimestamp.present
            ? loadedTimestamp.value
            : this.loadedTimestamp,
        sources: sources ?? this.sources,
      );
  MuteListTableData copyWithCompanion(MuteListTableCompanion data) {
    return MuteListTableData(
      pubkey: data.pubkey.present ? data.pubkey.value : this.pubkey,
      mutes: data.mutes.present ? data.mutes.value : this.mutes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      loadedTimestamp: data.loadedTimestamp.present
          ? data.loadedTimestamp.value
          : this.loadedTimestamp,
      sources: data.sources.present ? data.sources.value : this.sources,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MuteListTableData(')
          ..write('pubkey: $pubkey, ')
          ..write('mutes: $mutes, ')
          ..write('createdAt: $createdAt, ')
          ..write('loadedTimestamp: $loadedTimestamp, ')
          ..write('sources: $sources')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(pubkey, mutes, createdAt, loadedTimestamp, sources);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MuteListTableData &&
          other.pubkey == this.pubkey &&
          other.mutes == this.mutes &&
          other.createdAt == this.createdAt &&
          other.loadedTimestamp == this.loadedTimestamp &&
          other.sources == this.sources);
}

class MuteListTableCompanion extends UpdateCompanion<MuteListTableData> {
  final Value<String> pubkey;
  final Value<String> mutes;
  final Value<int> createdAt;
  final Value<int?> loadedTimestamp;
  final Value<String> sources;
  final Value<int> rowid;
  const MuteListTableCompanion({
    this.pubkey = const Value.absent(),
    this.mutes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.loadedTimestamp = const Value.absent(),
    this.sources = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MuteListTableCompanion.insert({
    required String pubkey,
    this.mutes = const Value.absent(),
    required int createdAt,
    this.loadedTimestamp = const Value.absent(),
    this.sources = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : pubkey = Value(pubkey),
        createdAt = Value(createdAt);
  static Insertable<MuteListTableData> custom({
    Expression<String>? pubkey,
    Expression<String>? mutes,
    Expression<int>? createdAt,
    Expression<int>? loadedTimestamp,
    Expression<String>? sources,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (pubkey != null) 'pubkey': pubkey,
      if (mutes != null) 'mutes': mutes,
      if (createdAt != null) 'created_at': createdAt,
      if (loadedTimestamp != null) 'loaded_timestamp': loadedTimestamp,
      if (sources != null) 'sources': sources,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MuteListTableCompanion copyWith(
      {Value<String>? pubkey,
      Value<String>? mutes,
      Value<int>? createdAt,
      Value<int?>? loadedTimestamp,
      Value<String>? sources,
      Value<int>? rowid}) {
    return MuteListTableCompanion(
      pubkey: pubkey ?? this.pubkey,
      mutes: mutes ?? this.mutes,
      createdAt: createdAt ?? this.createdAt,
      loadedTimestamp: loadedTimestamp ?? this.loadedTimestamp,
      sources: sources ?? this.sources,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (pubkey.present) {
      map['pubkey'] = Variable<String>(pubkey.value);
    }
    if (mutes.present) {
      map['mutes'] = Variable<String>(mutes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (loadedTimestamp.present) {
      map['loaded_timestamp'] = Variable<int>(loadedTimestamp.value);
    }
    if (sources.present) {
      map['sources'] = Variable<String>(sources.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MuteListTableCompanion(')
          ..write('pubkey: $pubkey, ')
          ..write('mutes: $mutes, ')
          ..write('createdAt: $createdAt, ')
          ..write('loadedTimestamp: $loadedTimestamp, ')
          ..write('sources: $sources, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $UserRelayListTableTable extends UserRelayListTable
    with TableInfo<$UserRelayListTableTable, UserRelayListTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserRelayListTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _pubkeyMeta = const VerificationMeta('pubkey');
  @override
  late final GeneratedColumn<String> pubkey = GeneratedColumn<String>(
      'pubkey', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _readRelaysMeta =
      const VerificationMeta('readRelays');
  @override
  late final GeneratedColumn<String> readRelays = GeneratedColumn<String>(
      'read_relays', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('{}'));
  static const VerificationMeta _writeRelaysMeta =
      const VerificationMeta('writeRelays');
  @override
  late final GeneratedColumn<String> writeRelays = GeneratedColumn<String>(
      'write_relays', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('{}'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
      'created_at', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _loadedTimestampMeta =
      const VerificationMeta('loadedTimestamp');
  @override
  late final GeneratedColumn<int> loadedTimestamp = GeneratedColumn<int>(
      'loaded_timestamp', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _sourcesMeta =
      const VerificationMeta('sources');
  @override
  late final GeneratedColumn<String> sources = GeneratedColumn<String>(
      'sources', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('[]'));
  @override
  List<GeneratedColumn> get $columns =>
      [pubkey, readRelays, writeRelays, createdAt, loadedTimestamp, sources];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_relay_list_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<UserRelayListTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('pubkey')) {
      context.handle(_pubkeyMeta,
          pubkey.isAcceptableOrUnknown(data['pubkey']!, _pubkeyMeta));
    } else if (isInserting) {
      context.missing(_pubkeyMeta);
    }
    if (data.containsKey('read_relays')) {
      context.handle(
          _readRelaysMeta,
          readRelays.isAcceptableOrUnknown(
              data['read_relays']!, _readRelaysMeta));
    }
    if (data.containsKey('write_relays')) {
      context.handle(
          _writeRelaysMeta,
          writeRelays.isAcceptableOrUnknown(
              data['write_relays']!, _writeRelaysMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('loaded_timestamp')) {
      context.handle(
          _loadedTimestampMeta,
          loadedTimestamp.isAcceptableOrUnknown(
              data['loaded_timestamp']!, _loadedTimestampMeta));
    }
    if (data.containsKey('sources')) {
      context.handle(_sourcesMeta,
          sources.isAcceptableOrUnknown(data['sources']!, _sourcesMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {pubkey};
  @override
  UserRelayListTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserRelayListTableData(
      pubkey: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}pubkey'])!,
      readRelays: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}read_relays'])!,
      writeRelays: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}write_relays'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}created_at'])!,
      loadedTimestamp: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}loaded_timestamp']),
      sources: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sources'])!,
    );
  }

  @override
  $UserRelayListTableTable createAlias(String alias) {
    return $UserRelayListTableTable(attachedDatabase, alias);
  }
}

class UserRelayListTableData extends DataClass
    implements Insertable<UserRelayListTableData> {
  final String pubkey;
  final String readRelays;
  final String writeRelays;
  final int createdAt;
  final int? loadedTimestamp;
  final String sources;
  const UserRelayListTableData(
      {required this.pubkey,
      required this.readRelays,
      required this.writeRelays,
      required this.createdAt,
      this.loadedTimestamp,
      required this.sources});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['pubkey'] = Variable<String>(pubkey);
    map['read_relays'] = Variable<String>(readRelays);
    map['write_relays'] = Variable<String>(writeRelays);
    map['created_at'] = Variable<int>(createdAt);
    if (!nullToAbsent || loadedTimestamp != null) {
      map['loaded_timestamp'] = Variable<int>(loadedTimestamp);
    }
    map['sources'] = Variable<String>(sources);
    return map;
  }

  UserRelayListTableCompanion toCompanion(bool nullToAbsent) {
    return UserRelayListTableCompanion(
      pubkey: Value(pubkey),
      readRelays: Value(readRelays),
      writeRelays: Value(writeRelays),
      createdAt: Value(createdAt),
      loadedTimestamp: loadedTimestamp == null && nullToAbsent
          ? const Value.absent()
          : Value(loadedTimestamp),
      sources: Value(sources),
    );
  }

  factory UserRelayListTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserRelayListTableData(
      pubkey: serializer.fromJson<String>(json['pubkey']),
      readRelays: serializer.fromJson<String>(json['readRelays']),
      writeRelays: serializer.fromJson<String>(json['writeRelays']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      loadedTimestamp: serializer.fromJson<int?>(json['loadedTimestamp']),
      sources: serializer.fromJson<String>(json['sources']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'pubkey': serializer.toJson<String>(pubkey),
      'readRelays': serializer.toJson<String>(readRelays),
      'writeRelays': serializer.toJson<String>(writeRelays),
      'createdAt': serializer.toJson<int>(createdAt),
      'loadedTimestamp': serializer.toJson<int?>(loadedTimestamp),
      'sources': serializer.toJson<String>(sources),
    };
  }

  UserRelayListTableData copyWith(
          {String? pubkey,
          String? readRelays,
          String? writeRelays,
          int? createdAt,
          Value<int?> loadedTimestamp = const Value.absent(),
          String? sources}) =>
      UserRelayListTableData(
        pubkey: pubkey ?? this.pubkey,
        readRelays: readRelays ?? this.readRelays,
        writeRelays: writeRelays ?? this.writeRelays,
        createdAt: createdAt ?? this.createdAt,
        loadedTimestamp: loadedTimestamp.present
            ? loadedTimestamp.value
            : this.loadedTimestamp,
        sources: sources ?? this.sources,
      );
  UserRelayListTableData copyWithCompanion(UserRelayListTableCompanion data) {
    return UserRelayListTableData(
      pubkey: data.pubkey.present ? data.pubkey.value : this.pubkey,
      readRelays:
          data.readRelays.present ? data.readRelays.value : this.readRelays,
      writeRelays:
          data.writeRelays.present ? data.writeRelays.value : this.writeRelays,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      loadedTimestamp: data.loadedTimestamp.present
          ? data.loadedTimestamp.value
          : this.loadedTimestamp,
      sources: data.sources.present ? data.sources.value : this.sources,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserRelayListTableData(')
          ..write('pubkey: $pubkey, ')
          ..write('readRelays: $readRelays, ')
          ..write('writeRelays: $writeRelays, ')
          ..write('createdAt: $createdAt, ')
          ..write('loadedTimestamp: $loadedTimestamp, ')
          ..write('sources: $sources')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      pubkey, readRelays, writeRelays, createdAt, loadedTimestamp, sources);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserRelayListTableData &&
          other.pubkey == this.pubkey &&
          other.readRelays == this.readRelays &&
          other.writeRelays == this.writeRelays &&
          other.createdAt == this.createdAt &&
          other.loadedTimestamp == this.loadedTimestamp &&
          other.sources == this.sources);
}

class UserRelayListTableCompanion
    extends UpdateCompanion<UserRelayListTableData> {
  final Value<String> pubkey;
  final Value<String> readRelays;
  final Value<String> writeRelays;
  final Value<int> createdAt;
  final Value<int?> loadedTimestamp;
  final Value<String> sources;
  final Value<int> rowid;
  const UserRelayListTableCompanion({
    this.pubkey = const Value.absent(),
    this.readRelays = const Value.absent(),
    this.writeRelays = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.loadedTimestamp = const Value.absent(),
    this.sources = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserRelayListTableCompanion.insert({
    required String pubkey,
    this.readRelays = const Value.absent(),
    this.writeRelays = const Value.absent(),
    required int createdAt,
    this.loadedTimestamp = const Value.absent(),
    this.sources = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : pubkey = Value(pubkey),
        createdAt = Value(createdAt);
  static Insertable<UserRelayListTableData> custom({
    Expression<String>? pubkey,
    Expression<String>? readRelays,
    Expression<String>? writeRelays,
    Expression<int>? createdAt,
    Expression<int>? loadedTimestamp,
    Expression<String>? sources,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (pubkey != null) 'pubkey': pubkey,
      if (readRelays != null) 'read_relays': readRelays,
      if (writeRelays != null) 'write_relays': writeRelays,
      if (createdAt != null) 'created_at': createdAt,
      if (loadedTimestamp != null) 'loaded_timestamp': loadedTimestamp,
      if (sources != null) 'sources': sources,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserRelayListTableCompanion copyWith(
      {Value<String>? pubkey,
      Value<String>? readRelays,
      Value<String>? writeRelays,
      Value<int>? createdAt,
      Value<int?>? loadedTimestamp,
      Value<String>? sources,
      Value<int>? rowid}) {
    return UserRelayListTableCompanion(
      pubkey: pubkey ?? this.pubkey,
      readRelays: readRelays ?? this.readRelays,
      writeRelays: writeRelays ?? this.writeRelays,
      createdAt: createdAt ?? this.createdAt,
      loadedTimestamp: loadedTimestamp ?? this.loadedTimestamp,
      sources: sources ?? this.sources,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (pubkey.present) {
      map['pubkey'] = Variable<String>(pubkey.value);
    }
    if (readRelays.present) {
      map['read_relays'] = Variable<String>(readRelays.value);
    }
    if (writeRelays.present) {
      map['write_relays'] = Variable<String>(writeRelays.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (loadedTimestamp.present) {
      map['loaded_timestamp'] = Variable<int>(loadedTimestamp.value);
    }
    if (sources.present) {
      map['sources'] = Variable<String>(sources.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserRelayListTableCompanion(')
          ..write('pubkey: $pubkey, ')
          ..write('readRelays: $readRelays, ')
          ..write('writeRelays: $writeRelays, ')
          ..write('createdAt: $createdAt, ')
          ..write('loadedTimestamp: $loadedTimestamp, ')
          ..write('sources: $sources, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RelaySetTableTable extends RelaySetTable
    with TableInfo<$RelaySetTableTable, RelaySetTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RelaySetTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _pubkeyMeta = const VerificationMeta('pubkey');
  @override
  late final GeneratedColumn<String> pubkey = GeneratedColumn<String>(
      'pubkey', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _relaysMeta = const VerificationMeta('relays');
  @override
  late final GeneratedColumn<String> relays = GeneratedColumn<String>(
      'relays', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('{}'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
      'created_at', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _loadedTimestampMeta =
      const VerificationMeta('loadedTimestamp');
  @override
  late final GeneratedColumn<int> loadedTimestamp = GeneratedColumn<int>(
      'loaded_timestamp', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _sourcesMeta =
      const VerificationMeta('sources');
  @override
  late final GeneratedColumn<String> sources = GeneratedColumn<String>(
      'sources', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('[]'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, pubkey, relays, createdAt, loadedTimestamp, sources];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'relay_set_table';
  @override
  VerificationContext validateIntegrity(Insertable<RelaySetTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('pubkey')) {
      context.handle(_pubkeyMeta,
          pubkey.isAcceptableOrUnknown(data['pubkey']!, _pubkeyMeta));
    } else if (isInserting) {
      context.missing(_pubkeyMeta);
    }
    if (data.containsKey('relays')) {
      context.handle(_relaysMeta,
          relays.isAcceptableOrUnknown(data['relays']!, _relaysMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('loaded_timestamp')) {
      context.handle(
          _loadedTimestampMeta,
          loadedTimestamp.isAcceptableOrUnknown(
              data['loaded_timestamp']!, _loadedTimestampMeta));
    }
    if (data.containsKey('sources')) {
      context.handle(_sourcesMeta,
          sources.isAcceptableOrUnknown(data['sources']!, _sourcesMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RelaySetTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RelaySetTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      pubkey: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}pubkey'])!,
      relays: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}relays'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}created_at'])!,
      loadedTimestamp: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}loaded_timestamp']),
      sources: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sources'])!,
    );
  }

  @override
  $RelaySetTableTable createAlias(String alias) {
    return $RelaySetTableTable(attachedDatabase, alias);
  }
}

class RelaySetTableData extends DataClass
    implements Insertable<RelaySetTableData> {
  final String id;
  final String name;
  final String pubkey;
  final String relays;
  final int createdAt;
  final int? loadedTimestamp;
  final String sources;
  const RelaySetTableData(
      {required this.id,
      required this.name,
      required this.pubkey,
      required this.relays,
      required this.createdAt,
      this.loadedTimestamp,
      required this.sources});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['pubkey'] = Variable<String>(pubkey);
    map['relays'] = Variable<String>(relays);
    map['created_at'] = Variable<int>(createdAt);
    if (!nullToAbsent || loadedTimestamp != null) {
      map['loaded_timestamp'] = Variable<int>(loadedTimestamp);
    }
    map['sources'] = Variable<String>(sources);
    return map;
  }

  RelaySetTableCompanion toCompanion(bool nullToAbsent) {
    return RelaySetTableCompanion(
      id: Value(id),
      name: Value(name),
      pubkey: Value(pubkey),
      relays: Value(relays),
      createdAt: Value(createdAt),
      loadedTimestamp: loadedTimestamp == null && nullToAbsent
          ? const Value.absent()
          : Value(loadedTimestamp),
      sources: Value(sources),
    );
  }

  factory RelaySetTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RelaySetTableData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      pubkey: serializer.fromJson<String>(json['pubkey']),
      relays: serializer.fromJson<String>(json['relays']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      loadedTimestamp: serializer.fromJson<int?>(json['loadedTimestamp']),
      sources: serializer.fromJson<String>(json['sources']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'pubkey': serializer.toJson<String>(pubkey),
      'relays': serializer.toJson<String>(relays),
      'createdAt': serializer.toJson<int>(createdAt),
      'loadedTimestamp': serializer.toJson<int?>(loadedTimestamp),
      'sources': serializer.toJson<String>(sources),
    };
  }

  RelaySetTableData copyWith(
          {String? id,
          String? name,
          String? pubkey,
          String? relays,
          int? createdAt,
          Value<int?> loadedTimestamp = const Value.absent(),
          String? sources}) =>
      RelaySetTableData(
        id: id ?? this.id,
        name: name ?? this.name,
        pubkey: pubkey ?? this.pubkey,
        relays: relays ?? this.relays,
        createdAt: createdAt ?? this.createdAt,
        loadedTimestamp: loadedTimestamp.present
            ? loadedTimestamp.value
            : this.loadedTimestamp,
        sources: sources ?? this.sources,
      );
  RelaySetTableData copyWithCompanion(RelaySetTableCompanion data) {
    return RelaySetTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      pubkey: data.pubkey.present ? data.pubkey.value : this.pubkey,
      relays: data.relays.present ? data.relays.value : this.relays,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      loadedTimestamp: data.loadedTimestamp.present
          ? data.loadedTimestamp.value
          : this.loadedTimestamp,
      sources: data.sources.present ? data.sources.value : this.sources,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RelaySetTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('pubkey: $pubkey, ')
          ..write('relays: $relays, ')
          ..write('createdAt: $createdAt, ')
          ..write('loadedTimestamp: $loadedTimestamp, ')
          ..write('sources: $sources')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, name, pubkey, relays, createdAt, loadedTimestamp, sources);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RelaySetTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.pubkey == this.pubkey &&
          other.relays == this.relays &&
          other.createdAt == this.createdAt &&
          other.loadedTimestamp == this.loadedTimestamp &&
          other.sources == this.sources);
}

class RelaySetTableCompanion extends UpdateCompanion<RelaySetTableData> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> pubkey;
  final Value<String> relays;
  final Value<int> createdAt;
  final Value<int?> loadedTimestamp;
  final Value<String> sources;
  final Value<int> rowid;
  const RelaySetTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.pubkey = const Value.absent(),
    this.relays = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.loadedTimestamp = const Value.absent(),
    this.sources = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RelaySetTableCompanion.insert({
    required String id,
    required String name,
    required String pubkey,
    this.relays = const Value.absent(),
    required int createdAt,
    this.loadedTimestamp = const Value.absent(),
    this.sources = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        pubkey = Value(pubkey),
        createdAt = Value(createdAt);
  static Insertable<RelaySetTableData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? pubkey,
    Expression<String>? relays,
    Expression<int>? createdAt,
    Expression<int>? loadedTimestamp,
    Expression<String>? sources,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (pubkey != null) 'pubkey': pubkey,
      if (relays != null) 'relays': relays,
      if (createdAt != null) 'created_at': createdAt,
      if (loadedTimestamp != null) 'loaded_timestamp': loadedTimestamp,
      if (sources != null) 'sources': sources,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RelaySetTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String>? pubkey,
      Value<String>? relays,
      Value<int>? createdAt,
      Value<int?>? loadedTimestamp,
      Value<String>? sources,
      Value<int>? rowid}) {
    return RelaySetTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      pubkey: pubkey ?? this.pubkey,
      relays: relays ?? this.relays,
      createdAt: createdAt ?? this.createdAt,
      loadedTimestamp: loadedTimestamp ?? this.loadedTimestamp,
      sources: sources ?? this.sources,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (pubkey.present) {
      map['pubkey'] = Variable<String>(pubkey.value);
    }
    if (relays.present) {
      map['relays'] = Variable<String>(relays.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (loadedTimestamp.present) {
      map['loaded_timestamp'] = Variable<int>(loadedTimestamp.value);
    }
    if (sources.present) {
      map['sources'] = Variable<String>(sources.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RelaySetTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('pubkey: $pubkey, ')
          ..write('relays: $relays, ')
          ..write('createdAt: $createdAt, ')
          ..write('loadedTimestamp: $loadedTimestamp, ')
          ..write('sources: $sources, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $EventStatsTableTable extends EventStatsTable
    with TableInfo<$EventStatsTableTable, EventStatsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EventStatsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _repliesCountMeta =
      const VerificationMeta('repliesCount');
  @override
  late final GeneratedColumn<int> repliesCount = GeneratedColumn<int>(
      'replies_count', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _repostsCountMeta =
      const VerificationMeta('repostsCount');
  @override
  late final GeneratedColumn<int> repostsCount = GeneratedColumn<int>(
      'reposts_count', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _reactionsCountMeta =
      const VerificationMeta('reactionsCount');
  @override
  late final GeneratedColumn<int> reactionsCount = GeneratedColumn<int>(
      'reactions_count', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _zapsCountMeta =
      const VerificationMeta('zapsCount');
  @override
  late final GeneratedColumn<int> zapsCount = GeneratedColumn<int>(
      'zaps_count', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _zapAmountMeta =
      const VerificationMeta('zapAmount');
  @override
  late final GeneratedColumn<int> zapAmount = GeneratedColumn<int>(
      'zap_amount', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _lastUpdatedMeta =
      const VerificationMeta('lastUpdated');
  @override
  late final GeneratedColumn<int> lastUpdated = GeneratedColumn<int>(
      'last_updated', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        repliesCount,
        repostsCount,
        reactionsCount,
        zapsCount,
        zapAmount,
        lastUpdated
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'event_stats_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<EventStatsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('replies_count')) {
      context.handle(
          _repliesCountMeta,
          repliesCount.isAcceptableOrUnknown(
              data['replies_count']!, _repliesCountMeta));
    }
    if (data.containsKey('reposts_count')) {
      context.handle(
          _repostsCountMeta,
          repostsCount.isAcceptableOrUnknown(
              data['reposts_count']!, _repostsCountMeta));
    }
    if (data.containsKey('reactions_count')) {
      context.handle(
          _reactionsCountMeta,
          reactionsCount.isAcceptableOrUnknown(
              data['reactions_count']!, _reactionsCountMeta));
    }
    if (data.containsKey('zaps_count')) {
      context.handle(_zapsCountMeta,
          zapsCount.isAcceptableOrUnknown(data['zaps_count']!, _zapsCountMeta));
    }
    if (data.containsKey('zap_amount')) {
      context.handle(_zapAmountMeta,
          zapAmount.isAcceptableOrUnknown(data['zap_amount']!, _zapAmountMeta));
    }
    if (data.containsKey('last_updated')) {
      context.handle(
          _lastUpdatedMeta,
          lastUpdated.isAcceptableOrUnknown(
              data['last_updated']!, _lastUpdatedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  EventStatsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EventStatsTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      repliesCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}replies_count'])!,
      repostsCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}reposts_count'])!,
      reactionsCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}reactions_count'])!,
      zapsCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}zaps_count'])!,
      zapAmount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}zap_amount'])!,
      lastUpdated: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}last_updated']),
    );
  }

  @override
  $EventStatsTableTable createAlias(String alias) {
    return $EventStatsTableTable(attachedDatabase, alias);
  }
}

class EventStatsTableData extends DataClass
    implements Insertable<EventStatsTableData> {
  final String id;
  final int repliesCount;
  final int repostsCount;
  final int reactionsCount;
  final int zapsCount;
  final int zapAmount;
  final int? lastUpdated;
  const EventStatsTableData(
      {required this.id,
      required this.repliesCount,
      required this.repostsCount,
      required this.reactionsCount,
      required this.zapsCount,
      required this.zapAmount,
      this.lastUpdated});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['replies_count'] = Variable<int>(repliesCount);
    map['reposts_count'] = Variable<int>(repostsCount);
    map['reactions_count'] = Variable<int>(reactionsCount);
    map['zaps_count'] = Variable<int>(zapsCount);
    map['zap_amount'] = Variable<int>(zapAmount);
    if (!nullToAbsent || lastUpdated != null) {
      map['last_updated'] = Variable<int>(lastUpdated);
    }
    return map;
  }

  EventStatsTableCompanion toCompanion(bool nullToAbsent) {
    return EventStatsTableCompanion(
      id: Value(id),
      repliesCount: Value(repliesCount),
      repostsCount: Value(repostsCount),
      reactionsCount: Value(reactionsCount),
      zapsCount: Value(zapsCount),
      zapAmount: Value(zapAmount),
      lastUpdated: lastUpdated == null && nullToAbsent
          ? const Value.absent()
          : Value(lastUpdated),
    );
  }

  factory EventStatsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EventStatsTableData(
      id: serializer.fromJson<String>(json['id']),
      repliesCount: serializer.fromJson<int>(json['repliesCount']),
      repostsCount: serializer.fromJson<int>(json['repostsCount']),
      reactionsCount: serializer.fromJson<int>(json['reactionsCount']),
      zapsCount: serializer.fromJson<int>(json['zapsCount']),
      zapAmount: serializer.fromJson<int>(json['zapAmount']),
      lastUpdated: serializer.fromJson<int?>(json['lastUpdated']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'repliesCount': serializer.toJson<int>(repliesCount),
      'repostsCount': serializer.toJson<int>(repostsCount),
      'reactionsCount': serializer.toJson<int>(reactionsCount),
      'zapsCount': serializer.toJson<int>(zapsCount),
      'zapAmount': serializer.toJson<int>(zapAmount),
      'lastUpdated': serializer.toJson<int?>(lastUpdated),
    };
  }

  EventStatsTableData copyWith(
          {String? id,
          int? repliesCount,
          int? repostsCount,
          int? reactionsCount,
          int? zapsCount,
          int? zapAmount,
          Value<int?> lastUpdated = const Value.absent()}) =>
      EventStatsTableData(
        id: id ?? this.id,
        repliesCount: repliesCount ?? this.repliesCount,
        repostsCount: repostsCount ?? this.repostsCount,
        reactionsCount: reactionsCount ?? this.reactionsCount,
        zapsCount: zapsCount ?? this.zapsCount,
        zapAmount: zapAmount ?? this.zapAmount,
        lastUpdated: lastUpdated.present ? lastUpdated.value : this.lastUpdated,
      );
  EventStatsTableData copyWithCompanion(EventStatsTableCompanion data) {
    return EventStatsTableData(
      id: data.id.present ? data.id.value : this.id,
      repliesCount: data.repliesCount.present
          ? data.repliesCount.value
          : this.repliesCount,
      repostsCount: data.repostsCount.present
          ? data.repostsCount.value
          : this.repostsCount,
      reactionsCount: data.reactionsCount.present
          ? data.reactionsCount.value
          : this.reactionsCount,
      zapsCount: data.zapsCount.present ? data.zapsCount.value : this.zapsCount,
      zapAmount: data.zapAmount.present ? data.zapAmount.value : this.zapAmount,
      lastUpdated:
          data.lastUpdated.present ? data.lastUpdated.value : this.lastUpdated,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EventStatsTableData(')
          ..write('id: $id, ')
          ..write('repliesCount: $repliesCount, ')
          ..write('repostsCount: $repostsCount, ')
          ..write('reactionsCount: $reactionsCount, ')
          ..write('zapsCount: $zapsCount, ')
          ..write('zapAmount: $zapAmount, ')
          ..write('lastUpdated: $lastUpdated')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, repliesCount, repostsCount,
      reactionsCount, zapsCount, zapAmount, lastUpdated);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EventStatsTableData &&
          other.id == this.id &&
          other.repliesCount == this.repliesCount &&
          other.repostsCount == this.repostsCount &&
          other.reactionsCount == this.reactionsCount &&
          other.zapsCount == this.zapsCount &&
          other.zapAmount == this.zapAmount &&
          other.lastUpdated == this.lastUpdated);
}

class EventStatsTableCompanion extends UpdateCompanion<EventStatsTableData> {
  final Value<String> id;
  final Value<int> repliesCount;
  final Value<int> repostsCount;
  final Value<int> reactionsCount;
  final Value<int> zapsCount;
  final Value<int> zapAmount;
  final Value<int?> lastUpdated;
  final Value<int> rowid;
  const EventStatsTableCompanion({
    this.id = const Value.absent(),
    this.repliesCount = const Value.absent(),
    this.repostsCount = const Value.absent(),
    this.reactionsCount = const Value.absent(),
    this.zapsCount = const Value.absent(),
    this.zapAmount = const Value.absent(),
    this.lastUpdated = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  EventStatsTableCompanion.insert({
    required String id,
    this.repliesCount = const Value.absent(),
    this.repostsCount = const Value.absent(),
    this.reactionsCount = const Value.absent(),
    this.zapsCount = const Value.absent(),
    this.zapAmount = const Value.absent(),
    this.lastUpdated = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id);
  static Insertable<EventStatsTableData> custom({
    Expression<String>? id,
    Expression<int>? repliesCount,
    Expression<int>? repostsCount,
    Expression<int>? reactionsCount,
    Expression<int>? zapsCount,
    Expression<int>? zapAmount,
    Expression<int>? lastUpdated,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (repliesCount != null) 'replies_count': repliesCount,
      if (repostsCount != null) 'reposts_count': repostsCount,
      if (reactionsCount != null) 'reactions_count': reactionsCount,
      if (zapsCount != null) 'zaps_count': zapsCount,
      if (zapAmount != null) 'zap_amount': zapAmount,
      if (lastUpdated != null) 'last_updated': lastUpdated,
      if (rowid != null) 'rowid': rowid,
    });
  }

  EventStatsTableCompanion copyWith(
      {Value<String>? id,
      Value<int>? repliesCount,
      Value<int>? repostsCount,
      Value<int>? reactionsCount,
      Value<int>? zapsCount,
      Value<int>? zapAmount,
      Value<int?>? lastUpdated,
      Value<int>? rowid}) {
    return EventStatsTableCompanion(
      id: id ?? this.id,
      repliesCount: repliesCount ?? this.repliesCount,
      repostsCount: repostsCount ?? this.repostsCount,
      reactionsCount: reactionsCount ?? this.reactionsCount,
      zapsCount: zapsCount ?? this.zapsCount,
      zapAmount: zapAmount ?? this.zapAmount,
      lastUpdated: lastUpdated ?? this.lastUpdated,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (repliesCount.present) {
      map['replies_count'] = Variable<int>(repliesCount.value);
    }
    if (repostsCount.present) {
      map['reposts_count'] = Variable<int>(repostsCount.value);
    }
    if (reactionsCount.present) {
      map['reactions_count'] = Variable<int>(reactionsCount.value);
    }
    if (zapsCount.present) {
      map['zaps_count'] = Variable<int>(zapsCount.value);
    }
    if (zapAmount.present) {
      map['zap_amount'] = Variable<int>(zapAmount.value);
    }
    if (lastUpdated.present) {
      map['last_updated'] = Variable<int>(lastUpdated.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EventStatsTableCompanion(')
          ..write('id: $id, ')
          ..write('repliesCount: $repliesCount, ')
          ..write('repostsCount: $repostsCount, ')
          ..write('reactionsCount: $reactionsCount, ')
          ..write('zapsCount: $zapsCount, ')
          ..write('zapAmount: $zapAmount, ')
          ..write('lastUpdated: $lastUpdated, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $Nip05TableTable extends Nip05Table
    with TableInfo<$Nip05TableTable, Nip05TableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $Nip05TableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _nip05Meta = const VerificationMeta('nip05');
  @override
  late final GeneratedColumn<String> nip05 = GeneratedColumn<String>(
      'nip05', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _pubkeyMeta = const VerificationMeta('pubkey');
  @override
  late final GeneratedColumn<String> pubkey = GeneratedColumn<String>(
      'pubkey', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _validMeta = const VerificationMeta('valid');
  @override
  late final GeneratedColumn<bool> valid = GeneratedColumn<bool>(
      'valid', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("valid" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _lastCheckMeta =
      const VerificationMeta('lastCheck');
  @override
  late final GeneratedColumn<int> lastCheck = GeneratedColumn<int>(
      'last_check', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _networkFetchMeta =
      const VerificationMeta('networkFetch');
  @override
  late final GeneratedColumn<int> networkFetch = GeneratedColumn<int>(
      'network_fetch', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [nip05, pubkey, valid, lastCheck, networkFetch];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'nip05_table';
  @override
  VerificationContext validateIntegrity(Insertable<Nip05TableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('nip05')) {
      context.handle(
          _nip05Meta, nip05.isAcceptableOrUnknown(data['nip05']!, _nip05Meta));
    } else if (isInserting) {
      context.missing(_nip05Meta);
    }
    if (data.containsKey('pubkey')) {
      context.handle(_pubkeyMeta,
          pubkey.isAcceptableOrUnknown(data['pubkey']!, _pubkeyMeta));
    } else if (isInserting) {
      context.missing(_pubkeyMeta);
    }
    if (data.containsKey('valid')) {
      context.handle(
          _validMeta, valid.isAcceptableOrUnknown(data['valid']!, _validMeta));
    }
    if (data.containsKey('last_check')) {
      context.handle(_lastCheckMeta,
          lastCheck.isAcceptableOrUnknown(data['last_check']!, _lastCheckMeta));
    }
    if (data.containsKey('network_fetch')) {
      context.handle(
          _networkFetchMeta,
          networkFetch.isAcceptableOrUnknown(
              data['network_fetch']!, _networkFetchMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {nip05};
  @override
  Nip05TableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Nip05TableData(
      nip05: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nip05'])!,
      pubkey: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}pubkey'])!,
      valid: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}valid'])!,
      lastCheck: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}last_check']),
      networkFetch: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}network_fetch']),
    );
  }

  @override
  $Nip05TableTable createAlias(String alias) {
    return $Nip05TableTable(attachedDatabase, alias);
  }
}

class Nip05TableData extends DataClass implements Insertable<Nip05TableData> {
  final String nip05;
  final String pubkey;
  final bool valid;
  final int? lastCheck;
  final int? networkFetch;
  const Nip05TableData(
      {required this.nip05,
      required this.pubkey,
      required this.valid,
      this.lastCheck,
      this.networkFetch});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['nip05'] = Variable<String>(nip05);
    map['pubkey'] = Variable<String>(pubkey);
    map['valid'] = Variable<bool>(valid);
    if (!nullToAbsent || lastCheck != null) {
      map['last_check'] = Variable<int>(lastCheck);
    }
    if (!nullToAbsent || networkFetch != null) {
      map['network_fetch'] = Variable<int>(networkFetch);
    }
    return map;
  }

  Nip05TableCompanion toCompanion(bool nullToAbsent) {
    return Nip05TableCompanion(
      nip05: Value(nip05),
      pubkey: Value(pubkey),
      valid: Value(valid),
      lastCheck: lastCheck == null && nullToAbsent
          ? const Value.absent()
          : Value(lastCheck),
      networkFetch: networkFetch == null && nullToAbsent
          ? const Value.absent()
          : Value(networkFetch),
    );
  }

  factory Nip05TableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Nip05TableData(
      nip05: serializer.fromJson<String>(json['nip05']),
      pubkey: serializer.fromJson<String>(json['pubkey']),
      valid: serializer.fromJson<bool>(json['valid']),
      lastCheck: serializer.fromJson<int?>(json['lastCheck']),
      networkFetch: serializer.fromJson<int?>(json['networkFetch']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'nip05': serializer.toJson<String>(nip05),
      'pubkey': serializer.toJson<String>(pubkey),
      'valid': serializer.toJson<bool>(valid),
      'lastCheck': serializer.toJson<int?>(lastCheck),
      'networkFetch': serializer.toJson<int?>(networkFetch),
    };
  }

  Nip05TableData copyWith(
          {String? nip05,
          String? pubkey,
          bool? valid,
          Value<int?> lastCheck = const Value.absent(),
          Value<int?> networkFetch = const Value.absent()}) =>
      Nip05TableData(
        nip05: nip05 ?? this.nip05,
        pubkey: pubkey ?? this.pubkey,
        valid: valid ?? this.valid,
        lastCheck: lastCheck.present ? lastCheck.value : this.lastCheck,
        networkFetch:
            networkFetch.present ? networkFetch.value : this.networkFetch,
      );
  Nip05TableData copyWithCompanion(Nip05TableCompanion data) {
    return Nip05TableData(
      nip05: data.nip05.present ? data.nip05.value : this.nip05,
      pubkey: data.pubkey.present ? data.pubkey.value : this.pubkey,
      valid: data.valid.present ? data.valid.value : this.valid,
      lastCheck: data.lastCheck.present ? data.lastCheck.value : this.lastCheck,
      networkFetch: data.networkFetch.present
          ? data.networkFetch.value
          : this.networkFetch,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Nip05TableData(')
          ..write('nip05: $nip05, ')
          ..write('pubkey: $pubkey, ')
          ..write('valid: $valid, ')
          ..write('lastCheck: $lastCheck, ')
          ..write('networkFetch: $networkFetch')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(nip05, pubkey, valid, lastCheck, networkFetch);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Nip05TableData &&
          other.nip05 == this.nip05 &&
          other.pubkey == this.pubkey &&
          other.valid == this.valid &&
          other.lastCheck == this.lastCheck &&
          other.networkFetch == this.networkFetch);
}

class Nip05TableCompanion extends UpdateCompanion<Nip05TableData> {
  final Value<String> nip05;
  final Value<String> pubkey;
  final Value<bool> valid;
  final Value<int?> lastCheck;
  final Value<int?> networkFetch;
  final Value<int> rowid;
  const Nip05TableCompanion({
    this.nip05 = const Value.absent(),
    this.pubkey = const Value.absent(),
    this.valid = const Value.absent(),
    this.lastCheck = const Value.absent(),
    this.networkFetch = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  Nip05TableCompanion.insert({
    required String nip05,
    required String pubkey,
    this.valid = const Value.absent(),
    this.lastCheck = const Value.absent(),
    this.networkFetch = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : nip05 = Value(nip05),
        pubkey = Value(pubkey);
  static Insertable<Nip05TableData> custom({
    Expression<String>? nip05,
    Expression<String>? pubkey,
    Expression<bool>? valid,
    Expression<int>? lastCheck,
    Expression<int>? networkFetch,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (nip05 != null) 'nip05': nip05,
      if (pubkey != null) 'pubkey': pubkey,
      if (valid != null) 'valid': valid,
      if (lastCheck != null) 'last_check': lastCheck,
      if (networkFetch != null) 'network_fetch': networkFetch,
      if (rowid != null) 'rowid': rowid,
    });
  }

  Nip05TableCompanion copyWith(
      {Value<String>? nip05,
      Value<String>? pubkey,
      Value<bool>? valid,
      Value<int?>? lastCheck,
      Value<int?>? networkFetch,
      Value<int>? rowid}) {
    return Nip05TableCompanion(
      nip05: nip05 ?? this.nip05,
      pubkey: pubkey ?? this.pubkey,
      valid: valid ?? this.valid,
      lastCheck: lastCheck ?? this.lastCheck,
      networkFetch: networkFetch ?? this.networkFetch,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (nip05.present) {
      map['nip05'] = Variable<String>(nip05.value);
    }
    if (pubkey.present) {
      map['pubkey'] = Variable<String>(pubkey.value);
    }
    if (valid.present) {
      map['valid'] = Variable<bool>(valid.value);
    }
    if (lastCheck.present) {
      map['last_check'] = Variable<int>(lastCheck.value);
    }
    if (networkFetch.present) {
      map['network_fetch'] = Variable<int>(networkFetch.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('Nip05TableCompanion(')
          ..write('nip05: $nip05, ')
          ..write('pubkey: $pubkey, ')
          ..write('valid: $valid, ')
          ..write('lastCheck: $lastCheck, ')
          ..write('networkFetch: $networkFetch, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DmSessionInfosTableTable extends DmSessionInfosTable
    with TableInfo<$DmSessionInfosTableTable, DmSessionInfosTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DmSessionInfosTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _dmSessionIdMeta =
      const VerificationMeta('dmSessionId');
  @override
  late final GeneratedColumn<String> dmSessionId = GeneratedColumn<String>(
      'dm_session_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _pubkeyMeta = const VerificationMeta('pubkey');
  @override
  late final GeneratedColumn<String> pubkey = GeneratedColumn<String>(
      'pubkey', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _peerMeta = const VerificationMeta('peer');
  @override
  late final GeneratedColumn<String> peer = GeneratedColumn<String>(
      'peer', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _readMessageTimeMeta =
      const VerificationMeta('readMessageTime');
  @override
  late final GeneratedColumn<int> readMessageTime = GeneratedColumn<int>(
      'read_message_time', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _hiddenMessageTimeMeta =
      const VerificationMeta('hiddenMessageTime');
  @override
  late final GeneratedColumn<int> hiddenMessageTime = GeneratedColumn<int>(
      'hidden_message_time', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [dmSessionId, pubkey, peer, readMessageTime, hiddenMessageTime];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'dm_session_infos_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<DmSessionInfosTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('dm_session_id')) {
      context.handle(
          _dmSessionIdMeta,
          dmSessionId.isAcceptableOrUnknown(
              data['dm_session_id']!, _dmSessionIdMeta));
    } else if (isInserting) {
      context.missing(_dmSessionIdMeta);
    }
    if (data.containsKey('pubkey')) {
      context.handle(_pubkeyMeta,
          pubkey.isAcceptableOrUnknown(data['pubkey']!, _pubkeyMeta));
    } else if (isInserting) {
      context.missing(_pubkeyMeta);
    }
    if (data.containsKey('peer')) {
      context.handle(
          _peerMeta, peer.isAcceptableOrUnknown(data['peer']!, _peerMeta));
    } else if (isInserting) {
      context.missing(_peerMeta);
    }
    if (data.containsKey('read_message_time')) {
      context.handle(
          _readMessageTimeMeta,
          readMessageTime.isAcceptableOrUnknown(
              data['read_message_time']!, _readMessageTimeMeta));
    }
    if (data.containsKey('hidden_message_time')) {
      context.handle(
          _hiddenMessageTimeMeta,
          hiddenMessageTime.isAcceptableOrUnknown(
              data['hidden_message_time']!, _hiddenMessageTimeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {dmSessionId};
  @override
  DmSessionInfosTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DmSessionInfosTableData(
      dmSessionId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}dm_session_id'])!,
      pubkey: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}pubkey'])!,
      peer: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}peer'])!,
      readMessageTime: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}read_message_time']),
      hiddenMessageTime: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}hidden_message_time']),
    );
  }

  @override
  $DmSessionInfosTableTable createAlias(String alias) {
    return $DmSessionInfosTableTable(attachedDatabase, alias);
  }
}

class DmSessionInfosTableData extends DataClass
    implements Insertable<DmSessionInfosTableData> {
  final String dmSessionId;
  final String pubkey;
  final String peer;
  final int? readMessageTime;
  final int? hiddenMessageTime;
  const DmSessionInfosTableData(
      {required this.dmSessionId,
      required this.pubkey,
      required this.peer,
      this.readMessageTime,
      this.hiddenMessageTime});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['dm_session_id'] = Variable<String>(dmSessionId);
    map['pubkey'] = Variable<String>(pubkey);
    map['peer'] = Variable<String>(peer);
    if (!nullToAbsent || readMessageTime != null) {
      map['read_message_time'] = Variable<int>(readMessageTime);
    }
    if (!nullToAbsent || hiddenMessageTime != null) {
      map['hidden_message_time'] = Variable<int>(hiddenMessageTime);
    }
    return map;
  }

  DmSessionInfosTableCompanion toCompanion(bool nullToAbsent) {
    return DmSessionInfosTableCompanion(
      dmSessionId: Value(dmSessionId),
      pubkey: Value(pubkey),
      peer: Value(peer),
      readMessageTime: readMessageTime == null && nullToAbsent
          ? const Value.absent()
          : Value(readMessageTime),
      hiddenMessageTime: hiddenMessageTime == null && nullToAbsent
          ? const Value.absent()
          : Value(hiddenMessageTime),
    );
  }

  factory DmSessionInfosTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DmSessionInfosTableData(
      dmSessionId: serializer.fromJson<String>(json['dmSessionId']),
      pubkey: serializer.fromJson<String>(json['pubkey']),
      peer: serializer.fromJson<String>(json['peer']),
      readMessageTime: serializer.fromJson<int?>(json['readMessageTime']),
      hiddenMessageTime: serializer.fromJson<int?>(json['hiddenMessageTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'dmSessionId': serializer.toJson<String>(dmSessionId),
      'pubkey': serializer.toJson<String>(pubkey),
      'peer': serializer.toJson<String>(peer),
      'readMessageTime': serializer.toJson<int?>(readMessageTime),
      'hiddenMessageTime': serializer.toJson<int?>(hiddenMessageTime),
    };
  }

  DmSessionInfosTableData copyWith(
          {String? dmSessionId,
          String? pubkey,
          String? peer,
          Value<int?> readMessageTime = const Value.absent(),
          Value<int?> hiddenMessageTime = const Value.absent()}) =>
      DmSessionInfosTableData(
        dmSessionId: dmSessionId ?? this.dmSessionId,
        pubkey: pubkey ?? this.pubkey,
        peer: peer ?? this.peer,
        readMessageTime: readMessageTime.present
            ? readMessageTime.value
            : this.readMessageTime,
        hiddenMessageTime: hiddenMessageTime.present
            ? hiddenMessageTime.value
            : this.hiddenMessageTime,
      );
  DmSessionInfosTableData copyWithCompanion(DmSessionInfosTableCompanion data) {
    return DmSessionInfosTableData(
      dmSessionId:
          data.dmSessionId.present ? data.dmSessionId.value : this.dmSessionId,
      pubkey: data.pubkey.present ? data.pubkey.value : this.pubkey,
      peer: data.peer.present ? data.peer.value : this.peer,
      readMessageTime: data.readMessageTime.present
          ? data.readMessageTime.value
          : this.readMessageTime,
      hiddenMessageTime: data.hiddenMessageTime.present
          ? data.hiddenMessageTime.value
          : this.hiddenMessageTime,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DmSessionInfosTableData(')
          ..write('dmSessionId: $dmSessionId, ')
          ..write('pubkey: $pubkey, ')
          ..write('peer: $peer, ')
          ..write('readMessageTime: $readMessageTime, ')
          ..write('hiddenMessageTime: $hiddenMessageTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      dmSessionId, pubkey, peer, readMessageTime, hiddenMessageTime);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DmSessionInfosTableData &&
          other.dmSessionId == this.dmSessionId &&
          other.pubkey == this.pubkey &&
          other.peer == this.peer &&
          other.readMessageTime == this.readMessageTime &&
          other.hiddenMessageTime == this.hiddenMessageTime);
}

class DmSessionInfosTableCompanion
    extends UpdateCompanion<DmSessionInfosTableData> {
  final Value<String> dmSessionId;
  final Value<String> pubkey;
  final Value<String> peer;
  final Value<int?> readMessageTime;
  final Value<int?> hiddenMessageTime;
  final Value<int> rowid;
  const DmSessionInfosTableCompanion({
    this.dmSessionId = const Value.absent(),
    this.pubkey = const Value.absent(),
    this.peer = const Value.absent(),
    this.readMessageTime = const Value.absent(),
    this.hiddenMessageTime = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DmSessionInfosTableCompanion.insert({
    required String dmSessionId,
    required String pubkey,
    required String peer,
    this.readMessageTime = const Value.absent(),
    this.hiddenMessageTime = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : dmSessionId = Value(dmSessionId),
        pubkey = Value(pubkey),
        peer = Value(peer);
  static Insertable<DmSessionInfosTableData> custom({
    Expression<String>? dmSessionId,
    Expression<String>? pubkey,
    Expression<String>? peer,
    Expression<int>? readMessageTime,
    Expression<int>? hiddenMessageTime,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (dmSessionId != null) 'dm_session_id': dmSessionId,
      if (pubkey != null) 'pubkey': pubkey,
      if (peer != null) 'peer': peer,
      if (readMessageTime != null) 'read_message_time': readMessageTime,
      if (hiddenMessageTime != null) 'hidden_message_time': hiddenMessageTime,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DmSessionInfosTableCompanion copyWith(
      {Value<String>? dmSessionId,
      Value<String>? pubkey,
      Value<String>? peer,
      Value<int?>? readMessageTime,
      Value<int?>? hiddenMessageTime,
      Value<int>? rowid}) {
    return DmSessionInfosTableCompanion(
      dmSessionId: dmSessionId ?? this.dmSessionId,
      pubkey: pubkey ?? this.pubkey,
      peer: peer ?? this.peer,
      readMessageTime: readMessageTime ?? this.readMessageTime,
      hiddenMessageTime: hiddenMessageTime ?? this.hiddenMessageTime,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (dmSessionId.present) {
      map['dm_session_id'] = Variable<String>(dmSessionId.value);
    }
    if (pubkey.present) {
      map['pubkey'] = Variable<String>(pubkey.value);
    }
    if (peer.present) {
      map['peer'] = Variable<String>(peer.value);
    }
    if (readMessageTime.present) {
      map['read_message_time'] = Variable<int>(readMessageTime.value);
    }
    if (hiddenMessageTime.present) {
      map['hidden_message_time'] = Variable<int>(hiddenMessageTime.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DmSessionInfosTableCompanion(')
          ..write('dmSessionId: $dmSessionId, ')
          ..write('pubkey: $pubkey, ')
          ..write('peer: $peer, ')
          ..write('readMessageTime: $readMessageTime, ')
          ..write('hiddenMessageTime: $hiddenMessageTime, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $UserFollowersTableTable extends UserFollowersTable
    with TableInfo<$UserFollowersTableTable, UserFollowersTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserFollowersTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _pubkeyMeta = const VerificationMeta('pubkey');
  @override
  late final GeneratedColumn<String> pubkey = GeneratedColumn<String>(
      'pubkey', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _followersMeta =
      const VerificationMeta('followers');
  @override
  late final GeneratedColumn<String> followers = GeneratedColumn<String>(
      'followers', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('[]'));
  static const VerificationMeta _lastUpdatedMeta =
      const VerificationMeta('lastUpdated');
  @override
  late final GeneratedColumn<int> lastUpdated = GeneratedColumn<int>(
      'last_updated', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, pubkey, followers, lastUpdated];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_followers_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<UserFollowersTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('pubkey')) {
      context.handle(_pubkeyMeta,
          pubkey.isAcceptableOrUnknown(data['pubkey']!, _pubkeyMeta));
    } else if (isInserting) {
      context.missing(_pubkeyMeta);
    }
    if (data.containsKey('followers')) {
      context.handle(_followersMeta,
          followers.isAcceptableOrUnknown(data['followers']!, _followersMeta));
    }
    if (data.containsKey('last_updated')) {
      context.handle(
          _lastUpdatedMeta,
          lastUpdated.isAcceptableOrUnknown(
              data['last_updated']!, _lastUpdatedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {pubkey};
  @override
  UserFollowersTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserFollowersTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      pubkey: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}pubkey'])!,
      followers: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}followers'])!,
      lastUpdated: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}last_updated']),
    );
  }

  @override
  $UserFollowersTableTable createAlias(String alias) {
    return $UserFollowersTableTable(attachedDatabase, alias);
  }
}

class UserFollowersTableData extends DataClass
    implements Insertable<UserFollowersTableData> {
  final String id;
  final String pubkey;
  final String followers;
  final int? lastUpdated;
  const UserFollowersTableData(
      {required this.id,
      required this.pubkey,
      required this.followers,
      this.lastUpdated});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['pubkey'] = Variable<String>(pubkey);
    map['followers'] = Variable<String>(followers);
    if (!nullToAbsent || lastUpdated != null) {
      map['last_updated'] = Variable<int>(lastUpdated);
    }
    return map;
  }

  UserFollowersTableCompanion toCompanion(bool nullToAbsent) {
    return UserFollowersTableCompanion(
      id: Value(id),
      pubkey: Value(pubkey),
      followers: Value(followers),
      lastUpdated: lastUpdated == null && nullToAbsent
          ? const Value.absent()
          : Value(lastUpdated),
    );
  }

  factory UserFollowersTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserFollowersTableData(
      id: serializer.fromJson<String>(json['id']),
      pubkey: serializer.fromJson<String>(json['pubkey']),
      followers: serializer.fromJson<String>(json['followers']),
      lastUpdated: serializer.fromJson<int?>(json['lastUpdated']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'pubkey': serializer.toJson<String>(pubkey),
      'followers': serializer.toJson<String>(followers),
      'lastUpdated': serializer.toJson<int?>(lastUpdated),
    };
  }

  UserFollowersTableData copyWith(
          {String? id,
          String? pubkey,
          String? followers,
          Value<int?> lastUpdated = const Value.absent()}) =>
      UserFollowersTableData(
        id: id ?? this.id,
        pubkey: pubkey ?? this.pubkey,
        followers: followers ?? this.followers,
        lastUpdated: lastUpdated.present ? lastUpdated.value : this.lastUpdated,
      );
  UserFollowersTableData copyWithCompanion(UserFollowersTableCompanion data) {
    return UserFollowersTableData(
      id: data.id.present ? data.id.value : this.id,
      pubkey: data.pubkey.present ? data.pubkey.value : this.pubkey,
      followers: data.followers.present ? data.followers.value : this.followers,
      lastUpdated:
          data.lastUpdated.present ? data.lastUpdated.value : this.lastUpdated,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserFollowersTableData(')
          ..write('id: $id, ')
          ..write('pubkey: $pubkey, ')
          ..write('followers: $followers, ')
          ..write('lastUpdated: $lastUpdated')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, pubkey, followers, lastUpdated);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserFollowersTableData &&
          other.id == this.id &&
          other.pubkey == this.pubkey &&
          other.followers == this.followers &&
          other.lastUpdated == this.lastUpdated);
}

class UserFollowersTableCompanion
    extends UpdateCompanion<UserFollowersTableData> {
  final Value<String> id;
  final Value<String> pubkey;
  final Value<String> followers;
  final Value<int?> lastUpdated;
  final Value<int> rowid;
  const UserFollowersTableCompanion({
    this.id = const Value.absent(),
    this.pubkey = const Value.absent(),
    this.followers = const Value.absent(),
    this.lastUpdated = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserFollowersTableCompanion.insert({
    required String id,
    required String pubkey,
    this.followers = const Value.absent(),
    this.lastUpdated = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        pubkey = Value(pubkey);
  static Insertable<UserFollowersTableData> custom({
    Expression<String>? id,
    Expression<String>? pubkey,
    Expression<String>? followers,
    Expression<int>? lastUpdated,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (pubkey != null) 'pubkey': pubkey,
      if (followers != null) 'followers': followers,
      if (lastUpdated != null) 'last_updated': lastUpdated,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserFollowersTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? pubkey,
      Value<String>? followers,
      Value<int?>? lastUpdated,
      Value<int>? rowid}) {
    return UserFollowersTableCompanion(
      id: id ?? this.id,
      pubkey: pubkey ?? this.pubkey,
      followers: followers ?? this.followers,
      lastUpdated: lastUpdated ?? this.lastUpdated,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (pubkey.present) {
      map['pubkey'] = Variable<String>(pubkey.value);
    }
    if (followers.present) {
      map['followers'] = Variable<String>(followers.value);
    }
    if (lastUpdated.present) {
      map['last_updated'] = Variable<int>(lastUpdated.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserFollowersTableCompanion(')
          ..write('id: $id, ')
          ..write('pubkey: $pubkey, ')
          ..write('followers: $followers, ')
          ..write('lastUpdated: $lastUpdated, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $UserDraftTableTable extends UserDraftTable
    with TableInfo<$UserDraftTableTable, UserDraftTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserDraftTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _pubkeyMeta = const VerificationMeta('pubkey');
  @override
  late final GeneratedColumn<String> pubkey = GeneratedColumn<String>(
      'pubkey', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _contentMeta =
      const VerificationMeta('content');
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
      'content', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _kindMeta = const VerificationMeta('kind');
  @override
  late final GeneratedColumn<int> kind = GeneratedColumn<int>(
      'kind', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _tagsMeta = const VerificationMeta('tags');
  @override
  late final GeneratedColumn<String> tags = GeneratedColumn<String>(
      'tags', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('[]'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
      'created_at', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _lastUpdatedMeta =
      const VerificationMeta('lastUpdated');
  @override
  late final GeneratedColumn<int> lastUpdated = GeneratedColumn<int>(
      'last_updated', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, pubkey, content, kind, tags, createdAt, lastUpdated];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_draft_table';
  @override
  VerificationContext validateIntegrity(Insertable<UserDraftTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('pubkey')) {
      context.handle(_pubkeyMeta,
          pubkey.isAcceptableOrUnknown(data['pubkey']!, _pubkeyMeta));
    } else if (isInserting) {
      context.missing(_pubkeyMeta);
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('kind')) {
      context.handle(
          _kindMeta, kind.isAcceptableOrUnknown(data['kind']!, _kindMeta));
    } else if (isInserting) {
      context.missing(_kindMeta);
    }
    if (data.containsKey('tags')) {
      context.handle(
          _tagsMeta, tags.isAcceptableOrUnknown(data['tags']!, _tagsMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('last_updated')) {
      context.handle(
          _lastUpdatedMeta,
          lastUpdated.isAcceptableOrUnknown(
              data['last_updated']!, _lastUpdatedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {pubkey};
  @override
  UserDraftTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserDraftTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      pubkey: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}pubkey'])!,
      content: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content'])!,
      kind: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}kind'])!,
      tags: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tags'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}created_at'])!,
      lastUpdated: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}last_updated']),
    );
  }

  @override
  $UserDraftTableTable createAlias(String alias) {
    return $UserDraftTableTable(attachedDatabase, alias);
  }
}

class UserDraftTableData extends DataClass
    implements Insertable<UserDraftTableData> {
  final String id;
  final String pubkey;
  final String content;
  final int kind;
  final String tags;
  final int createdAt;
  final int? lastUpdated;
  const UserDraftTableData(
      {required this.id,
      required this.pubkey,
      required this.content,
      required this.kind,
      required this.tags,
      required this.createdAt,
      this.lastUpdated});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['pubkey'] = Variable<String>(pubkey);
    map['content'] = Variable<String>(content);
    map['kind'] = Variable<int>(kind);
    map['tags'] = Variable<String>(tags);
    map['created_at'] = Variable<int>(createdAt);
    if (!nullToAbsent || lastUpdated != null) {
      map['last_updated'] = Variable<int>(lastUpdated);
    }
    return map;
  }

  UserDraftTableCompanion toCompanion(bool nullToAbsent) {
    return UserDraftTableCompanion(
      id: Value(id),
      pubkey: Value(pubkey),
      content: Value(content),
      kind: Value(kind),
      tags: Value(tags),
      createdAt: Value(createdAt),
      lastUpdated: lastUpdated == null && nullToAbsent
          ? const Value.absent()
          : Value(lastUpdated),
    );
  }

  factory UserDraftTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserDraftTableData(
      id: serializer.fromJson<String>(json['id']),
      pubkey: serializer.fromJson<String>(json['pubkey']),
      content: serializer.fromJson<String>(json['content']),
      kind: serializer.fromJson<int>(json['kind']),
      tags: serializer.fromJson<String>(json['tags']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      lastUpdated: serializer.fromJson<int?>(json['lastUpdated']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'pubkey': serializer.toJson<String>(pubkey),
      'content': serializer.toJson<String>(content),
      'kind': serializer.toJson<int>(kind),
      'tags': serializer.toJson<String>(tags),
      'createdAt': serializer.toJson<int>(createdAt),
      'lastUpdated': serializer.toJson<int?>(lastUpdated),
    };
  }

  UserDraftTableData copyWith(
          {String? id,
          String? pubkey,
          String? content,
          int? kind,
          String? tags,
          int? createdAt,
          Value<int?> lastUpdated = const Value.absent()}) =>
      UserDraftTableData(
        id: id ?? this.id,
        pubkey: pubkey ?? this.pubkey,
        content: content ?? this.content,
        kind: kind ?? this.kind,
        tags: tags ?? this.tags,
        createdAt: createdAt ?? this.createdAt,
        lastUpdated: lastUpdated.present ? lastUpdated.value : this.lastUpdated,
      );
  UserDraftTableData copyWithCompanion(UserDraftTableCompanion data) {
    return UserDraftTableData(
      id: data.id.present ? data.id.value : this.id,
      pubkey: data.pubkey.present ? data.pubkey.value : this.pubkey,
      content: data.content.present ? data.content.value : this.content,
      kind: data.kind.present ? data.kind.value : this.kind,
      tags: data.tags.present ? data.tags.value : this.tags,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      lastUpdated:
          data.lastUpdated.present ? data.lastUpdated.value : this.lastUpdated,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserDraftTableData(')
          ..write('id: $id, ')
          ..write('pubkey: $pubkey, ')
          ..write('content: $content, ')
          ..write('kind: $kind, ')
          ..write('tags: $tags, ')
          ..write('createdAt: $createdAt, ')
          ..write('lastUpdated: $lastUpdated')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, pubkey, content, kind, tags, createdAt, lastUpdated);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserDraftTableData &&
          other.id == this.id &&
          other.pubkey == this.pubkey &&
          other.content == this.content &&
          other.kind == this.kind &&
          other.tags == this.tags &&
          other.createdAt == this.createdAt &&
          other.lastUpdated == this.lastUpdated);
}

class UserDraftTableCompanion extends UpdateCompanion<UserDraftTableData> {
  final Value<String> id;
  final Value<String> pubkey;
  final Value<String> content;
  final Value<int> kind;
  final Value<String> tags;
  final Value<int> createdAt;
  final Value<int?> lastUpdated;
  final Value<int> rowid;
  const UserDraftTableCompanion({
    this.id = const Value.absent(),
    this.pubkey = const Value.absent(),
    this.content = const Value.absent(),
    this.kind = const Value.absent(),
    this.tags = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.lastUpdated = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserDraftTableCompanion.insert({
    required String id,
    required String pubkey,
    required String content,
    required int kind,
    this.tags = const Value.absent(),
    required int createdAt,
    this.lastUpdated = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        pubkey = Value(pubkey),
        content = Value(content),
        kind = Value(kind),
        createdAt = Value(createdAt);
  static Insertable<UserDraftTableData> custom({
    Expression<String>? id,
    Expression<String>? pubkey,
    Expression<String>? content,
    Expression<int>? kind,
    Expression<String>? tags,
    Expression<int>? createdAt,
    Expression<int>? lastUpdated,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (pubkey != null) 'pubkey': pubkey,
      if (content != null) 'content': content,
      if (kind != null) 'kind': kind,
      if (tags != null) 'tags': tags,
      if (createdAt != null) 'created_at': createdAt,
      if (lastUpdated != null) 'last_updated': lastUpdated,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserDraftTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? pubkey,
      Value<String>? content,
      Value<int>? kind,
      Value<String>? tags,
      Value<int>? createdAt,
      Value<int?>? lastUpdated,
      Value<int>? rowid}) {
    return UserDraftTableCompanion(
      id: id ?? this.id,
      pubkey: pubkey ?? this.pubkey,
      content: content ?? this.content,
      kind: kind ?? this.kind,
      tags: tags ?? this.tags,
      createdAt: createdAt ?? this.createdAt,
      lastUpdated: lastUpdated ?? this.lastUpdated,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (pubkey.present) {
      map['pubkey'] = Variable<String>(pubkey.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (kind.present) {
      map['kind'] = Variable<int>(kind.value);
    }
    if (tags.present) {
      map['tags'] = Variable<String>(tags.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (lastUpdated.present) {
      map['last_updated'] = Variable<int>(lastUpdated.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserDraftTableCompanion(')
          ..write('id: $id, ')
          ..write('pubkey: $pubkey, ')
          ..write('content: $content, ')
          ..write('kind: $kind, ')
          ..write('tags: $tags, ')
          ..write('createdAt: $createdAt, ')
          ..write('lastUpdated: $lastUpdated, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $UserAppSettingsTableTable extends UserAppSettingsTable
    with TableInfo<$UserAppSettingsTableTable, UserAppSettingsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserAppSettingsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _pubkeyMeta = const VerificationMeta('pubkey');
  @override
  late final GeneratedColumn<String> pubkey = GeneratedColumn<String>(
      'pubkey', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _settingsMeta =
      const VerificationMeta('settings');
  @override
  late final GeneratedColumn<String> settings = GeneratedColumn<String>(
      'settings', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('{}'));
  static const VerificationMeta _lastUpdatedMeta =
      const VerificationMeta('lastUpdated');
  @override
  late final GeneratedColumn<int> lastUpdated = GeneratedColumn<int>(
      'last_updated', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [pubkey, settings, lastUpdated];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_app_settings_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<UserAppSettingsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('pubkey')) {
      context.handle(_pubkeyMeta,
          pubkey.isAcceptableOrUnknown(data['pubkey']!, _pubkeyMeta));
    } else if (isInserting) {
      context.missing(_pubkeyMeta);
    }
    if (data.containsKey('settings')) {
      context.handle(_settingsMeta,
          settings.isAcceptableOrUnknown(data['settings']!, _settingsMeta));
    }
    if (data.containsKey('last_updated')) {
      context.handle(
          _lastUpdatedMeta,
          lastUpdated.isAcceptableOrUnknown(
              data['last_updated']!, _lastUpdatedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {pubkey};
  @override
  UserAppSettingsTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserAppSettingsTableData(
      pubkey: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}pubkey'])!,
      settings: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}settings'])!,
      lastUpdated: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}last_updated']),
    );
  }

  @override
  $UserAppSettingsTableTable createAlias(String alias) {
    return $UserAppSettingsTableTable(attachedDatabase, alias);
  }
}

class UserAppSettingsTableData extends DataClass
    implements Insertable<UserAppSettingsTableData> {
  final String pubkey;
  final String settings;
  final int? lastUpdated;
  const UserAppSettingsTableData(
      {required this.pubkey, required this.settings, this.lastUpdated});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['pubkey'] = Variable<String>(pubkey);
    map['settings'] = Variable<String>(settings);
    if (!nullToAbsent || lastUpdated != null) {
      map['last_updated'] = Variable<int>(lastUpdated);
    }
    return map;
  }

  UserAppSettingsTableCompanion toCompanion(bool nullToAbsent) {
    return UserAppSettingsTableCompanion(
      pubkey: Value(pubkey),
      settings: Value(settings),
      lastUpdated: lastUpdated == null && nullToAbsent
          ? const Value.absent()
          : Value(lastUpdated),
    );
  }

  factory UserAppSettingsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserAppSettingsTableData(
      pubkey: serializer.fromJson<String>(json['pubkey']),
      settings: serializer.fromJson<String>(json['settings']),
      lastUpdated: serializer.fromJson<int?>(json['lastUpdated']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'pubkey': serializer.toJson<String>(pubkey),
      'settings': serializer.toJson<String>(settings),
      'lastUpdated': serializer.toJson<int?>(lastUpdated),
    };
  }

  UserAppSettingsTableData copyWith(
          {String? pubkey,
          String? settings,
          Value<int?> lastUpdated = const Value.absent()}) =>
      UserAppSettingsTableData(
        pubkey: pubkey ?? this.pubkey,
        settings: settings ?? this.settings,
        lastUpdated: lastUpdated.present ? lastUpdated.value : this.lastUpdated,
      );
  UserAppSettingsTableData copyWithCompanion(
      UserAppSettingsTableCompanion data) {
    return UserAppSettingsTableData(
      pubkey: data.pubkey.present ? data.pubkey.value : this.pubkey,
      settings: data.settings.present ? data.settings.value : this.settings,
      lastUpdated:
          data.lastUpdated.present ? data.lastUpdated.value : this.lastUpdated,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserAppSettingsTableData(')
          ..write('pubkey: $pubkey, ')
          ..write('settings: $settings, ')
          ..write('lastUpdated: $lastUpdated')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(pubkey, settings, lastUpdated);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserAppSettingsTableData &&
          other.pubkey == this.pubkey &&
          other.settings == this.settings &&
          other.lastUpdated == this.lastUpdated);
}

class UserAppSettingsTableCompanion
    extends UpdateCompanion<UserAppSettingsTableData> {
  final Value<String> pubkey;
  final Value<String> settings;
  final Value<int?> lastUpdated;
  final Value<int> rowid;
  const UserAppSettingsTableCompanion({
    this.pubkey = const Value.absent(),
    this.settings = const Value.absent(),
    this.lastUpdated = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserAppSettingsTableCompanion.insert({
    required String pubkey,
    this.settings = const Value.absent(),
    this.lastUpdated = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : pubkey = Value(pubkey);
  static Insertable<UserAppSettingsTableData> custom({
    Expression<String>? pubkey,
    Expression<String>? settings,
    Expression<int>? lastUpdated,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (pubkey != null) 'pubkey': pubkey,
      if (settings != null) 'settings': settings,
      if (lastUpdated != null) 'last_updated': lastUpdated,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserAppSettingsTableCompanion copyWith(
      {Value<String>? pubkey,
      Value<String>? settings,
      Value<int?>? lastUpdated,
      Value<int>? rowid}) {
    return UserAppSettingsTableCompanion(
      pubkey: pubkey ?? this.pubkey,
      settings: settings ?? this.settings,
      lastUpdated: lastUpdated ?? this.lastUpdated,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (pubkey.present) {
      map['pubkey'] = Variable<String>(pubkey.value);
    }
    if (settings.present) {
      map['settings'] = Variable<String>(settings.value);
    }
    if (lastUpdated.present) {
      map['last_updated'] = Variable<int>(lastUpdated.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserAppSettingsTableCompanion(')
          ..write('pubkey: $pubkey, ')
          ..write('settings: $settings, ')
          ..write('lastUpdated: $lastUpdated, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $UserWotTableTable extends UserWotTable
    with TableInfo<$UserWotTableTable, UserWotTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserWotTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _pubkeyMeta = const VerificationMeta('pubkey');
  @override
  late final GeneratedColumn<String> pubkey = GeneratedColumn<String>(
      'pubkey', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _wotDataMeta =
      const VerificationMeta('wotData');
  @override
  late final GeneratedColumn<String> wotData = GeneratedColumn<String>(
      'wot_data', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('{}'));
  static const VerificationMeta _lastUpdatedMeta =
      const VerificationMeta('lastUpdated');
  @override
  late final GeneratedColumn<int> lastUpdated = GeneratedColumn<int>(
      'last_updated', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, pubkey, wotData, lastUpdated];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_wot_table';
  @override
  VerificationContext validateIntegrity(Insertable<UserWotTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('pubkey')) {
      context.handle(_pubkeyMeta,
          pubkey.isAcceptableOrUnknown(data['pubkey']!, _pubkeyMeta));
    } else if (isInserting) {
      context.missing(_pubkeyMeta);
    }
    if (data.containsKey('wot_data')) {
      context.handle(_wotDataMeta,
          wotData.isAcceptableOrUnknown(data['wot_data']!, _wotDataMeta));
    }
    if (data.containsKey('last_updated')) {
      context.handle(
          _lastUpdatedMeta,
          lastUpdated.isAcceptableOrUnknown(
              data['last_updated']!, _lastUpdatedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {pubkey};
  @override
  UserWotTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserWotTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      pubkey: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}pubkey'])!,
      wotData: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}wot_data'])!,
      lastUpdated: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}last_updated']),
    );
  }

  @override
  $UserWotTableTable createAlias(String alias) {
    return $UserWotTableTable(attachedDatabase, alias);
  }
}

class UserWotTableData extends DataClass
    implements Insertable<UserWotTableData> {
  final String id;
  final String pubkey;
  final String wotData;
  final int? lastUpdated;
  const UserWotTableData(
      {required this.id,
      required this.pubkey,
      required this.wotData,
      this.lastUpdated});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['pubkey'] = Variable<String>(pubkey);
    map['wot_data'] = Variable<String>(wotData);
    if (!nullToAbsent || lastUpdated != null) {
      map['last_updated'] = Variable<int>(lastUpdated);
    }
    return map;
  }

  UserWotTableCompanion toCompanion(bool nullToAbsent) {
    return UserWotTableCompanion(
      id: Value(id),
      pubkey: Value(pubkey),
      wotData: Value(wotData),
      lastUpdated: lastUpdated == null && nullToAbsent
          ? const Value.absent()
          : Value(lastUpdated),
    );
  }

  factory UserWotTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserWotTableData(
      id: serializer.fromJson<String>(json['id']),
      pubkey: serializer.fromJson<String>(json['pubkey']),
      wotData: serializer.fromJson<String>(json['wotData']),
      lastUpdated: serializer.fromJson<int?>(json['lastUpdated']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'pubkey': serializer.toJson<String>(pubkey),
      'wotData': serializer.toJson<String>(wotData),
      'lastUpdated': serializer.toJson<int?>(lastUpdated),
    };
  }

  UserWotTableData copyWith(
          {String? id,
          String? pubkey,
          String? wotData,
          Value<int?> lastUpdated = const Value.absent()}) =>
      UserWotTableData(
        id: id ?? this.id,
        pubkey: pubkey ?? this.pubkey,
        wotData: wotData ?? this.wotData,
        lastUpdated: lastUpdated.present ? lastUpdated.value : this.lastUpdated,
      );
  UserWotTableData copyWithCompanion(UserWotTableCompanion data) {
    return UserWotTableData(
      id: data.id.present ? data.id.value : this.id,
      pubkey: data.pubkey.present ? data.pubkey.value : this.pubkey,
      wotData: data.wotData.present ? data.wotData.value : this.wotData,
      lastUpdated:
          data.lastUpdated.present ? data.lastUpdated.value : this.lastUpdated,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserWotTableData(')
          ..write('id: $id, ')
          ..write('pubkey: $pubkey, ')
          ..write('wotData: $wotData, ')
          ..write('lastUpdated: $lastUpdated')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, pubkey, wotData, lastUpdated);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserWotTableData &&
          other.id == this.id &&
          other.pubkey == this.pubkey &&
          other.wotData == this.wotData &&
          other.lastUpdated == this.lastUpdated);
}

class UserWotTableCompanion extends UpdateCompanion<UserWotTableData> {
  final Value<String> id;
  final Value<String> pubkey;
  final Value<String> wotData;
  final Value<int?> lastUpdated;
  final Value<int> rowid;
  const UserWotTableCompanion({
    this.id = const Value.absent(),
    this.pubkey = const Value.absent(),
    this.wotData = const Value.absent(),
    this.lastUpdated = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserWotTableCompanion.insert({
    required String id,
    required String pubkey,
    this.wotData = const Value.absent(),
    this.lastUpdated = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        pubkey = Value(pubkey);
  static Insertable<UserWotTableData> custom({
    Expression<String>? id,
    Expression<String>? pubkey,
    Expression<String>? wotData,
    Expression<int>? lastUpdated,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (pubkey != null) 'pubkey': pubkey,
      if (wotData != null) 'wot_data': wotData,
      if (lastUpdated != null) 'last_updated': lastUpdated,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserWotTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? pubkey,
      Value<String>? wotData,
      Value<int?>? lastUpdated,
      Value<int>? rowid}) {
    return UserWotTableCompanion(
      id: id ?? this.id,
      pubkey: pubkey ?? this.pubkey,
      wotData: wotData ?? this.wotData,
      lastUpdated: lastUpdated ?? this.lastUpdated,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (pubkey.present) {
      map['pubkey'] = Variable<String>(pubkey.value);
    }
    if (wotData.present) {
      map['wot_data'] = Variable<String>(wotData.value);
    }
    if (lastUpdated.present) {
      map['last_updated'] = Variable<int>(lastUpdated.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserWotTableCompanion(')
          ..write('id: $id, ')
          ..write('pubkey: $pubkey, ')
          ..write('wotData: $wotData, ')
          ..write('lastUpdated: $lastUpdated, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $WotScoreTableTable extends WotScoreTable
    with TableInfo<$WotScoreTableTable, WotScoreTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WotScoreTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _pubkeyMeta = const VerificationMeta('pubkey');
  @override
  late final GeneratedColumn<String> pubkey = GeneratedColumn<String>(
      'pubkey', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _originPubkeyMeta =
      const VerificationMeta('originPubkey');
  @override
  late final GeneratedColumn<String> originPubkey = GeneratedColumn<String>(
      'origin_pubkey', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _scoreMeta = const VerificationMeta('score');
  @override
  late final GeneratedColumn<double> score = GeneratedColumn<double>(
      'score', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  static const VerificationMeta _depthMeta = const VerificationMeta('depth');
  @override
  late final GeneratedColumn<int> depth = GeneratedColumn<int>(
      'depth', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _lastUpdatedMeta =
      const VerificationMeta('lastUpdated');
  @override
  late final GeneratedColumn<int> lastUpdated = GeneratedColumn<int>(
      'last_updated', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, pubkey, originPubkey, score, depth, lastUpdated];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'wot_score_table';
  @override
  VerificationContext validateIntegrity(Insertable<WotScoreTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('pubkey')) {
      context.handle(_pubkeyMeta,
          pubkey.isAcceptableOrUnknown(data['pubkey']!, _pubkeyMeta));
    } else if (isInserting) {
      context.missing(_pubkeyMeta);
    }
    if (data.containsKey('origin_pubkey')) {
      context.handle(
          _originPubkeyMeta,
          originPubkey.isAcceptableOrUnknown(
              data['origin_pubkey']!, _originPubkeyMeta));
    } else if (isInserting) {
      context.missing(_originPubkeyMeta);
    }
    if (data.containsKey('score')) {
      context.handle(
          _scoreMeta, score.isAcceptableOrUnknown(data['score']!, _scoreMeta));
    }
    if (data.containsKey('depth')) {
      context.handle(
          _depthMeta, depth.isAcceptableOrUnknown(data['depth']!, _depthMeta));
    }
    if (data.containsKey('last_updated')) {
      context.handle(
          _lastUpdatedMeta,
          lastUpdated.isAcceptableOrUnknown(
              data['last_updated']!, _lastUpdatedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {pubkey};
  @override
  WotScoreTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WotScoreTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      pubkey: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}pubkey'])!,
      originPubkey: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}origin_pubkey'])!,
      score: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}score'])!,
      depth: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}depth'])!,
      lastUpdated: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}last_updated']),
    );
  }

  @override
  $WotScoreTableTable createAlias(String alias) {
    return $WotScoreTableTable(attachedDatabase, alias);
  }
}

class WotScoreTableData extends DataClass
    implements Insertable<WotScoreTableData> {
  final String id;
  final String pubkey;
  final String originPubkey;
  final double score;
  final int depth;
  final int? lastUpdated;
  const WotScoreTableData(
      {required this.id,
      required this.pubkey,
      required this.originPubkey,
      required this.score,
      required this.depth,
      this.lastUpdated});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['pubkey'] = Variable<String>(pubkey);
    map['origin_pubkey'] = Variable<String>(originPubkey);
    map['score'] = Variable<double>(score);
    map['depth'] = Variable<int>(depth);
    if (!nullToAbsent || lastUpdated != null) {
      map['last_updated'] = Variable<int>(lastUpdated);
    }
    return map;
  }

  WotScoreTableCompanion toCompanion(bool nullToAbsent) {
    return WotScoreTableCompanion(
      id: Value(id),
      pubkey: Value(pubkey),
      originPubkey: Value(originPubkey),
      score: Value(score),
      depth: Value(depth),
      lastUpdated: lastUpdated == null && nullToAbsent
          ? const Value.absent()
          : Value(lastUpdated),
    );
  }

  factory WotScoreTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WotScoreTableData(
      id: serializer.fromJson<String>(json['id']),
      pubkey: serializer.fromJson<String>(json['pubkey']),
      originPubkey: serializer.fromJson<String>(json['originPubkey']),
      score: serializer.fromJson<double>(json['score']),
      depth: serializer.fromJson<int>(json['depth']),
      lastUpdated: serializer.fromJson<int?>(json['lastUpdated']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'pubkey': serializer.toJson<String>(pubkey),
      'originPubkey': serializer.toJson<String>(originPubkey),
      'score': serializer.toJson<double>(score),
      'depth': serializer.toJson<int>(depth),
      'lastUpdated': serializer.toJson<int?>(lastUpdated),
    };
  }

  WotScoreTableData copyWith(
          {String? id,
          String? pubkey,
          String? originPubkey,
          double? score,
          int? depth,
          Value<int?> lastUpdated = const Value.absent()}) =>
      WotScoreTableData(
        id: id ?? this.id,
        pubkey: pubkey ?? this.pubkey,
        originPubkey: originPubkey ?? this.originPubkey,
        score: score ?? this.score,
        depth: depth ?? this.depth,
        lastUpdated: lastUpdated.present ? lastUpdated.value : this.lastUpdated,
      );
  WotScoreTableData copyWithCompanion(WotScoreTableCompanion data) {
    return WotScoreTableData(
      id: data.id.present ? data.id.value : this.id,
      pubkey: data.pubkey.present ? data.pubkey.value : this.pubkey,
      originPubkey: data.originPubkey.present
          ? data.originPubkey.value
          : this.originPubkey,
      score: data.score.present ? data.score.value : this.score,
      depth: data.depth.present ? data.depth.value : this.depth,
      lastUpdated:
          data.lastUpdated.present ? data.lastUpdated.value : this.lastUpdated,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WotScoreTableData(')
          ..write('id: $id, ')
          ..write('pubkey: $pubkey, ')
          ..write('originPubkey: $originPubkey, ')
          ..write('score: $score, ')
          ..write('depth: $depth, ')
          ..write('lastUpdated: $lastUpdated')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, pubkey, originPubkey, score, depth, lastUpdated);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WotScoreTableData &&
          other.id == this.id &&
          other.pubkey == this.pubkey &&
          other.originPubkey == this.originPubkey &&
          other.score == this.score &&
          other.depth == this.depth &&
          other.lastUpdated == this.lastUpdated);
}

class WotScoreTableCompanion extends UpdateCompanion<WotScoreTableData> {
  final Value<String> id;
  final Value<String> pubkey;
  final Value<String> originPubkey;
  final Value<double> score;
  final Value<int> depth;
  final Value<int?> lastUpdated;
  final Value<int> rowid;
  const WotScoreTableCompanion({
    this.id = const Value.absent(),
    this.pubkey = const Value.absent(),
    this.originPubkey = const Value.absent(),
    this.score = const Value.absent(),
    this.depth = const Value.absent(),
    this.lastUpdated = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WotScoreTableCompanion.insert({
    required String id,
    required String pubkey,
    required String originPubkey,
    this.score = const Value.absent(),
    this.depth = const Value.absent(),
    this.lastUpdated = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        pubkey = Value(pubkey),
        originPubkey = Value(originPubkey);
  static Insertable<WotScoreTableData> custom({
    Expression<String>? id,
    Expression<String>? pubkey,
    Expression<String>? originPubkey,
    Expression<double>? score,
    Expression<int>? depth,
    Expression<int>? lastUpdated,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (pubkey != null) 'pubkey': pubkey,
      if (originPubkey != null) 'origin_pubkey': originPubkey,
      if (score != null) 'score': score,
      if (depth != null) 'depth': depth,
      if (lastUpdated != null) 'last_updated': lastUpdated,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WotScoreTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? pubkey,
      Value<String>? originPubkey,
      Value<double>? score,
      Value<int>? depth,
      Value<int?>? lastUpdated,
      Value<int>? rowid}) {
    return WotScoreTableCompanion(
      id: id ?? this.id,
      pubkey: pubkey ?? this.pubkey,
      originPubkey: originPubkey ?? this.originPubkey,
      score: score ?? this.score,
      depth: depth ?? this.depth,
      lastUpdated: lastUpdated ?? this.lastUpdated,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (pubkey.present) {
      map['pubkey'] = Variable<String>(pubkey.value);
    }
    if (originPubkey.present) {
      map['origin_pubkey'] = Variable<String>(originPubkey.value);
    }
    if (score.present) {
      map['score'] = Variable<double>(score.value);
    }
    if (depth.present) {
      map['depth'] = Variable<int>(depth.value);
    }
    if (lastUpdated.present) {
      map['last_updated'] = Variable<int>(lastUpdated.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WotScoreTableCompanion(')
          ..write('id: $id, ')
          ..write('pubkey: $pubkey, ')
          ..write('originPubkey: $originPubkey, ')
          ..write('score: $score, ')
          ..write('depth: $depth, ')
          ..write('lastUpdated: $lastUpdated, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$NostrDatabase extends GeneratedDatabase {
  _$NostrDatabase(QueryExecutor e) : super(e);
  $NostrDatabaseManager get managers => $NostrDatabaseManager(this);
  late final $EventTableTable eventTable = $EventTableTable(this);
  late final $MetadataTableTable metadataTable = $MetadataTableTable(this);
  late final $ContactListTableTable contactListTable =
      $ContactListTableTable(this);
  late final $MuteListTableTable muteListTable = $MuteListTableTable(this);
  late final $UserRelayListTableTable userRelayListTable =
      $UserRelayListTableTable(this);
  late final $RelaySetTableTable relaySetTable = $RelaySetTableTable(this);
  late final $EventStatsTableTable eventStatsTable =
      $EventStatsTableTable(this);
  late final $Nip05TableTable nip05Table = $Nip05TableTable(this);
  late final $DmSessionInfosTableTable dmSessionInfosTable =
      $DmSessionInfosTableTable(this);
  late final $UserFollowersTableTable userFollowersTable =
      $UserFollowersTableTable(this);
  late final $UserDraftTableTable userDraftTable = $UserDraftTableTable(this);
  late final $UserAppSettingsTableTable userAppSettingsTable =
      $UserAppSettingsTableTable(this);
  late final $UserWotTableTable userWotTable = $UserWotTableTable(this);
  late final $WotScoreTableTable wotScoreTable = $WotScoreTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        eventTable,
        metadataTable,
        contactListTable,
        muteListTable,
        userRelayListTable,
        relaySetTable,
        eventStatsTable,
        nip05Table,
        dmSessionInfosTable,
        userFollowersTable,
        userDraftTable,
        userAppSettingsTable,
        userWotTable,
        wotScoreTable
      ];
}

typedef $$EventTableTableCreateCompanionBuilder = EventTableCompanion Function({
  required String id,
  required String pubkey,
  required int createdAt,
  required int kind,
  Value<List<List<String>>> tags,
  required String content,
  required String sig,
  Value<String> currentUser,
  Value<List<String>> seenOn,
  Value<int?> lastUpdated,
  Value<String?> subscriptionId,
  Value<List<List<String>>> tTags,
  Value<List<List<String>>> pTags,
  Value<List<List<String>>> capitalpTags,
  Value<List<List<String>>> kTags,
  Value<List<List<String>>> eTags,
  Value<List<List<String>>> lTags,
  Value<List<List<String>>> aTags,
  Value<List<List<String>>> other,
  Value<String?> dTag,
  Value<String?> root,
  Value<String?> reply,
  Value<int> rowid,
});
typedef $$EventTableTableUpdateCompanionBuilder = EventTableCompanion Function({
  Value<String> id,
  Value<String> pubkey,
  Value<int> createdAt,
  Value<int> kind,
  Value<List<List<String>>> tags,
  Value<String> content,
  Value<String> sig,
  Value<String> currentUser,
  Value<List<String>> seenOn,
  Value<int?> lastUpdated,
  Value<String?> subscriptionId,
  Value<List<List<String>>> tTags,
  Value<List<List<String>>> pTags,
  Value<List<List<String>>> capitalpTags,
  Value<List<List<String>>> kTags,
  Value<List<List<String>>> eTags,
  Value<List<List<String>>> lTags,
  Value<List<List<String>>> aTags,
  Value<List<List<String>>> other,
  Value<String?> dTag,
  Value<String?> root,
  Value<String?> reply,
  Value<int> rowid,
});

class $$EventTableTableFilterComposer
    extends Composer<_$NostrDatabase, $EventTableTable> {
  $$EventTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get pubkey => $composableBuilder(
      column: $table.pubkey, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get kind => $composableBuilder(
      column: $table.kind, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<List<List<String>>, List<List<String>>, String>
      get tags => $composableBuilder(
          column: $table.tags,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<String> get content => $composableBuilder(
      column: $table.content, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sig => $composableBuilder(
      column: $table.sig, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get currentUser => $composableBuilder(
      column: $table.currentUser, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
      get seenOn => $composableBuilder(
          column: $table.seenOn,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<int> get lastUpdated => $composableBuilder(
      column: $table.lastUpdated, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get subscriptionId => $composableBuilder(
      column: $table.subscriptionId,
      builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<List<List<String>>, List<List<String>>, String>
      get tTags => $composableBuilder(
          column: $table.tTags,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<List<List<String>>, List<List<String>>, String>
      get pTags => $composableBuilder(
          column: $table.pTags,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<List<List<String>>, List<List<String>>, String>
      get capitalpTags => $composableBuilder(
          column: $table.capitalpTags,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<List<List<String>>, List<List<String>>, String>
      get kTags => $composableBuilder(
          column: $table.kTags,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<List<List<String>>, List<List<String>>, String>
      get eTags => $composableBuilder(
          column: $table.eTags,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<List<List<String>>, List<List<String>>, String>
      get lTags => $composableBuilder(
          column: $table.lTags,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<List<List<String>>, List<List<String>>, String>
      get aTags => $composableBuilder(
          column: $table.aTags,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<List<List<String>>, List<List<String>>, String>
      get other => $composableBuilder(
          column: $table.other,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<String> get dTag => $composableBuilder(
      column: $table.dTag, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get root => $composableBuilder(
      column: $table.root, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get reply => $composableBuilder(
      column: $table.reply, builder: (column) => ColumnFilters(column));
}

class $$EventTableTableOrderingComposer
    extends Composer<_$NostrDatabase, $EventTableTable> {
  $$EventTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get pubkey => $composableBuilder(
      column: $table.pubkey, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get kind => $composableBuilder(
      column: $table.kind, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get tags => $composableBuilder(
      column: $table.tags, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get content => $composableBuilder(
      column: $table.content, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sig => $composableBuilder(
      column: $table.sig, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get currentUser => $composableBuilder(
      column: $table.currentUser, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get seenOn => $composableBuilder(
      column: $table.seenOn, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get lastUpdated => $composableBuilder(
      column: $table.lastUpdated, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get subscriptionId => $composableBuilder(
      column: $table.subscriptionId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get tTags => $composableBuilder(
      column: $table.tTags, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get pTags => $composableBuilder(
      column: $table.pTags, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get capitalpTags => $composableBuilder(
      column: $table.capitalpTags,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get kTags => $composableBuilder(
      column: $table.kTags, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get eTags => $composableBuilder(
      column: $table.eTags, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get lTags => $composableBuilder(
      column: $table.lTags, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get aTags => $composableBuilder(
      column: $table.aTags, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get other => $composableBuilder(
      column: $table.other, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get dTag => $composableBuilder(
      column: $table.dTag, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get root => $composableBuilder(
      column: $table.root, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get reply => $composableBuilder(
      column: $table.reply, builder: (column) => ColumnOrderings(column));
}

class $$EventTableTableAnnotationComposer
    extends Composer<_$NostrDatabase, $EventTableTable> {
  $$EventTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get pubkey =>
      $composableBuilder(column: $table.pubkey, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get kind =>
      $composableBuilder(column: $table.kind, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<List<String>>, String> get tags =>
      $composableBuilder(column: $table.tags, builder: (column) => column);

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  GeneratedColumn<String> get sig =>
      $composableBuilder(column: $table.sig, builder: (column) => column);

  GeneratedColumn<String> get currentUser => $composableBuilder(
      column: $table.currentUser, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get seenOn =>
      $composableBuilder(column: $table.seenOn, builder: (column) => column);

  GeneratedColumn<int> get lastUpdated => $composableBuilder(
      column: $table.lastUpdated, builder: (column) => column);

  GeneratedColumn<String> get subscriptionId => $composableBuilder(
      column: $table.subscriptionId, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<List<String>>, String> get tTags =>
      $composableBuilder(column: $table.tTags, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<List<String>>, String> get pTags =>
      $composableBuilder(column: $table.pTags, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<List<String>>, String>
      get capitalpTags => $composableBuilder(
          column: $table.capitalpTags, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<List<String>>, String> get kTags =>
      $composableBuilder(column: $table.kTags, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<List<String>>, String> get eTags =>
      $composableBuilder(column: $table.eTags, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<List<String>>, String> get lTags =>
      $composableBuilder(column: $table.lTags, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<List<String>>, String> get aTags =>
      $composableBuilder(column: $table.aTags, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<List<String>>, String> get other =>
      $composableBuilder(column: $table.other, builder: (column) => column);

  GeneratedColumn<String> get dTag =>
      $composableBuilder(column: $table.dTag, builder: (column) => column);

  GeneratedColumn<String> get root =>
      $composableBuilder(column: $table.root, builder: (column) => column);

  GeneratedColumn<String> get reply =>
      $composableBuilder(column: $table.reply, builder: (column) => column);
}

class $$EventTableTableTableManager extends RootTableManager<
    _$NostrDatabase,
    $EventTableTable,
    EventTableData,
    $$EventTableTableFilterComposer,
    $$EventTableTableOrderingComposer,
    $$EventTableTableAnnotationComposer,
    $$EventTableTableCreateCompanionBuilder,
    $$EventTableTableUpdateCompanionBuilder,
    (
      EventTableData,
      BaseReferences<_$NostrDatabase, $EventTableTable, EventTableData>
    ),
    EventTableData,
    PrefetchHooks Function()> {
  $$EventTableTableTableManager(_$NostrDatabase db, $EventTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EventTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EventTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EventTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> pubkey = const Value.absent(),
            Value<int> createdAt = const Value.absent(),
            Value<int> kind = const Value.absent(),
            Value<List<List<String>>> tags = const Value.absent(),
            Value<String> content = const Value.absent(),
            Value<String> sig = const Value.absent(),
            Value<String> currentUser = const Value.absent(),
            Value<List<String>> seenOn = const Value.absent(),
            Value<int?> lastUpdated = const Value.absent(),
            Value<String?> subscriptionId = const Value.absent(),
            Value<List<List<String>>> tTags = const Value.absent(),
            Value<List<List<String>>> pTags = const Value.absent(),
            Value<List<List<String>>> capitalpTags = const Value.absent(),
            Value<List<List<String>>> kTags = const Value.absent(),
            Value<List<List<String>>> eTags = const Value.absent(),
            Value<List<List<String>>> lTags = const Value.absent(),
            Value<List<List<String>>> aTags = const Value.absent(),
            Value<List<List<String>>> other = const Value.absent(),
            Value<String?> dTag = const Value.absent(),
            Value<String?> root = const Value.absent(),
            Value<String?> reply = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              EventTableCompanion(
            id: id,
            pubkey: pubkey,
            createdAt: createdAt,
            kind: kind,
            tags: tags,
            content: content,
            sig: sig,
            currentUser: currentUser,
            seenOn: seenOn,
            lastUpdated: lastUpdated,
            subscriptionId: subscriptionId,
            tTags: tTags,
            pTags: pTags,
            capitalpTags: capitalpTags,
            kTags: kTags,
            eTags: eTags,
            lTags: lTags,
            aTags: aTags,
            other: other,
            dTag: dTag,
            root: root,
            reply: reply,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String pubkey,
            required int createdAt,
            required int kind,
            Value<List<List<String>>> tags = const Value.absent(),
            required String content,
            required String sig,
            Value<String> currentUser = const Value.absent(),
            Value<List<String>> seenOn = const Value.absent(),
            Value<int?> lastUpdated = const Value.absent(),
            Value<String?> subscriptionId = const Value.absent(),
            Value<List<List<String>>> tTags = const Value.absent(),
            Value<List<List<String>>> pTags = const Value.absent(),
            Value<List<List<String>>> capitalpTags = const Value.absent(),
            Value<List<List<String>>> kTags = const Value.absent(),
            Value<List<List<String>>> eTags = const Value.absent(),
            Value<List<List<String>>> lTags = const Value.absent(),
            Value<List<List<String>>> aTags = const Value.absent(),
            Value<List<List<String>>> other = const Value.absent(),
            Value<String?> dTag = const Value.absent(),
            Value<String?> root = const Value.absent(),
            Value<String?> reply = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              EventTableCompanion.insert(
            id: id,
            pubkey: pubkey,
            createdAt: createdAt,
            kind: kind,
            tags: tags,
            content: content,
            sig: sig,
            currentUser: currentUser,
            seenOn: seenOn,
            lastUpdated: lastUpdated,
            subscriptionId: subscriptionId,
            tTags: tTags,
            pTags: pTags,
            capitalpTags: capitalpTags,
            kTags: kTags,
            eTags: eTags,
            lTags: lTags,
            aTags: aTags,
            other: other,
            dTag: dTag,
            root: root,
            reply: reply,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$EventTableTableProcessedTableManager = ProcessedTableManager<
    _$NostrDatabase,
    $EventTableTable,
    EventTableData,
    $$EventTableTableFilterComposer,
    $$EventTableTableOrderingComposer,
    $$EventTableTableAnnotationComposer,
    $$EventTableTableCreateCompanionBuilder,
    $$EventTableTableUpdateCompanionBuilder,
    (
      EventTableData,
      BaseReferences<_$NostrDatabase, $EventTableTable, EventTableData>
    ),
    EventTableData,
    PrefetchHooks Function()>;
typedef $$MetadataTableTableCreateCompanionBuilder = MetadataTableCompanion
    Function({
  required String pubkey,
  Value<String> name,
  Value<String> displayName,
  Value<String> picture,
  Value<String> banner,
  Value<String> website,
  Value<String> about,
  Value<String> nip05,
  Value<String> lud16,
  Value<String> lud06,
  required int createdAt,
  Value<bool> isDeleted,
  Value<int?> refreshedTimestamp,
  Value<int> rowid,
});
typedef $$MetadataTableTableUpdateCompanionBuilder = MetadataTableCompanion
    Function({
  Value<String> pubkey,
  Value<String> name,
  Value<String> displayName,
  Value<String> picture,
  Value<String> banner,
  Value<String> website,
  Value<String> about,
  Value<String> nip05,
  Value<String> lud16,
  Value<String> lud06,
  Value<int> createdAt,
  Value<bool> isDeleted,
  Value<int?> refreshedTimestamp,
  Value<int> rowid,
});

class $$MetadataTableTableFilterComposer
    extends Composer<_$NostrDatabase, $MetadataTableTable> {
  $$MetadataTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get pubkey => $composableBuilder(
      column: $table.pubkey, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get displayName => $composableBuilder(
      column: $table.displayName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get picture => $composableBuilder(
      column: $table.picture, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get banner => $composableBuilder(
      column: $table.banner, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get website => $composableBuilder(
      column: $table.website, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get about => $composableBuilder(
      column: $table.about, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nip05 => $composableBuilder(
      column: $table.nip05, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get lud16 => $composableBuilder(
      column: $table.lud16, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get lud06 => $composableBuilder(
      column: $table.lud06, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get refreshedTimestamp => $composableBuilder(
      column: $table.refreshedTimestamp,
      builder: (column) => ColumnFilters(column));
}

class $$MetadataTableTableOrderingComposer
    extends Composer<_$NostrDatabase, $MetadataTableTable> {
  $$MetadataTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get pubkey => $composableBuilder(
      column: $table.pubkey, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get displayName => $composableBuilder(
      column: $table.displayName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get picture => $composableBuilder(
      column: $table.picture, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get banner => $composableBuilder(
      column: $table.banner, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get website => $composableBuilder(
      column: $table.website, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get about => $composableBuilder(
      column: $table.about, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nip05 => $composableBuilder(
      column: $table.nip05, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get lud16 => $composableBuilder(
      column: $table.lud16, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get lud06 => $composableBuilder(
      column: $table.lud06, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
      column: $table.isDeleted, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get refreshedTimestamp => $composableBuilder(
      column: $table.refreshedTimestamp,
      builder: (column) => ColumnOrderings(column));
}

class $$MetadataTableTableAnnotationComposer
    extends Composer<_$NostrDatabase, $MetadataTableTable> {
  $$MetadataTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get pubkey =>
      $composableBuilder(column: $table.pubkey, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get displayName => $composableBuilder(
      column: $table.displayName, builder: (column) => column);

  GeneratedColumn<String> get picture =>
      $composableBuilder(column: $table.picture, builder: (column) => column);

  GeneratedColumn<String> get banner =>
      $composableBuilder(column: $table.banner, builder: (column) => column);

  GeneratedColumn<String> get website =>
      $composableBuilder(column: $table.website, builder: (column) => column);

  GeneratedColumn<String> get about =>
      $composableBuilder(column: $table.about, builder: (column) => column);

  GeneratedColumn<String> get nip05 =>
      $composableBuilder(column: $table.nip05, builder: (column) => column);

  GeneratedColumn<String> get lud16 =>
      $composableBuilder(column: $table.lud16, builder: (column) => column);

  GeneratedColumn<String> get lud06 =>
      $composableBuilder(column: $table.lud06, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);

  GeneratedColumn<int> get refreshedTimestamp => $composableBuilder(
      column: $table.refreshedTimestamp, builder: (column) => column);
}

class $$MetadataTableTableTableManager extends RootTableManager<
    _$NostrDatabase,
    $MetadataTableTable,
    MetadataTableData,
    $$MetadataTableTableFilterComposer,
    $$MetadataTableTableOrderingComposer,
    $$MetadataTableTableAnnotationComposer,
    $$MetadataTableTableCreateCompanionBuilder,
    $$MetadataTableTableUpdateCompanionBuilder,
    (
      MetadataTableData,
      BaseReferences<_$NostrDatabase, $MetadataTableTable, MetadataTableData>
    ),
    MetadataTableData,
    PrefetchHooks Function()> {
  $$MetadataTableTableTableManager(
      _$NostrDatabase db, $MetadataTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MetadataTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MetadataTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MetadataTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> pubkey = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> displayName = const Value.absent(),
            Value<String> picture = const Value.absent(),
            Value<String> banner = const Value.absent(),
            Value<String> website = const Value.absent(),
            Value<String> about = const Value.absent(),
            Value<String> nip05 = const Value.absent(),
            Value<String> lud16 = const Value.absent(),
            Value<String> lud06 = const Value.absent(),
            Value<int> createdAt = const Value.absent(),
            Value<bool> isDeleted = const Value.absent(),
            Value<int?> refreshedTimestamp = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MetadataTableCompanion(
            pubkey: pubkey,
            name: name,
            displayName: displayName,
            picture: picture,
            banner: banner,
            website: website,
            about: about,
            nip05: nip05,
            lud16: lud16,
            lud06: lud06,
            createdAt: createdAt,
            isDeleted: isDeleted,
            refreshedTimestamp: refreshedTimestamp,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String pubkey,
            Value<String> name = const Value.absent(),
            Value<String> displayName = const Value.absent(),
            Value<String> picture = const Value.absent(),
            Value<String> banner = const Value.absent(),
            Value<String> website = const Value.absent(),
            Value<String> about = const Value.absent(),
            Value<String> nip05 = const Value.absent(),
            Value<String> lud16 = const Value.absent(),
            Value<String> lud06 = const Value.absent(),
            required int createdAt,
            Value<bool> isDeleted = const Value.absent(),
            Value<int?> refreshedTimestamp = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MetadataTableCompanion.insert(
            pubkey: pubkey,
            name: name,
            displayName: displayName,
            picture: picture,
            banner: banner,
            website: website,
            about: about,
            nip05: nip05,
            lud16: lud16,
            lud06: lud06,
            createdAt: createdAt,
            isDeleted: isDeleted,
            refreshedTimestamp: refreshedTimestamp,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$MetadataTableTableProcessedTableManager = ProcessedTableManager<
    _$NostrDatabase,
    $MetadataTableTable,
    MetadataTableData,
    $$MetadataTableTableFilterComposer,
    $$MetadataTableTableOrderingComposer,
    $$MetadataTableTableAnnotationComposer,
    $$MetadataTableTableCreateCompanionBuilder,
    $$MetadataTableTableUpdateCompanionBuilder,
    (
      MetadataTableData,
      BaseReferences<_$NostrDatabase, $MetadataTableTable, MetadataTableData>
    ),
    MetadataTableData,
    PrefetchHooks Function()>;
typedef $$ContactListTableTableCreateCompanionBuilder
    = ContactListTableCompanion Function({
  required String pubkey,
  Value<List<String>> contacts,
  required int createdAt,
  Value<int?> loadedTimestamp,
  Value<List<String>> sources,
  Value<List<String>> followedCommunities,
  Value<List<String>> followedTags,
  Value<List<String>> followedEvents,
  Value<List<String>> contactRelays,
  Value<List<String>> petnames,
  Value<int> rowid,
});
typedef $$ContactListTableTableUpdateCompanionBuilder
    = ContactListTableCompanion Function({
  Value<String> pubkey,
  Value<List<String>> contacts,
  Value<int> createdAt,
  Value<int?> loadedTimestamp,
  Value<List<String>> sources,
  Value<List<String>> followedCommunities,
  Value<List<String>> followedTags,
  Value<List<String>> followedEvents,
  Value<List<String>> contactRelays,
  Value<List<String>> petnames,
  Value<int> rowid,
});

class $$ContactListTableTableFilterComposer
    extends Composer<_$NostrDatabase, $ContactListTableTable> {
  $$ContactListTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get pubkey => $composableBuilder(
      column: $table.pubkey, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
      get contacts => $composableBuilder(
          column: $table.contacts,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<int> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get loadedTimestamp => $composableBuilder(
      column: $table.loadedTimestamp,
      builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
      get sources => $composableBuilder(
          column: $table.sources,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
      get followedCommunities => $composableBuilder(
          column: $table.followedCommunities,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
      get followedTags => $composableBuilder(
          column: $table.followedTags,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
      get followedEvents => $composableBuilder(
          column: $table.followedEvents,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
      get contactRelays => $composableBuilder(
          column: $table.contactRelays,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
      get petnames => $composableBuilder(
          column: $table.petnames,
          builder: (column) => ColumnWithTypeConverterFilters(column));
}

class $$ContactListTableTableOrderingComposer
    extends Composer<_$NostrDatabase, $ContactListTableTable> {
  $$ContactListTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get pubkey => $composableBuilder(
      column: $table.pubkey, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get contacts => $composableBuilder(
      column: $table.contacts, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get loadedTimestamp => $composableBuilder(
      column: $table.loadedTimestamp,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sources => $composableBuilder(
      column: $table.sources, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get followedCommunities => $composableBuilder(
      column: $table.followedCommunities,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get followedTags => $composableBuilder(
      column: $table.followedTags,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get followedEvents => $composableBuilder(
      column: $table.followedEvents,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get contactRelays => $composableBuilder(
      column: $table.contactRelays,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get petnames => $composableBuilder(
      column: $table.petnames, builder: (column) => ColumnOrderings(column));
}

class $$ContactListTableTableAnnotationComposer
    extends Composer<_$NostrDatabase, $ContactListTableTable> {
  $$ContactListTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get pubkey =>
      $composableBuilder(column: $table.pubkey, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get contacts =>
      $composableBuilder(column: $table.contacts, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get loadedTimestamp => $composableBuilder(
      column: $table.loadedTimestamp, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get sources =>
      $composableBuilder(column: $table.sources, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String>
      get followedCommunities => $composableBuilder(
          column: $table.followedCommunities, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get followedTags =>
      $composableBuilder(
          column: $table.followedTags, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get followedEvents =>
      $composableBuilder(
          column: $table.followedEvents, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get contactRelays =>
      $composableBuilder(
          column: $table.contactRelays, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get petnames =>
      $composableBuilder(column: $table.petnames, builder: (column) => column);
}

class $$ContactListTableTableTableManager extends RootTableManager<
    _$NostrDatabase,
    $ContactListTableTable,
    ContactListTableData,
    $$ContactListTableTableFilterComposer,
    $$ContactListTableTableOrderingComposer,
    $$ContactListTableTableAnnotationComposer,
    $$ContactListTableTableCreateCompanionBuilder,
    $$ContactListTableTableUpdateCompanionBuilder,
    (
      ContactListTableData,
      BaseReferences<_$NostrDatabase, $ContactListTableTable,
          ContactListTableData>
    ),
    ContactListTableData,
    PrefetchHooks Function()> {
  $$ContactListTableTableTableManager(
      _$NostrDatabase db, $ContactListTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ContactListTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ContactListTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ContactListTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> pubkey = const Value.absent(),
            Value<List<String>> contacts = const Value.absent(),
            Value<int> createdAt = const Value.absent(),
            Value<int?> loadedTimestamp = const Value.absent(),
            Value<List<String>> sources = const Value.absent(),
            Value<List<String>> followedCommunities = const Value.absent(),
            Value<List<String>> followedTags = const Value.absent(),
            Value<List<String>> followedEvents = const Value.absent(),
            Value<List<String>> contactRelays = const Value.absent(),
            Value<List<String>> petnames = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ContactListTableCompanion(
            pubkey: pubkey,
            contacts: contacts,
            createdAt: createdAt,
            loadedTimestamp: loadedTimestamp,
            sources: sources,
            followedCommunities: followedCommunities,
            followedTags: followedTags,
            followedEvents: followedEvents,
            contactRelays: contactRelays,
            petnames: petnames,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String pubkey,
            Value<List<String>> contacts = const Value.absent(),
            required int createdAt,
            Value<int?> loadedTimestamp = const Value.absent(),
            Value<List<String>> sources = const Value.absent(),
            Value<List<String>> followedCommunities = const Value.absent(),
            Value<List<String>> followedTags = const Value.absent(),
            Value<List<String>> followedEvents = const Value.absent(),
            Value<List<String>> contactRelays = const Value.absent(),
            Value<List<String>> petnames = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ContactListTableCompanion.insert(
            pubkey: pubkey,
            contacts: contacts,
            createdAt: createdAt,
            loadedTimestamp: loadedTimestamp,
            sources: sources,
            followedCommunities: followedCommunities,
            followedTags: followedTags,
            followedEvents: followedEvents,
            contactRelays: contactRelays,
            petnames: petnames,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ContactListTableTableProcessedTableManager = ProcessedTableManager<
    _$NostrDatabase,
    $ContactListTableTable,
    ContactListTableData,
    $$ContactListTableTableFilterComposer,
    $$ContactListTableTableOrderingComposer,
    $$ContactListTableTableAnnotationComposer,
    $$ContactListTableTableCreateCompanionBuilder,
    $$ContactListTableTableUpdateCompanionBuilder,
    (
      ContactListTableData,
      BaseReferences<_$NostrDatabase, $ContactListTableTable,
          ContactListTableData>
    ),
    ContactListTableData,
    PrefetchHooks Function()>;
typedef $$MuteListTableTableCreateCompanionBuilder = MuteListTableCompanion
    Function({
  required String pubkey,
  Value<String> mutes,
  required int createdAt,
  Value<int?> loadedTimestamp,
  Value<String> sources,
  Value<int> rowid,
});
typedef $$MuteListTableTableUpdateCompanionBuilder = MuteListTableCompanion
    Function({
  Value<String> pubkey,
  Value<String> mutes,
  Value<int> createdAt,
  Value<int?> loadedTimestamp,
  Value<String> sources,
  Value<int> rowid,
});

class $$MuteListTableTableFilterComposer
    extends Composer<_$NostrDatabase, $MuteListTableTable> {
  $$MuteListTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get pubkey => $composableBuilder(
      column: $table.pubkey, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get mutes => $composableBuilder(
      column: $table.mutes, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get loadedTimestamp => $composableBuilder(
      column: $table.loadedTimestamp,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sources => $composableBuilder(
      column: $table.sources, builder: (column) => ColumnFilters(column));
}

class $$MuteListTableTableOrderingComposer
    extends Composer<_$NostrDatabase, $MuteListTableTable> {
  $$MuteListTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get pubkey => $composableBuilder(
      column: $table.pubkey, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get mutes => $composableBuilder(
      column: $table.mutes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get loadedTimestamp => $composableBuilder(
      column: $table.loadedTimestamp,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sources => $composableBuilder(
      column: $table.sources, builder: (column) => ColumnOrderings(column));
}

class $$MuteListTableTableAnnotationComposer
    extends Composer<_$NostrDatabase, $MuteListTableTable> {
  $$MuteListTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get pubkey =>
      $composableBuilder(column: $table.pubkey, builder: (column) => column);

  GeneratedColumn<String> get mutes =>
      $composableBuilder(column: $table.mutes, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get loadedTimestamp => $composableBuilder(
      column: $table.loadedTimestamp, builder: (column) => column);

  GeneratedColumn<String> get sources =>
      $composableBuilder(column: $table.sources, builder: (column) => column);
}

class $$MuteListTableTableTableManager extends RootTableManager<
    _$NostrDatabase,
    $MuteListTableTable,
    MuteListTableData,
    $$MuteListTableTableFilterComposer,
    $$MuteListTableTableOrderingComposer,
    $$MuteListTableTableAnnotationComposer,
    $$MuteListTableTableCreateCompanionBuilder,
    $$MuteListTableTableUpdateCompanionBuilder,
    (
      MuteListTableData,
      BaseReferences<_$NostrDatabase, $MuteListTableTable, MuteListTableData>
    ),
    MuteListTableData,
    PrefetchHooks Function()> {
  $$MuteListTableTableTableManager(
      _$NostrDatabase db, $MuteListTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MuteListTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MuteListTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MuteListTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> pubkey = const Value.absent(),
            Value<String> mutes = const Value.absent(),
            Value<int> createdAt = const Value.absent(),
            Value<int?> loadedTimestamp = const Value.absent(),
            Value<String> sources = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MuteListTableCompanion(
            pubkey: pubkey,
            mutes: mutes,
            createdAt: createdAt,
            loadedTimestamp: loadedTimestamp,
            sources: sources,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String pubkey,
            Value<String> mutes = const Value.absent(),
            required int createdAt,
            Value<int?> loadedTimestamp = const Value.absent(),
            Value<String> sources = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MuteListTableCompanion.insert(
            pubkey: pubkey,
            mutes: mutes,
            createdAt: createdAt,
            loadedTimestamp: loadedTimestamp,
            sources: sources,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$MuteListTableTableProcessedTableManager = ProcessedTableManager<
    _$NostrDatabase,
    $MuteListTableTable,
    MuteListTableData,
    $$MuteListTableTableFilterComposer,
    $$MuteListTableTableOrderingComposer,
    $$MuteListTableTableAnnotationComposer,
    $$MuteListTableTableCreateCompanionBuilder,
    $$MuteListTableTableUpdateCompanionBuilder,
    (
      MuteListTableData,
      BaseReferences<_$NostrDatabase, $MuteListTableTable, MuteListTableData>
    ),
    MuteListTableData,
    PrefetchHooks Function()>;
typedef $$UserRelayListTableTableCreateCompanionBuilder
    = UserRelayListTableCompanion Function({
  required String pubkey,
  Value<String> readRelays,
  Value<String> writeRelays,
  required int createdAt,
  Value<int?> loadedTimestamp,
  Value<String> sources,
  Value<int> rowid,
});
typedef $$UserRelayListTableTableUpdateCompanionBuilder
    = UserRelayListTableCompanion Function({
  Value<String> pubkey,
  Value<String> readRelays,
  Value<String> writeRelays,
  Value<int> createdAt,
  Value<int?> loadedTimestamp,
  Value<String> sources,
  Value<int> rowid,
});

class $$UserRelayListTableTableFilterComposer
    extends Composer<_$NostrDatabase, $UserRelayListTableTable> {
  $$UserRelayListTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get pubkey => $composableBuilder(
      column: $table.pubkey, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get readRelays => $composableBuilder(
      column: $table.readRelays, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get writeRelays => $composableBuilder(
      column: $table.writeRelays, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get loadedTimestamp => $composableBuilder(
      column: $table.loadedTimestamp,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sources => $composableBuilder(
      column: $table.sources, builder: (column) => ColumnFilters(column));
}

class $$UserRelayListTableTableOrderingComposer
    extends Composer<_$NostrDatabase, $UserRelayListTableTable> {
  $$UserRelayListTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get pubkey => $composableBuilder(
      column: $table.pubkey, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get readRelays => $composableBuilder(
      column: $table.readRelays, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get writeRelays => $composableBuilder(
      column: $table.writeRelays, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get loadedTimestamp => $composableBuilder(
      column: $table.loadedTimestamp,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sources => $composableBuilder(
      column: $table.sources, builder: (column) => ColumnOrderings(column));
}

class $$UserRelayListTableTableAnnotationComposer
    extends Composer<_$NostrDatabase, $UserRelayListTableTable> {
  $$UserRelayListTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get pubkey =>
      $composableBuilder(column: $table.pubkey, builder: (column) => column);

  GeneratedColumn<String> get readRelays => $composableBuilder(
      column: $table.readRelays, builder: (column) => column);

  GeneratedColumn<String> get writeRelays => $composableBuilder(
      column: $table.writeRelays, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get loadedTimestamp => $composableBuilder(
      column: $table.loadedTimestamp, builder: (column) => column);

  GeneratedColumn<String> get sources =>
      $composableBuilder(column: $table.sources, builder: (column) => column);
}

class $$UserRelayListTableTableTableManager extends RootTableManager<
    _$NostrDatabase,
    $UserRelayListTableTable,
    UserRelayListTableData,
    $$UserRelayListTableTableFilterComposer,
    $$UserRelayListTableTableOrderingComposer,
    $$UserRelayListTableTableAnnotationComposer,
    $$UserRelayListTableTableCreateCompanionBuilder,
    $$UserRelayListTableTableUpdateCompanionBuilder,
    (
      UserRelayListTableData,
      BaseReferences<_$NostrDatabase, $UserRelayListTableTable,
          UserRelayListTableData>
    ),
    UserRelayListTableData,
    PrefetchHooks Function()> {
  $$UserRelayListTableTableTableManager(
      _$NostrDatabase db, $UserRelayListTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserRelayListTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserRelayListTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserRelayListTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> pubkey = const Value.absent(),
            Value<String> readRelays = const Value.absent(),
            Value<String> writeRelays = const Value.absent(),
            Value<int> createdAt = const Value.absent(),
            Value<int?> loadedTimestamp = const Value.absent(),
            Value<String> sources = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              UserRelayListTableCompanion(
            pubkey: pubkey,
            readRelays: readRelays,
            writeRelays: writeRelays,
            createdAt: createdAt,
            loadedTimestamp: loadedTimestamp,
            sources: sources,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String pubkey,
            Value<String> readRelays = const Value.absent(),
            Value<String> writeRelays = const Value.absent(),
            required int createdAt,
            Value<int?> loadedTimestamp = const Value.absent(),
            Value<String> sources = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              UserRelayListTableCompanion.insert(
            pubkey: pubkey,
            readRelays: readRelays,
            writeRelays: writeRelays,
            createdAt: createdAt,
            loadedTimestamp: loadedTimestamp,
            sources: sources,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$UserRelayListTableTableProcessedTableManager = ProcessedTableManager<
    _$NostrDatabase,
    $UserRelayListTableTable,
    UserRelayListTableData,
    $$UserRelayListTableTableFilterComposer,
    $$UserRelayListTableTableOrderingComposer,
    $$UserRelayListTableTableAnnotationComposer,
    $$UserRelayListTableTableCreateCompanionBuilder,
    $$UserRelayListTableTableUpdateCompanionBuilder,
    (
      UserRelayListTableData,
      BaseReferences<_$NostrDatabase, $UserRelayListTableTable,
          UserRelayListTableData>
    ),
    UserRelayListTableData,
    PrefetchHooks Function()>;
typedef $$RelaySetTableTableCreateCompanionBuilder = RelaySetTableCompanion
    Function({
  required String id,
  required String name,
  required String pubkey,
  Value<String> relays,
  required int createdAt,
  Value<int?> loadedTimestamp,
  Value<String> sources,
  Value<int> rowid,
});
typedef $$RelaySetTableTableUpdateCompanionBuilder = RelaySetTableCompanion
    Function({
  Value<String> id,
  Value<String> name,
  Value<String> pubkey,
  Value<String> relays,
  Value<int> createdAt,
  Value<int?> loadedTimestamp,
  Value<String> sources,
  Value<int> rowid,
});

class $$RelaySetTableTableFilterComposer
    extends Composer<_$NostrDatabase, $RelaySetTableTable> {
  $$RelaySetTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get pubkey => $composableBuilder(
      column: $table.pubkey, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get relays => $composableBuilder(
      column: $table.relays, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get loadedTimestamp => $composableBuilder(
      column: $table.loadedTimestamp,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sources => $composableBuilder(
      column: $table.sources, builder: (column) => ColumnFilters(column));
}

class $$RelaySetTableTableOrderingComposer
    extends Composer<_$NostrDatabase, $RelaySetTableTable> {
  $$RelaySetTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get pubkey => $composableBuilder(
      column: $table.pubkey, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get relays => $composableBuilder(
      column: $table.relays, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get loadedTimestamp => $composableBuilder(
      column: $table.loadedTimestamp,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sources => $composableBuilder(
      column: $table.sources, builder: (column) => ColumnOrderings(column));
}

class $$RelaySetTableTableAnnotationComposer
    extends Composer<_$NostrDatabase, $RelaySetTableTable> {
  $$RelaySetTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get pubkey =>
      $composableBuilder(column: $table.pubkey, builder: (column) => column);

  GeneratedColumn<String> get relays =>
      $composableBuilder(column: $table.relays, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get loadedTimestamp => $composableBuilder(
      column: $table.loadedTimestamp, builder: (column) => column);

  GeneratedColumn<String> get sources =>
      $composableBuilder(column: $table.sources, builder: (column) => column);
}

class $$RelaySetTableTableTableManager extends RootTableManager<
    _$NostrDatabase,
    $RelaySetTableTable,
    RelaySetTableData,
    $$RelaySetTableTableFilterComposer,
    $$RelaySetTableTableOrderingComposer,
    $$RelaySetTableTableAnnotationComposer,
    $$RelaySetTableTableCreateCompanionBuilder,
    $$RelaySetTableTableUpdateCompanionBuilder,
    (
      RelaySetTableData,
      BaseReferences<_$NostrDatabase, $RelaySetTableTable, RelaySetTableData>
    ),
    RelaySetTableData,
    PrefetchHooks Function()> {
  $$RelaySetTableTableTableManager(
      _$NostrDatabase db, $RelaySetTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RelaySetTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RelaySetTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RelaySetTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> pubkey = const Value.absent(),
            Value<String> relays = const Value.absent(),
            Value<int> createdAt = const Value.absent(),
            Value<int?> loadedTimestamp = const Value.absent(),
            Value<String> sources = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              RelaySetTableCompanion(
            id: id,
            name: name,
            pubkey: pubkey,
            relays: relays,
            createdAt: createdAt,
            loadedTimestamp: loadedTimestamp,
            sources: sources,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            required String pubkey,
            Value<String> relays = const Value.absent(),
            required int createdAt,
            Value<int?> loadedTimestamp = const Value.absent(),
            Value<String> sources = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              RelaySetTableCompanion.insert(
            id: id,
            name: name,
            pubkey: pubkey,
            relays: relays,
            createdAt: createdAt,
            loadedTimestamp: loadedTimestamp,
            sources: sources,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$RelaySetTableTableProcessedTableManager = ProcessedTableManager<
    _$NostrDatabase,
    $RelaySetTableTable,
    RelaySetTableData,
    $$RelaySetTableTableFilterComposer,
    $$RelaySetTableTableOrderingComposer,
    $$RelaySetTableTableAnnotationComposer,
    $$RelaySetTableTableCreateCompanionBuilder,
    $$RelaySetTableTableUpdateCompanionBuilder,
    (
      RelaySetTableData,
      BaseReferences<_$NostrDatabase, $RelaySetTableTable, RelaySetTableData>
    ),
    RelaySetTableData,
    PrefetchHooks Function()>;
typedef $$EventStatsTableTableCreateCompanionBuilder = EventStatsTableCompanion
    Function({
  required String id,
  Value<int> repliesCount,
  Value<int> repostsCount,
  Value<int> reactionsCount,
  Value<int> zapsCount,
  Value<int> zapAmount,
  Value<int?> lastUpdated,
  Value<int> rowid,
});
typedef $$EventStatsTableTableUpdateCompanionBuilder = EventStatsTableCompanion
    Function({
  Value<String> id,
  Value<int> repliesCount,
  Value<int> repostsCount,
  Value<int> reactionsCount,
  Value<int> zapsCount,
  Value<int> zapAmount,
  Value<int?> lastUpdated,
  Value<int> rowid,
});

class $$EventStatsTableTableFilterComposer
    extends Composer<_$NostrDatabase, $EventStatsTableTable> {
  $$EventStatsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get repliesCount => $composableBuilder(
      column: $table.repliesCount, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get repostsCount => $composableBuilder(
      column: $table.repostsCount, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get reactionsCount => $composableBuilder(
      column: $table.reactionsCount,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get zapsCount => $composableBuilder(
      column: $table.zapsCount, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get zapAmount => $composableBuilder(
      column: $table.zapAmount, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get lastUpdated => $composableBuilder(
      column: $table.lastUpdated, builder: (column) => ColumnFilters(column));
}

class $$EventStatsTableTableOrderingComposer
    extends Composer<_$NostrDatabase, $EventStatsTableTable> {
  $$EventStatsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get repliesCount => $composableBuilder(
      column: $table.repliesCount,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get repostsCount => $composableBuilder(
      column: $table.repostsCount,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get reactionsCount => $composableBuilder(
      column: $table.reactionsCount,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get zapsCount => $composableBuilder(
      column: $table.zapsCount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get zapAmount => $composableBuilder(
      column: $table.zapAmount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get lastUpdated => $composableBuilder(
      column: $table.lastUpdated, builder: (column) => ColumnOrderings(column));
}

class $$EventStatsTableTableAnnotationComposer
    extends Composer<_$NostrDatabase, $EventStatsTableTable> {
  $$EventStatsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get repliesCount => $composableBuilder(
      column: $table.repliesCount, builder: (column) => column);

  GeneratedColumn<int> get repostsCount => $composableBuilder(
      column: $table.repostsCount, builder: (column) => column);

  GeneratedColumn<int> get reactionsCount => $composableBuilder(
      column: $table.reactionsCount, builder: (column) => column);

  GeneratedColumn<int> get zapsCount =>
      $composableBuilder(column: $table.zapsCount, builder: (column) => column);

  GeneratedColumn<int> get zapAmount =>
      $composableBuilder(column: $table.zapAmount, builder: (column) => column);

  GeneratedColumn<int> get lastUpdated => $composableBuilder(
      column: $table.lastUpdated, builder: (column) => column);
}

class $$EventStatsTableTableTableManager extends RootTableManager<
    _$NostrDatabase,
    $EventStatsTableTable,
    EventStatsTableData,
    $$EventStatsTableTableFilterComposer,
    $$EventStatsTableTableOrderingComposer,
    $$EventStatsTableTableAnnotationComposer,
    $$EventStatsTableTableCreateCompanionBuilder,
    $$EventStatsTableTableUpdateCompanionBuilder,
    (
      EventStatsTableData,
      BaseReferences<_$NostrDatabase, $EventStatsTableTable,
          EventStatsTableData>
    ),
    EventStatsTableData,
    PrefetchHooks Function()> {
  $$EventStatsTableTableTableManager(
      _$NostrDatabase db, $EventStatsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EventStatsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EventStatsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EventStatsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<int> repliesCount = const Value.absent(),
            Value<int> repostsCount = const Value.absent(),
            Value<int> reactionsCount = const Value.absent(),
            Value<int> zapsCount = const Value.absent(),
            Value<int> zapAmount = const Value.absent(),
            Value<int?> lastUpdated = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              EventStatsTableCompanion(
            id: id,
            repliesCount: repliesCount,
            repostsCount: repostsCount,
            reactionsCount: reactionsCount,
            zapsCount: zapsCount,
            zapAmount: zapAmount,
            lastUpdated: lastUpdated,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            Value<int> repliesCount = const Value.absent(),
            Value<int> repostsCount = const Value.absent(),
            Value<int> reactionsCount = const Value.absent(),
            Value<int> zapsCount = const Value.absent(),
            Value<int> zapAmount = const Value.absent(),
            Value<int?> lastUpdated = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              EventStatsTableCompanion.insert(
            id: id,
            repliesCount: repliesCount,
            repostsCount: repostsCount,
            reactionsCount: reactionsCount,
            zapsCount: zapsCount,
            zapAmount: zapAmount,
            lastUpdated: lastUpdated,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$EventStatsTableTableProcessedTableManager = ProcessedTableManager<
    _$NostrDatabase,
    $EventStatsTableTable,
    EventStatsTableData,
    $$EventStatsTableTableFilterComposer,
    $$EventStatsTableTableOrderingComposer,
    $$EventStatsTableTableAnnotationComposer,
    $$EventStatsTableTableCreateCompanionBuilder,
    $$EventStatsTableTableUpdateCompanionBuilder,
    (
      EventStatsTableData,
      BaseReferences<_$NostrDatabase, $EventStatsTableTable,
          EventStatsTableData>
    ),
    EventStatsTableData,
    PrefetchHooks Function()>;
typedef $$Nip05TableTableCreateCompanionBuilder = Nip05TableCompanion Function({
  required String nip05,
  required String pubkey,
  Value<bool> valid,
  Value<int?> lastCheck,
  Value<int?> networkFetch,
  Value<int> rowid,
});
typedef $$Nip05TableTableUpdateCompanionBuilder = Nip05TableCompanion Function({
  Value<String> nip05,
  Value<String> pubkey,
  Value<bool> valid,
  Value<int?> lastCheck,
  Value<int?> networkFetch,
  Value<int> rowid,
});

class $$Nip05TableTableFilterComposer
    extends Composer<_$NostrDatabase, $Nip05TableTable> {
  $$Nip05TableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get nip05 => $composableBuilder(
      column: $table.nip05, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get pubkey => $composableBuilder(
      column: $table.pubkey, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get valid => $composableBuilder(
      column: $table.valid, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get lastCheck => $composableBuilder(
      column: $table.lastCheck, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get networkFetch => $composableBuilder(
      column: $table.networkFetch, builder: (column) => ColumnFilters(column));
}

class $$Nip05TableTableOrderingComposer
    extends Composer<_$NostrDatabase, $Nip05TableTable> {
  $$Nip05TableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get nip05 => $composableBuilder(
      column: $table.nip05, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get pubkey => $composableBuilder(
      column: $table.pubkey, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get valid => $composableBuilder(
      column: $table.valid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get lastCheck => $composableBuilder(
      column: $table.lastCheck, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get networkFetch => $composableBuilder(
      column: $table.networkFetch,
      builder: (column) => ColumnOrderings(column));
}

class $$Nip05TableTableAnnotationComposer
    extends Composer<_$NostrDatabase, $Nip05TableTable> {
  $$Nip05TableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get nip05 =>
      $composableBuilder(column: $table.nip05, builder: (column) => column);

  GeneratedColumn<String> get pubkey =>
      $composableBuilder(column: $table.pubkey, builder: (column) => column);

  GeneratedColumn<bool> get valid =>
      $composableBuilder(column: $table.valid, builder: (column) => column);

  GeneratedColumn<int> get lastCheck =>
      $composableBuilder(column: $table.lastCheck, builder: (column) => column);

  GeneratedColumn<int> get networkFetch => $composableBuilder(
      column: $table.networkFetch, builder: (column) => column);
}

class $$Nip05TableTableTableManager extends RootTableManager<
    _$NostrDatabase,
    $Nip05TableTable,
    Nip05TableData,
    $$Nip05TableTableFilterComposer,
    $$Nip05TableTableOrderingComposer,
    $$Nip05TableTableAnnotationComposer,
    $$Nip05TableTableCreateCompanionBuilder,
    $$Nip05TableTableUpdateCompanionBuilder,
    (
      Nip05TableData,
      BaseReferences<_$NostrDatabase, $Nip05TableTable, Nip05TableData>
    ),
    Nip05TableData,
    PrefetchHooks Function()> {
  $$Nip05TableTableTableManager(_$NostrDatabase db, $Nip05TableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$Nip05TableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$Nip05TableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$Nip05TableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> nip05 = const Value.absent(),
            Value<String> pubkey = const Value.absent(),
            Value<bool> valid = const Value.absent(),
            Value<int?> lastCheck = const Value.absent(),
            Value<int?> networkFetch = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              Nip05TableCompanion(
            nip05: nip05,
            pubkey: pubkey,
            valid: valid,
            lastCheck: lastCheck,
            networkFetch: networkFetch,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String nip05,
            required String pubkey,
            Value<bool> valid = const Value.absent(),
            Value<int?> lastCheck = const Value.absent(),
            Value<int?> networkFetch = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              Nip05TableCompanion.insert(
            nip05: nip05,
            pubkey: pubkey,
            valid: valid,
            lastCheck: lastCheck,
            networkFetch: networkFetch,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$Nip05TableTableProcessedTableManager = ProcessedTableManager<
    _$NostrDatabase,
    $Nip05TableTable,
    Nip05TableData,
    $$Nip05TableTableFilterComposer,
    $$Nip05TableTableOrderingComposer,
    $$Nip05TableTableAnnotationComposer,
    $$Nip05TableTableCreateCompanionBuilder,
    $$Nip05TableTableUpdateCompanionBuilder,
    (
      Nip05TableData,
      BaseReferences<_$NostrDatabase, $Nip05TableTable, Nip05TableData>
    ),
    Nip05TableData,
    PrefetchHooks Function()>;
typedef $$DmSessionInfosTableTableCreateCompanionBuilder
    = DmSessionInfosTableCompanion Function({
  required String dmSessionId,
  required String pubkey,
  required String peer,
  Value<int?> readMessageTime,
  Value<int?> hiddenMessageTime,
  Value<int> rowid,
});
typedef $$DmSessionInfosTableTableUpdateCompanionBuilder
    = DmSessionInfosTableCompanion Function({
  Value<String> dmSessionId,
  Value<String> pubkey,
  Value<String> peer,
  Value<int?> readMessageTime,
  Value<int?> hiddenMessageTime,
  Value<int> rowid,
});

class $$DmSessionInfosTableTableFilterComposer
    extends Composer<_$NostrDatabase, $DmSessionInfosTableTable> {
  $$DmSessionInfosTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get dmSessionId => $composableBuilder(
      column: $table.dmSessionId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get pubkey => $composableBuilder(
      column: $table.pubkey, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get peer => $composableBuilder(
      column: $table.peer, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get readMessageTime => $composableBuilder(
      column: $table.readMessageTime,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get hiddenMessageTime => $composableBuilder(
      column: $table.hiddenMessageTime,
      builder: (column) => ColumnFilters(column));
}

class $$DmSessionInfosTableTableOrderingComposer
    extends Composer<_$NostrDatabase, $DmSessionInfosTableTable> {
  $$DmSessionInfosTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get dmSessionId => $composableBuilder(
      column: $table.dmSessionId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get pubkey => $composableBuilder(
      column: $table.pubkey, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get peer => $composableBuilder(
      column: $table.peer, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get readMessageTime => $composableBuilder(
      column: $table.readMessageTime,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get hiddenMessageTime => $composableBuilder(
      column: $table.hiddenMessageTime,
      builder: (column) => ColumnOrderings(column));
}

class $$DmSessionInfosTableTableAnnotationComposer
    extends Composer<_$NostrDatabase, $DmSessionInfosTableTable> {
  $$DmSessionInfosTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get dmSessionId => $composableBuilder(
      column: $table.dmSessionId, builder: (column) => column);

  GeneratedColumn<String> get pubkey =>
      $composableBuilder(column: $table.pubkey, builder: (column) => column);

  GeneratedColumn<String> get peer =>
      $composableBuilder(column: $table.peer, builder: (column) => column);

  GeneratedColumn<int> get readMessageTime => $composableBuilder(
      column: $table.readMessageTime, builder: (column) => column);

  GeneratedColumn<int> get hiddenMessageTime => $composableBuilder(
      column: $table.hiddenMessageTime, builder: (column) => column);
}

class $$DmSessionInfosTableTableTableManager extends RootTableManager<
    _$NostrDatabase,
    $DmSessionInfosTableTable,
    DmSessionInfosTableData,
    $$DmSessionInfosTableTableFilterComposer,
    $$DmSessionInfosTableTableOrderingComposer,
    $$DmSessionInfosTableTableAnnotationComposer,
    $$DmSessionInfosTableTableCreateCompanionBuilder,
    $$DmSessionInfosTableTableUpdateCompanionBuilder,
    (
      DmSessionInfosTableData,
      BaseReferences<_$NostrDatabase, $DmSessionInfosTableTable,
          DmSessionInfosTableData>
    ),
    DmSessionInfosTableData,
    PrefetchHooks Function()> {
  $$DmSessionInfosTableTableTableManager(
      _$NostrDatabase db, $DmSessionInfosTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DmSessionInfosTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DmSessionInfosTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DmSessionInfosTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> dmSessionId = const Value.absent(),
            Value<String> pubkey = const Value.absent(),
            Value<String> peer = const Value.absent(),
            Value<int?> readMessageTime = const Value.absent(),
            Value<int?> hiddenMessageTime = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DmSessionInfosTableCompanion(
            dmSessionId: dmSessionId,
            pubkey: pubkey,
            peer: peer,
            readMessageTime: readMessageTime,
            hiddenMessageTime: hiddenMessageTime,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String dmSessionId,
            required String pubkey,
            required String peer,
            Value<int?> readMessageTime = const Value.absent(),
            Value<int?> hiddenMessageTime = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DmSessionInfosTableCompanion.insert(
            dmSessionId: dmSessionId,
            pubkey: pubkey,
            peer: peer,
            readMessageTime: readMessageTime,
            hiddenMessageTime: hiddenMessageTime,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$DmSessionInfosTableTableProcessedTableManager = ProcessedTableManager<
    _$NostrDatabase,
    $DmSessionInfosTableTable,
    DmSessionInfosTableData,
    $$DmSessionInfosTableTableFilterComposer,
    $$DmSessionInfosTableTableOrderingComposer,
    $$DmSessionInfosTableTableAnnotationComposer,
    $$DmSessionInfosTableTableCreateCompanionBuilder,
    $$DmSessionInfosTableTableUpdateCompanionBuilder,
    (
      DmSessionInfosTableData,
      BaseReferences<_$NostrDatabase, $DmSessionInfosTableTable,
          DmSessionInfosTableData>
    ),
    DmSessionInfosTableData,
    PrefetchHooks Function()>;
typedef $$UserFollowersTableTableCreateCompanionBuilder
    = UserFollowersTableCompanion Function({
  required String id,
  required String pubkey,
  Value<String> followers,
  Value<int?> lastUpdated,
  Value<int> rowid,
});
typedef $$UserFollowersTableTableUpdateCompanionBuilder
    = UserFollowersTableCompanion Function({
  Value<String> id,
  Value<String> pubkey,
  Value<String> followers,
  Value<int?> lastUpdated,
  Value<int> rowid,
});

class $$UserFollowersTableTableFilterComposer
    extends Composer<_$NostrDatabase, $UserFollowersTableTable> {
  $$UserFollowersTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get pubkey => $composableBuilder(
      column: $table.pubkey, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get followers => $composableBuilder(
      column: $table.followers, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get lastUpdated => $composableBuilder(
      column: $table.lastUpdated, builder: (column) => ColumnFilters(column));
}

class $$UserFollowersTableTableOrderingComposer
    extends Composer<_$NostrDatabase, $UserFollowersTableTable> {
  $$UserFollowersTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get pubkey => $composableBuilder(
      column: $table.pubkey, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get followers => $composableBuilder(
      column: $table.followers, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get lastUpdated => $composableBuilder(
      column: $table.lastUpdated, builder: (column) => ColumnOrderings(column));
}

class $$UserFollowersTableTableAnnotationComposer
    extends Composer<_$NostrDatabase, $UserFollowersTableTable> {
  $$UserFollowersTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get pubkey =>
      $composableBuilder(column: $table.pubkey, builder: (column) => column);

  GeneratedColumn<String> get followers =>
      $composableBuilder(column: $table.followers, builder: (column) => column);

  GeneratedColumn<int> get lastUpdated => $composableBuilder(
      column: $table.lastUpdated, builder: (column) => column);
}

class $$UserFollowersTableTableTableManager extends RootTableManager<
    _$NostrDatabase,
    $UserFollowersTableTable,
    UserFollowersTableData,
    $$UserFollowersTableTableFilterComposer,
    $$UserFollowersTableTableOrderingComposer,
    $$UserFollowersTableTableAnnotationComposer,
    $$UserFollowersTableTableCreateCompanionBuilder,
    $$UserFollowersTableTableUpdateCompanionBuilder,
    (
      UserFollowersTableData,
      BaseReferences<_$NostrDatabase, $UserFollowersTableTable,
          UserFollowersTableData>
    ),
    UserFollowersTableData,
    PrefetchHooks Function()> {
  $$UserFollowersTableTableTableManager(
      _$NostrDatabase db, $UserFollowersTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserFollowersTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserFollowersTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserFollowersTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> pubkey = const Value.absent(),
            Value<String> followers = const Value.absent(),
            Value<int?> lastUpdated = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              UserFollowersTableCompanion(
            id: id,
            pubkey: pubkey,
            followers: followers,
            lastUpdated: lastUpdated,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String pubkey,
            Value<String> followers = const Value.absent(),
            Value<int?> lastUpdated = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              UserFollowersTableCompanion.insert(
            id: id,
            pubkey: pubkey,
            followers: followers,
            lastUpdated: lastUpdated,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$UserFollowersTableTableProcessedTableManager = ProcessedTableManager<
    _$NostrDatabase,
    $UserFollowersTableTable,
    UserFollowersTableData,
    $$UserFollowersTableTableFilterComposer,
    $$UserFollowersTableTableOrderingComposer,
    $$UserFollowersTableTableAnnotationComposer,
    $$UserFollowersTableTableCreateCompanionBuilder,
    $$UserFollowersTableTableUpdateCompanionBuilder,
    (
      UserFollowersTableData,
      BaseReferences<_$NostrDatabase, $UserFollowersTableTable,
          UserFollowersTableData>
    ),
    UserFollowersTableData,
    PrefetchHooks Function()>;
typedef $$UserDraftTableTableCreateCompanionBuilder = UserDraftTableCompanion
    Function({
  required String id,
  required String pubkey,
  required String content,
  required int kind,
  Value<String> tags,
  required int createdAt,
  Value<int?> lastUpdated,
  Value<int> rowid,
});
typedef $$UserDraftTableTableUpdateCompanionBuilder = UserDraftTableCompanion
    Function({
  Value<String> id,
  Value<String> pubkey,
  Value<String> content,
  Value<int> kind,
  Value<String> tags,
  Value<int> createdAt,
  Value<int?> lastUpdated,
  Value<int> rowid,
});

class $$UserDraftTableTableFilterComposer
    extends Composer<_$NostrDatabase, $UserDraftTableTable> {
  $$UserDraftTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get pubkey => $composableBuilder(
      column: $table.pubkey, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get content => $composableBuilder(
      column: $table.content, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get kind => $composableBuilder(
      column: $table.kind, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get tags => $composableBuilder(
      column: $table.tags, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get lastUpdated => $composableBuilder(
      column: $table.lastUpdated, builder: (column) => ColumnFilters(column));
}

class $$UserDraftTableTableOrderingComposer
    extends Composer<_$NostrDatabase, $UserDraftTableTable> {
  $$UserDraftTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get pubkey => $composableBuilder(
      column: $table.pubkey, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get content => $composableBuilder(
      column: $table.content, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get kind => $composableBuilder(
      column: $table.kind, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get tags => $composableBuilder(
      column: $table.tags, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get lastUpdated => $composableBuilder(
      column: $table.lastUpdated, builder: (column) => ColumnOrderings(column));
}

class $$UserDraftTableTableAnnotationComposer
    extends Composer<_$NostrDatabase, $UserDraftTableTable> {
  $$UserDraftTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get pubkey =>
      $composableBuilder(column: $table.pubkey, builder: (column) => column);

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  GeneratedColumn<int> get kind =>
      $composableBuilder(column: $table.kind, builder: (column) => column);

  GeneratedColumn<String> get tags =>
      $composableBuilder(column: $table.tags, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get lastUpdated => $composableBuilder(
      column: $table.lastUpdated, builder: (column) => column);
}

class $$UserDraftTableTableTableManager extends RootTableManager<
    _$NostrDatabase,
    $UserDraftTableTable,
    UserDraftTableData,
    $$UserDraftTableTableFilterComposer,
    $$UserDraftTableTableOrderingComposer,
    $$UserDraftTableTableAnnotationComposer,
    $$UserDraftTableTableCreateCompanionBuilder,
    $$UserDraftTableTableUpdateCompanionBuilder,
    (
      UserDraftTableData,
      BaseReferences<_$NostrDatabase, $UserDraftTableTable, UserDraftTableData>
    ),
    UserDraftTableData,
    PrefetchHooks Function()> {
  $$UserDraftTableTableTableManager(
      _$NostrDatabase db, $UserDraftTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserDraftTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserDraftTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserDraftTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> pubkey = const Value.absent(),
            Value<String> content = const Value.absent(),
            Value<int> kind = const Value.absent(),
            Value<String> tags = const Value.absent(),
            Value<int> createdAt = const Value.absent(),
            Value<int?> lastUpdated = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              UserDraftTableCompanion(
            id: id,
            pubkey: pubkey,
            content: content,
            kind: kind,
            tags: tags,
            createdAt: createdAt,
            lastUpdated: lastUpdated,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String pubkey,
            required String content,
            required int kind,
            Value<String> tags = const Value.absent(),
            required int createdAt,
            Value<int?> lastUpdated = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              UserDraftTableCompanion.insert(
            id: id,
            pubkey: pubkey,
            content: content,
            kind: kind,
            tags: tags,
            createdAt: createdAt,
            lastUpdated: lastUpdated,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$UserDraftTableTableProcessedTableManager = ProcessedTableManager<
    _$NostrDatabase,
    $UserDraftTableTable,
    UserDraftTableData,
    $$UserDraftTableTableFilterComposer,
    $$UserDraftTableTableOrderingComposer,
    $$UserDraftTableTableAnnotationComposer,
    $$UserDraftTableTableCreateCompanionBuilder,
    $$UserDraftTableTableUpdateCompanionBuilder,
    (
      UserDraftTableData,
      BaseReferences<_$NostrDatabase, $UserDraftTableTable, UserDraftTableData>
    ),
    UserDraftTableData,
    PrefetchHooks Function()>;
typedef $$UserAppSettingsTableTableCreateCompanionBuilder
    = UserAppSettingsTableCompanion Function({
  required String pubkey,
  Value<String> settings,
  Value<int?> lastUpdated,
  Value<int> rowid,
});
typedef $$UserAppSettingsTableTableUpdateCompanionBuilder
    = UserAppSettingsTableCompanion Function({
  Value<String> pubkey,
  Value<String> settings,
  Value<int?> lastUpdated,
  Value<int> rowid,
});

class $$UserAppSettingsTableTableFilterComposer
    extends Composer<_$NostrDatabase, $UserAppSettingsTableTable> {
  $$UserAppSettingsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get pubkey => $composableBuilder(
      column: $table.pubkey, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get settings => $composableBuilder(
      column: $table.settings, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get lastUpdated => $composableBuilder(
      column: $table.lastUpdated, builder: (column) => ColumnFilters(column));
}

class $$UserAppSettingsTableTableOrderingComposer
    extends Composer<_$NostrDatabase, $UserAppSettingsTableTable> {
  $$UserAppSettingsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get pubkey => $composableBuilder(
      column: $table.pubkey, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get settings => $composableBuilder(
      column: $table.settings, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get lastUpdated => $composableBuilder(
      column: $table.lastUpdated, builder: (column) => ColumnOrderings(column));
}

class $$UserAppSettingsTableTableAnnotationComposer
    extends Composer<_$NostrDatabase, $UserAppSettingsTableTable> {
  $$UserAppSettingsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get pubkey =>
      $composableBuilder(column: $table.pubkey, builder: (column) => column);

  GeneratedColumn<String> get settings =>
      $composableBuilder(column: $table.settings, builder: (column) => column);

  GeneratedColumn<int> get lastUpdated => $composableBuilder(
      column: $table.lastUpdated, builder: (column) => column);
}

class $$UserAppSettingsTableTableTableManager extends RootTableManager<
    _$NostrDatabase,
    $UserAppSettingsTableTable,
    UserAppSettingsTableData,
    $$UserAppSettingsTableTableFilterComposer,
    $$UserAppSettingsTableTableOrderingComposer,
    $$UserAppSettingsTableTableAnnotationComposer,
    $$UserAppSettingsTableTableCreateCompanionBuilder,
    $$UserAppSettingsTableTableUpdateCompanionBuilder,
    (
      UserAppSettingsTableData,
      BaseReferences<_$NostrDatabase, $UserAppSettingsTableTable,
          UserAppSettingsTableData>
    ),
    UserAppSettingsTableData,
    PrefetchHooks Function()> {
  $$UserAppSettingsTableTableTableManager(
      _$NostrDatabase db, $UserAppSettingsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserAppSettingsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserAppSettingsTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserAppSettingsTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> pubkey = const Value.absent(),
            Value<String> settings = const Value.absent(),
            Value<int?> lastUpdated = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              UserAppSettingsTableCompanion(
            pubkey: pubkey,
            settings: settings,
            lastUpdated: lastUpdated,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String pubkey,
            Value<String> settings = const Value.absent(),
            Value<int?> lastUpdated = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              UserAppSettingsTableCompanion.insert(
            pubkey: pubkey,
            settings: settings,
            lastUpdated: lastUpdated,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$UserAppSettingsTableTableProcessedTableManager
    = ProcessedTableManager<
        _$NostrDatabase,
        $UserAppSettingsTableTable,
        UserAppSettingsTableData,
        $$UserAppSettingsTableTableFilterComposer,
        $$UserAppSettingsTableTableOrderingComposer,
        $$UserAppSettingsTableTableAnnotationComposer,
        $$UserAppSettingsTableTableCreateCompanionBuilder,
        $$UserAppSettingsTableTableUpdateCompanionBuilder,
        (
          UserAppSettingsTableData,
          BaseReferences<_$NostrDatabase, $UserAppSettingsTableTable,
              UserAppSettingsTableData>
        ),
        UserAppSettingsTableData,
        PrefetchHooks Function()>;
typedef $$UserWotTableTableCreateCompanionBuilder = UserWotTableCompanion
    Function({
  required String id,
  required String pubkey,
  Value<String> wotData,
  Value<int?> lastUpdated,
  Value<int> rowid,
});
typedef $$UserWotTableTableUpdateCompanionBuilder = UserWotTableCompanion
    Function({
  Value<String> id,
  Value<String> pubkey,
  Value<String> wotData,
  Value<int?> lastUpdated,
  Value<int> rowid,
});

class $$UserWotTableTableFilterComposer
    extends Composer<_$NostrDatabase, $UserWotTableTable> {
  $$UserWotTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get pubkey => $composableBuilder(
      column: $table.pubkey, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get wotData => $composableBuilder(
      column: $table.wotData, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get lastUpdated => $composableBuilder(
      column: $table.lastUpdated, builder: (column) => ColumnFilters(column));
}

class $$UserWotTableTableOrderingComposer
    extends Composer<_$NostrDatabase, $UserWotTableTable> {
  $$UserWotTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get pubkey => $composableBuilder(
      column: $table.pubkey, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get wotData => $composableBuilder(
      column: $table.wotData, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get lastUpdated => $composableBuilder(
      column: $table.lastUpdated, builder: (column) => ColumnOrderings(column));
}

class $$UserWotTableTableAnnotationComposer
    extends Composer<_$NostrDatabase, $UserWotTableTable> {
  $$UserWotTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get pubkey =>
      $composableBuilder(column: $table.pubkey, builder: (column) => column);

  GeneratedColumn<String> get wotData =>
      $composableBuilder(column: $table.wotData, builder: (column) => column);

  GeneratedColumn<int> get lastUpdated => $composableBuilder(
      column: $table.lastUpdated, builder: (column) => column);
}

class $$UserWotTableTableTableManager extends RootTableManager<
    _$NostrDatabase,
    $UserWotTableTable,
    UserWotTableData,
    $$UserWotTableTableFilterComposer,
    $$UserWotTableTableOrderingComposer,
    $$UserWotTableTableAnnotationComposer,
    $$UserWotTableTableCreateCompanionBuilder,
    $$UserWotTableTableUpdateCompanionBuilder,
    (
      UserWotTableData,
      BaseReferences<_$NostrDatabase, $UserWotTableTable, UserWotTableData>
    ),
    UserWotTableData,
    PrefetchHooks Function()> {
  $$UserWotTableTableTableManager(_$NostrDatabase db, $UserWotTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserWotTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserWotTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserWotTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> pubkey = const Value.absent(),
            Value<String> wotData = const Value.absent(),
            Value<int?> lastUpdated = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              UserWotTableCompanion(
            id: id,
            pubkey: pubkey,
            wotData: wotData,
            lastUpdated: lastUpdated,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String pubkey,
            Value<String> wotData = const Value.absent(),
            Value<int?> lastUpdated = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              UserWotTableCompanion.insert(
            id: id,
            pubkey: pubkey,
            wotData: wotData,
            lastUpdated: lastUpdated,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$UserWotTableTableProcessedTableManager = ProcessedTableManager<
    _$NostrDatabase,
    $UserWotTableTable,
    UserWotTableData,
    $$UserWotTableTableFilterComposer,
    $$UserWotTableTableOrderingComposer,
    $$UserWotTableTableAnnotationComposer,
    $$UserWotTableTableCreateCompanionBuilder,
    $$UserWotTableTableUpdateCompanionBuilder,
    (
      UserWotTableData,
      BaseReferences<_$NostrDatabase, $UserWotTableTable, UserWotTableData>
    ),
    UserWotTableData,
    PrefetchHooks Function()>;
typedef $$WotScoreTableTableCreateCompanionBuilder = WotScoreTableCompanion
    Function({
  required String id,
  required String pubkey,
  required String originPubkey,
  Value<double> score,
  Value<int> depth,
  Value<int?> lastUpdated,
  Value<int> rowid,
});
typedef $$WotScoreTableTableUpdateCompanionBuilder = WotScoreTableCompanion
    Function({
  Value<String> id,
  Value<String> pubkey,
  Value<String> originPubkey,
  Value<double> score,
  Value<int> depth,
  Value<int?> lastUpdated,
  Value<int> rowid,
});

class $$WotScoreTableTableFilterComposer
    extends Composer<_$NostrDatabase, $WotScoreTableTable> {
  $$WotScoreTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get pubkey => $composableBuilder(
      column: $table.pubkey, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get originPubkey => $composableBuilder(
      column: $table.originPubkey, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get score => $composableBuilder(
      column: $table.score, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get depth => $composableBuilder(
      column: $table.depth, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get lastUpdated => $composableBuilder(
      column: $table.lastUpdated, builder: (column) => ColumnFilters(column));
}

class $$WotScoreTableTableOrderingComposer
    extends Composer<_$NostrDatabase, $WotScoreTableTable> {
  $$WotScoreTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get pubkey => $composableBuilder(
      column: $table.pubkey, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get originPubkey => $composableBuilder(
      column: $table.originPubkey,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get score => $composableBuilder(
      column: $table.score, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get depth => $composableBuilder(
      column: $table.depth, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get lastUpdated => $composableBuilder(
      column: $table.lastUpdated, builder: (column) => ColumnOrderings(column));
}

class $$WotScoreTableTableAnnotationComposer
    extends Composer<_$NostrDatabase, $WotScoreTableTable> {
  $$WotScoreTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get pubkey =>
      $composableBuilder(column: $table.pubkey, builder: (column) => column);

  GeneratedColumn<String> get originPubkey => $composableBuilder(
      column: $table.originPubkey, builder: (column) => column);

  GeneratedColumn<double> get score =>
      $composableBuilder(column: $table.score, builder: (column) => column);

  GeneratedColumn<int> get depth =>
      $composableBuilder(column: $table.depth, builder: (column) => column);

  GeneratedColumn<int> get lastUpdated => $composableBuilder(
      column: $table.lastUpdated, builder: (column) => column);
}

class $$WotScoreTableTableTableManager extends RootTableManager<
    _$NostrDatabase,
    $WotScoreTableTable,
    WotScoreTableData,
    $$WotScoreTableTableFilterComposer,
    $$WotScoreTableTableOrderingComposer,
    $$WotScoreTableTableAnnotationComposer,
    $$WotScoreTableTableCreateCompanionBuilder,
    $$WotScoreTableTableUpdateCompanionBuilder,
    (
      WotScoreTableData,
      BaseReferences<_$NostrDatabase, $WotScoreTableTable, WotScoreTableData>
    ),
    WotScoreTableData,
    PrefetchHooks Function()> {
  $$WotScoreTableTableTableManager(
      _$NostrDatabase db, $WotScoreTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WotScoreTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WotScoreTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WotScoreTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> pubkey = const Value.absent(),
            Value<String> originPubkey = const Value.absent(),
            Value<double> score = const Value.absent(),
            Value<int> depth = const Value.absent(),
            Value<int?> lastUpdated = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              WotScoreTableCompanion(
            id: id,
            pubkey: pubkey,
            originPubkey: originPubkey,
            score: score,
            depth: depth,
            lastUpdated: lastUpdated,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String pubkey,
            required String originPubkey,
            Value<double> score = const Value.absent(),
            Value<int> depth = const Value.absent(),
            Value<int?> lastUpdated = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              WotScoreTableCompanion.insert(
            id: id,
            pubkey: pubkey,
            originPubkey: originPubkey,
            score: score,
            depth: depth,
            lastUpdated: lastUpdated,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$WotScoreTableTableProcessedTableManager = ProcessedTableManager<
    _$NostrDatabase,
    $WotScoreTableTable,
    WotScoreTableData,
    $$WotScoreTableTableFilterComposer,
    $$WotScoreTableTableOrderingComposer,
    $$WotScoreTableTableAnnotationComposer,
    $$WotScoreTableTableCreateCompanionBuilder,
    $$WotScoreTableTableUpdateCompanionBuilder,
    (
      WotScoreTableData,
      BaseReferences<_$NostrDatabase, $WotScoreTableTable, WotScoreTableData>
    ),
    WotScoreTableData,
    PrefetchHooks Function()>;

class $NostrDatabaseManager {
  final _$NostrDatabase _db;
  $NostrDatabaseManager(this._db);
  $$EventTableTableTableManager get eventTable =>
      $$EventTableTableTableManager(_db, _db.eventTable);
  $$MetadataTableTableTableManager get metadataTable =>
      $$MetadataTableTableTableManager(_db, _db.metadataTable);
  $$ContactListTableTableTableManager get contactListTable =>
      $$ContactListTableTableTableManager(_db, _db.contactListTable);
  $$MuteListTableTableTableManager get muteListTable =>
      $$MuteListTableTableTableManager(_db, _db.muteListTable);
  $$UserRelayListTableTableTableManager get userRelayListTable =>
      $$UserRelayListTableTableTableManager(_db, _db.userRelayListTable);
  $$RelaySetTableTableTableManager get relaySetTable =>
      $$RelaySetTableTableTableManager(_db, _db.relaySetTable);
  $$EventStatsTableTableTableManager get eventStatsTable =>
      $$EventStatsTableTableTableManager(_db, _db.eventStatsTable);
  $$Nip05TableTableTableManager get nip05Table =>
      $$Nip05TableTableTableManager(_db, _db.nip05Table);
  $$DmSessionInfosTableTableTableManager get dmSessionInfosTable =>
      $$DmSessionInfosTableTableTableManager(_db, _db.dmSessionInfosTable);
  $$UserFollowersTableTableTableManager get userFollowersTable =>
      $$UserFollowersTableTableTableManager(_db, _db.userFollowersTable);
  $$UserDraftTableTableTableManager get userDraftTable =>
      $$UserDraftTableTableTableManager(_db, _db.userDraftTable);
  $$UserAppSettingsTableTableTableManager get userAppSettingsTable =>
      $$UserAppSettingsTableTableTableManager(_db, _db.userAppSettingsTable);
  $$UserWotTableTableTableManager get userWotTable =>
      $$UserWotTableTableTableManager(_db, _db.userWotTable);
  $$WotScoreTableTableTableManager get wotScoreTable =>
      $$WotScoreTableTableTableManager(_db, _db.wotScoreTable);
}
