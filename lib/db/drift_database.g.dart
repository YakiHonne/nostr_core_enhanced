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
  late final GeneratedColumnWithTypeConverter<List<String>, String> tTags =
      GeneratedColumn<String>('t_tags', aliasedName, false,
              type: DriftSqlType.string,
              requiredDuringInsert: false,
              defaultValue: const Constant('[]'))
          .withConverter<List<String>>($EventTableTable.$convertertTags);
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> pTags =
      GeneratedColumn<String>('p_tags', aliasedName, false,
              type: DriftSqlType.string,
              requiredDuringInsert: false,
              defaultValue: const Constant('[]'))
          .withConverter<List<String>>($EventTableTable.$converterpTags);
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String>
      capitalpTags = GeneratedColumn<String>(
              'capitalp_tags', aliasedName, false,
              type: DriftSqlType.string,
              requiredDuringInsert: false,
              defaultValue: const Constant('[]'))
          .withConverter<List<String>>($EventTableTable.$convertercapitalpTags);
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> kTags =
      GeneratedColumn<String>('k_tags', aliasedName, false,
              type: DriftSqlType.string,
              requiredDuringInsert: false,
              defaultValue: const Constant('[]'))
          .withConverter<List<String>>($EventTableTable.$converterkTags);
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> eTags =
      GeneratedColumn<String>('e_tags', aliasedName, false,
              type: DriftSqlType.string,
              requiredDuringInsert: false,
              defaultValue: const Constant('[]'))
          .withConverter<List<String>>($EventTableTable.$convertereTags);
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> lTags =
      GeneratedColumn<String>('l_tags', aliasedName, false,
              type: DriftSqlType.string,
              requiredDuringInsert: false,
              defaultValue: const Constant('[]'))
          .withConverter<List<String>>($EventTableTable.$converterlTags);
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> aTags =
      GeneratedColumn<String>('a_tags', aliasedName, false,
              type: DriftSqlType.string,
              requiredDuringInsert: false,
              defaultValue: const Constant('[]'))
          .withConverter<List<String>>($EventTableTable.$converteraTags);
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> cTags =
      GeneratedColumn<String>('c_tags', aliasedName, false,
              type: DriftSqlType.string,
              requiredDuringInsert: false,
              defaultValue: const Constant('[]'))
          .withConverter<List<String>>($EventTableTable.$convertercTags);
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> qTags =
      GeneratedColumn<String>('q_tags', aliasedName, false,
              type: DriftSqlType.string,
              requiredDuringInsert: false,
              defaultValue: const Constant('[]'))
          .withConverter<List<String>>($EventTableTable.$converterqTags);
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
        cTags,
        qTags,
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
      cTags: $EventTableTable.$convertercTags.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}c_tags'])!),
      qTags: $EventTableTable.$converterqTags.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}q_tags'])!),
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
  static TypeConverter<List<String>, String> $convertertTags =
      const StringListConverter();
  static TypeConverter<List<String>, String> $converterpTags =
      const StringListConverter();
  static TypeConverter<List<String>, String> $convertercapitalpTags =
      const StringListConverter();
  static TypeConverter<List<String>, String> $converterkTags =
      const StringListConverter();
  static TypeConverter<List<String>, String> $convertereTags =
      const StringListConverter();
  static TypeConverter<List<String>, String> $converterlTags =
      const StringListConverter();
  static TypeConverter<List<String>, String> $converteraTags =
      const StringListConverter();
  static TypeConverter<List<String>, String> $convertercTags =
      const StringListConverter();
  static TypeConverter<List<String>, String> $converterqTags =
      const StringListConverter();
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
  final List<String> tTags;
  final List<String> pTags;
  final List<String> capitalpTags;
  final List<String> kTags;
  final List<String> eTags;
  final List<String> lTags;
  final List<String> aTags;
  final List<String> cTags;
  final List<String> qTags;
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
      required this.cTags,
      required this.qTags,
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
      map['c_tags'] =
          Variable<String>($EventTableTable.$convertercTags.toSql(cTags));
    }
    {
      map['q_tags'] =
          Variable<String>($EventTableTable.$converterqTags.toSql(qTags));
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
      cTags: Value(cTags),
      qTags: Value(qTags),
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
      tTags: serializer.fromJson<List<String>>(json['tTags']),
      pTags: serializer.fromJson<List<String>>(json['pTags']),
      capitalpTags: serializer.fromJson<List<String>>(json['capitalpTags']),
      kTags: serializer.fromJson<List<String>>(json['kTags']),
      eTags: serializer.fromJson<List<String>>(json['eTags']),
      lTags: serializer.fromJson<List<String>>(json['lTags']),
      aTags: serializer.fromJson<List<String>>(json['aTags']),
      cTags: serializer.fromJson<List<String>>(json['cTags']),
      qTags: serializer.fromJson<List<String>>(json['qTags']),
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
      'tTags': serializer.toJson<List<String>>(tTags),
      'pTags': serializer.toJson<List<String>>(pTags),
      'capitalpTags': serializer.toJson<List<String>>(capitalpTags),
      'kTags': serializer.toJson<List<String>>(kTags),
      'eTags': serializer.toJson<List<String>>(eTags),
      'lTags': serializer.toJson<List<String>>(lTags),
      'aTags': serializer.toJson<List<String>>(aTags),
      'cTags': serializer.toJson<List<String>>(cTags),
      'qTags': serializer.toJson<List<String>>(qTags),
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
          List<String>? tTags,
          List<String>? pTags,
          List<String>? capitalpTags,
          List<String>? kTags,
          List<String>? eTags,
          List<String>? lTags,
          List<String>? aTags,
          List<String>? cTags,
          List<String>? qTags,
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
        cTags: cTags ?? this.cTags,
        qTags: qTags ?? this.qTags,
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
      cTags: data.cTags.present ? data.cTags.value : this.cTags,
      qTags: data.qTags.present ? data.qTags.value : this.qTags,
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
          ..write('cTags: $cTags, ')
          ..write('qTags: $qTags, ')
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
        cTags,
        qTags,
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
          other.cTags == this.cTags &&
          other.qTags == this.qTags &&
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
  final Value<List<String>> tTags;
  final Value<List<String>> pTags;
  final Value<List<String>> capitalpTags;
  final Value<List<String>> kTags;
  final Value<List<String>> eTags;
  final Value<List<String>> lTags;
  final Value<List<String>> aTags;
  final Value<List<String>> cTags;
  final Value<List<String>> qTags;
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
    this.cTags = const Value.absent(),
    this.qTags = const Value.absent(),
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
    this.cTags = const Value.absent(),
    this.qTags = const Value.absent(),
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
    Expression<String>? cTags,
    Expression<String>? qTags,
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
      if (cTags != null) 'c_tags': cTags,
      if (qTags != null) 'q_tags': qTags,
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
      Value<List<String>>? tTags,
      Value<List<String>>? pTags,
      Value<List<String>>? capitalpTags,
      Value<List<String>>? kTags,
      Value<List<String>>? eTags,
      Value<List<String>>? lTags,
      Value<List<String>>? aTags,
      Value<List<String>>? cTags,
      Value<List<String>>? qTags,
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
      cTags: cTags ?? this.cTags,
      qTags: qTags ?? this.qTags,
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
    if (cTags.present) {
      map['c_tags'] =
          Variable<String>($EventTableTable.$convertercTags.toSql(cTags.value));
    }
    if (qTags.present) {
      map['q_tags'] =
          Variable<String>($EventTableTable.$converterqTags.toSql(qTags.value));
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
          ..write('cTags: $cTags, ')
          ..write('qTags: $qTags, ')
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
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> mutes =
      GeneratedColumn<String>('mutes', aliasedName, false,
              type: DriftSqlType.string,
              requiredDuringInsert: false,
              defaultValue: const Constant('[]'))
          .withConverter<List<String>>($MuteListTableTable.$convertermutes);
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
  List<GeneratedColumn> get $columns =>
      [pubkey, mutes, createdAt, loadedTimestamp];
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
  MuteListTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MuteListTableData(
      pubkey: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}pubkey'])!,
      mutes: $MuteListTableTable.$convertermutes.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}mutes'])!),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}created_at'])!,
      loadedTimestamp: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}loaded_timestamp']),
    );
  }

  @override
  $MuteListTableTable createAlias(String alias) {
    return $MuteListTableTable(attachedDatabase, alias);
  }

  static TypeConverter<List<String>, String> $convertermutes =
      const StringListConverter();
}

class MuteListTableData extends DataClass
    implements Insertable<MuteListTableData> {
  final String pubkey;
  final List<String> mutes;
  final int createdAt;
  final int? loadedTimestamp;
  const MuteListTableData(
      {required this.pubkey,
      required this.mutes,
      required this.createdAt,
      this.loadedTimestamp});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['pubkey'] = Variable<String>(pubkey);
    {
      map['mutes'] =
          Variable<String>($MuteListTableTable.$convertermutes.toSql(mutes));
    }
    map['created_at'] = Variable<int>(createdAt);
    if (!nullToAbsent || loadedTimestamp != null) {
      map['loaded_timestamp'] = Variable<int>(loadedTimestamp);
    }
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
    );
  }

  factory MuteListTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MuteListTableData(
      pubkey: serializer.fromJson<String>(json['pubkey']),
      mutes: serializer.fromJson<List<String>>(json['mutes']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      loadedTimestamp: serializer.fromJson<int?>(json['loadedTimestamp']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'pubkey': serializer.toJson<String>(pubkey),
      'mutes': serializer.toJson<List<String>>(mutes),
      'createdAt': serializer.toJson<int>(createdAt),
      'loadedTimestamp': serializer.toJson<int?>(loadedTimestamp),
    };
  }

  MuteListTableData copyWith(
          {String? pubkey,
          List<String>? mutes,
          int? createdAt,
          Value<int?> loadedTimestamp = const Value.absent()}) =>
      MuteListTableData(
        pubkey: pubkey ?? this.pubkey,
        mutes: mutes ?? this.mutes,
        createdAt: createdAt ?? this.createdAt,
        loadedTimestamp: loadedTimestamp.present
            ? loadedTimestamp.value
            : this.loadedTimestamp,
      );
  MuteListTableData copyWithCompanion(MuteListTableCompanion data) {
    return MuteListTableData(
      pubkey: data.pubkey.present ? data.pubkey.value : this.pubkey,
      mutes: data.mutes.present ? data.mutes.value : this.mutes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      loadedTimestamp: data.loadedTimestamp.present
          ? data.loadedTimestamp.value
          : this.loadedTimestamp,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MuteListTableData(')
          ..write('pubkey: $pubkey, ')
          ..write('mutes: $mutes, ')
          ..write('createdAt: $createdAt, ')
          ..write('loadedTimestamp: $loadedTimestamp')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(pubkey, mutes, createdAt, loadedTimestamp);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MuteListTableData &&
          other.pubkey == this.pubkey &&
          other.mutes == this.mutes &&
          other.createdAt == this.createdAt &&
          other.loadedTimestamp == this.loadedTimestamp);
}

class MuteListTableCompanion extends UpdateCompanion<MuteListTableData> {
  final Value<String> pubkey;
  final Value<List<String>> mutes;
  final Value<int> createdAt;
  final Value<int?> loadedTimestamp;
  final Value<int> rowid;
  const MuteListTableCompanion({
    this.pubkey = const Value.absent(),
    this.mutes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.loadedTimestamp = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MuteListTableCompanion.insert({
    required String pubkey,
    this.mutes = const Value.absent(),
    required int createdAt,
    this.loadedTimestamp = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : pubkey = Value(pubkey),
        createdAt = Value(createdAt);
  static Insertable<MuteListTableData> custom({
    Expression<String>? pubkey,
    Expression<String>? mutes,
    Expression<int>? createdAt,
    Expression<int>? loadedTimestamp,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (pubkey != null) 'pubkey': pubkey,
      if (mutes != null) 'mutes': mutes,
      if (createdAt != null) 'created_at': createdAt,
      if (loadedTimestamp != null) 'loaded_timestamp': loadedTimestamp,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MuteListTableCompanion copyWith(
      {Value<String>? pubkey,
      Value<List<String>>? mutes,
      Value<int>? createdAt,
      Value<int?>? loadedTimestamp,
      Value<int>? rowid}) {
    return MuteListTableCompanion(
      pubkey: pubkey ?? this.pubkey,
      mutes: mutes ?? this.mutes,
      createdAt: createdAt ?? this.createdAt,
      loadedTimestamp: loadedTimestamp ?? this.loadedTimestamp,
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
      map['mutes'] = Variable<String>(
          $MuteListTableTable.$convertermutes.toSql(mutes.value));
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (loadedTimestamp.present) {
      map['loaded_timestamp'] = Variable<int>(loadedTimestamp.value);
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
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
      'created_at', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _refreshedTimestampMeta =
      const VerificationMeta('refreshedTimestamp');
  @override
  late final GeneratedColumn<int> refreshedTimestamp = GeneratedColumn<int>(
      'refreshed_timestamp', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _relaysMeta = const VerificationMeta('relays');
  @override
  late final GeneratedColumn<String> relays = GeneratedColumn<String>(
      'relays', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [pubkey, createdAt, refreshedTimestamp, relays];
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
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('refreshed_timestamp')) {
      context.handle(
          _refreshedTimestampMeta,
          refreshedTimestamp.isAcceptableOrUnknown(
              data['refreshed_timestamp']!, _refreshedTimestampMeta));
    } else if (isInserting) {
      context.missing(_refreshedTimestampMeta);
    }
    if (data.containsKey('relays')) {
      context.handle(_relaysMeta,
          relays.isAcceptableOrUnknown(data['relays']!, _relaysMeta));
    } else if (isInserting) {
      context.missing(_relaysMeta);
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
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}created_at'])!,
      refreshedTimestamp: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}refreshed_timestamp'])!,
      relays: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}relays'])!,
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
  final int createdAt;
  final int refreshedTimestamp;
  final String relays;
  const UserRelayListTableData(
      {required this.pubkey,
      required this.createdAt,
      required this.refreshedTimestamp,
      required this.relays});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['pubkey'] = Variable<String>(pubkey);
    map['created_at'] = Variable<int>(createdAt);
    map['refreshed_timestamp'] = Variable<int>(refreshedTimestamp);
    map['relays'] = Variable<String>(relays);
    return map;
  }

  UserRelayListTableCompanion toCompanion(bool nullToAbsent) {
    return UserRelayListTableCompanion(
      pubkey: Value(pubkey),
      createdAt: Value(createdAt),
      refreshedTimestamp: Value(refreshedTimestamp),
      relays: Value(relays),
    );
  }

  factory UserRelayListTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserRelayListTableData(
      pubkey: serializer.fromJson<String>(json['pubkey']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      refreshedTimestamp: serializer.fromJson<int>(json['refreshedTimestamp']),
      relays: serializer.fromJson<String>(json['relays']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'pubkey': serializer.toJson<String>(pubkey),
      'createdAt': serializer.toJson<int>(createdAt),
      'refreshedTimestamp': serializer.toJson<int>(refreshedTimestamp),
      'relays': serializer.toJson<String>(relays),
    };
  }

  UserRelayListTableData copyWith(
          {String? pubkey,
          int? createdAt,
          int? refreshedTimestamp,
          String? relays}) =>
      UserRelayListTableData(
        pubkey: pubkey ?? this.pubkey,
        createdAt: createdAt ?? this.createdAt,
        refreshedTimestamp: refreshedTimestamp ?? this.refreshedTimestamp,
        relays: relays ?? this.relays,
      );
  UserRelayListTableData copyWithCompanion(UserRelayListTableCompanion data) {
    return UserRelayListTableData(
      pubkey: data.pubkey.present ? data.pubkey.value : this.pubkey,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      refreshedTimestamp: data.refreshedTimestamp.present
          ? data.refreshedTimestamp.value
          : this.refreshedTimestamp,
      relays: data.relays.present ? data.relays.value : this.relays,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserRelayListTableData(')
          ..write('pubkey: $pubkey, ')
          ..write('createdAt: $createdAt, ')
          ..write('refreshedTimestamp: $refreshedTimestamp, ')
          ..write('relays: $relays')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(pubkey, createdAt, refreshedTimestamp, relays);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserRelayListTableData &&
          other.pubkey == this.pubkey &&
          other.createdAt == this.createdAt &&
          other.refreshedTimestamp == this.refreshedTimestamp &&
          other.relays == this.relays);
}

class UserRelayListTableCompanion
    extends UpdateCompanion<UserRelayListTableData> {
  final Value<String> pubkey;
  final Value<int> createdAt;
  final Value<int> refreshedTimestamp;
  final Value<String> relays;
  final Value<int> rowid;
  const UserRelayListTableCompanion({
    this.pubkey = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.refreshedTimestamp = const Value.absent(),
    this.relays = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserRelayListTableCompanion.insert({
    required String pubkey,
    required int createdAt,
    required int refreshedTimestamp,
    required String relays,
    this.rowid = const Value.absent(),
  })  : pubkey = Value(pubkey),
        createdAt = Value(createdAt),
        refreshedTimestamp = Value(refreshedTimestamp),
        relays = Value(relays);
  static Insertable<UserRelayListTableData> custom({
    Expression<String>? pubkey,
    Expression<int>? createdAt,
    Expression<int>? refreshedTimestamp,
    Expression<String>? relays,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (pubkey != null) 'pubkey': pubkey,
      if (createdAt != null) 'created_at': createdAt,
      if (refreshedTimestamp != null) 'refreshed_timestamp': refreshedTimestamp,
      if (relays != null) 'relays': relays,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserRelayListTableCompanion copyWith(
      {Value<String>? pubkey,
      Value<int>? createdAt,
      Value<int>? refreshedTimestamp,
      Value<String>? relays,
      Value<int>? rowid}) {
    return UserRelayListTableCompanion(
      pubkey: pubkey ?? this.pubkey,
      createdAt: createdAt ?? this.createdAt,
      refreshedTimestamp: refreshedTimestamp ?? this.refreshedTimestamp,
      relays: relays ?? this.relays,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (pubkey.present) {
      map['pubkey'] = Variable<String>(pubkey.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (refreshedTimestamp.present) {
      map['refreshed_timestamp'] = Variable<int>(refreshedTimestamp.value);
    }
    if (relays.present) {
      map['relays'] = Variable<String>(relays.value);
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
          ..write('createdAt: $createdAt, ')
          ..write('refreshedTimestamp: $refreshedTimestamp, ')
          ..write('relays: $relays, ')
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
  static const VerificationMeta _relaysMapMeta =
      const VerificationMeta('relaysMap');
  @override
  late final GeneratedColumn<String> relaysMap = GeneratedColumn<String>(
      'relays_map', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('{}'));
  static const VerificationMeta _directionMeta =
      const VerificationMeta('direction');
  @override
  late final GeneratedColumn<String> direction = GeneratedColumn<String>(
      'direction', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _relayMinCountPerPubkeyMeta =
      const VerificationMeta('relayMinCountPerPubkey');
  @override
  late final GeneratedColumn<int> relayMinCountPerPubkey = GeneratedColumn<int>(
      'relay_min_count_per_pubkey', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, pubkey, relaysMap, direction, relayMinCountPerPubkey];
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
    if (data.containsKey('relays_map')) {
      context.handle(_relaysMapMeta,
          relaysMap.isAcceptableOrUnknown(data['relays_map']!, _relaysMapMeta));
    }
    if (data.containsKey('direction')) {
      context.handle(_directionMeta,
          direction.isAcceptableOrUnknown(data['direction']!, _directionMeta));
    } else if (isInserting) {
      context.missing(_directionMeta);
    }
    if (data.containsKey('relay_min_count_per_pubkey')) {
      context.handle(
          _relayMinCountPerPubkeyMeta,
          relayMinCountPerPubkey.isAcceptableOrUnknown(
              data['relay_min_count_per_pubkey']!,
              _relayMinCountPerPubkeyMeta));
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
      relaysMap: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}relays_map'])!,
      direction: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}direction'])!,
      relayMinCountPerPubkey: attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}relay_min_count_per_pubkey'])!,
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
  final String relaysMap;
  final String direction;
  final int relayMinCountPerPubkey;
  const RelaySetTableData(
      {required this.id,
      required this.name,
      required this.pubkey,
      required this.relaysMap,
      required this.direction,
      required this.relayMinCountPerPubkey});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['pubkey'] = Variable<String>(pubkey);
    map['relays_map'] = Variable<String>(relaysMap);
    map['direction'] = Variable<String>(direction);
    map['relay_min_count_per_pubkey'] = Variable<int>(relayMinCountPerPubkey);
    return map;
  }

  RelaySetTableCompanion toCompanion(bool nullToAbsent) {
    return RelaySetTableCompanion(
      id: Value(id),
      name: Value(name),
      pubkey: Value(pubkey),
      relaysMap: Value(relaysMap),
      direction: Value(direction),
      relayMinCountPerPubkey: Value(relayMinCountPerPubkey),
    );
  }

  factory RelaySetTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RelaySetTableData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      pubkey: serializer.fromJson<String>(json['pubkey']),
      relaysMap: serializer.fromJson<String>(json['relaysMap']),
      direction: serializer.fromJson<String>(json['direction']),
      relayMinCountPerPubkey:
          serializer.fromJson<int>(json['relayMinCountPerPubkey']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'pubkey': serializer.toJson<String>(pubkey),
      'relaysMap': serializer.toJson<String>(relaysMap),
      'direction': serializer.toJson<String>(direction),
      'relayMinCountPerPubkey': serializer.toJson<int>(relayMinCountPerPubkey),
    };
  }

  RelaySetTableData copyWith(
          {String? id,
          String? name,
          String? pubkey,
          String? relaysMap,
          String? direction,
          int? relayMinCountPerPubkey}) =>
      RelaySetTableData(
        id: id ?? this.id,
        name: name ?? this.name,
        pubkey: pubkey ?? this.pubkey,
        relaysMap: relaysMap ?? this.relaysMap,
        direction: direction ?? this.direction,
        relayMinCountPerPubkey:
            relayMinCountPerPubkey ?? this.relayMinCountPerPubkey,
      );
  RelaySetTableData copyWithCompanion(RelaySetTableCompanion data) {
    return RelaySetTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      pubkey: data.pubkey.present ? data.pubkey.value : this.pubkey,
      relaysMap: data.relaysMap.present ? data.relaysMap.value : this.relaysMap,
      direction: data.direction.present ? data.direction.value : this.direction,
      relayMinCountPerPubkey: data.relayMinCountPerPubkey.present
          ? data.relayMinCountPerPubkey.value
          : this.relayMinCountPerPubkey,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RelaySetTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('pubkey: $pubkey, ')
          ..write('relaysMap: $relaysMap, ')
          ..write('direction: $direction, ')
          ..write('relayMinCountPerPubkey: $relayMinCountPerPubkey')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, name, pubkey, relaysMap, direction, relayMinCountPerPubkey);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RelaySetTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.pubkey == this.pubkey &&
          other.relaysMap == this.relaysMap &&
          other.direction == this.direction &&
          other.relayMinCountPerPubkey == this.relayMinCountPerPubkey);
}

class RelaySetTableCompanion extends UpdateCompanion<RelaySetTableData> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> pubkey;
  final Value<String> relaysMap;
  final Value<String> direction;
  final Value<int> relayMinCountPerPubkey;
  final Value<int> rowid;
  const RelaySetTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.pubkey = const Value.absent(),
    this.relaysMap = const Value.absent(),
    this.direction = const Value.absent(),
    this.relayMinCountPerPubkey = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RelaySetTableCompanion.insert({
    required String id,
    required String name,
    required String pubkey,
    this.relaysMap = const Value.absent(),
    required String direction,
    this.relayMinCountPerPubkey = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        pubkey = Value(pubkey),
        direction = Value(direction);
  static Insertable<RelaySetTableData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? pubkey,
    Expression<String>? relaysMap,
    Expression<String>? direction,
    Expression<int>? relayMinCountPerPubkey,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (pubkey != null) 'pubkey': pubkey,
      if (relaysMap != null) 'relays_map': relaysMap,
      if (direction != null) 'direction': direction,
      if (relayMinCountPerPubkey != null)
        'relay_min_count_per_pubkey': relayMinCountPerPubkey,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RelaySetTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String>? pubkey,
      Value<String>? relaysMap,
      Value<String>? direction,
      Value<int>? relayMinCountPerPubkey,
      Value<int>? rowid}) {
    return RelaySetTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      pubkey: pubkey ?? this.pubkey,
      relaysMap: relaysMap ?? this.relaysMap,
      direction: direction ?? this.direction,
      relayMinCountPerPubkey:
          relayMinCountPerPubkey ?? this.relayMinCountPerPubkey,
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
    if (relaysMap.present) {
      map['relays_map'] = Variable<String>(relaysMap.value);
    }
    if (direction.present) {
      map['direction'] = Variable<String>(direction.value);
    }
    if (relayMinCountPerPubkey.present) {
      map['relay_min_count_per_pubkey'] =
          Variable<int>(relayMinCountPerPubkey.value);
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
          ..write('relaysMap: $relaysMap, ')
          ..write('direction: $direction, ')
          ..write('relayMinCountPerPubkey: $relayMinCountPerPubkey, ')
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
  @override
  late final GeneratedColumnWithTypeConverter<Map<String, String>, String>
      replies = GeneratedColumn<String>('replies', aliasedName, false,
              type: DriftSqlType.string,
              requiredDuringInsert: false,
              defaultValue: const Constant('{}'))
          .withConverter<Map<String, String>>(
              $EventStatsTableTable.$converterreplies);
  @override
  late final GeneratedColumnWithTypeConverter<Map<String, String>, String>
      reposts = GeneratedColumn<String>('reposts', aliasedName, false,
              type: DriftSqlType.string,
              requiredDuringInsert: false,
              defaultValue: const Constant('{}'))
          .withConverter<Map<String, String>>(
              $EventStatsTableTable.$converterreposts);
  @override
  late final GeneratedColumnWithTypeConverter<Map<String, String>, String>
      reactions = GeneratedColumn<String>('reactions', aliasedName, false,
              type: DriftSqlType.string,
              requiredDuringInsert: false,
              defaultValue: const Constant('{}'))
          .withConverter<Map<String, String>>(
              $EventStatsTableTable.$converterreactions);
  @override
  late final GeneratedColumnWithTypeConverter<Map<String, String>, String>
      quotes = GeneratedColumn<String>('quotes', aliasedName, false,
              type: DriftSqlType.string,
              requiredDuringInsert: false,
              defaultValue: const Constant('{}'))
          .withConverter<Map<String, String>>(
              $EventStatsTableTable.$converterquotes);
  @override
  late final GeneratedColumnWithTypeConverter<Map<String, Map<String, int>>,
      String> zaps = GeneratedColumn<String>('zaps', aliasedName, false,
          type: DriftSqlType.string,
          requiredDuringInsert: false,
          defaultValue: const Constant('{}'))
      .withConverter<Map<String, Map<String, int>>>(
          $EventStatsTableTable.$converterzaps);
  static const VerificationMeta _newestCreatedAtMeta =
      const VerificationMeta('newestCreatedAt');
  @override
  late final GeneratedColumn<int> newestCreatedAt = GeneratedColumn<int>(
      'newest_created_at', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, replies, reposts, reactions, quotes, zaps, newestCreatedAt];
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
    if (data.containsKey('newest_created_at')) {
      context.handle(
          _newestCreatedAtMeta,
          newestCreatedAt.isAcceptableOrUnknown(
              data['newest_created_at']!, _newestCreatedAtMeta));
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
      replies: $EventStatsTableTable.$converterreplies.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}replies'])!),
      reposts: $EventStatsTableTable.$converterreposts.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}reposts'])!),
      reactions: $EventStatsTableTable.$converterreactions.fromSql(
          attachedDatabase.typeMapping
              .read(DriftSqlType.string, data['${effectivePrefix}reactions'])!),
      quotes: $EventStatsTableTable.$converterquotes.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}quotes'])!),
      zaps: $EventStatsTableTable.$converterzaps.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}zaps'])!),
      newestCreatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}newest_created_at']),
    );
  }

  @override
  $EventStatsTableTable createAlias(String alias) {
    return $EventStatsTableTable(attachedDatabase, alias);
  }

  static TypeConverter<Map<String, String>, String> $converterreplies =
      const StringMapConverter();
  static TypeConverter<Map<String, String>, String> $converterreposts =
      const StringMapConverter();
  static TypeConverter<Map<String, String>, String> $converterreactions =
      const StringMapConverter();
  static TypeConverter<Map<String, String>, String> $converterquotes =
      const StringMapConverter();
  static TypeConverter<Map<String, Map<String, int>>, String> $converterzaps =
      const NestedMapIntConverter();
}

class EventStatsTableData extends DataClass
    implements Insertable<EventStatsTableData> {
  final String id;
  final Map<String, String> replies;
  final Map<String, String> reposts;
  final Map<String, String> reactions;
  final Map<String, String> quotes;
  final Map<String, Map<String, int>> zaps;
  final int? newestCreatedAt;
  const EventStatsTableData(
      {required this.id,
      required this.replies,
      required this.reposts,
      required this.reactions,
      required this.quotes,
      required this.zaps,
      this.newestCreatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    {
      map['replies'] = Variable<String>(
          $EventStatsTableTable.$converterreplies.toSql(replies));
    }
    {
      map['reposts'] = Variable<String>(
          $EventStatsTableTable.$converterreposts.toSql(reposts));
    }
    {
      map['reactions'] = Variable<String>(
          $EventStatsTableTable.$converterreactions.toSql(reactions));
    }
    {
      map['quotes'] = Variable<String>(
          $EventStatsTableTable.$converterquotes.toSql(quotes));
    }
    {
      map['zaps'] =
          Variable<String>($EventStatsTableTable.$converterzaps.toSql(zaps));
    }
    if (!nullToAbsent || newestCreatedAt != null) {
      map['newest_created_at'] = Variable<int>(newestCreatedAt);
    }
    return map;
  }

  EventStatsTableCompanion toCompanion(bool nullToAbsent) {
    return EventStatsTableCompanion(
      id: Value(id),
      replies: Value(replies),
      reposts: Value(reposts),
      reactions: Value(reactions),
      quotes: Value(quotes),
      zaps: Value(zaps),
      newestCreatedAt: newestCreatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(newestCreatedAt),
    );
  }

  factory EventStatsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EventStatsTableData(
      id: serializer.fromJson<String>(json['id']),
      replies: serializer.fromJson<Map<String, String>>(json['replies']),
      reposts: serializer.fromJson<Map<String, String>>(json['reposts']),
      reactions: serializer.fromJson<Map<String, String>>(json['reactions']),
      quotes: serializer.fromJson<Map<String, String>>(json['quotes']),
      zaps: serializer.fromJson<Map<String, Map<String, int>>>(json['zaps']),
      newestCreatedAt: serializer.fromJson<int?>(json['newestCreatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'replies': serializer.toJson<Map<String, String>>(replies),
      'reposts': serializer.toJson<Map<String, String>>(reposts),
      'reactions': serializer.toJson<Map<String, String>>(reactions),
      'quotes': serializer.toJson<Map<String, String>>(quotes),
      'zaps': serializer.toJson<Map<String, Map<String, int>>>(zaps),
      'newestCreatedAt': serializer.toJson<int?>(newestCreatedAt),
    };
  }

  EventStatsTableData copyWith(
          {String? id,
          Map<String, String>? replies,
          Map<String, String>? reposts,
          Map<String, String>? reactions,
          Map<String, String>? quotes,
          Map<String, Map<String, int>>? zaps,
          Value<int?> newestCreatedAt = const Value.absent()}) =>
      EventStatsTableData(
        id: id ?? this.id,
        replies: replies ?? this.replies,
        reposts: reposts ?? this.reposts,
        reactions: reactions ?? this.reactions,
        quotes: quotes ?? this.quotes,
        zaps: zaps ?? this.zaps,
        newestCreatedAt: newestCreatedAt.present
            ? newestCreatedAt.value
            : this.newestCreatedAt,
      );
  EventStatsTableData copyWithCompanion(EventStatsTableCompanion data) {
    return EventStatsTableData(
      id: data.id.present ? data.id.value : this.id,
      replies: data.replies.present ? data.replies.value : this.replies,
      reposts: data.reposts.present ? data.reposts.value : this.reposts,
      reactions: data.reactions.present ? data.reactions.value : this.reactions,
      quotes: data.quotes.present ? data.quotes.value : this.quotes,
      zaps: data.zaps.present ? data.zaps.value : this.zaps,
      newestCreatedAt: data.newestCreatedAt.present
          ? data.newestCreatedAt.value
          : this.newestCreatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EventStatsTableData(')
          ..write('id: $id, ')
          ..write('replies: $replies, ')
          ..write('reposts: $reposts, ')
          ..write('reactions: $reactions, ')
          ..write('quotes: $quotes, ')
          ..write('zaps: $zaps, ')
          ..write('newestCreatedAt: $newestCreatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, replies, reposts, reactions, quotes, zaps, newestCreatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EventStatsTableData &&
          other.id == this.id &&
          other.replies == this.replies &&
          other.reposts == this.reposts &&
          other.reactions == this.reactions &&
          other.quotes == this.quotes &&
          other.zaps == this.zaps &&
          other.newestCreatedAt == this.newestCreatedAt);
}

class EventStatsTableCompanion extends UpdateCompanion<EventStatsTableData> {
  final Value<String> id;
  final Value<Map<String, String>> replies;
  final Value<Map<String, String>> reposts;
  final Value<Map<String, String>> reactions;
  final Value<Map<String, String>> quotes;
  final Value<Map<String, Map<String, int>>> zaps;
  final Value<int?> newestCreatedAt;
  final Value<int> rowid;
  const EventStatsTableCompanion({
    this.id = const Value.absent(),
    this.replies = const Value.absent(),
    this.reposts = const Value.absent(),
    this.reactions = const Value.absent(),
    this.quotes = const Value.absent(),
    this.zaps = const Value.absent(),
    this.newestCreatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  EventStatsTableCompanion.insert({
    required String id,
    this.replies = const Value.absent(),
    this.reposts = const Value.absent(),
    this.reactions = const Value.absent(),
    this.quotes = const Value.absent(),
    this.zaps = const Value.absent(),
    this.newestCreatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id);
  static Insertable<EventStatsTableData> custom({
    Expression<String>? id,
    Expression<String>? replies,
    Expression<String>? reposts,
    Expression<String>? reactions,
    Expression<String>? quotes,
    Expression<String>? zaps,
    Expression<int>? newestCreatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (replies != null) 'replies': replies,
      if (reposts != null) 'reposts': reposts,
      if (reactions != null) 'reactions': reactions,
      if (quotes != null) 'quotes': quotes,
      if (zaps != null) 'zaps': zaps,
      if (newestCreatedAt != null) 'newest_created_at': newestCreatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  EventStatsTableCompanion copyWith(
      {Value<String>? id,
      Value<Map<String, String>>? replies,
      Value<Map<String, String>>? reposts,
      Value<Map<String, String>>? reactions,
      Value<Map<String, String>>? quotes,
      Value<Map<String, Map<String, int>>>? zaps,
      Value<int?>? newestCreatedAt,
      Value<int>? rowid}) {
    return EventStatsTableCompanion(
      id: id ?? this.id,
      replies: replies ?? this.replies,
      reposts: reposts ?? this.reposts,
      reactions: reactions ?? this.reactions,
      quotes: quotes ?? this.quotes,
      zaps: zaps ?? this.zaps,
      newestCreatedAt: newestCreatedAt ?? this.newestCreatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (replies.present) {
      map['replies'] = Variable<String>(
          $EventStatsTableTable.$converterreplies.toSql(replies.value));
    }
    if (reposts.present) {
      map['reposts'] = Variable<String>(
          $EventStatsTableTable.$converterreposts.toSql(reposts.value));
    }
    if (reactions.present) {
      map['reactions'] = Variable<String>(
          $EventStatsTableTable.$converterreactions.toSql(reactions.value));
    }
    if (quotes.present) {
      map['quotes'] = Variable<String>(
          $EventStatsTableTable.$converterquotes.toSql(quotes.value));
    }
    if (zaps.present) {
      map['zaps'] = Variable<String>(
          $EventStatsTableTable.$converterzaps.toSql(zaps.value));
    }
    if (newestCreatedAt.present) {
      map['newest_created_at'] = Variable<int>(newestCreatedAt.value);
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
          ..write('replies: $replies, ')
          ..write('reposts: $reposts, ')
          ..write('reactions: $reactions, ')
          ..write('quotes: $quotes, ')
          ..write('zaps: $zaps, ')
          ..write('newestCreatedAt: $newestCreatedAt, ')
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
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [nip05, pubkey, valid, updatedAt];
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
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {pubkey};
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
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}updated_at'])!,
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
  final int updatedAt;
  const Nip05TableData(
      {required this.nip05,
      required this.pubkey,
      required this.valid,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['nip05'] = Variable<String>(nip05);
    map['pubkey'] = Variable<String>(pubkey);
    map['valid'] = Variable<bool>(valid);
    map['updated_at'] = Variable<int>(updatedAt);
    return map;
  }

  Nip05TableCompanion toCompanion(bool nullToAbsent) {
    return Nip05TableCompanion(
      nip05: Value(nip05),
      pubkey: Value(pubkey),
      valid: Value(valid),
      updatedAt: Value(updatedAt),
    );
  }

  factory Nip05TableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Nip05TableData(
      nip05: serializer.fromJson<String>(json['nip05']),
      pubkey: serializer.fromJson<String>(json['pubkey']),
      valid: serializer.fromJson<bool>(json['valid']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'nip05': serializer.toJson<String>(nip05),
      'pubkey': serializer.toJson<String>(pubkey),
      'valid': serializer.toJson<bool>(valid),
      'updatedAt': serializer.toJson<int>(updatedAt),
    };
  }

  Nip05TableData copyWith(
          {String? nip05, String? pubkey, bool? valid, int? updatedAt}) =>
      Nip05TableData(
        nip05: nip05 ?? this.nip05,
        pubkey: pubkey ?? this.pubkey,
        valid: valid ?? this.valid,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  Nip05TableData copyWithCompanion(Nip05TableCompanion data) {
    return Nip05TableData(
      nip05: data.nip05.present ? data.nip05.value : this.nip05,
      pubkey: data.pubkey.present ? data.pubkey.value : this.pubkey,
      valid: data.valid.present ? data.valid.value : this.valid,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Nip05TableData(')
          ..write('nip05: $nip05, ')
          ..write('pubkey: $pubkey, ')
          ..write('valid: $valid, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(nip05, pubkey, valid, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Nip05TableData &&
          other.nip05 == this.nip05 &&
          other.pubkey == this.pubkey &&
          other.valid == this.valid &&
          other.updatedAt == this.updatedAt);
}

class Nip05TableCompanion extends UpdateCompanion<Nip05TableData> {
  final Value<String> nip05;
  final Value<String> pubkey;
  final Value<bool> valid;
  final Value<int> updatedAt;
  final Value<int> rowid;
  const Nip05TableCompanion({
    this.nip05 = const Value.absent(),
    this.pubkey = const Value.absent(),
    this.valid = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  Nip05TableCompanion.insert({
    required String nip05,
    required String pubkey,
    this.valid = const Value.absent(),
    required int updatedAt,
    this.rowid = const Value.absent(),
  })  : nip05 = Value(nip05),
        pubkey = Value(pubkey),
        updatedAt = Value(updatedAt);
  static Insertable<Nip05TableData> custom({
    Expression<String>? nip05,
    Expression<String>? pubkey,
    Expression<bool>? valid,
    Expression<int>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (nip05 != null) 'nip05': nip05,
      if (pubkey != null) 'pubkey': pubkey,
      if (valid != null) 'valid': valid,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  Nip05TableCompanion copyWith(
      {Value<String>? nip05,
      Value<String>? pubkey,
      Value<bool>? valid,
      Value<int>? updatedAt,
      Value<int>? rowid}) {
    return Nip05TableCompanion(
      nip05: nip05 ?? this.nip05,
      pubkey: pubkey ?? this.pubkey,
      valid: valid ?? this.valid,
      updatedAt: updatedAt ?? this.updatedAt,
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
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
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
          ..write('updatedAt: $updatedAt, ')
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
  static const VerificationMeta _pubkeyMeta = const VerificationMeta('pubkey');
  @override
  late final GeneratedColumn<String> pubkey = GeneratedColumn<String>(
      'pubkey', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> followers =
      GeneratedColumn<String>('followers', aliasedName, false,
              type: DriftSqlType.string,
              requiredDuringInsert: false,
              defaultValue: const Constant('[]'))
          .withConverter<List<String>>(
              $UserFollowersTableTable.$converterfollowers);
  static const VerificationMeta _lastRefreshedMeta =
      const VerificationMeta('lastRefreshed');
  @override
  late final GeneratedColumn<int> lastRefreshed = GeneratedColumn<int>(
      'last_refreshed', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [pubkey, followers, lastRefreshed];
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
    if (data.containsKey('pubkey')) {
      context.handle(_pubkeyMeta,
          pubkey.isAcceptableOrUnknown(data['pubkey']!, _pubkeyMeta));
    } else if (isInserting) {
      context.missing(_pubkeyMeta);
    }
    if (data.containsKey('last_refreshed')) {
      context.handle(
          _lastRefreshedMeta,
          lastRefreshed.isAcceptableOrUnknown(
              data['last_refreshed']!, _lastRefreshedMeta));
    } else if (isInserting) {
      context.missing(_lastRefreshedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {pubkey};
  @override
  UserFollowersTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserFollowersTableData(
      pubkey: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}pubkey'])!,
      followers: $UserFollowersTableTable.$converterfollowers.fromSql(
          attachedDatabase.typeMapping
              .read(DriftSqlType.string, data['${effectivePrefix}followers'])!),
      lastRefreshed: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}last_refreshed'])!,
    );
  }

  @override
  $UserFollowersTableTable createAlias(String alias) {
    return $UserFollowersTableTable(attachedDatabase, alias);
  }

  static TypeConverter<List<String>, String> $converterfollowers =
      const StringListConverter();
}

class UserFollowersTableData extends DataClass
    implements Insertable<UserFollowersTableData> {
  final String pubkey;
  final List<String> followers;
  final int lastRefreshed;
  const UserFollowersTableData(
      {required this.pubkey,
      required this.followers,
      required this.lastRefreshed});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['pubkey'] = Variable<String>(pubkey);
    {
      map['followers'] = Variable<String>(
          $UserFollowersTableTable.$converterfollowers.toSql(followers));
    }
    map['last_refreshed'] = Variable<int>(lastRefreshed);
    return map;
  }

  UserFollowersTableCompanion toCompanion(bool nullToAbsent) {
    return UserFollowersTableCompanion(
      pubkey: Value(pubkey),
      followers: Value(followers),
      lastRefreshed: Value(lastRefreshed),
    );
  }

  factory UserFollowersTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserFollowersTableData(
      pubkey: serializer.fromJson<String>(json['pubkey']),
      followers: serializer.fromJson<List<String>>(json['followers']),
      lastRefreshed: serializer.fromJson<int>(json['lastRefreshed']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'pubkey': serializer.toJson<String>(pubkey),
      'followers': serializer.toJson<List<String>>(followers),
      'lastRefreshed': serializer.toJson<int>(lastRefreshed),
    };
  }

  UserFollowersTableData copyWith(
          {String? pubkey, List<String>? followers, int? lastRefreshed}) =>
      UserFollowersTableData(
        pubkey: pubkey ?? this.pubkey,
        followers: followers ?? this.followers,
        lastRefreshed: lastRefreshed ?? this.lastRefreshed,
      );
  UserFollowersTableData copyWithCompanion(UserFollowersTableCompanion data) {
    return UserFollowersTableData(
      pubkey: data.pubkey.present ? data.pubkey.value : this.pubkey,
      followers: data.followers.present ? data.followers.value : this.followers,
      lastRefreshed: data.lastRefreshed.present
          ? data.lastRefreshed.value
          : this.lastRefreshed,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserFollowersTableData(')
          ..write('pubkey: $pubkey, ')
          ..write('followers: $followers, ')
          ..write('lastRefreshed: $lastRefreshed')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(pubkey, followers, lastRefreshed);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserFollowersTableData &&
          other.pubkey == this.pubkey &&
          other.followers == this.followers &&
          other.lastRefreshed == this.lastRefreshed);
}

class UserFollowersTableCompanion
    extends UpdateCompanion<UserFollowersTableData> {
  final Value<String> pubkey;
  final Value<List<String>> followers;
  final Value<int> lastRefreshed;
  final Value<int> rowid;
  const UserFollowersTableCompanion({
    this.pubkey = const Value.absent(),
    this.followers = const Value.absent(),
    this.lastRefreshed = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserFollowersTableCompanion.insert({
    required String pubkey,
    this.followers = const Value.absent(),
    required int lastRefreshed,
    this.rowid = const Value.absent(),
  })  : pubkey = Value(pubkey),
        lastRefreshed = Value(lastRefreshed);
  static Insertable<UserFollowersTableData> custom({
    Expression<String>? pubkey,
    Expression<String>? followers,
    Expression<int>? lastRefreshed,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (pubkey != null) 'pubkey': pubkey,
      if (followers != null) 'followers': followers,
      if (lastRefreshed != null) 'last_refreshed': lastRefreshed,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserFollowersTableCompanion copyWith(
      {Value<String>? pubkey,
      Value<List<String>>? followers,
      Value<int>? lastRefreshed,
      Value<int>? rowid}) {
    return UserFollowersTableCompanion(
      pubkey: pubkey ?? this.pubkey,
      followers: followers ?? this.followers,
      lastRefreshed: lastRefreshed ?? this.lastRefreshed,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (pubkey.present) {
      map['pubkey'] = Variable<String>(pubkey.value);
    }
    if (followers.present) {
      map['followers'] = Variable<String>(
          $UserFollowersTableTable.$converterfollowers.toSql(followers.value));
    }
    if (lastRefreshed.present) {
      map['last_refreshed'] = Variable<int>(lastRefreshed.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserFollowersTableCompanion(')
          ..write('pubkey: $pubkey, ')
          ..write('followers: $followers, ')
          ..write('lastRefreshed: $lastRefreshed, ')
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
  static const VerificationMeta _pubkeyMeta = const VerificationMeta('pubkey');
  @override
  late final GeneratedColumn<String> pubkey = GeneratedColumn<String>(
      'pubkey', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _noteDraftMeta =
      const VerificationMeta('noteDraft');
  @override
  late final GeneratedColumn<String> noteDraft = GeneratedColumn<String>(
      'note_draft', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _articleDraftMeta =
      const VerificationMeta('articleDraft');
  @override
  late final GeneratedColumn<String> articleDraft = GeneratedColumn<String>(
      'article_draft', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  late final GeneratedColumnWithTypeConverter<Map<String, String>, String>
      replies = GeneratedColumn<String>('replies', aliasedName, false,
              type: DriftSqlType.string,
              requiredDuringInsert: false,
              defaultValue: const Constant('{}'))
          .withConverter<Map<String, String>>(
              $UserDraftTableTable.$converterreplies);
  @override
  late final GeneratedColumnWithTypeConverter<Map<String, String>, String>
      smartWidgetsDraft = GeneratedColumn<String>(
              'smart_widgets_draft', aliasedName, false,
              type: DriftSqlType.string,
              requiredDuringInsert: false,
              defaultValue: const Constant('{}'))
          .withConverter<Map<String, String>>(
              $UserDraftTableTable.$convertersmartWidgetsDraft);
  @override
  List<GeneratedColumn> get $columns =>
      [pubkey, noteDraft, articleDraft, replies, smartWidgetsDraft];
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
    if (data.containsKey('pubkey')) {
      context.handle(_pubkeyMeta,
          pubkey.isAcceptableOrUnknown(data['pubkey']!, _pubkeyMeta));
    } else if (isInserting) {
      context.missing(_pubkeyMeta);
    }
    if (data.containsKey('note_draft')) {
      context.handle(_noteDraftMeta,
          noteDraft.isAcceptableOrUnknown(data['note_draft']!, _noteDraftMeta));
    } else if (isInserting) {
      context.missing(_noteDraftMeta);
    }
    if (data.containsKey('article_draft')) {
      context.handle(
          _articleDraftMeta,
          articleDraft.isAcceptableOrUnknown(
              data['article_draft']!, _articleDraftMeta));
    } else if (isInserting) {
      context.missing(_articleDraftMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {pubkey};
  @override
  UserDraftTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserDraftTableData(
      pubkey: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}pubkey'])!,
      noteDraft: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}note_draft'])!,
      articleDraft: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}article_draft'])!,
      replies: $UserDraftTableTable.$converterreplies.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}replies'])!),
      smartWidgetsDraft: $UserDraftTableTable.$convertersmartWidgetsDraft
          .fromSql(attachedDatabase.typeMapping.read(DriftSqlType.string,
              data['${effectivePrefix}smart_widgets_draft'])!),
    );
  }

  @override
  $UserDraftTableTable createAlias(String alias) {
    return $UserDraftTableTable(attachedDatabase, alias);
  }

  static TypeConverter<Map<String, String>, String> $converterreplies =
      const StringMapConverter();
  static TypeConverter<Map<String, String>, String>
      $convertersmartWidgetsDraft = const StringMapConverter();
}

class UserDraftTableData extends DataClass
    implements Insertable<UserDraftTableData> {
  final String pubkey;
  final String noteDraft;
  final String articleDraft;
  final Map<String, String> replies;
  final Map<String, String> smartWidgetsDraft;
  const UserDraftTableData(
      {required this.pubkey,
      required this.noteDraft,
      required this.articleDraft,
      required this.replies,
      required this.smartWidgetsDraft});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['pubkey'] = Variable<String>(pubkey);
    map['note_draft'] = Variable<String>(noteDraft);
    map['article_draft'] = Variable<String>(articleDraft);
    {
      map['replies'] = Variable<String>(
          $UserDraftTableTable.$converterreplies.toSql(replies));
    }
    {
      map['smart_widgets_draft'] = Variable<String>($UserDraftTableTable
          .$convertersmartWidgetsDraft
          .toSql(smartWidgetsDraft));
    }
    return map;
  }

  UserDraftTableCompanion toCompanion(bool nullToAbsent) {
    return UserDraftTableCompanion(
      pubkey: Value(pubkey),
      noteDraft: Value(noteDraft),
      articleDraft: Value(articleDraft),
      replies: Value(replies),
      smartWidgetsDraft: Value(smartWidgetsDraft),
    );
  }

  factory UserDraftTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserDraftTableData(
      pubkey: serializer.fromJson<String>(json['pubkey']),
      noteDraft: serializer.fromJson<String>(json['noteDraft']),
      articleDraft: serializer.fromJson<String>(json['articleDraft']),
      replies: serializer.fromJson<Map<String, String>>(json['replies']),
      smartWidgetsDraft:
          serializer.fromJson<Map<String, String>>(json['smartWidgetsDraft']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'pubkey': serializer.toJson<String>(pubkey),
      'noteDraft': serializer.toJson<String>(noteDraft),
      'articleDraft': serializer.toJson<String>(articleDraft),
      'replies': serializer.toJson<Map<String, String>>(replies),
      'smartWidgetsDraft':
          serializer.toJson<Map<String, String>>(smartWidgetsDraft),
    };
  }

  UserDraftTableData copyWith(
          {String? pubkey,
          String? noteDraft,
          String? articleDraft,
          Map<String, String>? replies,
          Map<String, String>? smartWidgetsDraft}) =>
      UserDraftTableData(
        pubkey: pubkey ?? this.pubkey,
        noteDraft: noteDraft ?? this.noteDraft,
        articleDraft: articleDraft ?? this.articleDraft,
        replies: replies ?? this.replies,
        smartWidgetsDraft: smartWidgetsDraft ?? this.smartWidgetsDraft,
      );
  UserDraftTableData copyWithCompanion(UserDraftTableCompanion data) {
    return UserDraftTableData(
      pubkey: data.pubkey.present ? data.pubkey.value : this.pubkey,
      noteDraft: data.noteDraft.present ? data.noteDraft.value : this.noteDraft,
      articleDraft: data.articleDraft.present
          ? data.articleDraft.value
          : this.articleDraft,
      replies: data.replies.present ? data.replies.value : this.replies,
      smartWidgetsDraft: data.smartWidgetsDraft.present
          ? data.smartWidgetsDraft.value
          : this.smartWidgetsDraft,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserDraftTableData(')
          ..write('pubkey: $pubkey, ')
          ..write('noteDraft: $noteDraft, ')
          ..write('articleDraft: $articleDraft, ')
          ..write('replies: $replies, ')
          ..write('smartWidgetsDraft: $smartWidgetsDraft')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(pubkey, noteDraft, articleDraft, replies, smartWidgetsDraft);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserDraftTableData &&
          other.pubkey == this.pubkey &&
          other.noteDraft == this.noteDraft &&
          other.articleDraft == this.articleDraft &&
          other.replies == this.replies &&
          other.smartWidgetsDraft == this.smartWidgetsDraft);
}

class UserDraftTableCompanion extends UpdateCompanion<UserDraftTableData> {
  final Value<String> pubkey;
  final Value<String> noteDraft;
  final Value<String> articleDraft;
  final Value<Map<String, String>> replies;
  final Value<Map<String, String>> smartWidgetsDraft;
  final Value<int> rowid;
  const UserDraftTableCompanion({
    this.pubkey = const Value.absent(),
    this.noteDraft = const Value.absent(),
    this.articleDraft = const Value.absent(),
    this.replies = const Value.absent(),
    this.smartWidgetsDraft = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserDraftTableCompanion.insert({
    required String pubkey,
    required String noteDraft,
    required String articleDraft,
    this.replies = const Value.absent(),
    this.smartWidgetsDraft = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : pubkey = Value(pubkey),
        noteDraft = Value(noteDraft),
        articleDraft = Value(articleDraft);
  static Insertable<UserDraftTableData> custom({
    Expression<String>? pubkey,
    Expression<String>? noteDraft,
    Expression<String>? articleDraft,
    Expression<String>? replies,
    Expression<String>? smartWidgetsDraft,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (pubkey != null) 'pubkey': pubkey,
      if (noteDraft != null) 'note_draft': noteDraft,
      if (articleDraft != null) 'article_draft': articleDraft,
      if (replies != null) 'replies': replies,
      if (smartWidgetsDraft != null) 'smart_widgets_draft': smartWidgetsDraft,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserDraftTableCompanion copyWith(
      {Value<String>? pubkey,
      Value<String>? noteDraft,
      Value<String>? articleDraft,
      Value<Map<String, String>>? replies,
      Value<Map<String, String>>? smartWidgetsDraft,
      Value<int>? rowid}) {
    return UserDraftTableCompanion(
      pubkey: pubkey ?? this.pubkey,
      noteDraft: noteDraft ?? this.noteDraft,
      articleDraft: articleDraft ?? this.articleDraft,
      replies: replies ?? this.replies,
      smartWidgetsDraft: smartWidgetsDraft ?? this.smartWidgetsDraft,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (pubkey.present) {
      map['pubkey'] = Variable<String>(pubkey.value);
    }
    if (noteDraft.present) {
      map['note_draft'] = Variable<String>(noteDraft.value);
    }
    if (articleDraft.present) {
      map['article_draft'] = Variable<String>(articleDraft.value);
    }
    if (replies.present) {
      map['replies'] = Variable<String>(
          $UserDraftTableTable.$converterreplies.toSql(replies.value));
    }
    if (smartWidgetsDraft.present) {
      map['smart_widgets_draft'] = Variable<String>($UserDraftTableTable
          .$convertersmartWidgetsDraft
          .toSql(smartWidgetsDraft.value));
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserDraftTableCompanion(')
          ..write('pubkey: $pubkey, ')
          ..write('noteDraft: $noteDraft, ')
          ..write('articleDraft: $articleDraft, ')
          ..write('replies: $replies, ')
          ..write('smartWidgetsDraft: $smartWidgetsDraft, ')
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
  static const VerificationMeta _filtersMeta =
      const VerificationMeta('filters');
  @override
  late final GeneratedColumn<String> filters = GeneratedColumn<String>(
      'filters', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('{}'));
  static const VerificationMeta _contentSourcesMeta =
      const VerificationMeta('contentSources');
  @override
  late final GeneratedColumn<String> contentSources = GeneratedColumn<String>(
      'content_sources', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('{}'));
  @override
  List<GeneratedColumn> get $columns => [pubkey, filters, contentSources];
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
    if (data.containsKey('filters')) {
      context.handle(_filtersMeta,
          filters.isAcceptableOrUnknown(data['filters']!, _filtersMeta));
    }
    if (data.containsKey('content_sources')) {
      context.handle(
          _contentSourcesMeta,
          contentSources.isAcceptableOrUnknown(
              data['content_sources']!, _contentSourcesMeta));
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
      filters: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}filters'])!,
      contentSources: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}content_sources'])!,
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
  final String filters;
  final String contentSources;
  const UserAppSettingsTableData(
      {required this.pubkey,
      required this.filters,
      required this.contentSources});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['pubkey'] = Variable<String>(pubkey);
    map['filters'] = Variable<String>(filters);
    map['content_sources'] = Variable<String>(contentSources);
    return map;
  }

  UserAppSettingsTableCompanion toCompanion(bool nullToAbsent) {
    return UserAppSettingsTableCompanion(
      pubkey: Value(pubkey),
      filters: Value(filters),
      contentSources: Value(contentSources),
    );
  }

  factory UserAppSettingsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserAppSettingsTableData(
      pubkey: serializer.fromJson<String>(json['pubkey']),
      filters: serializer.fromJson<String>(json['filters']),
      contentSources: serializer.fromJson<String>(json['contentSources']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'pubkey': serializer.toJson<String>(pubkey),
      'filters': serializer.toJson<String>(filters),
      'contentSources': serializer.toJson<String>(contentSources),
    };
  }

  UserAppSettingsTableData copyWith(
          {String? pubkey, String? filters, String? contentSources}) =>
      UserAppSettingsTableData(
        pubkey: pubkey ?? this.pubkey,
        filters: filters ?? this.filters,
        contentSources: contentSources ?? this.contentSources,
      );
  UserAppSettingsTableData copyWithCompanion(
      UserAppSettingsTableCompanion data) {
    return UserAppSettingsTableData(
      pubkey: data.pubkey.present ? data.pubkey.value : this.pubkey,
      filters: data.filters.present ? data.filters.value : this.filters,
      contentSources: data.contentSources.present
          ? data.contentSources.value
          : this.contentSources,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserAppSettingsTableData(')
          ..write('pubkey: $pubkey, ')
          ..write('filters: $filters, ')
          ..write('contentSources: $contentSources')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(pubkey, filters, contentSources);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserAppSettingsTableData &&
          other.pubkey == this.pubkey &&
          other.filters == this.filters &&
          other.contentSources == this.contentSources);
}

class UserAppSettingsTableCompanion
    extends UpdateCompanion<UserAppSettingsTableData> {
  final Value<String> pubkey;
  final Value<String> filters;
  final Value<String> contentSources;
  final Value<int> rowid;
  const UserAppSettingsTableCompanion({
    this.pubkey = const Value.absent(),
    this.filters = const Value.absent(),
    this.contentSources = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserAppSettingsTableCompanion.insert({
    required String pubkey,
    this.filters = const Value.absent(),
    this.contentSources = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : pubkey = Value(pubkey);
  static Insertable<UserAppSettingsTableData> custom({
    Expression<String>? pubkey,
    Expression<String>? filters,
    Expression<String>? contentSources,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (pubkey != null) 'pubkey': pubkey,
      if (filters != null) 'filters': filters,
      if (contentSources != null) 'content_sources': contentSources,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserAppSettingsTableCompanion copyWith(
      {Value<String>? pubkey,
      Value<String>? filters,
      Value<String>? contentSources,
      Value<int>? rowid}) {
    return UserAppSettingsTableCompanion(
      pubkey: pubkey ?? this.pubkey,
      filters: filters ?? this.filters,
      contentSources: contentSources ?? this.contentSources,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (pubkey.present) {
      map['pubkey'] = Variable<String>(pubkey.value);
    }
    if (filters.present) {
      map['filters'] = Variable<String>(filters.value);
    }
    if (contentSources.present) {
      map['content_sources'] = Variable<String>(contentSources.value);
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
          ..write('filters: $filters, ')
          ..write('contentSources: $contentSources, ')
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
  @override
  late final GeneratedColumnWithTypeConverter<Map<String, double>, String> wot =
      GeneratedColumn<String>('wot', aliasedName, false,
              type: DriftSqlType.string,
              requiredDuringInsert: false,
              defaultValue: const Constant('{}'))
          .withConverter<Map<String, double>>($UserWotTableTable.$converterwot);
  @override
  List<GeneratedColumn> get $columns => [pubkey, createdAt, wot];
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {pubkey};
  @override
  UserWotTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserWotTableData(
      pubkey: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}pubkey'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}created_at'])!,
      wot: $UserWotTableTable.$converterwot.fromSql(attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}wot'])!),
    );
  }

  @override
  $UserWotTableTable createAlias(String alias) {
    return $UserWotTableTable(attachedDatabase, alias);
  }

  static TypeConverter<Map<String, double>, String> $converterwot =
      const DoubleMapConverter();
}

class UserWotTableData extends DataClass
    implements Insertable<UserWotTableData> {
  final String pubkey;
  final int createdAt;
  final Map<String, double> wot;
  const UserWotTableData(
      {required this.pubkey, required this.createdAt, required this.wot});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['pubkey'] = Variable<String>(pubkey);
    map['created_at'] = Variable<int>(createdAt);
    {
      map['wot'] =
          Variable<String>($UserWotTableTable.$converterwot.toSql(wot));
    }
    return map;
  }

  UserWotTableCompanion toCompanion(bool nullToAbsent) {
    return UserWotTableCompanion(
      pubkey: Value(pubkey),
      createdAt: Value(createdAt),
      wot: Value(wot),
    );
  }

  factory UserWotTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserWotTableData(
      pubkey: serializer.fromJson<String>(json['pubkey']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      wot: serializer.fromJson<Map<String, double>>(json['wot']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'pubkey': serializer.toJson<String>(pubkey),
      'createdAt': serializer.toJson<int>(createdAt),
      'wot': serializer.toJson<Map<String, double>>(wot),
    };
  }

  UserWotTableData copyWith(
          {String? pubkey, int? createdAt, Map<String, double>? wot}) =>
      UserWotTableData(
        pubkey: pubkey ?? this.pubkey,
        createdAt: createdAt ?? this.createdAt,
        wot: wot ?? this.wot,
      );
  UserWotTableData copyWithCompanion(UserWotTableCompanion data) {
    return UserWotTableData(
      pubkey: data.pubkey.present ? data.pubkey.value : this.pubkey,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      wot: data.wot.present ? data.wot.value : this.wot,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserWotTableData(')
          ..write('pubkey: $pubkey, ')
          ..write('createdAt: $createdAt, ')
          ..write('wot: $wot')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(pubkey, createdAt, wot);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserWotTableData &&
          other.pubkey == this.pubkey &&
          other.createdAt == this.createdAt &&
          other.wot == this.wot);
}

class UserWotTableCompanion extends UpdateCompanion<UserWotTableData> {
  final Value<String> pubkey;
  final Value<int> createdAt;
  final Value<Map<String, double>> wot;
  final Value<int> rowid;
  const UserWotTableCompanion({
    this.pubkey = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.wot = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserWotTableCompanion.insert({
    required String pubkey,
    required int createdAt,
    this.wot = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : pubkey = Value(pubkey),
        createdAt = Value(createdAt);
  static Insertable<UserWotTableData> custom({
    Expression<String>? pubkey,
    Expression<int>? createdAt,
    Expression<String>? wot,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (pubkey != null) 'pubkey': pubkey,
      if (createdAt != null) 'created_at': createdAt,
      if (wot != null) 'wot': wot,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserWotTableCompanion copyWith(
      {Value<String>? pubkey,
      Value<int>? createdAt,
      Value<Map<String, double>>? wot,
      Value<int>? rowid}) {
    return UserWotTableCompanion(
      pubkey: pubkey ?? this.pubkey,
      createdAt: createdAt ?? this.createdAt,
      wot: wot ?? this.wot,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (pubkey.present) {
      map['pubkey'] = Variable<String>(pubkey.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (wot.present) {
      map['wot'] =
          Variable<String>($UserWotTableTable.$converterwot.toSql(wot.value));
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserWotTableCompanion(')
          ..write('pubkey: $pubkey, ')
          ..write('createdAt: $createdAt, ')
          ..write('wot: $wot, ')
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
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
      'created_at', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, pubkey, originPubkey, score, createdAt];
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
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
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
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}created_at'])!,
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
  final int createdAt;
  const WotScoreTableData(
      {required this.id,
      required this.pubkey,
      required this.originPubkey,
      required this.score,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['pubkey'] = Variable<String>(pubkey);
    map['origin_pubkey'] = Variable<String>(originPubkey);
    map['score'] = Variable<double>(score);
    map['created_at'] = Variable<int>(createdAt);
    return map;
  }

  WotScoreTableCompanion toCompanion(bool nullToAbsent) {
    return WotScoreTableCompanion(
      id: Value(id),
      pubkey: Value(pubkey),
      originPubkey: Value(originPubkey),
      score: Value(score),
      createdAt: Value(createdAt),
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
      createdAt: serializer.fromJson<int>(json['createdAt']),
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
      'createdAt': serializer.toJson<int>(createdAt),
    };
  }

  WotScoreTableData copyWith(
          {String? id,
          String? pubkey,
          String? originPubkey,
          double? score,
          int? createdAt}) =>
      WotScoreTableData(
        id: id ?? this.id,
        pubkey: pubkey ?? this.pubkey,
        originPubkey: originPubkey ?? this.originPubkey,
        score: score ?? this.score,
        createdAt: createdAt ?? this.createdAt,
      );
  WotScoreTableData copyWithCompanion(WotScoreTableCompanion data) {
    return WotScoreTableData(
      id: data.id.present ? data.id.value : this.id,
      pubkey: data.pubkey.present ? data.pubkey.value : this.pubkey,
      originPubkey: data.originPubkey.present
          ? data.originPubkey.value
          : this.originPubkey,
      score: data.score.present ? data.score.value : this.score,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WotScoreTableData(')
          ..write('id: $id, ')
          ..write('pubkey: $pubkey, ')
          ..write('originPubkey: $originPubkey, ')
          ..write('score: $score, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, pubkey, originPubkey, score, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WotScoreTableData &&
          other.id == this.id &&
          other.pubkey == this.pubkey &&
          other.originPubkey == this.originPubkey &&
          other.score == this.score &&
          other.createdAt == this.createdAt);
}

class WotScoreTableCompanion extends UpdateCompanion<WotScoreTableData> {
  final Value<String> id;
  final Value<String> pubkey;
  final Value<String> originPubkey;
  final Value<double> score;
  final Value<int> createdAt;
  final Value<int> rowid;
  const WotScoreTableCompanion({
    this.id = const Value.absent(),
    this.pubkey = const Value.absent(),
    this.originPubkey = const Value.absent(),
    this.score = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  WotScoreTableCompanion.insert({
    required String id,
    required String pubkey,
    required String originPubkey,
    this.score = const Value.absent(),
    required int createdAt,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        pubkey = Value(pubkey),
        originPubkey = Value(originPubkey),
        createdAt = Value(createdAt);
  static Insertable<WotScoreTableData> custom({
    Expression<String>? id,
    Expression<String>? pubkey,
    Expression<String>? originPubkey,
    Expression<double>? score,
    Expression<int>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (pubkey != null) 'pubkey': pubkey,
      if (originPubkey != null) 'origin_pubkey': originPubkey,
      if (score != null) 'score': score,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  WotScoreTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? pubkey,
      Value<String>? originPubkey,
      Value<double>? score,
      Value<int>? createdAt,
      Value<int>? rowid}) {
    return WotScoreTableCompanion(
      id: id ?? this.id,
      pubkey: pubkey ?? this.pubkey,
      originPubkey: originPubkey ?? this.originPubkey,
      score: score ?? this.score,
      createdAt: createdAt ?? this.createdAt,
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
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
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
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RelayInfoListTableTable extends RelayInfoListTable
    with TableInfo<$RelayInfoListTableTable, RelayInfoListTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RelayInfoListTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _pubkeyMeta = const VerificationMeta('pubkey');
  @override
  late final GeneratedColumn<String> pubkey = GeneratedColumn<String>(
      'pubkey', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _contactMeta =
      const VerificationMeta('contact');
  @override
  late final GeneratedColumn<String> contact = GeneratedColumn<String>(
      'contact', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> nips =
      GeneratedColumn<String>('nips', aliasedName, false,
              type: DriftSqlType.string,
              requiredDuringInsert: false,
              defaultValue: const Constant('[]'))
          .withConverter<List<String>>($RelayInfoListTableTable.$converternips);
  static const VerificationMeta _softwareMeta =
      const VerificationMeta('software');
  @override
  late final GeneratedColumn<String> software = GeneratedColumn<String>(
      'software', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _iconMeta = const VerificationMeta('icon');
  @override
  late final GeneratedColumn<String> icon = GeneratedColumn<String>(
      'icon', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _versionMeta =
      const VerificationMeta('version');
  @override
  late final GeneratedColumn<String> version = GeneratedColumn<String>(
      'version', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
      'url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _locationMeta =
      const VerificationMeta('location');
  @override
  late final GeneratedColumn<String> location = GeneratedColumn<String>(
      'location', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _latencyMeta =
      const VerificationMeta('latency');
  @override
  late final GeneratedColumn<String> latency = GeneratedColumn<String>(
      'latency', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isPaidMeta = const VerificationMeta('isPaid');
  @override
  late final GeneratedColumn<bool> isPaid = GeneratedColumn<bool>(
      'is_paid', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_paid" IN (0, 1))'));
  static const VerificationMeta _isAuthMeta = const VerificationMeta('isAuth');
  @override
  late final GeneratedColumn<bool> isAuth = GeneratedColumn<bool>(
      'is_auth', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_auth" IN (0, 1))'));
  static const VerificationMeta _lastUpdatedMeta =
      const VerificationMeta('lastUpdated');
  @override
  late final GeneratedColumn<int> lastUpdated = GeneratedColumn<int>(
      'last_updated', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        name,
        description,
        pubkey,
        contact,
        nips,
        software,
        icon,
        version,
        url,
        location,
        latency,
        isPaid,
        isAuth,
        lastUpdated
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'relay_info_list_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<RelayInfoListTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('pubkey')) {
      context.handle(_pubkeyMeta,
          pubkey.isAcceptableOrUnknown(data['pubkey']!, _pubkeyMeta));
    } else if (isInserting) {
      context.missing(_pubkeyMeta);
    }
    if (data.containsKey('contact')) {
      context.handle(_contactMeta,
          contact.isAcceptableOrUnknown(data['contact']!, _contactMeta));
    } else if (isInserting) {
      context.missing(_contactMeta);
    }
    if (data.containsKey('software')) {
      context.handle(_softwareMeta,
          software.isAcceptableOrUnknown(data['software']!, _softwareMeta));
    } else if (isInserting) {
      context.missing(_softwareMeta);
    }
    if (data.containsKey('icon')) {
      context.handle(
          _iconMeta, icon.isAcceptableOrUnknown(data['icon']!, _iconMeta));
    } else if (isInserting) {
      context.missing(_iconMeta);
    }
    if (data.containsKey('version')) {
      context.handle(_versionMeta,
          version.isAcceptableOrUnknown(data['version']!, _versionMeta));
    } else if (isInserting) {
      context.missing(_versionMeta);
    }
    if (data.containsKey('url')) {
      context.handle(
          _urlMeta, url.isAcceptableOrUnknown(data['url']!, _urlMeta));
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    if (data.containsKey('location')) {
      context.handle(_locationMeta,
          location.isAcceptableOrUnknown(data['location']!, _locationMeta));
    } else if (isInserting) {
      context.missing(_locationMeta);
    }
    if (data.containsKey('latency')) {
      context.handle(_latencyMeta,
          latency.isAcceptableOrUnknown(data['latency']!, _latencyMeta));
    } else if (isInserting) {
      context.missing(_latencyMeta);
    }
    if (data.containsKey('is_paid')) {
      context.handle(_isPaidMeta,
          isPaid.isAcceptableOrUnknown(data['is_paid']!, _isPaidMeta));
    } else if (isInserting) {
      context.missing(_isPaidMeta);
    }
    if (data.containsKey('is_auth')) {
      context.handle(_isAuthMeta,
          isAuth.isAcceptableOrUnknown(data['is_auth']!, _isAuthMeta));
    } else if (isInserting) {
      context.missing(_isAuthMeta);
    }
    if (data.containsKey('last_updated')) {
      context.handle(
          _lastUpdatedMeta,
          lastUpdated.isAcceptableOrUnknown(
              data['last_updated']!, _lastUpdatedMeta));
    } else if (isInserting) {
      context.missing(_lastUpdatedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {name};
  @override
  RelayInfoListTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RelayInfoListTableData(
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      pubkey: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}pubkey'])!,
      contact: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}contact'])!,
      nips: $RelayInfoListTableTable.$converternips.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nips'])!),
      software: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}software'])!,
      icon: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}icon'])!,
      version: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}version'])!,
      url: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}url'])!,
      location: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}location'])!,
      latency: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}latency'])!,
      isPaid: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_paid'])!,
      isAuth: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_auth'])!,
      lastUpdated: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}last_updated'])!,
    );
  }

  @override
  $RelayInfoListTableTable createAlias(String alias) {
    return $RelayInfoListTableTable(attachedDatabase, alias);
  }

  static TypeConverter<List<String>, String> $converternips =
      const StringListConverter();
}

class RelayInfoListTableData extends DataClass
    implements Insertable<RelayInfoListTableData> {
  final String name;
  final String description;
  final String pubkey;
  final String contact;
  final List<String> nips;
  final String software;
  final String icon;
  final String version;
  final String url;
  final String location;
  final String latency;
  final bool isPaid;
  final bool isAuth;
  final int lastUpdated;
  const RelayInfoListTableData(
      {required this.name,
      required this.description,
      required this.pubkey,
      required this.contact,
      required this.nips,
      required this.software,
      required this.icon,
      required this.version,
      required this.url,
      required this.location,
      required this.latency,
      required this.isPaid,
      required this.isAuth,
      required this.lastUpdated});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    map['pubkey'] = Variable<String>(pubkey);
    map['contact'] = Variable<String>(contact);
    {
      map['nips'] =
          Variable<String>($RelayInfoListTableTable.$converternips.toSql(nips));
    }
    map['software'] = Variable<String>(software);
    map['icon'] = Variable<String>(icon);
    map['version'] = Variable<String>(version);
    map['url'] = Variable<String>(url);
    map['location'] = Variable<String>(location);
    map['latency'] = Variable<String>(latency);
    map['is_paid'] = Variable<bool>(isPaid);
    map['is_auth'] = Variable<bool>(isAuth);
    map['last_updated'] = Variable<int>(lastUpdated);
    return map;
  }

  RelayInfoListTableCompanion toCompanion(bool nullToAbsent) {
    return RelayInfoListTableCompanion(
      name: Value(name),
      description: Value(description),
      pubkey: Value(pubkey),
      contact: Value(contact),
      nips: Value(nips),
      software: Value(software),
      icon: Value(icon),
      version: Value(version),
      url: Value(url),
      location: Value(location),
      latency: Value(latency),
      isPaid: Value(isPaid),
      isAuth: Value(isAuth),
      lastUpdated: Value(lastUpdated),
    );
  }

  factory RelayInfoListTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RelayInfoListTableData(
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      pubkey: serializer.fromJson<String>(json['pubkey']),
      contact: serializer.fromJson<String>(json['contact']),
      nips: serializer.fromJson<List<String>>(json['nips']),
      software: serializer.fromJson<String>(json['software']),
      icon: serializer.fromJson<String>(json['icon']),
      version: serializer.fromJson<String>(json['version']),
      url: serializer.fromJson<String>(json['url']),
      location: serializer.fromJson<String>(json['location']),
      latency: serializer.fromJson<String>(json['latency']),
      isPaid: serializer.fromJson<bool>(json['isPaid']),
      isAuth: serializer.fromJson<bool>(json['isAuth']),
      lastUpdated: serializer.fromJson<int>(json['lastUpdated']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'pubkey': serializer.toJson<String>(pubkey),
      'contact': serializer.toJson<String>(contact),
      'nips': serializer.toJson<List<String>>(nips),
      'software': serializer.toJson<String>(software),
      'icon': serializer.toJson<String>(icon),
      'version': serializer.toJson<String>(version),
      'url': serializer.toJson<String>(url),
      'location': serializer.toJson<String>(location),
      'latency': serializer.toJson<String>(latency),
      'isPaid': serializer.toJson<bool>(isPaid),
      'isAuth': serializer.toJson<bool>(isAuth),
      'lastUpdated': serializer.toJson<int>(lastUpdated),
    };
  }

  RelayInfoListTableData copyWith(
          {String? name,
          String? description,
          String? pubkey,
          String? contact,
          List<String>? nips,
          String? software,
          String? icon,
          String? version,
          String? url,
          String? location,
          String? latency,
          bool? isPaid,
          bool? isAuth,
          int? lastUpdated}) =>
      RelayInfoListTableData(
        name: name ?? this.name,
        description: description ?? this.description,
        pubkey: pubkey ?? this.pubkey,
        contact: contact ?? this.contact,
        nips: nips ?? this.nips,
        software: software ?? this.software,
        icon: icon ?? this.icon,
        version: version ?? this.version,
        url: url ?? this.url,
        location: location ?? this.location,
        latency: latency ?? this.latency,
        isPaid: isPaid ?? this.isPaid,
        isAuth: isAuth ?? this.isAuth,
        lastUpdated: lastUpdated ?? this.lastUpdated,
      );
  RelayInfoListTableData copyWithCompanion(RelayInfoListTableCompanion data) {
    return RelayInfoListTableData(
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
      pubkey: data.pubkey.present ? data.pubkey.value : this.pubkey,
      contact: data.contact.present ? data.contact.value : this.contact,
      nips: data.nips.present ? data.nips.value : this.nips,
      software: data.software.present ? data.software.value : this.software,
      icon: data.icon.present ? data.icon.value : this.icon,
      version: data.version.present ? data.version.value : this.version,
      url: data.url.present ? data.url.value : this.url,
      location: data.location.present ? data.location.value : this.location,
      latency: data.latency.present ? data.latency.value : this.latency,
      isPaid: data.isPaid.present ? data.isPaid.value : this.isPaid,
      isAuth: data.isAuth.present ? data.isAuth.value : this.isAuth,
      lastUpdated:
          data.lastUpdated.present ? data.lastUpdated.value : this.lastUpdated,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RelayInfoListTableData(')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('pubkey: $pubkey, ')
          ..write('contact: $contact, ')
          ..write('nips: $nips, ')
          ..write('software: $software, ')
          ..write('icon: $icon, ')
          ..write('version: $version, ')
          ..write('url: $url, ')
          ..write('location: $location, ')
          ..write('latency: $latency, ')
          ..write('isPaid: $isPaid, ')
          ..write('isAuth: $isAuth, ')
          ..write('lastUpdated: $lastUpdated')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      name,
      description,
      pubkey,
      contact,
      nips,
      software,
      icon,
      version,
      url,
      location,
      latency,
      isPaid,
      isAuth,
      lastUpdated);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RelayInfoListTableData &&
          other.name == this.name &&
          other.description == this.description &&
          other.pubkey == this.pubkey &&
          other.contact == this.contact &&
          other.nips == this.nips &&
          other.software == this.software &&
          other.icon == this.icon &&
          other.version == this.version &&
          other.url == this.url &&
          other.location == this.location &&
          other.latency == this.latency &&
          other.isPaid == this.isPaid &&
          other.isAuth == this.isAuth &&
          other.lastUpdated == this.lastUpdated);
}

class RelayInfoListTableCompanion
    extends UpdateCompanion<RelayInfoListTableData> {
  final Value<String> name;
  final Value<String> description;
  final Value<String> pubkey;
  final Value<String> contact;
  final Value<List<String>> nips;
  final Value<String> software;
  final Value<String> icon;
  final Value<String> version;
  final Value<String> url;
  final Value<String> location;
  final Value<String> latency;
  final Value<bool> isPaid;
  final Value<bool> isAuth;
  final Value<int> lastUpdated;
  final Value<int> rowid;
  const RelayInfoListTableCompanion({
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.pubkey = const Value.absent(),
    this.contact = const Value.absent(),
    this.nips = const Value.absent(),
    this.software = const Value.absent(),
    this.icon = const Value.absent(),
    this.version = const Value.absent(),
    this.url = const Value.absent(),
    this.location = const Value.absent(),
    this.latency = const Value.absent(),
    this.isPaid = const Value.absent(),
    this.isAuth = const Value.absent(),
    this.lastUpdated = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RelayInfoListTableCompanion.insert({
    required String name,
    required String description,
    required String pubkey,
    required String contact,
    this.nips = const Value.absent(),
    required String software,
    required String icon,
    required String version,
    required String url,
    required String location,
    required String latency,
    required bool isPaid,
    required bool isAuth,
    required int lastUpdated,
    this.rowid = const Value.absent(),
  })  : name = Value(name),
        description = Value(description),
        pubkey = Value(pubkey),
        contact = Value(contact),
        software = Value(software),
        icon = Value(icon),
        version = Value(version),
        url = Value(url),
        location = Value(location),
        latency = Value(latency),
        isPaid = Value(isPaid),
        isAuth = Value(isAuth),
        lastUpdated = Value(lastUpdated);
  static Insertable<RelayInfoListTableData> custom({
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? pubkey,
    Expression<String>? contact,
    Expression<String>? nips,
    Expression<String>? software,
    Expression<String>? icon,
    Expression<String>? version,
    Expression<String>? url,
    Expression<String>? location,
    Expression<String>? latency,
    Expression<bool>? isPaid,
    Expression<bool>? isAuth,
    Expression<int>? lastUpdated,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (pubkey != null) 'pubkey': pubkey,
      if (contact != null) 'contact': contact,
      if (nips != null) 'nips': nips,
      if (software != null) 'software': software,
      if (icon != null) 'icon': icon,
      if (version != null) 'version': version,
      if (url != null) 'url': url,
      if (location != null) 'location': location,
      if (latency != null) 'latency': latency,
      if (isPaid != null) 'is_paid': isPaid,
      if (isAuth != null) 'is_auth': isAuth,
      if (lastUpdated != null) 'last_updated': lastUpdated,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RelayInfoListTableCompanion copyWith(
      {Value<String>? name,
      Value<String>? description,
      Value<String>? pubkey,
      Value<String>? contact,
      Value<List<String>>? nips,
      Value<String>? software,
      Value<String>? icon,
      Value<String>? version,
      Value<String>? url,
      Value<String>? location,
      Value<String>? latency,
      Value<bool>? isPaid,
      Value<bool>? isAuth,
      Value<int>? lastUpdated,
      Value<int>? rowid}) {
    return RelayInfoListTableCompanion(
      name: name ?? this.name,
      description: description ?? this.description,
      pubkey: pubkey ?? this.pubkey,
      contact: contact ?? this.contact,
      nips: nips ?? this.nips,
      software: software ?? this.software,
      icon: icon ?? this.icon,
      version: version ?? this.version,
      url: url ?? this.url,
      location: location ?? this.location,
      latency: latency ?? this.latency,
      isPaid: isPaid ?? this.isPaid,
      isAuth: isAuth ?? this.isAuth,
      lastUpdated: lastUpdated ?? this.lastUpdated,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (pubkey.present) {
      map['pubkey'] = Variable<String>(pubkey.value);
    }
    if (contact.present) {
      map['contact'] = Variable<String>(contact.value);
    }
    if (nips.present) {
      map['nips'] = Variable<String>(
          $RelayInfoListTableTable.$converternips.toSql(nips.value));
    }
    if (software.present) {
      map['software'] = Variable<String>(software.value);
    }
    if (icon.present) {
      map['icon'] = Variable<String>(icon.value);
    }
    if (version.present) {
      map['version'] = Variable<String>(version.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    if (latency.present) {
      map['latency'] = Variable<String>(latency.value);
    }
    if (isPaid.present) {
      map['is_paid'] = Variable<bool>(isPaid.value);
    }
    if (isAuth.present) {
      map['is_auth'] = Variable<bool>(isAuth.value);
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
    return (StringBuffer('RelayInfoListTableCompanion(')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('pubkey: $pubkey, ')
          ..write('contact: $contact, ')
          ..write('nips: $nips, ')
          ..write('software: $software, ')
          ..write('icon: $icon, ')
          ..write('version: $version, ')
          ..write('url: $url, ')
          ..write('location: $location, ')
          ..write('latency: $latency, ')
          ..write('isPaid: $isPaid, ')
          ..write('isAuth: $isAuth, ')
          ..write('lastUpdated: $lastUpdated, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CashuMintTableTable extends CashuMintTable
    with TableInfo<$CashuMintTableTable, CashuMintTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CashuMintTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _pubkeyMeta = const VerificationMeta('pubkey');
  @override
  late final GeneratedColumn<String> pubkey = GeneratedColumn<String>(
      'pubkey', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _mintURLMeta =
      const VerificationMeta('mintURL');
  @override
  late final GeneratedColumn<String> mintURL = GeneratedColumn<String>(
      'mint_u_r_l', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _balanceMeta =
      const VerificationMeta('balance');
  @override
  late final GeneratedColumn<int> balance = GeneratedColumn<int>(
      'balance', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _maxNutsVersionMeta =
      const VerificationMeta('maxNutsVersion');
  @override
  late final GeneratedColumn<int> maxNutsVersion = GeneratedColumn<int>(
      'max_nuts_version', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  @override
  List<GeneratedColumn> get $columns =>
      [pubkey, mintURL, name, balance, maxNutsVersion];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'IMint';
  @override
  VerificationContext validateIntegrity(Insertable<CashuMintTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('pubkey')) {
      context.handle(_pubkeyMeta,
          pubkey.isAcceptableOrUnknown(data['pubkey']!, _pubkeyMeta));
    } else if (isInserting) {
      context.missing(_pubkeyMeta);
    }
    if (data.containsKey('mint_u_r_l')) {
      context.handle(_mintURLMeta,
          mintURL.isAcceptableOrUnknown(data['mint_u_r_l']!, _mintURLMeta));
    } else if (isInserting) {
      context.missing(_mintURLMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    if (data.containsKey('balance')) {
      context.handle(_balanceMeta,
          balance.isAcceptableOrUnknown(data['balance']!, _balanceMeta));
    }
    if (data.containsKey('max_nuts_version')) {
      context.handle(
          _maxNutsVersionMeta,
          maxNutsVersion.isAcceptableOrUnknown(
              data['max_nuts_version']!, _maxNutsVersionMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {pubkey, mintURL};
  @override
  CashuMintTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CashuMintTableData(
      pubkey: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}pubkey'])!,
      mintURL: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}mint_u_r_l'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      balance: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}balance'])!,
      maxNutsVersion: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}max_nuts_version'])!,
    );
  }

  @override
  $CashuMintTableTable createAlias(String alias) {
    return $CashuMintTableTable(attachedDatabase, alias);
  }
}

class CashuMintTableData extends DataClass
    implements Insertable<CashuMintTableData> {
  final String pubkey;
  final String mintURL;
  final String name;
  final int balance;
  final int maxNutsVersion;
  const CashuMintTableData(
      {required this.pubkey,
      required this.mintURL,
      required this.name,
      required this.balance,
      required this.maxNutsVersion});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['pubkey'] = Variable<String>(pubkey);
    map['mint_u_r_l'] = Variable<String>(mintURL);
    map['name'] = Variable<String>(name);
    map['balance'] = Variable<int>(balance);
    map['max_nuts_version'] = Variable<int>(maxNutsVersion);
    return map;
  }

  CashuMintTableCompanion toCompanion(bool nullToAbsent) {
    return CashuMintTableCompanion(
      pubkey: Value(pubkey),
      mintURL: Value(mintURL),
      name: Value(name),
      balance: Value(balance),
      maxNutsVersion: Value(maxNutsVersion),
    );
  }

  factory CashuMintTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CashuMintTableData(
      pubkey: serializer.fromJson<String>(json['pubkey']),
      mintURL: serializer.fromJson<String>(json['mintURL']),
      name: serializer.fromJson<String>(json['name']),
      balance: serializer.fromJson<int>(json['balance']),
      maxNutsVersion: serializer.fromJson<int>(json['maxNutsVersion']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'pubkey': serializer.toJson<String>(pubkey),
      'mintURL': serializer.toJson<String>(mintURL),
      'name': serializer.toJson<String>(name),
      'balance': serializer.toJson<int>(balance),
      'maxNutsVersion': serializer.toJson<int>(maxNutsVersion),
    };
  }

  CashuMintTableData copyWith(
          {String? pubkey,
          String? mintURL,
          String? name,
          int? balance,
          int? maxNutsVersion}) =>
      CashuMintTableData(
        pubkey: pubkey ?? this.pubkey,
        mintURL: mintURL ?? this.mintURL,
        name: name ?? this.name,
        balance: balance ?? this.balance,
        maxNutsVersion: maxNutsVersion ?? this.maxNutsVersion,
      );
  CashuMintTableData copyWithCompanion(CashuMintTableCompanion data) {
    return CashuMintTableData(
      pubkey: data.pubkey.present ? data.pubkey.value : this.pubkey,
      mintURL: data.mintURL.present ? data.mintURL.value : this.mintURL,
      name: data.name.present ? data.name.value : this.name,
      balance: data.balance.present ? data.balance.value : this.balance,
      maxNutsVersion: data.maxNutsVersion.present
          ? data.maxNutsVersion.value
          : this.maxNutsVersion,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CashuMintTableData(')
          ..write('pubkey: $pubkey, ')
          ..write('mintURL: $mintURL, ')
          ..write('name: $name, ')
          ..write('balance: $balance, ')
          ..write('maxNutsVersion: $maxNutsVersion')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(pubkey, mintURL, name, balance, maxNutsVersion);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CashuMintTableData &&
          other.pubkey == this.pubkey &&
          other.mintURL == this.mintURL &&
          other.name == this.name &&
          other.balance == this.balance &&
          other.maxNutsVersion == this.maxNutsVersion);
}

class CashuMintTableCompanion extends UpdateCompanion<CashuMintTableData> {
  final Value<String> pubkey;
  final Value<String> mintURL;
  final Value<String> name;
  final Value<int> balance;
  final Value<int> maxNutsVersion;
  final Value<int> rowid;
  const CashuMintTableCompanion({
    this.pubkey = const Value.absent(),
    this.mintURL = const Value.absent(),
    this.name = const Value.absent(),
    this.balance = const Value.absent(),
    this.maxNutsVersion = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CashuMintTableCompanion.insert({
    required String pubkey,
    required String mintURL,
    this.name = const Value.absent(),
    this.balance = const Value.absent(),
    this.maxNutsVersion = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : pubkey = Value(pubkey),
        mintURL = Value(mintURL);
  static Insertable<CashuMintTableData> custom({
    Expression<String>? pubkey,
    Expression<String>? mintURL,
    Expression<String>? name,
    Expression<int>? balance,
    Expression<int>? maxNutsVersion,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (pubkey != null) 'pubkey': pubkey,
      if (mintURL != null) 'mint_u_r_l': mintURL,
      if (name != null) 'name': name,
      if (balance != null) 'balance': balance,
      if (maxNutsVersion != null) 'max_nuts_version': maxNutsVersion,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CashuMintTableCompanion copyWith(
      {Value<String>? pubkey,
      Value<String>? mintURL,
      Value<String>? name,
      Value<int>? balance,
      Value<int>? maxNutsVersion,
      Value<int>? rowid}) {
    return CashuMintTableCompanion(
      pubkey: pubkey ?? this.pubkey,
      mintURL: mintURL ?? this.mintURL,
      name: name ?? this.name,
      balance: balance ?? this.balance,
      maxNutsVersion: maxNutsVersion ?? this.maxNutsVersion,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (pubkey.present) {
      map['pubkey'] = Variable<String>(pubkey.value);
    }
    if (mintURL.present) {
      map['mint_u_r_l'] = Variable<String>(mintURL.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (balance.present) {
      map['balance'] = Variable<int>(balance.value);
    }
    if (maxNutsVersion.present) {
      map['max_nuts_version'] = Variable<int>(maxNutsVersion.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CashuMintTableCompanion(')
          ..write('pubkey: $pubkey, ')
          ..write('mintURL: $mintURL, ')
          ..write('name: $name, ')
          ..write('balance: $balance, ')
          ..write('maxNutsVersion: $maxNutsVersion, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CashuKeysetInfoTableTable extends CashuKeysetInfoTable
    with TableInfo<$CashuKeysetInfoTableTable, CashuKeysetInfoTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CashuKeysetInfoTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _mintURLMeta =
      const VerificationMeta('mintURL');
  @override
  late final GeneratedColumn<String> mintURL = GeneratedColumn<String>(
      'mint_u_r_l', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _unitMeta = const VerificationMeta('unit');
  @override
  late final GeneratedColumn<String> unit = GeneratedColumn<String>(
      'unit', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _activeMeta = const VerificationMeta('active');
  @override
  late final GeneratedColumn<bool> active = GeneratedColumn<bool>(
      'active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("active" IN (0, 1))'));
  static const VerificationMeta _keysetRawMeta =
      const VerificationMeta('keysetRaw');
  @override
  late final GeneratedColumn<String> keysetRaw = GeneratedColumn<String>(
      'keyset_raw', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _inputFeePPKMeta =
      const VerificationMeta('inputFeePPK');
  @override
  late final GeneratedColumn<int> inputFeePPK = GeneratedColumn<int>(
      'input_fee_p_p_k', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  @override
  List<GeneratedColumn> get $columns =>
      [id, mintURL, unit, active, keysetRaw, inputFeePPK];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'KeysetInfo';
  @override
  VerificationContext validateIntegrity(
      Insertable<CashuKeysetInfoTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('mint_u_r_l')) {
      context.handle(_mintURLMeta,
          mintURL.isAcceptableOrUnknown(data['mint_u_r_l']!, _mintURLMeta));
    } else if (isInserting) {
      context.missing(_mintURLMeta);
    }
    if (data.containsKey('unit')) {
      context.handle(
          _unitMeta, unit.isAcceptableOrUnknown(data['unit']!, _unitMeta));
    } else if (isInserting) {
      context.missing(_unitMeta);
    }
    if (data.containsKey('active')) {
      context.handle(_activeMeta,
          active.isAcceptableOrUnknown(data['active']!, _activeMeta));
    } else if (isInserting) {
      context.missing(_activeMeta);
    }
    if (data.containsKey('keyset_raw')) {
      context.handle(_keysetRawMeta,
          keysetRaw.isAcceptableOrUnknown(data['keyset_raw']!, _keysetRawMeta));
    }
    if (data.containsKey('input_fee_p_p_k')) {
      context.handle(
          _inputFeePPKMeta,
          inputFeePPK.isAcceptableOrUnknown(
              data['input_fee_p_p_k']!, _inputFeePPKMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id, mintURL};
  @override
  CashuKeysetInfoTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CashuKeysetInfoTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      mintURL: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}mint_u_r_l'])!,
      unit: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}unit'])!,
      active: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}active'])!,
      keysetRaw: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}keyset_raw'])!,
      inputFeePPK: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}input_fee_p_p_k'])!,
    );
  }

  @override
  $CashuKeysetInfoTableTable createAlias(String alias) {
    return $CashuKeysetInfoTableTable(attachedDatabase, alias);
  }
}

class CashuKeysetInfoTableData extends DataClass
    implements Insertable<CashuKeysetInfoTableData> {
  final String id;
  final String mintURL;
  final String unit;
  final bool active;
  final String keysetRaw;
  final int inputFeePPK;
  const CashuKeysetInfoTableData(
      {required this.id,
      required this.mintURL,
      required this.unit,
      required this.active,
      required this.keysetRaw,
      required this.inputFeePPK});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['mint_u_r_l'] = Variable<String>(mintURL);
    map['unit'] = Variable<String>(unit);
    map['active'] = Variable<bool>(active);
    map['keyset_raw'] = Variable<String>(keysetRaw);
    map['input_fee_p_p_k'] = Variable<int>(inputFeePPK);
    return map;
  }

  CashuKeysetInfoTableCompanion toCompanion(bool nullToAbsent) {
    return CashuKeysetInfoTableCompanion(
      id: Value(id),
      mintURL: Value(mintURL),
      unit: Value(unit),
      active: Value(active),
      keysetRaw: Value(keysetRaw),
      inputFeePPK: Value(inputFeePPK),
    );
  }

  factory CashuKeysetInfoTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CashuKeysetInfoTableData(
      id: serializer.fromJson<String>(json['id']),
      mintURL: serializer.fromJson<String>(json['mintURL']),
      unit: serializer.fromJson<String>(json['unit']),
      active: serializer.fromJson<bool>(json['active']),
      keysetRaw: serializer.fromJson<String>(json['keysetRaw']),
      inputFeePPK: serializer.fromJson<int>(json['inputFeePPK']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'mintURL': serializer.toJson<String>(mintURL),
      'unit': serializer.toJson<String>(unit),
      'active': serializer.toJson<bool>(active),
      'keysetRaw': serializer.toJson<String>(keysetRaw),
      'inputFeePPK': serializer.toJson<int>(inputFeePPK),
    };
  }

  CashuKeysetInfoTableData copyWith(
          {String? id,
          String? mintURL,
          String? unit,
          bool? active,
          String? keysetRaw,
          int? inputFeePPK}) =>
      CashuKeysetInfoTableData(
        id: id ?? this.id,
        mintURL: mintURL ?? this.mintURL,
        unit: unit ?? this.unit,
        active: active ?? this.active,
        keysetRaw: keysetRaw ?? this.keysetRaw,
        inputFeePPK: inputFeePPK ?? this.inputFeePPK,
      );
  CashuKeysetInfoTableData copyWithCompanion(
      CashuKeysetInfoTableCompanion data) {
    return CashuKeysetInfoTableData(
      id: data.id.present ? data.id.value : this.id,
      mintURL: data.mintURL.present ? data.mintURL.value : this.mintURL,
      unit: data.unit.present ? data.unit.value : this.unit,
      active: data.active.present ? data.active.value : this.active,
      keysetRaw: data.keysetRaw.present ? data.keysetRaw.value : this.keysetRaw,
      inputFeePPK:
          data.inputFeePPK.present ? data.inputFeePPK.value : this.inputFeePPK,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CashuKeysetInfoTableData(')
          ..write('id: $id, ')
          ..write('mintURL: $mintURL, ')
          ..write('unit: $unit, ')
          ..write('active: $active, ')
          ..write('keysetRaw: $keysetRaw, ')
          ..write('inputFeePPK: $inputFeePPK')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, mintURL, unit, active, keysetRaw, inputFeePPK);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CashuKeysetInfoTableData &&
          other.id == this.id &&
          other.mintURL == this.mintURL &&
          other.unit == this.unit &&
          other.active == this.active &&
          other.keysetRaw == this.keysetRaw &&
          other.inputFeePPK == this.inputFeePPK);
}

class CashuKeysetInfoTableCompanion
    extends UpdateCompanion<CashuKeysetInfoTableData> {
  final Value<String> id;
  final Value<String> mintURL;
  final Value<String> unit;
  final Value<bool> active;
  final Value<String> keysetRaw;
  final Value<int> inputFeePPK;
  final Value<int> rowid;
  const CashuKeysetInfoTableCompanion({
    this.id = const Value.absent(),
    this.mintURL = const Value.absent(),
    this.unit = const Value.absent(),
    this.active = const Value.absent(),
    this.keysetRaw = const Value.absent(),
    this.inputFeePPK = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CashuKeysetInfoTableCompanion.insert({
    required String id,
    required String mintURL,
    required String unit,
    required bool active,
    this.keysetRaw = const Value.absent(),
    this.inputFeePPK = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        mintURL = Value(mintURL),
        unit = Value(unit),
        active = Value(active);
  static Insertable<CashuKeysetInfoTableData> custom({
    Expression<String>? id,
    Expression<String>? mintURL,
    Expression<String>? unit,
    Expression<bool>? active,
    Expression<String>? keysetRaw,
    Expression<int>? inputFeePPK,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (mintURL != null) 'mint_u_r_l': mintURL,
      if (unit != null) 'unit': unit,
      if (active != null) 'active': active,
      if (keysetRaw != null) 'keyset_raw': keysetRaw,
      if (inputFeePPK != null) 'input_fee_p_p_k': inputFeePPK,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CashuKeysetInfoTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? mintURL,
      Value<String>? unit,
      Value<bool>? active,
      Value<String>? keysetRaw,
      Value<int>? inputFeePPK,
      Value<int>? rowid}) {
    return CashuKeysetInfoTableCompanion(
      id: id ?? this.id,
      mintURL: mintURL ?? this.mintURL,
      unit: unit ?? this.unit,
      active: active ?? this.active,
      keysetRaw: keysetRaw ?? this.keysetRaw,
      inputFeePPK: inputFeePPK ?? this.inputFeePPK,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (mintURL.present) {
      map['mint_u_r_l'] = Variable<String>(mintURL.value);
    }
    if (unit.present) {
      map['unit'] = Variable<String>(unit.value);
    }
    if (active.present) {
      map['active'] = Variable<bool>(active.value);
    }
    if (keysetRaw.present) {
      map['keyset_raw'] = Variable<String>(keysetRaw.value);
    }
    if (inputFeePPK.present) {
      map['input_fee_p_p_k'] = Variable<int>(inputFeePPK.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CashuKeysetInfoTableCompanion(')
          ..write('id: $id, ')
          ..write('mintURL: $mintURL, ')
          ..write('unit: $unit, ')
          ..write('active: $active, ')
          ..write('keysetRaw: $keysetRaw, ')
          ..write('inputFeePPK: $inputFeePPK, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CashuInvoiceTableTable extends CashuInvoiceTable
    with TableInfo<$CashuInvoiceTableTable, CashuInvoiceTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CashuInvoiceTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _quoteMeta = const VerificationMeta('quote');
  @override
  late final GeneratedColumn<String> quote = GeneratedColumn<String>(
      'quote', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _requestMeta =
      const VerificationMeta('request');
  @override
  late final GeneratedColumn<String> request = GeneratedColumn<String>(
      'request', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _paidMeta = const VerificationMeta('paid');
  @override
  late final GeneratedColumn<bool> paid = GeneratedColumn<bool>(
      'paid', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("paid" IN (0, 1))'));
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<String> amount = GeneratedColumn<String>(
      'amount', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _expiryMeta = const VerificationMeta('expiry');
  @override
  late final GeneratedColumn<int> expiry = GeneratedColumn<int>(
      'expiry', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _mintURLMeta =
      const VerificationMeta('mintURL');
  @override
  late final GeneratedColumn<String> mintURL = GeneratedColumn<String>(
      'mint_u_r_l', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, quote, request, paid, amount, expiry, mintURL];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'IInvoice';
  @override
  VerificationContext validateIntegrity(
      Insertable<CashuInvoiceTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('quote')) {
      context.handle(
          _quoteMeta, quote.isAcceptableOrUnknown(data['quote']!, _quoteMeta));
    } else if (isInserting) {
      context.missing(_quoteMeta);
    }
    if (data.containsKey('request')) {
      context.handle(_requestMeta,
          request.isAcceptableOrUnknown(data['request']!, _requestMeta));
    } else if (isInserting) {
      context.missing(_requestMeta);
    }
    if (data.containsKey('paid')) {
      context.handle(
          _paidMeta, paid.isAcceptableOrUnknown(data['paid']!, _paidMeta));
    } else if (isInserting) {
      context.missing(_paidMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('expiry')) {
      context.handle(_expiryMeta,
          expiry.isAcceptableOrUnknown(data['expiry']!, _expiryMeta));
    } else if (isInserting) {
      context.missing(_expiryMeta);
    }
    if (data.containsKey('mint_u_r_l')) {
      context.handle(_mintURLMeta,
          mintURL.isAcceptableOrUnknown(data['mint_u_r_l']!, _mintURLMeta));
    } else if (isInserting) {
      context.missing(_mintURLMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {mintURL, quote};
  @override
  CashuInvoiceTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CashuInvoiceTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      quote: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}quote'])!,
      request: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}request'])!,
      paid: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}paid'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}amount'])!,
      expiry: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}expiry'])!,
      mintURL: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}mint_u_r_l'])!,
    );
  }

  @override
  $CashuInvoiceTableTable createAlias(String alias) {
    return $CashuInvoiceTableTable(attachedDatabase, alias);
  }
}

class CashuInvoiceTableData extends DataClass
    implements Insertable<CashuInvoiceTableData> {
  final String id;
  final String quote;
  final String request;
  final bool paid;
  final String amount;
  final int expiry;
  final String mintURL;
  const CashuInvoiceTableData(
      {required this.id,
      required this.quote,
      required this.request,
      required this.paid,
      required this.amount,
      required this.expiry,
      required this.mintURL});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['quote'] = Variable<String>(quote);
    map['request'] = Variable<String>(request);
    map['paid'] = Variable<bool>(paid);
    map['amount'] = Variable<String>(amount);
    map['expiry'] = Variable<int>(expiry);
    map['mint_u_r_l'] = Variable<String>(mintURL);
    return map;
  }

  CashuInvoiceTableCompanion toCompanion(bool nullToAbsent) {
    return CashuInvoiceTableCompanion(
      id: Value(id),
      quote: Value(quote),
      request: Value(request),
      paid: Value(paid),
      amount: Value(amount),
      expiry: Value(expiry),
      mintURL: Value(mintURL),
    );
  }

  factory CashuInvoiceTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CashuInvoiceTableData(
      id: serializer.fromJson<String>(json['id']),
      quote: serializer.fromJson<String>(json['quote']),
      request: serializer.fromJson<String>(json['request']),
      paid: serializer.fromJson<bool>(json['paid']),
      amount: serializer.fromJson<String>(json['amount']),
      expiry: serializer.fromJson<int>(json['expiry']),
      mintURL: serializer.fromJson<String>(json['mintURL']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'quote': serializer.toJson<String>(quote),
      'request': serializer.toJson<String>(request),
      'paid': serializer.toJson<bool>(paid),
      'amount': serializer.toJson<String>(amount),
      'expiry': serializer.toJson<int>(expiry),
      'mintURL': serializer.toJson<String>(mintURL),
    };
  }

  CashuInvoiceTableData copyWith(
          {String? id,
          String? quote,
          String? request,
          bool? paid,
          String? amount,
          int? expiry,
          String? mintURL}) =>
      CashuInvoiceTableData(
        id: id ?? this.id,
        quote: quote ?? this.quote,
        request: request ?? this.request,
        paid: paid ?? this.paid,
        amount: amount ?? this.amount,
        expiry: expiry ?? this.expiry,
        mintURL: mintURL ?? this.mintURL,
      );
  CashuInvoiceTableData copyWithCompanion(CashuInvoiceTableCompanion data) {
    return CashuInvoiceTableData(
      id: data.id.present ? data.id.value : this.id,
      quote: data.quote.present ? data.quote.value : this.quote,
      request: data.request.present ? data.request.value : this.request,
      paid: data.paid.present ? data.paid.value : this.paid,
      amount: data.amount.present ? data.amount.value : this.amount,
      expiry: data.expiry.present ? data.expiry.value : this.expiry,
      mintURL: data.mintURL.present ? data.mintURL.value : this.mintURL,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CashuInvoiceTableData(')
          ..write('id: $id, ')
          ..write('quote: $quote, ')
          ..write('request: $request, ')
          ..write('paid: $paid, ')
          ..write('amount: $amount, ')
          ..write('expiry: $expiry, ')
          ..write('mintURL: $mintURL')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, quote, request, paid, amount, expiry, mintURL);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CashuInvoiceTableData &&
          other.id == this.id &&
          other.quote == this.quote &&
          other.request == this.request &&
          other.paid == this.paid &&
          other.amount == this.amount &&
          other.expiry == this.expiry &&
          other.mintURL == this.mintURL);
}

class CashuInvoiceTableCompanion
    extends UpdateCompanion<CashuInvoiceTableData> {
  final Value<String> id;
  final Value<String> quote;
  final Value<String> request;
  final Value<bool> paid;
  final Value<String> amount;
  final Value<int> expiry;
  final Value<String> mintURL;
  final Value<int> rowid;
  const CashuInvoiceTableCompanion({
    this.id = const Value.absent(),
    this.quote = const Value.absent(),
    this.request = const Value.absent(),
    this.paid = const Value.absent(),
    this.amount = const Value.absent(),
    this.expiry = const Value.absent(),
    this.mintURL = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CashuInvoiceTableCompanion.insert({
    required String id,
    required String quote,
    required String request,
    required bool paid,
    required String amount,
    required int expiry,
    required String mintURL,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        quote = Value(quote),
        request = Value(request),
        paid = Value(paid),
        amount = Value(amount),
        expiry = Value(expiry),
        mintURL = Value(mintURL);
  static Insertable<CashuInvoiceTableData> custom({
    Expression<String>? id,
    Expression<String>? quote,
    Expression<String>? request,
    Expression<bool>? paid,
    Expression<String>? amount,
    Expression<int>? expiry,
    Expression<String>? mintURL,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (quote != null) 'quote': quote,
      if (request != null) 'request': request,
      if (paid != null) 'paid': paid,
      if (amount != null) 'amount': amount,
      if (expiry != null) 'expiry': expiry,
      if (mintURL != null) 'mint_u_r_l': mintURL,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CashuInvoiceTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? quote,
      Value<String>? request,
      Value<bool>? paid,
      Value<String>? amount,
      Value<int>? expiry,
      Value<String>? mintURL,
      Value<int>? rowid}) {
    return CashuInvoiceTableCompanion(
      id: id ?? this.id,
      quote: quote ?? this.quote,
      request: request ?? this.request,
      paid: paid ?? this.paid,
      amount: amount ?? this.amount,
      expiry: expiry ?? this.expiry,
      mintURL: mintURL ?? this.mintURL,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (quote.present) {
      map['quote'] = Variable<String>(quote.value);
    }
    if (request.present) {
      map['request'] = Variable<String>(request.value);
    }
    if (paid.present) {
      map['paid'] = Variable<bool>(paid.value);
    }
    if (amount.present) {
      map['amount'] = Variable<String>(amount.value);
    }
    if (expiry.present) {
      map['expiry'] = Variable<int>(expiry.value);
    }
    if (mintURL.present) {
      map['mint_u_r_l'] = Variable<String>(mintURL.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CashuInvoiceTableCompanion(')
          ..write('id: $id, ')
          ..write('quote: $quote, ')
          ..write('request: $request, ')
          ..write('paid: $paid, ')
          ..write('amount: $amount, ')
          ..write('expiry: $expiry, ')
          ..write('mintURL: $mintURL, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CashuUnblindingDataTableTable extends CashuUnblindingDataTable
    with
        TableInfo<$CashuUnblindingDataTableTable,
            CashuUnblindingDataTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CashuUnblindingDataTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _mintURLMeta =
      const VerificationMeta('mintURL');
  @override
  late final GeneratedColumn<String> mintURL = GeneratedColumn<String>(
      'mint_u_r_l', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _unitMeta = const VerificationMeta('unit');
  @override
  late final GeneratedColumn<String> unit = GeneratedColumn<String>(
      'unit', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _actionTypeRawMeta =
      const VerificationMeta('actionTypeRaw');
  @override
  late final GeneratedColumn<int> actionTypeRaw = GeneratedColumn<int>(
      'action_type_raw', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _actionValueMeta =
      const VerificationMeta('actionValue');
  @override
  late final GeneratedColumn<String> actionValue = GeneratedColumn<String>(
      'action_value', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<String> amount = GeneratedColumn<String>(
      'amount', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _C_Meta = const VerificationMeta('C_');
  @override
  late final GeneratedColumn<String> C_ = GeneratedColumn<String>(
      'c', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dleqPlainTextMeta =
      const VerificationMeta('dleqPlainText');
  @override
  late final GeneratedColumn<String> dleqPlainText = GeneratedColumn<String>(
      'dleq_plain_text', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _rMeta = const VerificationMeta('r');
  @override
  late final GeneratedColumn<String> r = GeneratedColumn<String>(
      'r', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _secretMeta = const VerificationMeta('secret');
  @override
  late final GeneratedColumn<String> secret = GeneratedColumn<String>(
      'secret', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        mintURL,
        unit,
        actionTypeRaw,
        actionValue,
        id,
        amount,
        C_,
        dleqPlainText,
        r,
        secret
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'UnblindingData';
  @override
  VerificationContext validateIntegrity(
      Insertable<CashuUnblindingDataTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('mint_u_r_l')) {
      context.handle(_mintURLMeta,
          mintURL.isAcceptableOrUnknown(data['mint_u_r_l']!, _mintURLMeta));
    } else if (isInserting) {
      context.missing(_mintURLMeta);
    }
    if (data.containsKey('unit')) {
      context.handle(
          _unitMeta, unit.isAcceptableOrUnknown(data['unit']!, _unitMeta));
    } else if (isInserting) {
      context.missing(_unitMeta);
    }
    if (data.containsKey('action_type_raw')) {
      context.handle(
          _actionTypeRawMeta,
          actionTypeRaw.isAcceptableOrUnknown(
              data['action_type_raw']!, _actionTypeRawMeta));
    } else if (isInserting) {
      context.missing(_actionTypeRawMeta);
    }
    if (data.containsKey('action_value')) {
      context.handle(
          _actionValueMeta,
          actionValue.isAcceptableOrUnknown(
              data['action_value']!, _actionValueMeta));
    } else if (isInserting) {
      context.missing(_actionValueMeta);
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('c')) {
      context.handle(_C_Meta, C_.isAcceptableOrUnknown(data['c']!, _C_Meta));
    } else if (isInserting) {
      context.missing(_C_Meta);
    }
    if (data.containsKey('dleq_plain_text')) {
      context.handle(
          _dleqPlainTextMeta,
          dleqPlainText.isAcceptableOrUnknown(
              data['dleq_plain_text']!, _dleqPlainTextMeta));
    }
    if (data.containsKey('r')) {
      context.handle(_rMeta, r.isAcceptableOrUnknown(data['r']!, _rMeta));
    } else if (isInserting) {
      context.missing(_rMeta);
    }
    if (data.containsKey('secret')) {
      context.handle(_secretMeta,
          secret.isAcceptableOrUnknown(data['secret']!, _secretMeta));
    } else if (isInserting) {
      context.missing(_secretMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id, secret};
  @override
  CashuUnblindingDataTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CashuUnblindingDataTableData(
      mintURL: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}mint_u_r_l'])!,
      unit: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}unit'])!,
      actionTypeRaw: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}action_type_raw'])!,
      actionValue: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}action_value'])!,
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}amount'])!,
      C_: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}c'])!,
      dleqPlainText: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}dleq_plain_text'])!,
      r: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}r'])!,
      secret: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}secret'])!,
    );
  }

  @override
  $CashuUnblindingDataTableTable createAlias(String alias) {
    return $CashuUnblindingDataTableTable(attachedDatabase, alias);
  }
}

class CashuUnblindingDataTableData extends DataClass
    implements Insertable<CashuUnblindingDataTableData> {
  final String mintURL;
  final String unit;
  final int actionTypeRaw;
  final String actionValue;
  final String id;
  final String amount;
  final String C_;
  final String dleqPlainText;
  final String r;
  final String secret;
  const CashuUnblindingDataTableData(
      {required this.mintURL,
      required this.unit,
      required this.actionTypeRaw,
      required this.actionValue,
      required this.id,
      required this.amount,
      required this.C_,
      required this.dleqPlainText,
      required this.r,
      required this.secret});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['mint_u_r_l'] = Variable<String>(mintURL);
    map['unit'] = Variable<String>(unit);
    map['action_type_raw'] = Variable<int>(actionTypeRaw);
    map['action_value'] = Variable<String>(actionValue);
    map['id'] = Variable<String>(id);
    map['amount'] = Variable<String>(amount);
    map['c'] = Variable<String>(C_);
    map['dleq_plain_text'] = Variable<String>(dleqPlainText);
    map['r'] = Variable<String>(r);
    map['secret'] = Variable<String>(secret);
    return map;
  }

  CashuUnblindingDataTableCompanion toCompanion(bool nullToAbsent) {
    return CashuUnblindingDataTableCompanion(
      mintURL: Value(mintURL),
      unit: Value(unit),
      actionTypeRaw: Value(actionTypeRaw),
      actionValue: Value(actionValue),
      id: Value(id),
      amount: Value(amount),
      C_: Value(C_),
      dleqPlainText: Value(dleqPlainText),
      r: Value(r),
      secret: Value(secret),
    );
  }

  factory CashuUnblindingDataTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CashuUnblindingDataTableData(
      mintURL: serializer.fromJson<String>(json['mintURL']),
      unit: serializer.fromJson<String>(json['unit']),
      actionTypeRaw: serializer.fromJson<int>(json['actionTypeRaw']),
      actionValue: serializer.fromJson<String>(json['actionValue']),
      id: serializer.fromJson<String>(json['id']),
      amount: serializer.fromJson<String>(json['amount']),
      C_: serializer.fromJson<String>(json['C_']),
      dleqPlainText: serializer.fromJson<String>(json['dleqPlainText']),
      r: serializer.fromJson<String>(json['r']),
      secret: serializer.fromJson<String>(json['secret']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'mintURL': serializer.toJson<String>(mintURL),
      'unit': serializer.toJson<String>(unit),
      'actionTypeRaw': serializer.toJson<int>(actionTypeRaw),
      'actionValue': serializer.toJson<String>(actionValue),
      'id': serializer.toJson<String>(id),
      'amount': serializer.toJson<String>(amount),
      'C_': serializer.toJson<String>(C_),
      'dleqPlainText': serializer.toJson<String>(dleqPlainText),
      'r': serializer.toJson<String>(r),
      'secret': serializer.toJson<String>(secret),
    };
  }

  CashuUnblindingDataTableData copyWith(
          {String? mintURL,
          String? unit,
          int? actionTypeRaw,
          String? actionValue,
          String? id,
          String? amount,
          String? C_,
          String? dleqPlainText,
          String? r,
          String? secret}) =>
      CashuUnblindingDataTableData(
        mintURL: mintURL ?? this.mintURL,
        unit: unit ?? this.unit,
        actionTypeRaw: actionTypeRaw ?? this.actionTypeRaw,
        actionValue: actionValue ?? this.actionValue,
        id: id ?? this.id,
        amount: amount ?? this.amount,
        C_: C_ ?? this.C_,
        dleqPlainText: dleqPlainText ?? this.dleqPlainText,
        r: r ?? this.r,
        secret: secret ?? this.secret,
      );
  CashuUnblindingDataTableData copyWithCompanion(
      CashuUnblindingDataTableCompanion data) {
    return CashuUnblindingDataTableData(
      mintURL: data.mintURL.present ? data.mintURL.value : this.mintURL,
      unit: data.unit.present ? data.unit.value : this.unit,
      actionTypeRaw: data.actionTypeRaw.present
          ? data.actionTypeRaw.value
          : this.actionTypeRaw,
      actionValue:
          data.actionValue.present ? data.actionValue.value : this.actionValue,
      id: data.id.present ? data.id.value : this.id,
      amount: data.amount.present ? data.amount.value : this.amount,
      C_: data.C_.present ? data.C_.value : this.C_,
      dleqPlainText: data.dleqPlainText.present
          ? data.dleqPlainText.value
          : this.dleqPlainText,
      r: data.r.present ? data.r.value : this.r,
      secret: data.secret.present ? data.secret.value : this.secret,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CashuUnblindingDataTableData(')
          ..write('mintURL: $mintURL, ')
          ..write('unit: $unit, ')
          ..write('actionTypeRaw: $actionTypeRaw, ')
          ..write('actionValue: $actionValue, ')
          ..write('id: $id, ')
          ..write('amount: $amount, ')
          ..write('C_: $C_, ')
          ..write('dleqPlainText: $dleqPlainText, ')
          ..write('r: $r, ')
          ..write('secret: $secret')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(mintURL, unit, actionTypeRaw, actionValue, id,
      amount, C_, dleqPlainText, r, secret);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CashuUnblindingDataTableData &&
          other.mintURL == this.mintURL &&
          other.unit == this.unit &&
          other.actionTypeRaw == this.actionTypeRaw &&
          other.actionValue == this.actionValue &&
          other.id == this.id &&
          other.amount == this.amount &&
          other.C_ == this.C_ &&
          other.dleqPlainText == this.dleqPlainText &&
          other.r == this.r &&
          other.secret == this.secret);
}

class CashuUnblindingDataTableCompanion
    extends UpdateCompanion<CashuUnblindingDataTableData> {
  final Value<String> mintURL;
  final Value<String> unit;
  final Value<int> actionTypeRaw;
  final Value<String> actionValue;
  final Value<String> id;
  final Value<String> amount;
  final Value<String> C_;
  final Value<String> dleqPlainText;
  final Value<String> r;
  final Value<String> secret;
  final Value<int> rowid;
  const CashuUnblindingDataTableCompanion({
    this.mintURL = const Value.absent(),
    this.unit = const Value.absent(),
    this.actionTypeRaw = const Value.absent(),
    this.actionValue = const Value.absent(),
    this.id = const Value.absent(),
    this.amount = const Value.absent(),
    this.C_ = const Value.absent(),
    this.dleqPlainText = const Value.absent(),
    this.r = const Value.absent(),
    this.secret = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CashuUnblindingDataTableCompanion.insert({
    required String mintURL,
    required String unit,
    required int actionTypeRaw,
    required String actionValue,
    required String id,
    required String amount,
    required String C_,
    this.dleqPlainText = const Value.absent(),
    required String r,
    required String secret,
    this.rowid = const Value.absent(),
  })  : mintURL = Value(mintURL),
        unit = Value(unit),
        actionTypeRaw = Value(actionTypeRaw),
        actionValue = Value(actionValue),
        id = Value(id),
        amount = Value(amount),
        C_ = Value(C_),
        r = Value(r),
        secret = Value(secret);
  static Insertable<CashuUnblindingDataTableData> custom({
    Expression<String>? mintURL,
    Expression<String>? unit,
    Expression<int>? actionTypeRaw,
    Expression<String>? actionValue,
    Expression<String>? id,
    Expression<String>? amount,
    Expression<String>? C_,
    Expression<String>? dleqPlainText,
    Expression<String>? r,
    Expression<String>? secret,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (mintURL != null) 'mint_u_r_l': mintURL,
      if (unit != null) 'unit': unit,
      if (actionTypeRaw != null) 'action_type_raw': actionTypeRaw,
      if (actionValue != null) 'action_value': actionValue,
      if (id != null) 'id': id,
      if (amount != null) 'amount': amount,
      if (C_ != null) 'c': C_,
      if (dleqPlainText != null) 'dleq_plain_text': dleqPlainText,
      if (r != null) 'r': r,
      if (secret != null) 'secret': secret,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CashuUnblindingDataTableCompanion copyWith(
      {Value<String>? mintURL,
      Value<String>? unit,
      Value<int>? actionTypeRaw,
      Value<String>? actionValue,
      Value<String>? id,
      Value<String>? amount,
      Value<String>? C_,
      Value<String>? dleqPlainText,
      Value<String>? r,
      Value<String>? secret,
      Value<int>? rowid}) {
    return CashuUnblindingDataTableCompanion(
      mintURL: mintURL ?? this.mintURL,
      unit: unit ?? this.unit,
      actionTypeRaw: actionTypeRaw ?? this.actionTypeRaw,
      actionValue: actionValue ?? this.actionValue,
      id: id ?? this.id,
      amount: amount ?? this.amount,
      C_: C_ ?? this.C_,
      dleqPlainText: dleqPlainText ?? this.dleqPlainText,
      r: r ?? this.r,
      secret: secret ?? this.secret,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (mintURL.present) {
      map['mint_u_r_l'] = Variable<String>(mintURL.value);
    }
    if (unit.present) {
      map['unit'] = Variable<String>(unit.value);
    }
    if (actionTypeRaw.present) {
      map['action_type_raw'] = Variable<int>(actionTypeRaw.value);
    }
    if (actionValue.present) {
      map['action_value'] = Variable<String>(actionValue.value);
    }
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (amount.present) {
      map['amount'] = Variable<String>(amount.value);
    }
    if (C_.present) {
      map['c'] = Variable<String>(C_.value);
    }
    if (dleqPlainText.present) {
      map['dleq_plain_text'] = Variable<String>(dleqPlainText.value);
    }
    if (r.present) {
      map['r'] = Variable<String>(r.value);
    }
    if (secret.present) {
      map['secret'] = Variable<String>(secret.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CashuUnblindingDataTableCompanion(')
          ..write('mintURL: $mintURL, ')
          ..write('unit: $unit, ')
          ..write('actionTypeRaw: $actionTypeRaw, ')
          ..write('actionValue: $actionValue, ')
          ..write('id: $id, ')
          ..write('amount: $amount, ')
          ..write('C_: $C_, ')
          ..write('dleqPlainText: $dleqPlainText, ')
          ..write('r: $r, ')
          ..write('secret: $secret, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CashuMintInfoTableTable extends CashuMintInfoTable
    with TableInfo<$CashuMintInfoTableTable, CashuMintInfoTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CashuMintInfoTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _mintURLMeta =
      const VerificationMeta('mintURL');
  @override
  late final GeneratedColumn<String> mintURL = GeneratedColumn<String>(
      'mint_u_r_l', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _iconUrlMeta =
      const VerificationMeta('iconUrl');
  @override
  late final GeneratedColumn<String> iconUrl = GeneratedColumn<String>(
      'icon_url', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _pubkeyMeta = const VerificationMeta('pubkey');
  @override
  late final GeneratedColumn<String> pubkey = GeneratedColumn<String>(
      'pubkey', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _versionMeta =
      const VerificationMeta('version');
  @override
  late final GeneratedColumn<String> version = GeneratedColumn<String>(
      'version', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _descriptionLongMeta =
      const VerificationMeta('descriptionLong');
  @override
  late final GeneratedColumn<String> descriptionLong = GeneratedColumn<String>(
      'description_long', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  @override
  late final GeneratedColumnWithTypeConverter<List<Map<String, String>>, String>
      contact = GeneratedColumn<String>('contact', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<Map<String, String>>>(
              $CashuMintInfoTableTable.$convertercontact);
  static const VerificationMeta _motdMeta = const VerificationMeta('motd');
  @override
  late final GeneratedColumn<String> motd = GeneratedColumn<String>(
      'motd', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _nutsJsonMeta =
      const VerificationMeta('nutsJson');
  @override
  late final GeneratedColumn<String> nutsJson = GeneratedColumn<String>(
      'nuts_json', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  @override
  List<GeneratedColumn> get $columns => [
        mintURL,
        name,
        iconUrl,
        pubkey,
        version,
        description,
        descriptionLong,
        contact,
        motd,
        nutsJson
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'MintInfo';
  @override
  VerificationContext validateIntegrity(
      Insertable<CashuMintInfoTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('mint_u_r_l')) {
      context.handle(_mintURLMeta,
          mintURL.isAcceptableOrUnknown(data['mint_u_r_l']!, _mintURLMeta));
    } else if (isInserting) {
      context.missing(_mintURLMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    if (data.containsKey('icon_url')) {
      context.handle(_iconUrlMeta,
          iconUrl.isAcceptableOrUnknown(data['icon_url']!, _iconUrlMeta));
    }
    if (data.containsKey('pubkey')) {
      context.handle(_pubkeyMeta,
          pubkey.isAcceptableOrUnknown(data['pubkey']!, _pubkeyMeta));
    }
    if (data.containsKey('version')) {
      context.handle(_versionMeta,
          version.isAcceptableOrUnknown(data['version']!, _versionMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('description_long')) {
      context.handle(
          _descriptionLongMeta,
          descriptionLong.isAcceptableOrUnknown(
              data['description_long']!, _descriptionLongMeta));
    }
    if (data.containsKey('motd')) {
      context.handle(
          _motdMeta, motd.isAcceptableOrUnknown(data['motd']!, _motdMeta));
    }
    if (data.containsKey('nuts_json')) {
      context.handle(_nutsJsonMeta,
          nutsJson.isAcceptableOrUnknown(data['nuts_json']!, _nutsJsonMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {mintURL};
  @override
  CashuMintInfoTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CashuMintInfoTableData(
      mintURL: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}mint_u_r_l'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      iconUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}icon_url'])!,
      pubkey: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}pubkey'])!,
      version: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}version'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      descriptionLong: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}description_long'])!,
      contact: $CashuMintInfoTableTable.$convertercontact.fromSql(
          attachedDatabase.typeMapping
              .read(DriftSqlType.string, data['${effectivePrefix}contact'])!),
      motd: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}motd'])!,
      nutsJson: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nuts_json'])!,
    );
  }

  @override
  $CashuMintInfoTableTable createAlias(String alias) {
    return $CashuMintInfoTableTable(attachedDatabase, alias);
  }

  static TypeConverter<List<Map<String, String>>, String> $convertercontact =
      const StringListOfMapConverter();
}

class CashuMintInfoTableData extends DataClass
    implements Insertable<CashuMintInfoTableData> {
  final String mintURL;
  final String name;
  final String iconUrl;
  final String pubkey;
  final String version;
  final String description;
  final String descriptionLong;
  final List<Map<String, String>> contact;
  final String motd;
  final String nutsJson;
  const CashuMintInfoTableData(
      {required this.mintURL,
      required this.name,
      required this.iconUrl,
      required this.pubkey,
      required this.version,
      required this.description,
      required this.descriptionLong,
      required this.contact,
      required this.motd,
      required this.nutsJson});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['mint_u_r_l'] = Variable<String>(mintURL);
    map['name'] = Variable<String>(name);
    map['icon_url'] = Variable<String>(iconUrl);
    map['pubkey'] = Variable<String>(pubkey);
    map['version'] = Variable<String>(version);
    map['description'] = Variable<String>(description);
    map['description_long'] = Variable<String>(descriptionLong);
    {
      map['contact'] = Variable<String>(
          $CashuMintInfoTableTable.$convertercontact.toSql(contact));
    }
    map['motd'] = Variable<String>(motd);
    map['nuts_json'] = Variable<String>(nutsJson);
    return map;
  }

  CashuMintInfoTableCompanion toCompanion(bool nullToAbsent) {
    return CashuMintInfoTableCompanion(
      mintURL: Value(mintURL),
      name: Value(name),
      iconUrl: Value(iconUrl),
      pubkey: Value(pubkey),
      version: Value(version),
      description: Value(description),
      descriptionLong: Value(descriptionLong),
      contact: Value(contact),
      motd: Value(motd),
      nutsJson: Value(nutsJson),
    );
  }

  factory CashuMintInfoTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CashuMintInfoTableData(
      mintURL: serializer.fromJson<String>(json['mintURL']),
      name: serializer.fromJson<String>(json['name']),
      iconUrl: serializer.fromJson<String>(json['iconUrl']),
      pubkey: serializer.fromJson<String>(json['pubkey']),
      version: serializer.fromJson<String>(json['version']),
      description: serializer.fromJson<String>(json['description']),
      descriptionLong: serializer.fromJson<String>(json['descriptionLong']),
      contact: serializer.fromJson<List<Map<String, String>>>(json['contact']),
      motd: serializer.fromJson<String>(json['motd']),
      nutsJson: serializer.fromJson<String>(json['nutsJson']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'mintURL': serializer.toJson<String>(mintURL),
      'name': serializer.toJson<String>(name),
      'iconUrl': serializer.toJson<String>(iconUrl),
      'pubkey': serializer.toJson<String>(pubkey),
      'version': serializer.toJson<String>(version),
      'description': serializer.toJson<String>(description),
      'descriptionLong': serializer.toJson<String>(descriptionLong),
      'contact': serializer.toJson<List<Map<String, String>>>(contact),
      'motd': serializer.toJson<String>(motd),
      'nutsJson': serializer.toJson<String>(nutsJson),
    };
  }

  CashuMintInfoTableData copyWith(
          {String? mintURL,
          String? name,
          String? iconUrl,
          String? pubkey,
          String? version,
          String? description,
          String? descriptionLong,
          List<Map<String, String>>? contact,
          String? motd,
          String? nutsJson}) =>
      CashuMintInfoTableData(
        mintURL: mintURL ?? this.mintURL,
        name: name ?? this.name,
        iconUrl: iconUrl ?? this.iconUrl,
        pubkey: pubkey ?? this.pubkey,
        version: version ?? this.version,
        description: description ?? this.description,
        descriptionLong: descriptionLong ?? this.descriptionLong,
        contact: contact ?? this.contact,
        motd: motd ?? this.motd,
        nutsJson: nutsJson ?? this.nutsJson,
      );
  CashuMintInfoTableData copyWithCompanion(CashuMintInfoTableCompanion data) {
    return CashuMintInfoTableData(
      mintURL: data.mintURL.present ? data.mintURL.value : this.mintURL,
      name: data.name.present ? data.name.value : this.name,
      iconUrl: data.iconUrl.present ? data.iconUrl.value : this.iconUrl,
      pubkey: data.pubkey.present ? data.pubkey.value : this.pubkey,
      version: data.version.present ? data.version.value : this.version,
      description:
          data.description.present ? data.description.value : this.description,
      descriptionLong: data.descriptionLong.present
          ? data.descriptionLong.value
          : this.descriptionLong,
      contact: data.contact.present ? data.contact.value : this.contact,
      motd: data.motd.present ? data.motd.value : this.motd,
      nutsJson: data.nutsJson.present ? data.nutsJson.value : this.nutsJson,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CashuMintInfoTableData(')
          ..write('mintURL: $mintURL, ')
          ..write('name: $name, ')
          ..write('iconUrl: $iconUrl, ')
          ..write('pubkey: $pubkey, ')
          ..write('version: $version, ')
          ..write('description: $description, ')
          ..write('descriptionLong: $descriptionLong, ')
          ..write('contact: $contact, ')
          ..write('motd: $motd, ')
          ..write('nutsJson: $nutsJson')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(mintURL, name, iconUrl, pubkey, version,
      description, descriptionLong, contact, motd, nutsJson);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CashuMintInfoTableData &&
          other.mintURL == this.mintURL &&
          other.name == this.name &&
          other.iconUrl == this.iconUrl &&
          other.pubkey == this.pubkey &&
          other.version == this.version &&
          other.description == this.description &&
          other.descriptionLong == this.descriptionLong &&
          other.contact == this.contact &&
          other.motd == this.motd &&
          other.nutsJson == this.nutsJson);
}

class CashuMintInfoTableCompanion
    extends UpdateCompanion<CashuMintInfoTableData> {
  final Value<String> mintURL;
  final Value<String> name;
  final Value<String> iconUrl;
  final Value<String> pubkey;
  final Value<String> version;
  final Value<String> description;
  final Value<String> descriptionLong;
  final Value<List<Map<String, String>>> contact;
  final Value<String> motd;
  final Value<String> nutsJson;
  final Value<int> rowid;
  const CashuMintInfoTableCompanion({
    this.mintURL = const Value.absent(),
    this.name = const Value.absent(),
    this.iconUrl = const Value.absent(),
    this.pubkey = const Value.absent(),
    this.version = const Value.absent(),
    this.description = const Value.absent(),
    this.descriptionLong = const Value.absent(),
    this.contact = const Value.absent(),
    this.motd = const Value.absent(),
    this.nutsJson = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CashuMintInfoTableCompanion.insert({
    required String mintURL,
    this.name = const Value.absent(),
    this.iconUrl = const Value.absent(),
    this.pubkey = const Value.absent(),
    this.version = const Value.absent(),
    this.description = const Value.absent(),
    this.descriptionLong = const Value.absent(),
    required List<Map<String, String>> contact,
    this.motd = const Value.absent(),
    this.nutsJson = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : mintURL = Value(mintURL),
        contact = Value(contact);
  static Insertable<CashuMintInfoTableData> custom({
    Expression<String>? mintURL,
    Expression<String>? name,
    Expression<String>? iconUrl,
    Expression<String>? pubkey,
    Expression<String>? version,
    Expression<String>? description,
    Expression<String>? descriptionLong,
    Expression<String>? contact,
    Expression<String>? motd,
    Expression<String>? nutsJson,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (mintURL != null) 'mint_u_r_l': mintURL,
      if (name != null) 'name': name,
      if (iconUrl != null) 'icon_url': iconUrl,
      if (pubkey != null) 'pubkey': pubkey,
      if (version != null) 'version': version,
      if (description != null) 'description': description,
      if (descriptionLong != null) 'description_long': descriptionLong,
      if (contact != null) 'contact': contact,
      if (motd != null) 'motd': motd,
      if (nutsJson != null) 'nuts_json': nutsJson,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CashuMintInfoTableCompanion copyWith(
      {Value<String>? mintURL,
      Value<String>? name,
      Value<String>? iconUrl,
      Value<String>? pubkey,
      Value<String>? version,
      Value<String>? description,
      Value<String>? descriptionLong,
      Value<List<Map<String, String>>>? contact,
      Value<String>? motd,
      Value<String>? nutsJson,
      Value<int>? rowid}) {
    return CashuMintInfoTableCompanion(
      mintURL: mintURL ?? this.mintURL,
      name: name ?? this.name,
      iconUrl: iconUrl ?? this.iconUrl,
      pubkey: pubkey ?? this.pubkey,
      version: version ?? this.version,
      description: description ?? this.description,
      descriptionLong: descriptionLong ?? this.descriptionLong,
      contact: contact ?? this.contact,
      motd: motd ?? this.motd,
      nutsJson: nutsJson ?? this.nutsJson,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (mintURL.present) {
      map['mint_u_r_l'] = Variable<String>(mintURL.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (iconUrl.present) {
      map['icon_url'] = Variable<String>(iconUrl.value);
    }
    if (pubkey.present) {
      map['pubkey'] = Variable<String>(pubkey.value);
    }
    if (version.present) {
      map['version'] = Variable<String>(version.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (descriptionLong.present) {
      map['description_long'] = Variable<String>(descriptionLong.value);
    }
    if (contact.present) {
      map['contact'] = Variable<String>(
          $CashuMintInfoTableTable.$convertercontact.toSql(contact.value));
    }
    if (motd.present) {
      map['motd'] = Variable<String>(motd.value);
    }
    if (nutsJson.present) {
      map['nuts_json'] = Variable<String>(nutsJson.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CashuMintInfoTableCompanion(')
          ..write('mintURL: $mintURL, ')
          ..write('name: $name, ')
          ..write('iconUrl: $iconUrl, ')
          ..write('pubkey: $pubkey, ')
          ..write('version: $version, ')
          ..write('description: $description, ')
          ..write('descriptionLong: $descriptionLong, ')
          ..write('contact: $contact, ')
          ..write('motd: $motd, ')
          ..write('nutsJson: $nutsJson, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CashuLightningInvoiceTableTable extends CashuLightningInvoiceTable
    with
        TableInfo<$CashuLightningInvoiceTableTable,
            CashuLightningInvoiceTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CashuLightningInvoiceTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _prMeta = const VerificationMeta('pr');
  @override
  late final GeneratedColumn<String> pr = GeneratedColumn<String>(
      'pr', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _hashMeta = const VerificationMeta('hash');
  @override
  late final GeneratedColumn<String> hash = GeneratedColumn<String>(
      'hash', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<String> amount = GeneratedColumn<String>(
      'amount', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _mintURLMeta =
      const VerificationMeta('mintURL');
  @override
  late final GeneratedColumn<String> mintURL = GeneratedColumn<String>(
      'mint_u_r_l', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, pr, hash, amount, mintURL];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cashu_lightning_invoice';
  @override
  VerificationContext validateIntegrity(
      Insertable<CashuLightningInvoiceTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('pr')) {
      context.handle(_prMeta, pr.isAcceptableOrUnknown(data['pr']!, _prMeta));
    } else if (isInserting) {
      context.missing(_prMeta);
    }
    if (data.containsKey('hash')) {
      context.handle(
          _hashMeta, hash.isAcceptableOrUnknown(data['hash']!, _hashMeta));
    } else if (isInserting) {
      context.missing(_hashMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('mint_u_r_l')) {
      context.handle(_mintURLMeta,
          mintURL.isAcceptableOrUnknown(data['mint_u_r_l']!, _mintURLMeta));
    } else if (isInserting) {
      context.missing(_mintURLMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {mintURL, hash};
  @override
  CashuLightningInvoiceTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CashuLightningInvoiceTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      pr: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}pr'])!,
      hash: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}hash'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}amount'])!,
      mintURL: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}mint_u_r_l'])!,
    );
  }

  @override
  $CashuLightningInvoiceTableTable createAlias(String alias) {
    return $CashuLightningInvoiceTableTable(attachedDatabase, alias);
  }
}

class CashuLightningInvoiceTableData extends DataClass
    implements Insertable<CashuLightningInvoiceTableData> {
  final String id;
  final String pr;
  final String hash;
  final String amount;
  final String mintURL;
  const CashuLightningInvoiceTableData(
      {required this.id,
      required this.pr,
      required this.hash,
      required this.amount,
      required this.mintURL});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['pr'] = Variable<String>(pr);
    map['hash'] = Variable<String>(hash);
    map['amount'] = Variable<String>(amount);
    map['mint_u_r_l'] = Variable<String>(mintURL);
    return map;
  }

  CashuLightningInvoiceTableCompanion toCompanion(bool nullToAbsent) {
    return CashuLightningInvoiceTableCompanion(
      id: Value(id),
      pr: Value(pr),
      hash: Value(hash),
      amount: Value(amount),
      mintURL: Value(mintURL),
    );
  }

  factory CashuLightningInvoiceTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CashuLightningInvoiceTableData(
      id: serializer.fromJson<String>(json['id']),
      pr: serializer.fromJson<String>(json['pr']),
      hash: serializer.fromJson<String>(json['hash']),
      amount: serializer.fromJson<String>(json['amount']),
      mintURL: serializer.fromJson<String>(json['mintURL']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'pr': serializer.toJson<String>(pr),
      'hash': serializer.toJson<String>(hash),
      'amount': serializer.toJson<String>(amount),
      'mintURL': serializer.toJson<String>(mintURL),
    };
  }

  CashuLightningInvoiceTableData copyWith(
          {String? id,
          String? pr,
          String? hash,
          String? amount,
          String? mintURL}) =>
      CashuLightningInvoiceTableData(
        id: id ?? this.id,
        pr: pr ?? this.pr,
        hash: hash ?? this.hash,
        amount: amount ?? this.amount,
        mintURL: mintURL ?? this.mintURL,
      );
  CashuLightningInvoiceTableData copyWithCompanion(
      CashuLightningInvoiceTableCompanion data) {
    return CashuLightningInvoiceTableData(
      id: data.id.present ? data.id.value : this.id,
      pr: data.pr.present ? data.pr.value : this.pr,
      hash: data.hash.present ? data.hash.value : this.hash,
      amount: data.amount.present ? data.amount.value : this.amount,
      mintURL: data.mintURL.present ? data.mintURL.value : this.mintURL,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CashuLightningInvoiceTableData(')
          ..write('id: $id, ')
          ..write('pr: $pr, ')
          ..write('hash: $hash, ')
          ..write('amount: $amount, ')
          ..write('mintURL: $mintURL')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, pr, hash, amount, mintURL);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CashuLightningInvoiceTableData &&
          other.id == this.id &&
          other.pr == this.pr &&
          other.hash == this.hash &&
          other.amount == this.amount &&
          other.mintURL == this.mintURL);
}

class CashuLightningInvoiceTableCompanion
    extends UpdateCompanion<CashuLightningInvoiceTableData> {
  final Value<String> id;
  final Value<String> pr;
  final Value<String> hash;
  final Value<String> amount;
  final Value<String> mintURL;
  final Value<int> rowid;
  const CashuLightningInvoiceTableCompanion({
    this.id = const Value.absent(),
    this.pr = const Value.absent(),
    this.hash = const Value.absent(),
    this.amount = const Value.absent(),
    this.mintURL = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CashuLightningInvoiceTableCompanion.insert({
    required String id,
    required String pr,
    required String hash,
    required String amount,
    required String mintURL,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        pr = Value(pr),
        hash = Value(hash),
        amount = Value(amount),
        mintURL = Value(mintURL);
  static Insertable<CashuLightningInvoiceTableData> custom({
    Expression<String>? id,
    Expression<String>? pr,
    Expression<String>? hash,
    Expression<String>? amount,
    Expression<String>? mintURL,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (pr != null) 'pr': pr,
      if (hash != null) 'hash': hash,
      if (amount != null) 'amount': amount,
      if (mintURL != null) 'mint_u_r_l': mintURL,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CashuLightningInvoiceTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? pr,
      Value<String>? hash,
      Value<String>? amount,
      Value<String>? mintURL,
      Value<int>? rowid}) {
    return CashuLightningInvoiceTableCompanion(
      id: id ?? this.id,
      pr: pr ?? this.pr,
      hash: hash ?? this.hash,
      amount: amount ?? this.amount,
      mintURL: mintURL ?? this.mintURL,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (pr.present) {
      map['pr'] = Variable<String>(pr.value);
    }
    if (hash.present) {
      map['hash'] = Variable<String>(hash.value);
    }
    if (amount.present) {
      map['amount'] = Variable<String>(amount.value);
    }
    if (mintURL.present) {
      map['mint_u_r_l'] = Variable<String>(mintURL.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CashuLightningInvoiceTableCompanion(')
          ..write('id: $id, ')
          ..write('pr: $pr, ')
          ..write('hash: $hash, ')
          ..write('amount: $amount, ')
          ..write('mintURL: $mintURL, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CashuTokensTableTable extends CashuTokensTable
    with TableInfo<$CashuTokensTableTable, CashuTokensTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CashuTokensTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _mintUrlMeta =
      const VerificationMeta('mintUrl');
  @override
  late final GeneratedColumn<String> mintUrl = GeneratedColumn<String>(
      'mint_url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _unitMeta = const VerificationMeta('unit');
  @override
  late final GeneratedColumn<String> unit = GeneratedColumn<String>(
      'unit', aliasedName, false,
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
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> proofs =
      GeneratedColumn<String>('proofs', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<String>>($CashuTokensTableTable.$converterproofs);
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String>
      deletedTokensIds = GeneratedColumn<String>(
              'deleted_tokens_ids', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<String>>(
              $CashuTokensTableTable.$converterdeletedTokensIds);
  @override
  List<GeneratedColumn> get $columns =>
      [id, mintUrl, unit, pubkey, createdAt, proofs, deletedTokensIds];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'CashuTokens';
  @override
  VerificationContext validateIntegrity(
      Insertable<CashuTokensTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('mint_url')) {
      context.handle(_mintUrlMeta,
          mintUrl.isAcceptableOrUnknown(data['mint_url']!, _mintUrlMeta));
    } else if (isInserting) {
      context.missing(_mintUrlMeta);
    }
    if (data.containsKey('unit')) {
      context.handle(
          _unitMeta, unit.isAcceptableOrUnknown(data['unit']!, _unitMeta));
    } else if (isInserting) {
      context.missing(_unitMeta);
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CashuTokensTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CashuTokensTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      mintUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}mint_url'])!,
      unit: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}unit'])!,
      pubkey: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}pubkey'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}created_at'])!,
      proofs: $CashuTokensTableTable.$converterproofs.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}proofs'])!),
      deletedTokensIds: $CashuTokensTableTable.$converterdeletedTokensIds
          .fromSql(attachedDatabase.typeMapping.read(DriftSqlType.string,
              data['${effectivePrefix}deleted_tokens_ids'])!),
    );
  }

  @override
  $CashuTokensTableTable createAlias(String alias) {
    return $CashuTokensTableTable(attachedDatabase, alias);
  }

  static TypeConverter<List<String>, String> $converterproofs =
      const StringListConverter();
  static TypeConverter<List<String>, String> $converterdeletedTokensIds =
      const StringListConverter();
}

class CashuTokensTableData extends DataClass
    implements Insertable<CashuTokensTableData> {
  final String id;
  final String mintUrl;
  final String unit;
  final String pubkey;
  final int createdAt;
  final List<String> proofs;
  final List<String> deletedTokensIds;
  const CashuTokensTableData(
      {required this.id,
      required this.mintUrl,
      required this.unit,
      required this.pubkey,
      required this.createdAt,
      required this.proofs,
      required this.deletedTokensIds});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['mint_url'] = Variable<String>(mintUrl);
    map['unit'] = Variable<String>(unit);
    map['pubkey'] = Variable<String>(pubkey);
    map['created_at'] = Variable<int>(createdAt);
    {
      map['proofs'] = Variable<String>(
          $CashuTokensTableTable.$converterproofs.toSql(proofs));
    }
    {
      map['deleted_tokens_ids'] = Variable<String>($CashuTokensTableTable
          .$converterdeletedTokensIds
          .toSql(deletedTokensIds));
    }
    return map;
  }

  CashuTokensTableCompanion toCompanion(bool nullToAbsent) {
    return CashuTokensTableCompanion(
      id: Value(id),
      mintUrl: Value(mintUrl),
      unit: Value(unit),
      pubkey: Value(pubkey),
      createdAt: Value(createdAt),
      proofs: Value(proofs),
      deletedTokensIds: Value(deletedTokensIds),
    );
  }

  factory CashuTokensTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CashuTokensTableData(
      id: serializer.fromJson<String>(json['id']),
      mintUrl: serializer.fromJson<String>(json['mintUrl']),
      unit: serializer.fromJson<String>(json['unit']),
      pubkey: serializer.fromJson<String>(json['pubkey']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      proofs: serializer.fromJson<List<String>>(json['proofs']),
      deletedTokensIds:
          serializer.fromJson<List<String>>(json['deletedTokensIds']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'mintUrl': serializer.toJson<String>(mintUrl),
      'unit': serializer.toJson<String>(unit),
      'pubkey': serializer.toJson<String>(pubkey),
      'createdAt': serializer.toJson<int>(createdAt),
      'proofs': serializer.toJson<List<String>>(proofs),
      'deletedTokensIds': serializer.toJson<List<String>>(deletedTokensIds),
    };
  }

  CashuTokensTableData copyWith(
          {String? id,
          String? mintUrl,
          String? unit,
          String? pubkey,
          int? createdAt,
          List<String>? proofs,
          List<String>? deletedTokensIds}) =>
      CashuTokensTableData(
        id: id ?? this.id,
        mintUrl: mintUrl ?? this.mintUrl,
        unit: unit ?? this.unit,
        pubkey: pubkey ?? this.pubkey,
        createdAt: createdAt ?? this.createdAt,
        proofs: proofs ?? this.proofs,
        deletedTokensIds: deletedTokensIds ?? this.deletedTokensIds,
      );
  CashuTokensTableData copyWithCompanion(CashuTokensTableCompanion data) {
    return CashuTokensTableData(
      id: data.id.present ? data.id.value : this.id,
      mintUrl: data.mintUrl.present ? data.mintUrl.value : this.mintUrl,
      unit: data.unit.present ? data.unit.value : this.unit,
      pubkey: data.pubkey.present ? data.pubkey.value : this.pubkey,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      proofs: data.proofs.present ? data.proofs.value : this.proofs,
      deletedTokensIds: data.deletedTokensIds.present
          ? data.deletedTokensIds.value
          : this.deletedTokensIds,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CashuTokensTableData(')
          ..write('id: $id, ')
          ..write('mintUrl: $mintUrl, ')
          ..write('unit: $unit, ')
          ..write('pubkey: $pubkey, ')
          ..write('createdAt: $createdAt, ')
          ..write('proofs: $proofs, ')
          ..write('deletedTokensIds: $deletedTokensIds')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, mintUrl, unit, pubkey, createdAt, proofs, deletedTokensIds);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CashuTokensTableData &&
          other.id == this.id &&
          other.mintUrl == this.mintUrl &&
          other.unit == this.unit &&
          other.pubkey == this.pubkey &&
          other.createdAt == this.createdAt &&
          other.proofs == this.proofs &&
          other.deletedTokensIds == this.deletedTokensIds);
}

class CashuTokensTableCompanion extends UpdateCompanion<CashuTokensTableData> {
  final Value<String> id;
  final Value<String> mintUrl;
  final Value<String> unit;
  final Value<String> pubkey;
  final Value<int> createdAt;
  final Value<List<String>> proofs;
  final Value<List<String>> deletedTokensIds;
  final Value<int> rowid;
  const CashuTokensTableCompanion({
    this.id = const Value.absent(),
    this.mintUrl = const Value.absent(),
    this.unit = const Value.absent(),
    this.pubkey = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.proofs = const Value.absent(),
    this.deletedTokensIds = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CashuTokensTableCompanion.insert({
    required String id,
    required String mintUrl,
    required String unit,
    required String pubkey,
    required int createdAt,
    required List<String> proofs,
    required List<String> deletedTokensIds,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        mintUrl = Value(mintUrl),
        unit = Value(unit),
        pubkey = Value(pubkey),
        createdAt = Value(createdAt),
        proofs = Value(proofs),
        deletedTokensIds = Value(deletedTokensIds);
  static Insertable<CashuTokensTableData> custom({
    Expression<String>? id,
    Expression<String>? mintUrl,
    Expression<String>? unit,
    Expression<String>? pubkey,
    Expression<int>? createdAt,
    Expression<String>? proofs,
    Expression<String>? deletedTokensIds,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (mintUrl != null) 'mint_url': mintUrl,
      if (unit != null) 'unit': unit,
      if (pubkey != null) 'pubkey': pubkey,
      if (createdAt != null) 'created_at': createdAt,
      if (proofs != null) 'proofs': proofs,
      if (deletedTokensIds != null) 'deleted_tokens_ids': deletedTokensIds,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CashuTokensTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? mintUrl,
      Value<String>? unit,
      Value<String>? pubkey,
      Value<int>? createdAt,
      Value<List<String>>? proofs,
      Value<List<String>>? deletedTokensIds,
      Value<int>? rowid}) {
    return CashuTokensTableCompanion(
      id: id ?? this.id,
      mintUrl: mintUrl ?? this.mintUrl,
      unit: unit ?? this.unit,
      pubkey: pubkey ?? this.pubkey,
      createdAt: createdAt ?? this.createdAt,
      proofs: proofs ?? this.proofs,
      deletedTokensIds: deletedTokensIds ?? this.deletedTokensIds,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (mintUrl.present) {
      map['mint_url'] = Variable<String>(mintUrl.value);
    }
    if (unit.present) {
      map['unit'] = Variable<String>(unit.value);
    }
    if (pubkey.present) {
      map['pubkey'] = Variable<String>(pubkey.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (proofs.present) {
      map['proofs'] = Variable<String>(
          $CashuTokensTableTable.$converterproofs.toSql(proofs.value));
    }
    if (deletedTokensIds.present) {
      map['deleted_tokens_ids'] = Variable<String>($CashuTokensTableTable
          .$converterdeletedTokensIds
          .toSql(deletedTokensIds.value));
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CashuTokensTableCompanion(')
          ..write('id: $id, ')
          ..write('mintUrl: $mintUrl, ')
          ..write('unit: $unit, ')
          ..write('pubkey: $pubkey, ')
          ..write('createdAt: $createdAt, ')
          ..write('proofs: $proofs, ')
          ..write('deletedTokensIds: $deletedTokensIds, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CashuSpendingTableTable extends CashuSpendingTable
    with TableInfo<$CashuSpendingTableTable, CashuSpendingTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CashuSpendingTableTable(this.attachedDatabase, [this._alias]);
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
  late final GeneratedColumnWithTypeConverter<List<List<String>>, String>
      content = GeneratedColumn<String>('content', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<List<String>>>(
              $CashuSpendingTableTable.$convertercontent);
  @override
  late final GeneratedColumnWithTypeConverter<List<List<String>>, String> tags =
      GeneratedColumn<String>('tags', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<List<String>>>(
              $CashuSpendingTableTable.$convertertags);
  @override
  List<GeneratedColumn> get $columns =>
      [id, pubkey, createdAt, kind, content, tags];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'CashuSpending';
  @override
  VerificationContext validateIntegrity(
      Insertable<CashuSpendingTableData> instance,
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
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CashuSpendingTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CashuSpendingTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      pubkey: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}pubkey'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}created_at'])!,
      kind: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}kind'])!,
      content: $CashuSpendingTableTable.$convertercontent.fromSql(
          attachedDatabase.typeMapping
              .read(DriftSqlType.string, data['${effectivePrefix}content'])!),
      tags: $CashuSpendingTableTable.$convertertags.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}tags'])!),
    );
  }

  @override
  $CashuSpendingTableTable createAlias(String alias) {
    return $CashuSpendingTableTable(attachedDatabase, alias);
  }

  static TypeConverter<List<List<String>>, String> $convertercontent =
      const StringListOfListConverter();
  static TypeConverter<List<List<String>>, String> $convertertags =
      const StringListOfListConverter();
}

class CashuSpendingTableData extends DataClass
    implements Insertable<CashuSpendingTableData> {
  final String id;
  final String pubkey;
  final int createdAt;
  final int kind;
  final List<List<String>> content;
  final List<List<String>> tags;
  const CashuSpendingTableData(
      {required this.id,
      required this.pubkey,
      required this.createdAt,
      required this.kind,
      required this.content,
      required this.tags});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['pubkey'] = Variable<String>(pubkey);
    map['created_at'] = Variable<int>(createdAt);
    map['kind'] = Variable<int>(kind);
    {
      map['content'] = Variable<String>(
          $CashuSpendingTableTable.$convertercontent.toSql(content));
    }
    {
      map['tags'] =
          Variable<String>($CashuSpendingTableTable.$convertertags.toSql(tags));
    }
    return map;
  }

  CashuSpendingTableCompanion toCompanion(bool nullToAbsent) {
    return CashuSpendingTableCompanion(
      id: Value(id),
      pubkey: Value(pubkey),
      createdAt: Value(createdAt),
      kind: Value(kind),
      content: Value(content),
      tags: Value(tags),
    );
  }

  factory CashuSpendingTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CashuSpendingTableData(
      id: serializer.fromJson<String>(json['id']),
      pubkey: serializer.fromJson<String>(json['pubkey']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      kind: serializer.fromJson<int>(json['kind']),
      content: serializer.fromJson<List<List<String>>>(json['content']),
      tags: serializer.fromJson<List<List<String>>>(json['tags']),
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
      'content': serializer.toJson<List<List<String>>>(content),
      'tags': serializer.toJson<List<List<String>>>(tags),
    };
  }

  CashuSpendingTableData copyWith(
          {String? id,
          String? pubkey,
          int? createdAt,
          int? kind,
          List<List<String>>? content,
          List<List<String>>? tags}) =>
      CashuSpendingTableData(
        id: id ?? this.id,
        pubkey: pubkey ?? this.pubkey,
        createdAt: createdAt ?? this.createdAt,
        kind: kind ?? this.kind,
        content: content ?? this.content,
        tags: tags ?? this.tags,
      );
  CashuSpendingTableData copyWithCompanion(CashuSpendingTableCompanion data) {
    return CashuSpendingTableData(
      id: data.id.present ? data.id.value : this.id,
      pubkey: data.pubkey.present ? data.pubkey.value : this.pubkey,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      kind: data.kind.present ? data.kind.value : this.kind,
      content: data.content.present ? data.content.value : this.content,
      tags: data.tags.present ? data.tags.value : this.tags,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CashuSpendingTableData(')
          ..write('id: $id, ')
          ..write('pubkey: $pubkey, ')
          ..write('createdAt: $createdAt, ')
          ..write('kind: $kind, ')
          ..write('content: $content, ')
          ..write('tags: $tags')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, pubkey, createdAt, kind, content, tags);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CashuSpendingTableData &&
          other.id == this.id &&
          other.pubkey == this.pubkey &&
          other.createdAt == this.createdAt &&
          other.kind == this.kind &&
          other.content == this.content &&
          other.tags == this.tags);
}

class CashuSpendingTableCompanion
    extends UpdateCompanion<CashuSpendingTableData> {
  final Value<String> id;
  final Value<String> pubkey;
  final Value<int> createdAt;
  final Value<int> kind;
  final Value<List<List<String>>> content;
  final Value<List<List<String>>> tags;
  final Value<int> rowid;
  const CashuSpendingTableCompanion({
    this.id = const Value.absent(),
    this.pubkey = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.kind = const Value.absent(),
    this.content = const Value.absent(),
    this.tags = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CashuSpendingTableCompanion.insert({
    required String id,
    required String pubkey,
    required int createdAt,
    required int kind,
    required List<List<String>> content,
    required List<List<String>> tags,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        pubkey = Value(pubkey),
        createdAt = Value(createdAt),
        kind = Value(kind),
        content = Value(content),
        tags = Value(tags);
  static Insertable<CashuSpendingTableData> custom({
    Expression<String>? id,
    Expression<String>? pubkey,
    Expression<int>? createdAt,
    Expression<int>? kind,
    Expression<String>? content,
    Expression<String>? tags,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (pubkey != null) 'pubkey': pubkey,
      if (createdAt != null) 'created_at': createdAt,
      if (kind != null) 'kind': kind,
      if (content != null) 'content': content,
      if (tags != null) 'tags': tags,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CashuSpendingTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? pubkey,
      Value<int>? createdAt,
      Value<int>? kind,
      Value<List<List<String>>>? content,
      Value<List<List<String>>>? tags,
      Value<int>? rowid}) {
    return CashuSpendingTableCompanion(
      id: id ?? this.id,
      pubkey: pubkey ?? this.pubkey,
      createdAt: createdAt ?? this.createdAt,
      kind: kind ?? this.kind,
      content: content ?? this.content,
      tags: tags ?? this.tags,
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
    if (content.present) {
      map['content'] = Variable<String>(
          $CashuSpendingTableTable.$convertercontent.toSql(content.value));
    }
    if (tags.present) {
      map['tags'] = Variable<String>(
          $CashuSpendingTableTable.$convertertags.toSql(tags.value));
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CashuSpendingTableCompanion(')
          ..write('id: $id, ')
          ..write('pubkey: $pubkey, ')
          ..write('createdAt: $createdAt, ')
          ..write('kind: $kind, ')
          ..write('content: $content, ')
          ..write('tags: $tags, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CashuWalletTableTable extends CashuWalletTable
    with TableInfo<$CashuWalletTableTable, CashuWalletTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CashuWalletTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
      'created_at', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _pubkeyMeta = const VerificationMeta('pubkey');
  @override
  late final GeneratedColumn<String> pubkey = GeneratedColumn<String>(
      'pubkey', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _signSecretMeta =
      const VerificationMeta('signSecret');
  @override
  late final GeneratedColumn<String> signSecret = GeneratedColumn<String>(
      'sign_secret', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> mints =
      GeneratedColumn<String>('mints', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<List<String>>($CashuWalletTableTable.$convertermints);
  @override
  List<GeneratedColumn> get $columns =>
      [id, createdAt, pubkey, signSecret, mints];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'CashuWallet';
  @override
  VerificationContext validateIntegrity(
      Insertable<CashuWalletTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('pubkey')) {
      context.handle(_pubkeyMeta,
          pubkey.isAcceptableOrUnknown(data['pubkey']!, _pubkeyMeta));
    } else if (isInserting) {
      context.missing(_pubkeyMeta);
    }
    if (data.containsKey('sign_secret')) {
      context.handle(
          _signSecretMeta,
          signSecret.isAcceptableOrUnknown(
              data['sign_secret']!, _signSecretMeta));
    } else if (isInserting) {
      context.missing(_signSecretMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {pubkey};
  @override
  CashuWalletTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CashuWalletTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}created_at'])!,
      pubkey: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}pubkey'])!,
      signSecret: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sign_secret'])!,
      mints: $CashuWalletTableTable.$convertermints.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}mints'])!),
    );
  }

  @override
  $CashuWalletTableTable createAlias(String alias) {
    return $CashuWalletTableTable(attachedDatabase, alias);
  }

  static TypeConverter<List<String>, String> $convertermints =
      const StringListConverter();
}

class CashuWalletTableData extends DataClass
    implements Insertable<CashuWalletTableData> {
  final String id;
  final int createdAt;
  final String pubkey;
  final String signSecret;
  final List<String> mints;
  const CashuWalletTableData(
      {required this.id,
      required this.createdAt,
      required this.pubkey,
      required this.signSecret,
      required this.mints});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['created_at'] = Variable<int>(createdAt);
    map['pubkey'] = Variable<String>(pubkey);
    map['sign_secret'] = Variable<String>(signSecret);
    {
      map['mints'] =
          Variable<String>($CashuWalletTableTable.$convertermints.toSql(mints));
    }
    return map;
  }

  CashuWalletTableCompanion toCompanion(bool nullToAbsent) {
    return CashuWalletTableCompanion(
      id: Value(id),
      createdAt: Value(createdAt),
      pubkey: Value(pubkey),
      signSecret: Value(signSecret),
      mints: Value(mints),
    );
  }

  factory CashuWalletTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CashuWalletTableData(
      id: serializer.fromJson<String>(json['id']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      pubkey: serializer.fromJson<String>(json['pubkey']),
      signSecret: serializer.fromJson<String>(json['signSecret']),
      mints: serializer.fromJson<List<String>>(json['mints']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'createdAt': serializer.toJson<int>(createdAt),
      'pubkey': serializer.toJson<String>(pubkey),
      'signSecret': serializer.toJson<String>(signSecret),
      'mints': serializer.toJson<List<String>>(mints),
    };
  }

  CashuWalletTableData copyWith(
          {String? id,
          int? createdAt,
          String? pubkey,
          String? signSecret,
          List<String>? mints}) =>
      CashuWalletTableData(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        pubkey: pubkey ?? this.pubkey,
        signSecret: signSecret ?? this.signSecret,
        mints: mints ?? this.mints,
      );
  CashuWalletTableData copyWithCompanion(CashuWalletTableCompanion data) {
    return CashuWalletTableData(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      pubkey: data.pubkey.present ? data.pubkey.value : this.pubkey,
      signSecret:
          data.signSecret.present ? data.signSecret.value : this.signSecret,
      mints: data.mints.present ? data.mints.value : this.mints,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CashuWalletTableData(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('pubkey: $pubkey, ')
          ..write('signSecret: $signSecret, ')
          ..write('mints: $mints')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, createdAt, pubkey, signSecret, mints);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CashuWalletTableData &&
          other.id == this.id &&
          other.createdAt == this.createdAt &&
          other.pubkey == this.pubkey &&
          other.signSecret == this.signSecret &&
          other.mints == this.mints);
}

class CashuWalletTableCompanion extends UpdateCompanion<CashuWalletTableData> {
  final Value<String> id;
  final Value<int> createdAt;
  final Value<String> pubkey;
  final Value<String> signSecret;
  final Value<List<String>> mints;
  final Value<int> rowid;
  const CashuWalletTableCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.pubkey = const Value.absent(),
    this.signSecret = const Value.absent(),
    this.mints = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CashuWalletTableCompanion.insert({
    required String id,
    required int createdAt,
    required String pubkey,
    required String signSecret,
    required List<String> mints,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        createdAt = Value(createdAt),
        pubkey = Value(pubkey),
        signSecret = Value(signSecret),
        mints = Value(mints);
  static Insertable<CashuWalletTableData> custom({
    Expression<String>? id,
    Expression<int>? createdAt,
    Expression<String>? pubkey,
    Expression<String>? signSecret,
    Expression<String>? mints,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
      if (pubkey != null) 'pubkey': pubkey,
      if (signSecret != null) 'sign_secret': signSecret,
      if (mints != null) 'mints': mints,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CashuWalletTableCompanion copyWith(
      {Value<String>? id,
      Value<int>? createdAt,
      Value<String>? pubkey,
      Value<String>? signSecret,
      Value<List<String>>? mints,
      Value<int>? rowid}) {
    return CashuWalletTableCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      pubkey: pubkey ?? this.pubkey,
      signSecret: signSecret ?? this.signSecret,
      mints: mints ?? this.mints,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (pubkey.present) {
      map['pubkey'] = Variable<String>(pubkey.value);
    }
    if (signSecret.present) {
      map['sign_secret'] = Variable<String>(signSecret.value);
    }
    if (mints.present) {
      map['mints'] = Variable<String>(
          $CashuWalletTableTable.$convertermints.toSql(mints.value));
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CashuWalletTableCompanion(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt, ')
          ..write('pubkey: $pubkey, ')
          ..write('signSecret: $signSecret, ')
          ..write('mints: $mints, ')
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
  late final $RelayInfoListTableTable relayInfoListTable =
      $RelayInfoListTableTable(this);
  late final $CashuMintTableTable cashuMintTable = $CashuMintTableTable(this);
  late final $CashuKeysetInfoTableTable cashuKeysetInfoTable =
      $CashuKeysetInfoTableTable(this);
  late final $CashuInvoiceTableTable cashuInvoiceTable =
      $CashuInvoiceTableTable(this);
  late final $CashuUnblindingDataTableTable cashuUnblindingDataTable =
      $CashuUnblindingDataTableTable(this);
  late final $CashuMintInfoTableTable cashuMintInfoTable =
      $CashuMintInfoTableTable(this);
  late final $CashuLightningInvoiceTableTable cashuLightningInvoiceTable =
      $CashuLightningInvoiceTableTable(this);
  late final $CashuTokensTableTable cashuTokensTable =
      $CashuTokensTableTable(this);
  late final $CashuSpendingTableTable cashuSpendingTable =
      $CashuSpendingTableTable(this);
  late final $CashuWalletTableTable cashuWalletTable =
      $CashuWalletTableTable(this);
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
        wotScoreTable,
        relayInfoListTable,
        cashuMintTable,
        cashuKeysetInfoTable,
        cashuInvoiceTable,
        cashuUnblindingDataTable,
        cashuMintInfoTable,
        cashuLightningInvoiceTable,
        cashuTokensTable,
        cashuSpendingTable,
        cashuWalletTable
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
  Value<List<String>> tTags,
  Value<List<String>> pTags,
  Value<List<String>> capitalpTags,
  Value<List<String>> kTags,
  Value<List<String>> eTags,
  Value<List<String>> lTags,
  Value<List<String>> aTags,
  Value<List<String>> cTags,
  Value<List<String>> qTags,
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
  Value<List<String>> tTags,
  Value<List<String>> pTags,
  Value<List<String>> capitalpTags,
  Value<List<String>> kTags,
  Value<List<String>> eTags,
  Value<List<String>> lTags,
  Value<List<String>> aTags,
  Value<List<String>> cTags,
  Value<List<String>> qTags,
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

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
      get tTags => $composableBuilder(
          column: $table.tTags,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
      get pTags => $composableBuilder(
          column: $table.pTags,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
      get capitalpTags => $composableBuilder(
          column: $table.capitalpTags,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
      get kTags => $composableBuilder(
          column: $table.kTags,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
      get eTags => $composableBuilder(
          column: $table.eTags,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
      get lTags => $composableBuilder(
          column: $table.lTags,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
      get aTags => $composableBuilder(
          column: $table.aTags,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
      get cTags => $composableBuilder(
          column: $table.cTags,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
      get qTags => $composableBuilder(
          column: $table.qTags,
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

  ColumnOrderings<String> get cTags => $composableBuilder(
      column: $table.cTags, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get qTags => $composableBuilder(
      column: $table.qTags, builder: (column) => ColumnOrderings(column));

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

  GeneratedColumnWithTypeConverter<List<String>, String> get tTags =>
      $composableBuilder(column: $table.tTags, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get pTags =>
      $composableBuilder(column: $table.pTags, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get capitalpTags =>
      $composableBuilder(
          column: $table.capitalpTags, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get kTags =>
      $composableBuilder(column: $table.kTags, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get eTags =>
      $composableBuilder(column: $table.eTags, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get lTags =>
      $composableBuilder(column: $table.lTags, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get aTags =>
      $composableBuilder(column: $table.aTags, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get cTags =>
      $composableBuilder(column: $table.cTags, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get qTags =>
      $composableBuilder(column: $table.qTags, builder: (column) => column);

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
            Value<List<String>> tTags = const Value.absent(),
            Value<List<String>> pTags = const Value.absent(),
            Value<List<String>> capitalpTags = const Value.absent(),
            Value<List<String>> kTags = const Value.absent(),
            Value<List<String>> eTags = const Value.absent(),
            Value<List<String>> lTags = const Value.absent(),
            Value<List<String>> aTags = const Value.absent(),
            Value<List<String>> cTags = const Value.absent(),
            Value<List<String>> qTags = const Value.absent(),
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
            cTags: cTags,
            qTags: qTags,
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
            Value<List<String>> tTags = const Value.absent(),
            Value<List<String>> pTags = const Value.absent(),
            Value<List<String>> capitalpTags = const Value.absent(),
            Value<List<String>> kTags = const Value.absent(),
            Value<List<String>> eTags = const Value.absent(),
            Value<List<String>> lTags = const Value.absent(),
            Value<List<String>> aTags = const Value.absent(),
            Value<List<String>> cTags = const Value.absent(),
            Value<List<String>> qTags = const Value.absent(),
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
            cTags: cTags,
            qTags: qTags,
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
  Value<List<String>> mutes,
  required int createdAt,
  Value<int?> loadedTimestamp,
  Value<int> rowid,
});
typedef $$MuteListTableTableUpdateCompanionBuilder = MuteListTableCompanion
    Function({
  Value<String> pubkey,
  Value<List<String>> mutes,
  Value<int> createdAt,
  Value<int?> loadedTimestamp,
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

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
      get mutes => $composableBuilder(
          column: $table.mutes,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<int> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get loadedTimestamp => $composableBuilder(
      column: $table.loadedTimestamp,
      builder: (column) => ColumnFilters(column));
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

  GeneratedColumnWithTypeConverter<List<String>, String> get mutes =>
      $composableBuilder(column: $table.mutes, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get loadedTimestamp => $composableBuilder(
      column: $table.loadedTimestamp, builder: (column) => column);
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
            Value<List<String>> mutes = const Value.absent(),
            Value<int> createdAt = const Value.absent(),
            Value<int?> loadedTimestamp = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MuteListTableCompanion(
            pubkey: pubkey,
            mutes: mutes,
            createdAt: createdAt,
            loadedTimestamp: loadedTimestamp,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String pubkey,
            Value<List<String>> mutes = const Value.absent(),
            required int createdAt,
            Value<int?> loadedTimestamp = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              MuteListTableCompanion.insert(
            pubkey: pubkey,
            mutes: mutes,
            createdAt: createdAt,
            loadedTimestamp: loadedTimestamp,
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
  required int createdAt,
  required int refreshedTimestamp,
  required String relays,
  Value<int> rowid,
});
typedef $$UserRelayListTableTableUpdateCompanionBuilder
    = UserRelayListTableCompanion Function({
  Value<String> pubkey,
  Value<int> createdAt,
  Value<int> refreshedTimestamp,
  Value<String> relays,
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

  ColumnFilters<int> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get refreshedTimestamp => $composableBuilder(
      column: $table.refreshedTimestamp,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get relays => $composableBuilder(
      column: $table.relays, builder: (column) => ColumnFilters(column));
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

  ColumnOrderings<int> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get refreshedTimestamp => $composableBuilder(
      column: $table.refreshedTimestamp,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get relays => $composableBuilder(
      column: $table.relays, builder: (column) => ColumnOrderings(column));
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

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get refreshedTimestamp => $composableBuilder(
      column: $table.refreshedTimestamp, builder: (column) => column);

  GeneratedColumn<String> get relays =>
      $composableBuilder(column: $table.relays, builder: (column) => column);
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
            Value<int> createdAt = const Value.absent(),
            Value<int> refreshedTimestamp = const Value.absent(),
            Value<String> relays = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              UserRelayListTableCompanion(
            pubkey: pubkey,
            createdAt: createdAt,
            refreshedTimestamp: refreshedTimestamp,
            relays: relays,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String pubkey,
            required int createdAt,
            required int refreshedTimestamp,
            required String relays,
            Value<int> rowid = const Value.absent(),
          }) =>
              UserRelayListTableCompanion.insert(
            pubkey: pubkey,
            createdAt: createdAt,
            refreshedTimestamp: refreshedTimestamp,
            relays: relays,
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
  Value<String> relaysMap,
  required String direction,
  Value<int> relayMinCountPerPubkey,
  Value<int> rowid,
});
typedef $$RelaySetTableTableUpdateCompanionBuilder = RelaySetTableCompanion
    Function({
  Value<String> id,
  Value<String> name,
  Value<String> pubkey,
  Value<String> relaysMap,
  Value<String> direction,
  Value<int> relayMinCountPerPubkey,
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

  ColumnFilters<String> get relaysMap => $composableBuilder(
      column: $table.relaysMap, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get direction => $composableBuilder(
      column: $table.direction, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get relayMinCountPerPubkey => $composableBuilder(
      column: $table.relayMinCountPerPubkey,
      builder: (column) => ColumnFilters(column));
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

  ColumnOrderings<String> get relaysMap => $composableBuilder(
      column: $table.relaysMap, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get direction => $composableBuilder(
      column: $table.direction, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get relayMinCountPerPubkey => $composableBuilder(
      column: $table.relayMinCountPerPubkey,
      builder: (column) => ColumnOrderings(column));
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

  GeneratedColumn<String> get relaysMap =>
      $composableBuilder(column: $table.relaysMap, builder: (column) => column);

  GeneratedColumn<String> get direction =>
      $composableBuilder(column: $table.direction, builder: (column) => column);

  GeneratedColumn<int> get relayMinCountPerPubkey => $composableBuilder(
      column: $table.relayMinCountPerPubkey, builder: (column) => column);
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
            Value<String> relaysMap = const Value.absent(),
            Value<String> direction = const Value.absent(),
            Value<int> relayMinCountPerPubkey = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              RelaySetTableCompanion(
            id: id,
            name: name,
            pubkey: pubkey,
            relaysMap: relaysMap,
            direction: direction,
            relayMinCountPerPubkey: relayMinCountPerPubkey,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            required String pubkey,
            Value<String> relaysMap = const Value.absent(),
            required String direction,
            Value<int> relayMinCountPerPubkey = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              RelaySetTableCompanion.insert(
            id: id,
            name: name,
            pubkey: pubkey,
            relaysMap: relaysMap,
            direction: direction,
            relayMinCountPerPubkey: relayMinCountPerPubkey,
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
  Value<Map<String, String>> replies,
  Value<Map<String, String>> reposts,
  Value<Map<String, String>> reactions,
  Value<Map<String, String>> quotes,
  Value<Map<String, Map<String, int>>> zaps,
  Value<int?> newestCreatedAt,
  Value<int> rowid,
});
typedef $$EventStatsTableTableUpdateCompanionBuilder = EventStatsTableCompanion
    Function({
  Value<String> id,
  Value<Map<String, String>> replies,
  Value<Map<String, String>> reposts,
  Value<Map<String, String>> reactions,
  Value<Map<String, String>> quotes,
  Value<Map<String, Map<String, int>>> zaps,
  Value<int?> newestCreatedAt,
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

  ColumnWithTypeConverterFilters<Map<String, String>, Map<String, String>,
          String>
      get replies => $composableBuilder(
          column: $table.replies,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<Map<String, String>, Map<String, String>,
          String>
      get reposts => $composableBuilder(
          column: $table.reposts,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<Map<String, String>, Map<String, String>,
          String>
      get reactions => $composableBuilder(
          column: $table.reactions,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<Map<String, String>, Map<String, String>,
          String>
      get quotes => $composableBuilder(
          column: $table.quotes,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<Map<String, Map<String, int>>,
          Map<String, Map<String, int>>, String>
      get zaps => $composableBuilder(
          column: $table.zaps,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<int> get newestCreatedAt => $composableBuilder(
      column: $table.newestCreatedAt,
      builder: (column) => ColumnFilters(column));
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

  ColumnOrderings<String> get replies => $composableBuilder(
      column: $table.replies, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get reposts => $composableBuilder(
      column: $table.reposts, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get reactions => $composableBuilder(
      column: $table.reactions, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get quotes => $composableBuilder(
      column: $table.quotes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get zaps => $composableBuilder(
      column: $table.zaps, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get newestCreatedAt => $composableBuilder(
      column: $table.newestCreatedAt,
      builder: (column) => ColumnOrderings(column));
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

  GeneratedColumnWithTypeConverter<Map<String, String>, String> get replies =>
      $composableBuilder(column: $table.replies, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Map<String, String>, String> get reposts =>
      $composableBuilder(column: $table.reposts, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Map<String, String>, String> get reactions =>
      $composableBuilder(column: $table.reactions, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Map<String, String>, String> get quotes =>
      $composableBuilder(column: $table.quotes, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Map<String, Map<String, int>>, String>
      get zaps =>
          $composableBuilder(column: $table.zaps, builder: (column) => column);

  GeneratedColumn<int> get newestCreatedAt => $composableBuilder(
      column: $table.newestCreatedAt, builder: (column) => column);
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
            Value<Map<String, String>> replies = const Value.absent(),
            Value<Map<String, String>> reposts = const Value.absent(),
            Value<Map<String, String>> reactions = const Value.absent(),
            Value<Map<String, String>> quotes = const Value.absent(),
            Value<Map<String, Map<String, int>>> zaps = const Value.absent(),
            Value<int?> newestCreatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              EventStatsTableCompanion(
            id: id,
            replies: replies,
            reposts: reposts,
            reactions: reactions,
            quotes: quotes,
            zaps: zaps,
            newestCreatedAt: newestCreatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            Value<Map<String, String>> replies = const Value.absent(),
            Value<Map<String, String>> reposts = const Value.absent(),
            Value<Map<String, String>> reactions = const Value.absent(),
            Value<Map<String, String>> quotes = const Value.absent(),
            Value<Map<String, Map<String, int>>> zaps = const Value.absent(),
            Value<int?> newestCreatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              EventStatsTableCompanion.insert(
            id: id,
            replies: replies,
            reposts: reposts,
            reactions: reactions,
            quotes: quotes,
            zaps: zaps,
            newestCreatedAt: newestCreatedAt,
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
  required int updatedAt,
  Value<int> rowid,
});
typedef $$Nip05TableTableUpdateCompanionBuilder = Nip05TableCompanion Function({
  Value<String> nip05,
  Value<String> pubkey,
  Value<bool> valid,
  Value<int> updatedAt,
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

  ColumnFilters<int> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
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

  ColumnOrderings<int> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
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

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
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
            Value<int> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              Nip05TableCompanion(
            nip05: nip05,
            pubkey: pubkey,
            valid: valid,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String nip05,
            required String pubkey,
            Value<bool> valid = const Value.absent(),
            required int updatedAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              Nip05TableCompanion.insert(
            nip05: nip05,
            pubkey: pubkey,
            valid: valid,
            updatedAt: updatedAt,
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
  required String pubkey,
  Value<List<String>> followers,
  required int lastRefreshed,
  Value<int> rowid,
});
typedef $$UserFollowersTableTableUpdateCompanionBuilder
    = UserFollowersTableCompanion Function({
  Value<String> pubkey,
  Value<List<String>> followers,
  Value<int> lastRefreshed,
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
  ColumnFilters<String> get pubkey => $composableBuilder(
      column: $table.pubkey, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
      get followers => $composableBuilder(
          column: $table.followers,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<int> get lastRefreshed => $composableBuilder(
      column: $table.lastRefreshed, builder: (column) => ColumnFilters(column));
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
  ColumnOrderings<String> get pubkey => $composableBuilder(
      column: $table.pubkey, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get followers => $composableBuilder(
      column: $table.followers, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get lastRefreshed => $composableBuilder(
      column: $table.lastRefreshed,
      builder: (column) => ColumnOrderings(column));
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
  GeneratedColumn<String> get pubkey =>
      $composableBuilder(column: $table.pubkey, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get followers =>
      $composableBuilder(column: $table.followers, builder: (column) => column);

  GeneratedColumn<int> get lastRefreshed => $composableBuilder(
      column: $table.lastRefreshed, builder: (column) => column);
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
            Value<String> pubkey = const Value.absent(),
            Value<List<String>> followers = const Value.absent(),
            Value<int> lastRefreshed = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              UserFollowersTableCompanion(
            pubkey: pubkey,
            followers: followers,
            lastRefreshed: lastRefreshed,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String pubkey,
            Value<List<String>> followers = const Value.absent(),
            required int lastRefreshed,
            Value<int> rowid = const Value.absent(),
          }) =>
              UserFollowersTableCompanion.insert(
            pubkey: pubkey,
            followers: followers,
            lastRefreshed: lastRefreshed,
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
  required String pubkey,
  required String noteDraft,
  required String articleDraft,
  Value<Map<String, String>> replies,
  Value<Map<String, String>> smartWidgetsDraft,
  Value<int> rowid,
});
typedef $$UserDraftTableTableUpdateCompanionBuilder = UserDraftTableCompanion
    Function({
  Value<String> pubkey,
  Value<String> noteDraft,
  Value<String> articleDraft,
  Value<Map<String, String>> replies,
  Value<Map<String, String>> smartWidgetsDraft,
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
  ColumnFilters<String> get pubkey => $composableBuilder(
      column: $table.pubkey, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get noteDraft => $composableBuilder(
      column: $table.noteDraft, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get articleDraft => $composableBuilder(
      column: $table.articleDraft, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<Map<String, String>, Map<String, String>,
          String>
      get replies => $composableBuilder(
          column: $table.replies,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<Map<String, String>, Map<String, String>,
          String>
      get smartWidgetsDraft => $composableBuilder(
          column: $table.smartWidgetsDraft,
          builder: (column) => ColumnWithTypeConverterFilters(column));
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
  ColumnOrderings<String> get pubkey => $composableBuilder(
      column: $table.pubkey, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get noteDraft => $composableBuilder(
      column: $table.noteDraft, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get articleDraft => $composableBuilder(
      column: $table.articleDraft,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get replies => $composableBuilder(
      column: $table.replies, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get smartWidgetsDraft => $composableBuilder(
      column: $table.smartWidgetsDraft,
      builder: (column) => ColumnOrderings(column));
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
  GeneratedColumn<String> get pubkey =>
      $composableBuilder(column: $table.pubkey, builder: (column) => column);

  GeneratedColumn<String> get noteDraft =>
      $composableBuilder(column: $table.noteDraft, builder: (column) => column);

  GeneratedColumn<String> get articleDraft => $composableBuilder(
      column: $table.articleDraft, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Map<String, String>, String> get replies =>
      $composableBuilder(column: $table.replies, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Map<String, String>, String>
      get smartWidgetsDraft => $composableBuilder(
          column: $table.smartWidgetsDraft, builder: (column) => column);
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
            Value<String> pubkey = const Value.absent(),
            Value<String> noteDraft = const Value.absent(),
            Value<String> articleDraft = const Value.absent(),
            Value<Map<String, String>> replies = const Value.absent(),
            Value<Map<String, String>> smartWidgetsDraft = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              UserDraftTableCompanion(
            pubkey: pubkey,
            noteDraft: noteDraft,
            articleDraft: articleDraft,
            replies: replies,
            smartWidgetsDraft: smartWidgetsDraft,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String pubkey,
            required String noteDraft,
            required String articleDraft,
            Value<Map<String, String>> replies = const Value.absent(),
            Value<Map<String, String>> smartWidgetsDraft = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              UserDraftTableCompanion.insert(
            pubkey: pubkey,
            noteDraft: noteDraft,
            articleDraft: articleDraft,
            replies: replies,
            smartWidgetsDraft: smartWidgetsDraft,
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
  Value<String> filters,
  Value<String> contentSources,
  Value<int> rowid,
});
typedef $$UserAppSettingsTableTableUpdateCompanionBuilder
    = UserAppSettingsTableCompanion Function({
  Value<String> pubkey,
  Value<String> filters,
  Value<String> contentSources,
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

  ColumnFilters<String> get filters => $composableBuilder(
      column: $table.filters, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get contentSources => $composableBuilder(
      column: $table.contentSources,
      builder: (column) => ColumnFilters(column));
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

  ColumnOrderings<String> get filters => $composableBuilder(
      column: $table.filters, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get contentSources => $composableBuilder(
      column: $table.contentSources,
      builder: (column) => ColumnOrderings(column));
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

  GeneratedColumn<String> get filters =>
      $composableBuilder(column: $table.filters, builder: (column) => column);

  GeneratedColumn<String> get contentSources => $composableBuilder(
      column: $table.contentSources, builder: (column) => column);
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
            Value<String> filters = const Value.absent(),
            Value<String> contentSources = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              UserAppSettingsTableCompanion(
            pubkey: pubkey,
            filters: filters,
            contentSources: contentSources,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String pubkey,
            Value<String> filters = const Value.absent(),
            Value<String> contentSources = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              UserAppSettingsTableCompanion.insert(
            pubkey: pubkey,
            filters: filters,
            contentSources: contentSources,
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
  required String pubkey,
  required int createdAt,
  Value<Map<String, double>> wot,
  Value<int> rowid,
});
typedef $$UserWotTableTableUpdateCompanionBuilder = UserWotTableCompanion
    Function({
  Value<String> pubkey,
  Value<int> createdAt,
  Value<Map<String, double>> wot,
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
  ColumnFilters<String> get pubkey => $composableBuilder(
      column: $table.pubkey, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<Map<String, double>, Map<String, double>,
          String>
      get wot => $composableBuilder(
          column: $table.wot,
          builder: (column) => ColumnWithTypeConverterFilters(column));
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
  ColumnOrderings<String> get pubkey => $composableBuilder(
      column: $table.pubkey, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get wot => $composableBuilder(
      column: $table.wot, builder: (column) => ColumnOrderings(column));
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
  GeneratedColumn<String> get pubkey =>
      $composableBuilder(column: $table.pubkey, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Map<String, double>, String> get wot =>
      $composableBuilder(column: $table.wot, builder: (column) => column);
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
            Value<String> pubkey = const Value.absent(),
            Value<int> createdAt = const Value.absent(),
            Value<Map<String, double>> wot = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              UserWotTableCompanion(
            pubkey: pubkey,
            createdAt: createdAt,
            wot: wot,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String pubkey,
            required int createdAt,
            Value<Map<String, double>> wot = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              UserWotTableCompanion.insert(
            pubkey: pubkey,
            createdAt: createdAt,
            wot: wot,
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
  required int createdAt,
  Value<int> rowid,
});
typedef $$WotScoreTableTableUpdateCompanionBuilder = WotScoreTableCompanion
    Function({
  Value<String> id,
  Value<String> pubkey,
  Value<String> originPubkey,
  Value<double> score,
  Value<int> createdAt,
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

  ColumnFilters<int> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));
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

  ColumnOrderings<int> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
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

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
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
            Value<int> createdAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              WotScoreTableCompanion(
            id: id,
            pubkey: pubkey,
            originPubkey: originPubkey,
            score: score,
            createdAt: createdAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String pubkey,
            required String originPubkey,
            Value<double> score = const Value.absent(),
            required int createdAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              WotScoreTableCompanion.insert(
            id: id,
            pubkey: pubkey,
            originPubkey: originPubkey,
            score: score,
            createdAt: createdAt,
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
typedef $$RelayInfoListTableTableCreateCompanionBuilder
    = RelayInfoListTableCompanion Function({
  required String name,
  required String description,
  required String pubkey,
  required String contact,
  Value<List<String>> nips,
  required String software,
  required String icon,
  required String version,
  required String url,
  required String location,
  required String latency,
  required bool isPaid,
  required bool isAuth,
  required int lastUpdated,
  Value<int> rowid,
});
typedef $$RelayInfoListTableTableUpdateCompanionBuilder
    = RelayInfoListTableCompanion Function({
  Value<String> name,
  Value<String> description,
  Value<String> pubkey,
  Value<String> contact,
  Value<List<String>> nips,
  Value<String> software,
  Value<String> icon,
  Value<String> version,
  Value<String> url,
  Value<String> location,
  Value<String> latency,
  Value<bool> isPaid,
  Value<bool> isAuth,
  Value<int> lastUpdated,
  Value<int> rowid,
});

class $$RelayInfoListTableTableFilterComposer
    extends Composer<_$NostrDatabase, $RelayInfoListTableTable> {
  $$RelayInfoListTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get pubkey => $composableBuilder(
      column: $table.pubkey, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get contact => $composableBuilder(
      column: $table.contact, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<List<String>, List<String>, String> get nips =>
      $composableBuilder(
          column: $table.nips,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<String> get software => $composableBuilder(
      column: $table.software, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get icon => $composableBuilder(
      column: $table.icon, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get url => $composableBuilder(
      column: $table.url, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get location => $composableBuilder(
      column: $table.location, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get latency => $composableBuilder(
      column: $table.latency, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isPaid => $composableBuilder(
      column: $table.isPaid, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isAuth => $composableBuilder(
      column: $table.isAuth, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get lastUpdated => $composableBuilder(
      column: $table.lastUpdated, builder: (column) => ColumnFilters(column));
}

class $$RelayInfoListTableTableOrderingComposer
    extends Composer<_$NostrDatabase, $RelayInfoListTableTable> {
  $$RelayInfoListTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get pubkey => $composableBuilder(
      column: $table.pubkey, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get contact => $composableBuilder(
      column: $table.contact, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nips => $composableBuilder(
      column: $table.nips, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get software => $composableBuilder(
      column: $table.software, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get icon => $composableBuilder(
      column: $table.icon, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get url => $composableBuilder(
      column: $table.url, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get location => $composableBuilder(
      column: $table.location, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get latency => $composableBuilder(
      column: $table.latency, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isPaid => $composableBuilder(
      column: $table.isPaid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isAuth => $composableBuilder(
      column: $table.isAuth, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get lastUpdated => $composableBuilder(
      column: $table.lastUpdated, builder: (column) => ColumnOrderings(column));
}

class $$RelayInfoListTableTableAnnotationComposer
    extends Composer<_$NostrDatabase, $RelayInfoListTableTable> {
  $$RelayInfoListTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get pubkey =>
      $composableBuilder(column: $table.pubkey, builder: (column) => column);

  GeneratedColumn<String> get contact =>
      $composableBuilder(column: $table.contact, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get nips =>
      $composableBuilder(column: $table.nips, builder: (column) => column);

  GeneratedColumn<String> get software =>
      $composableBuilder(column: $table.software, builder: (column) => column);

  GeneratedColumn<String> get icon =>
      $composableBuilder(column: $table.icon, builder: (column) => column);

  GeneratedColumn<String> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<String> get url =>
      $composableBuilder(column: $table.url, builder: (column) => column);

  GeneratedColumn<String> get location =>
      $composableBuilder(column: $table.location, builder: (column) => column);

  GeneratedColumn<String> get latency =>
      $composableBuilder(column: $table.latency, builder: (column) => column);

  GeneratedColumn<bool> get isPaid =>
      $composableBuilder(column: $table.isPaid, builder: (column) => column);

  GeneratedColumn<bool> get isAuth =>
      $composableBuilder(column: $table.isAuth, builder: (column) => column);

  GeneratedColumn<int> get lastUpdated => $composableBuilder(
      column: $table.lastUpdated, builder: (column) => column);
}

class $$RelayInfoListTableTableTableManager extends RootTableManager<
    _$NostrDatabase,
    $RelayInfoListTableTable,
    RelayInfoListTableData,
    $$RelayInfoListTableTableFilterComposer,
    $$RelayInfoListTableTableOrderingComposer,
    $$RelayInfoListTableTableAnnotationComposer,
    $$RelayInfoListTableTableCreateCompanionBuilder,
    $$RelayInfoListTableTableUpdateCompanionBuilder,
    (
      RelayInfoListTableData,
      BaseReferences<_$NostrDatabase, $RelayInfoListTableTable,
          RelayInfoListTableData>
    ),
    RelayInfoListTableData,
    PrefetchHooks Function()> {
  $$RelayInfoListTableTableTableManager(
      _$NostrDatabase db, $RelayInfoListTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RelayInfoListTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RelayInfoListTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RelayInfoListTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> name = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<String> pubkey = const Value.absent(),
            Value<String> contact = const Value.absent(),
            Value<List<String>> nips = const Value.absent(),
            Value<String> software = const Value.absent(),
            Value<String> icon = const Value.absent(),
            Value<String> version = const Value.absent(),
            Value<String> url = const Value.absent(),
            Value<String> location = const Value.absent(),
            Value<String> latency = const Value.absent(),
            Value<bool> isPaid = const Value.absent(),
            Value<bool> isAuth = const Value.absent(),
            Value<int> lastUpdated = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              RelayInfoListTableCompanion(
            name: name,
            description: description,
            pubkey: pubkey,
            contact: contact,
            nips: nips,
            software: software,
            icon: icon,
            version: version,
            url: url,
            location: location,
            latency: latency,
            isPaid: isPaid,
            isAuth: isAuth,
            lastUpdated: lastUpdated,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String name,
            required String description,
            required String pubkey,
            required String contact,
            Value<List<String>> nips = const Value.absent(),
            required String software,
            required String icon,
            required String version,
            required String url,
            required String location,
            required String latency,
            required bool isPaid,
            required bool isAuth,
            required int lastUpdated,
            Value<int> rowid = const Value.absent(),
          }) =>
              RelayInfoListTableCompanion.insert(
            name: name,
            description: description,
            pubkey: pubkey,
            contact: contact,
            nips: nips,
            software: software,
            icon: icon,
            version: version,
            url: url,
            location: location,
            latency: latency,
            isPaid: isPaid,
            isAuth: isAuth,
            lastUpdated: lastUpdated,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$RelayInfoListTableTableProcessedTableManager = ProcessedTableManager<
    _$NostrDatabase,
    $RelayInfoListTableTable,
    RelayInfoListTableData,
    $$RelayInfoListTableTableFilterComposer,
    $$RelayInfoListTableTableOrderingComposer,
    $$RelayInfoListTableTableAnnotationComposer,
    $$RelayInfoListTableTableCreateCompanionBuilder,
    $$RelayInfoListTableTableUpdateCompanionBuilder,
    (
      RelayInfoListTableData,
      BaseReferences<_$NostrDatabase, $RelayInfoListTableTable,
          RelayInfoListTableData>
    ),
    RelayInfoListTableData,
    PrefetchHooks Function()>;
typedef $$CashuMintTableTableCreateCompanionBuilder = CashuMintTableCompanion
    Function({
  required String pubkey,
  required String mintURL,
  Value<String> name,
  Value<int> balance,
  Value<int> maxNutsVersion,
  Value<int> rowid,
});
typedef $$CashuMintTableTableUpdateCompanionBuilder = CashuMintTableCompanion
    Function({
  Value<String> pubkey,
  Value<String> mintURL,
  Value<String> name,
  Value<int> balance,
  Value<int> maxNutsVersion,
  Value<int> rowid,
});

class $$CashuMintTableTableFilterComposer
    extends Composer<_$NostrDatabase, $CashuMintTableTable> {
  $$CashuMintTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get pubkey => $composableBuilder(
      column: $table.pubkey, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get mintURL => $composableBuilder(
      column: $table.mintURL, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get balance => $composableBuilder(
      column: $table.balance, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get maxNutsVersion => $composableBuilder(
      column: $table.maxNutsVersion,
      builder: (column) => ColumnFilters(column));
}

class $$CashuMintTableTableOrderingComposer
    extends Composer<_$NostrDatabase, $CashuMintTableTable> {
  $$CashuMintTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get pubkey => $composableBuilder(
      column: $table.pubkey, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get mintURL => $composableBuilder(
      column: $table.mintURL, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get balance => $composableBuilder(
      column: $table.balance, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get maxNutsVersion => $composableBuilder(
      column: $table.maxNutsVersion,
      builder: (column) => ColumnOrderings(column));
}

class $$CashuMintTableTableAnnotationComposer
    extends Composer<_$NostrDatabase, $CashuMintTableTable> {
  $$CashuMintTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get pubkey =>
      $composableBuilder(column: $table.pubkey, builder: (column) => column);

  GeneratedColumn<String> get mintURL =>
      $composableBuilder(column: $table.mintURL, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get balance =>
      $composableBuilder(column: $table.balance, builder: (column) => column);

  GeneratedColumn<int> get maxNutsVersion => $composableBuilder(
      column: $table.maxNutsVersion, builder: (column) => column);
}

class $$CashuMintTableTableTableManager extends RootTableManager<
    _$NostrDatabase,
    $CashuMintTableTable,
    CashuMintTableData,
    $$CashuMintTableTableFilterComposer,
    $$CashuMintTableTableOrderingComposer,
    $$CashuMintTableTableAnnotationComposer,
    $$CashuMintTableTableCreateCompanionBuilder,
    $$CashuMintTableTableUpdateCompanionBuilder,
    (
      CashuMintTableData,
      BaseReferences<_$NostrDatabase, $CashuMintTableTable, CashuMintTableData>
    ),
    CashuMintTableData,
    PrefetchHooks Function()> {
  $$CashuMintTableTableTableManager(
      _$NostrDatabase db, $CashuMintTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CashuMintTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CashuMintTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CashuMintTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> pubkey = const Value.absent(),
            Value<String> mintURL = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<int> balance = const Value.absent(),
            Value<int> maxNutsVersion = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CashuMintTableCompanion(
            pubkey: pubkey,
            mintURL: mintURL,
            name: name,
            balance: balance,
            maxNutsVersion: maxNutsVersion,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String pubkey,
            required String mintURL,
            Value<String> name = const Value.absent(),
            Value<int> balance = const Value.absent(),
            Value<int> maxNutsVersion = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CashuMintTableCompanion.insert(
            pubkey: pubkey,
            mintURL: mintURL,
            name: name,
            balance: balance,
            maxNutsVersion: maxNutsVersion,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CashuMintTableTableProcessedTableManager = ProcessedTableManager<
    _$NostrDatabase,
    $CashuMintTableTable,
    CashuMintTableData,
    $$CashuMintTableTableFilterComposer,
    $$CashuMintTableTableOrderingComposer,
    $$CashuMintTableTableAnnotationComposer,
    $$CashuMintTableTableCreateCompanionBuilder,
    $$CashuMintTableTableUpdateCompanionBuilder,
    (
      CashuMintTableData,
      BaseReferences<_$NostrDatabase, $CashuMintTableTable, CashuMintTableData>
    ),
    CashuMintTableData,
    PrefetchHooks Function()>;
typedef $$CashuKeysetInfoTableTableCreateCompanionBuilder
    = CashuKeysetInfoTableCompanion Function({
  required String id,
  required String mintURL,
  required String unit,
  required bool active,
  Value<String> keysetRaw,
  Value<int> inputFeePPK,
  Value<int> rowid,
});
typedef $$CashuKeysetInfoTableTableUpdateCompanionBuilder
    = CashuKeysetInfoTableCompanion Function({
  Value<String> id,
  Value<String> mintURL,
  Value<String> unit,
  Value<bool> active,
  Value<String> keysetRaw,
  Value<int> inputFeePPK,
  Value<int> rowid,
});

class $$CashuKeysetInfoTableTableFilterComposer
    extends Composer<_$NostrDatabase, $CashuKeysetInfoTableTable> {
  $$CashuKeysetInfoTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get mintURL => $composableBuilder(
      column: $table.mintURL, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get unit => $composableBuilder(
      column: $table.unit, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get active => $composableBuilder(
      column: $table.active, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get keysetRaw => $composableBuilder(
      column: $table.keysetRaw, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get inputFeePPK => $composableBuilder(
      column: $table.inputFeePPK, builder: (column) => ColumnFilters(column));
}

class $$CashuKeysetInfoTableTableOrderingComposer
    extends Composer<_$NostrDatabase, $CashuKeysetInfoTableTable> {
  $$CashuKeysetInfoTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get mintURL => $composableBuilder(
      column: $table.mintURL, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get unit => $composableBuilder(
      column: $table.unit, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get active => $composableBuilder(
      column: $table.active, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get keysetRaw => $composableBuilder(
      column: $table.keysetRaw, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get inputFeePPK => $composableBuilder(
      column: $table.inputFeePPK, builder: (column) => ColumnOrderings(column));
}

class $$CashuKeysetInfoTableTableAnnotationComposer
    extends Composer<_$NostrDatabase, $CashuKeysetInfoTableTable> {
  $$CashuKeysetInfoTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get mintURL =>
      $composableBuilder(column: $table.mintURL, builder: (column) => column);

  GeneratedColumn<String> get unit =>
      $composableBuilder(column: $table.unit, builder: (column) => column);

  GeneratedColumn<bool> get active =>
      $composableBuilder(column: $table.active, builder: (column) => column);

  GeneratedColumn<String> get keysetRaw =>
      $composableBuilder(column: $table.keysetRaw, builder: (column) => column);

  GeneratedColumn<int> get inputFeePPK => $composableBuilder(
      column: $table.inputFeePPK, builder: (column) => column);
}

class $$CashuKeysetInfoTableTableTableManager extends RootTableManager<
    _$NostrDatabase,
    $CashuKeysetInfoTableTable,
    CashuKeysetInfoTableData,
    $$CashuKeysetInfoTableTableFilterComposer,
    $$CashuKeysetInfoTableTableOrderingComposer,
    $$CashuKeysetInfoTableTableAnnotationComposer,
    $$CashuKeysetInfoTableTableCreateCompanionBuilder,
    $$CashuKeysetInfoTableTableUpdateCompanionBuilder,
    (
      CashuKeysetInfoTableData,
      BaseReferences<_$NostrDatabase, $CashuKeysetInfoTableTable,
          CashuKeysetInfoTableData>
    ),
    CashuKeysetInfoTableData,
    PrefetchHooks Function()> {
  $$CashuKeysetInfoTableTableTableManager(
      _$NostrDatabase db, $CashuKeysetInfoTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CashuKeysetInfoTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CashuKeysetInfoTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CashuKeysetInfoTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> mintURL = const Value.absent(),
            Value<String> unit = const Value.absent(),
            Value<bool> active = const Value.absent(),
            Value<String> keysetRaw = const Value.absent(),
            Value<int> inputFeePPK = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CashuKeysetInfoTableCompanion(
            id: id,
            mintURL: mintURL,
            unit: unit,
            active: active,
            keysetRaw: keysetRaw,
            inputFeePPK: inputFeePPK,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String mintURL,
            required String unit,
            required bool active,
            Value<String> keysetRaw = const Value.absent(),
            Value<int> inputFeePPK = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CashuKeysetInfoTableCompanion.insert(
            id: id,
            mintURL: mintURL,
            unit: unit,
            active: active,
            keysetRaw: keysetRaw,
            inputFeePPK: inputFeePPK,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CashuKeysetInfoTableTableProcessedTableManager
    = ProcessedTableManager<
        _$NostrDatabase,
        $CashuKeysetInfoTableTable,
        CashuKeysetInfoTableData,
        $$CashuKeysetInfoTableTableFilterComposer,
        $$CashuKeysetInfoTableTableOrderingComposer,
        $$CashuKeysetInfoTableTableAnnotationComposer,
        $$CashuKeysetInfoTableTableCreateCompanionBuilder,
        $$CashuKeysetInfoTableTableUpdateCompanionBuilder,
        (
          CashuKeysetInfoTableData,
          BaseReferences<_$NostrDatabase, $CashuKeysetInfoTableTable,
              CashuKeysetInfoTableData>
        ),
        CashuKeysetInfoTableData,
        PrefetchHooks Function()>;
typedef $$CashuInvoiceTableTableCreateCompanionBuilder
    = CashuInvoiceTableCompanion Function({
  required String id,
  required String quote,
  required String request,
  required bool paid,
  required String amount,
  required int expiry,
  required String mintURL,
  Value<int> rowid,
});
typedef $$CashuInvoiceTableTableUpdateCompanionBuilder
    = CashuInvoiceTableCompanion Function({
  Value<String> id,
  Value<String> quote,
  Value<String> request,
  Value<bool> paid,
  Value<String> amount,
  Value<int> expiry,
  Value<String> mintURL,
  Value<int> rowid,
});

class $$CashuInvoiceTableTableFilterComposer
    extends Composer<_$NostrDatabase, $CashuInvoiceTableTable> {
  $$CashuInvoiceTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get quote => $composableBuilder(
      column: $table.quote, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get request => $composableBuilder(
      column: $table.request, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get paid => $composableBuilder(
      column: $table.paid, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get expiry => $composableBuilder(
      column: $table.expiry, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get mintURL => $composableBuilder(
      column: $table.mintURL, builder: (column) => ColumnFilters(column));
}

class $$CashuInvoiceTableTableOrderingComposer
    extends Composer<_$NostrDatabase, $CashuInvoiceTableTable> {
  $$CashuInvoiceTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get quote => $composableBuilder(
      column: $table.quote, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get request => $composableBuilder(
      column: $table.request, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get paid => $composableBuilder(
      column: $table.paid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get expiry => $composableBuilder(
      column: $table.expiry, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get mintURL => $composableBuilder(
      column: $table.mintURL, builder: (column) => ColumnOrderings(column));
}

class $$CashuInvoiceTableTableAnnotationComposer
    extends Composer<_$NostrDatabase, $CashuInvoiceTableTable> {
  $$CashuInvoiceTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get quote =>
      $composableBuilder(column: $table.quote, builder: (column) => column);

  GeneratedColumn<String> get request =>
      $composableBuilder(column: $table.request, builder: (column) => column);

  GeneratedColumn<bool> get paid =>
      $composableBuilder(column: $table.paid, builder: (column) => column);

  GeneratedColumn<String> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<int> get expiry =>
      $composableBuilder(column: $table.expiry, builder: (column) => column);

  GeneratedColumn<String> get mintURL =>
      $composableBuilder(column: $table.mintURL, builder: (column) => column);
}

class $$CashuInvoiceTableTableTableManager extends RootTableManager<
    _$NostrDatabase,
    $CashuInvoiceTableTable,
    CashuInvoiceTableData,
    $$CashuInvoiceTableTableFilterComposer,
    $$CashuInvoiceTableTableOrderingComposer,
    $$CashuInvoiceTableTableAnnotationComposer,
    $$CashuInvoiceTableTableCreateCompanionBuilder,
    $$CashuInvoiceTableTableUpdateCompanionBuilder,
    (
      CashuInvoiceTableData,
      BaseReferences<_$NostrDatabase, $CashuInvoiceTableTable,
          CashuInvoiceTableData>
    ),
    CashuInvoiceTableData,
    PrefetchHooks Function()> {
  $$CashuInvoiceTableTableTableManager(
      _$NostrDatabase db, $CashuInvoiceTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CashuInvoiceTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CashuInvoiceTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CashuInvoiceTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> quote = const Value.absent(),
            Value<String> request = const Value.absent(),
            Value<bool> paid = const Value.absent(),
            Value<String> amount = const Value.absent(),
            Value<int> expiry = const Value.absent(),
            Value<String> mintURL = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CashuInvoiceTableCompanion(
            id: id,
            quote: quote,
            request: request,
            paid: paid,
            amount: amount,
            expiry: expiry,
            mintURL: mintURL,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String quote,
            required String request,
            required bool paid,
            required String amount,
            required int expiry,
            required String mintURL,
            Value<int> rowid = const Value.absent(),
          }) =>
              CashuInvoiceTableCompanion.insert(
            id: id,
            quote: quote,
            request: request,
            paid: paid,
            amount: amount,
            expiry: expiry,
            mintURL: mintURL,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CashuInvoiceTableTableProcessedTableManager = ProcessedTableManager<
    _$NostrDatabase,
    $CashuInvoiceTableTable,
    CashuInvoiceTableData,
    $$CashuInvoiceTableTableFilterComposer,
    $$CashuInvoiceTableTableOrderingComposer,
    $$CashuInvoiceTableTableAnnotationComposer,
    $$CashuInvoiceTableTableCreateCompanionBuilder,
    $$CashuInvoiceTableTableUpdateCompanionBuilder,
    (
      CashuInvoiceTableData,
      BaseReferences<_$NostrDatabase, $CashuInvoiceTableTable,
          CashuInvoiceTableData>
    ),
    CashuInvoiceTableData,
    PrefetchHooks Function()>;
typedef $$CashuUnblindingDataTableTableCreateCompanionBuilder
    = CashuUnblindingDataTableCompanion Function({
  required String mintURL,
  required String unit,
  required int actionTypeRaw,
  required String actionValue,
  required String id,
  required String amount,
  required String C_,
  Value<String> dleqPlainText,
  required String r,
  required String secret,
  Value<int> rowid,
});
typedef $$CashuUnblindingDataTableTableUpdateCompanionBuilder
    = CashuUnblindingDataTableCompanion Function({
  Value<String> mintURL,
  Value<String> unit,
  Value<int> actionTypeRaw,
  Value<String> actionValue,
  Value<String> id,
  Value<String> amount,
  Value<String> C_,
  Value<String> dleqPlainText,
  Value<String> r,
  Value<String> secret,
  Value<int> rowid,
});

class $$CashuUnblindingDataTableTableFilterComposer
    extends Composer<_$NostrDatabase, $CashuUnblindingDataTableTable> {
  $$CashuUnblindingDataTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get mintURL => $composableBuilder(
      column: $table.mintURL, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get unit => $composableBuilder(
      column: $table.unit, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get actionTypeRaw => $composableBuilder(
      column: $table.actionTypeRaw, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get actionValue => $composableBuilder(
      column: $table.actionValue, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get C_ => $composableBuilder(
      column: $table.C_, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get dleqPlainText => $composableBuilder(
      column: $table.dleqPlainText, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get r => $composableBuilder(
      column: $table.r, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get secret => $composableBuilder(
      column: $table.secret, builder: (column) => ColumnFilters(column));
}

class $$CashuUnblindingDataTableTableOrderingComposer
    extends Composer<_$NostrDatabase, $CashuUnblindingDataTableTable> {
  $$CashuUnblindingDataTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get mintURL => $composableBuilder(
      column: $table.mintURL, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get unit => $composableBuilder(
      column: $table.unit, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get actionTypeRaw => $composableBuilder(
      column: $table.actionTypeRaw,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get actionValue => $composableBuilder(
      column: $table.actionValue, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get C_ => $composableBuilder(
      column: $table.C_, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get dleqPlainText => $composableBuilder(
      column: $table.dleqPlainText,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get r => $composableBuilder(
      column: $table.r, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get secret => $composableBuilder(
      column: $table.secret, builder: (column) => ColumnOrderings(column));
}

class $$CashuUnblindingDataTableTableAnnotationComposer
    extends Composer<_$NostrDatabase, $CashuUnblindingDataTableTable> {
  $$CashuUnblindingDataTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get mintURL =>
      $composableBuilder(column: $table.mintURL, builder: (column) => column);

  GeneratedColumn<String> get unit =>
      $composableBuilder(column: $table.unit, builder: (column) => column);

  GeneratedColumn<int> get actionTypeRaw => $composableBuilder(
      column: $table.actionTypeRaw, builder: (column) => column);

  GeneratedColumn<String> get actionValue => $composableBuilder(
      column: $table.actionValue, builder: (column) => column);

  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<String> get C_ =>
      $composableBuilder(column: $table.C_, builder: (column) => column);

  GeneratedColumn<String> get dleqPlainText => $composableBuilder(
      column: $table.dleqPlainText, builder: (column) => column);

  GeneratedColumn<String> get r =>
      $composableBuilder(column: $table.r, builder: (column) => column);

  GeneratedColumn<String> get secret =>
      $composableBuilder(column: $table.secret, builder: (column) => column);
}

class $$CashuUnblindingDataTableTableTableManager extends RootTableManager<
    _$NostrDatabase,
    $CashuUnblindingDataTableTable,
    CashuUnblindingDataTableData,
    $$CashuUnblindingDataTableTableFilterComposer,
    $$CashuUnblindingDataTableTableOrderingComposer,
    $$CashuUnblindingDataTableTableAnnotationComposer,
    $$CashuUnblindingDataTableTableCreateCompanionBuilder,
    $$CashuUnblindingDataTableTableUpdateCompanionBuilder,
    (
      CashuUnblindingDataTableData,
      BaseReferences<_$NostrDatabase, $CashuUnblindingDataTableTable,
          CashuUnblindingDataTableData>
    ),
    CashuUnblindingDataTableData,
    PrefetchHooks Function()> {
  $$CashuUnblindingDataTableTableTableManager(
      _$NostrDatabase db, $CashuUnblindingDataTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CashuUnblindingDataTableTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$CashuUnblindingDataTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CashuUnblindingDataTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> mintURL = const Value.absent(),
            Value<String> unit = const Value.absent(),
            Value<int> actionTypeRaw = const Value.absent(),
            Value<String> actionValue = const Value.absent(),
            Value<String> id = const Value.absent(),
            Value<String> amount = const Value.absent(),
            Value<String> C_ = const Value.absent(),
            Value<String> dleqPlainText = const Value.absent(),
            Value<String> r = const Value.absent(),
            Value<String> secret = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CashuUnblindingDataTableCompanion(
            mintURL: mintURL,
            unit: unit,
            actionTypeRaw: actionTypeRaw,
            actionValue: actionValue,
            id: id,
            amount: amount,
            C_: C_,
            dleqPlainText: dleqPlainText,
            r: r,
            secret: secret,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String mintURL,
            required String unit,
            required int actionTypeRaw,
            required String actionValue,
            required String id,
            required String amount,
            required String C_,
            Value<String> dleqPlainText = const Value.absent(),
            required String r,
            required String secret,
            Value<int> rowid = const Value.absent(),
          }) =>
              CashuUnblindingDataTableCompanion.insert(
            mintURL: mintURL,
            unit: unit,
            actionTypeRaw: actionTypeRaw,
            actionValue: actionValue,
            id: id,
            amount: amount,
            C_: C_,
            dleqPlainText: dleqPlainText,
            r: r,
            secret: secret,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CashuUnblindingDataTableTableProcessedTableManager
    = ProcessedTableManager<
        _$NostrDatabase,
        $CashuUnblindingDataTableTable,
        CashuUnblindingDataTableData,
        $$CashuUnblindingDataTableTableFilterComposer,
        $$CashuUnblindingDataTableTableOrderingComposer,
        $$CashuUnblindingDataTableTableAnnotationComposer,
        $$CashuUnblindingDataTableTableCreateCompanionBuilder,
        $$CashuUnblindingDataTableTableUpdateCompanionBuilder,
        (
          CashuUnblindingDataTableData,
          BaseReferences<_$NostrDatabase, $CashuUnblindingDataTableTable,
              CashuUnblindingDataTableData>
        ),
        CashuUnblindingDataTableData,
        PrefetchHooks Function()>;
typedef $$CashuMintInfoTableTableCreateCompanionBuilder
    = CashuMintInfoTableCompanion Function({
  required String mintURL,
  Value<String> name,
  Value<String> iconUrl,
  Value<String> pubkey,
  Value<String> version,
  Value<String> description,
  Value<String> descriptionLong,
  required List<Map<String, String>> contact,
  Value<String> motd,
  Value<String> nutsJson,
  Value<int> rowid,
});
typedef $$CashuMintInfoTableTableUpdateCompanionBuilder
    = CashuMintInfoTableCompanion Function({
  Value<String> mintURL,
  Value<String> name,
  Value<String> iconUrl,
  Value<String> pubkey,
  Value<String> version,
  Value<String> description,
  Value<String> descriptionLong,
  Value<List<Map<String, String>>> contact,
  Value<String> motd,
  Value<String> nutsJson,
  Value<int> rowid,
});

class $$CashuMintInfoTableTableFilterComposer
    extends Composer<_$NostrDatabase, $CashuMintInfoTableTable> {
  $$CashuMintInfoTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get mintURL => $composableBuilder(
      column: $table.mintURL, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get iconUrl => $composableBuilder(
      column: $table.iconUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get pubkey => $composableBuilder(
      column: $table.pubkey, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get descriptionLong => $composableBuilder(
      column: $table.descriptionLong,
      builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<List<Map<String, String>>,
          List<Map<String, String>>, String>
      get contact => $composableBuilder(
          column: $table.contact,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<String> get motd => $composableBuilder(
      column: $table.motd, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get nutsJson => $composableBuilder(
      column: $table.nutsJson, builder: (column) => ColumnFilters(column));
}

class $$CashuMintInfoTableTableOrderingComposer
    extends Composer<_$NostrDatabase, $CashuMintInfoTableTable> {
  $$CashuMintInfoTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get mintURL => $composableBuilder(
      column: $table.mintURL, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get iconUrl => $composableBuilder(
      column: $table.iconUrl, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get pubkey => $composableBuilder(
      column: $table.pubkey, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get descriptionLong => $composableBuilder(
      column: $table.descriptionLong,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get contact => $composableBuilder(
      column: $table.contact, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get motd => $composableBuilder(
      column: $table.motd, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get nutsJson => $composableBuilder(
      column: $table.nutsJson, builder: (column) => ColumnOrderings(column));
}

class $$CashuMintInfoTableTableAnnotationComposer
    extends Composer<_$NostrDatabase, $CashuMintInfoTableTable> {
  $$CashuMintInfoTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get mintURL =>
      $composableBuilder(column: $table.mintURL, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get iconUrl =>
      $composableBuilder(column: $table.iconUrl, builder: (column) => column);

  GeneratedColumn<String> get pubkey =>
      $composableBuilder(column: $table.pubkey, builder: (column) => column);

  GeneratedColumn<String> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get descriptionLong => $composableBuilder(
      column: $table.descriptionLong, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<Map<String, String>>, String>
      get contact => $composableBuilder(
          column: $table.contact, builder: (column) => column);

  GeneratedColumn<String> get motd =>
      $composableBuilder(column: $table.motd, builder: (column) => column);

  GeneratedColumn<String> get nutsJson =>
      $composableBuilder(column: $table.nutsJson, builder: (column) => column);
}

class $$CashuMintInfoTableTableTableManager extends RootTableManager<
    _$NostrDatabase,
    $CashuMintInfoTableTable,
    CashuMintInfoTableData,
    $$CashuMintInfoTableTableFilterComposer,
    $$CashuMintInfoTableTableOrderingComposer,
    $$CashuMintInfoTableTableAnnotationComposer,
    $$CashuMintInfoTableTableCreateCompanionBuilder,
    $$CashuMintInfoTableTableUpdateCompanionBuilder,
    (
      CashuMintInfoTableData,
      BaseReferences<_$NostrDatabase, $CashuMintInfoTableTable,
          CashuMintInfoTableData>
    ),
    CashuMintInfoTableData,
    PrefetchHooks Function()> {
  $$CashuMintInfoTableTableTableManager(
      _$NostrDatabase db, $CashuMintInfoTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CashuMintInfoTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CashuMintInfoTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CashuMintInfoTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> mintURL = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> iconUrl = const Value.absent(),
            Value<String> pubkey = const Value.absent(),
            Value<String> version = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<String> descriptionLong = const Value.absent(),
            Value<List<Map<String, String>>> contact = const Value.absent(),
            Value<String> motd = const Value.absent(),
            Value<String> nutsJson = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CashuMintInfoTableCompanion(
            mintURL: mintURL,
            name: name,
            iconUrl: iconUrl,
            pubkey: pubkey,
            version: version,
            description: description,
            descriptionLong: descriptionLong,
            contact: contact,
            motd: motd,
            nutsJson: nutsJson,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String mintURL,
            Value<String> name = const Value.absent(),
            Value<String> iconUrl = const Value.absent(),
            Value<String> pubkey = const Value.absent(),
            Value<String> version = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<String> descriptionLong = const Value.absent(),
            required List<Map<String, String>> contact,
            Value<String> motd = const Value.absent(),
            Value<String> nutsJson = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CashuMintInfoTableCompanion.insert(
            mintURL: mintURL,
            name: name,
            iconUrl: iconUrl,
            pubkey: pubkey,
            version: version,
            description: description,
            descriptionLong: descriptionLong,
            contact: contact,
            motd: motd,
            nutsJson: nutsJson,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CashuMintInfoTableTableProcessedTableManager = ProcessedTableManager<
    _$NostrDatabase,
    $CashuMintInfoTableTable,
    CashuMintInfoTableData,
    $$CashuMintInfoTableTableFilterComposer,
    $$CashuMintInfoTableTableOrderingComposer,
    $$CashuMintInfoTableTableAnnotationComposer,
    $$CashuMintInfoTableTableCreateCompanionBuilder,
    $$CashuMintInfoTableTableUpdateCompanionBuilder,
    (
      CashuMintInfoTableData,
      BaseReferences<_$NostrDatabase, $CashuMintInfoTableTable,
          CashuMintInfoTableData>
    ),
    CashuMintInfoTableData,
    PrefetchHooks Function()>;
typedef $$CashuLightningInvoiceTableTableCreateCompanionBuilder
    = CashuLightningInvoiceTableCompanion Function({
  required String id,
  required String pr,
  required String hash,
  required String amount,
  required String mintURL,
  Value<int> rowid,
});
typedef $$CashuLightningInvoiceTableTableUpdateCompanionBuilder
    = CashuLightningInvoiceTableCompanion Function({
  Value<String> id,
  Value<String> pr,
  Value<String> hash,
  Value<String> amount,
  Value<String> mintURL,
  Value<int> rowid,
});

class $$CashuLightningInvoiceTableTableFilterComposer
    extends Composer<_$NostrDatabase, $CashuLightningInvoiceTableTable> {
  $$CashuLightningInvoiceTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get pr => $composableBuilder(
      column: $table.pr, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get hash => $composableBuilder(
      column: $table.hash, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get mintURL => $composableBuilder(
      column: $table.mintURL, builder: (column) => ColumnFilters(column));
}

class $$CashuLightningInvoiceTableTableOrderingComposer
    extends Composer<_$NostrDatabase, $CashuLightningInvoiceTableTable> {
  $$CashuLightningInvoiceTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get pr => $composableBuilder(
      column: $table.pr, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get hash => $composableBuilder(
      column: $table.hash, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get mintURL => $composableBuilder(
      column: $table.mintURL, builder: (column) => ColumnOrderings(column));
}

class $$CashuLightningInvoiceTableTableAnnotationComposer
    extends Composer<_$NostrDatabase, $CashuLightningInvoiceTableTable> {
  $$CashuLightningInvoiceTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get pr =>
      $composableBuilder(column: $table.pr, builder: (column) => column);

  GeneratedColumn<String> get hash =>
      $composableBuilder(column: $table.hash, builder: (column) => column);

  GeneratedColumn<String> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<String> get mintURL =>
      $composableBuilder(column: $table.mintURL, builder: (column) => column);
}

class $$CashuLightningInvoiceTableTableTableManager extends RootTableManager<
    _$NostrDatabase,
    $CashuLightningInvoiceTableTable,
    CashuLightningInvoiceTableData,
    $$CashuLightningInvoiceTableTableFilterComposer,
    $$CashuLightningInvoiceTableTableOrderingComposer,
    $$CashuLightningInvoiceTableTableAnnotationComposer,
    $$CashuLightningInvoiceTableTableCreateCompanionBuilder,
    $$CashuLightningInvoiceTableTableUpdateCompanionBuilder,
    (
      CashuLightningInvoiceTableData,
      BaseReferences<_$NostrDatabase, $CashuLightningInvoiceTableTable,
          CashuLightningInvoiceTableData>
    ),
    CashuLightningInvoiceTableData,
    PrefetchHooks Function()> {
  $$CashuLightningInvoiceTableTableTableManager(
      _$NostrDatabase db, $CashuLightningInvoiceTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CashuLightningInvoiceTableTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$CashuLightningInvoiceTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CashuLightningInvoiceTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> pr = const Value.absent(),
            Value<String> hash = const Value.absent(),
            Value<String> amount = const Value.absent(),
            Value<String> mintURL = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CashuLightningInvoiceTableCompanion(
            id: id,
            pr: pr,
            hash: hash,
            amount: amount,
            mintURL: mintURL,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String pr,
            required String hash,
            required String amount,
            required String mintURL,
            Value<int> rowid = const Value.absent(),
          }) =>
              CashuLightningInvoiceTableCompanion.insert(
            id: id,
            pr: pr,
            hash: hash,
            amount: amount,
            mintURL: mintURL,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CashuLightningInvoiceTableTableProcessedTableManager
    = ProcessedTableManager<
        _$NostrDatabase,
        $CashuLightningInvoiceTableTable,
        CashuLightningInvoiceTableData,
        $$CashuLightningInvoiceTableTableFilterComposer,
        $$CashuLightningInvoiceTableTableOrderingComposer,
        $$CashuLightningInvoiceTableTableAnnotationComposer,
        $$CashuLightningInvoiceTableTableCreateCompanionBuilder,
        $$CashuLightningInvoiceTableTableUpdateCompanionBuilder,
        (
          CashuLightningInvoiceTableData,
          BaseReferences<_$NostrDatabase, $CashuLightningInvoiceTableTable,
              CashuLightningInvoiceTableData>
        ),
        CashuLightningInvoiceTableData,
        PrefetchHooks Function()>;
typedef $$CashuTokensTableTableCreateCompanionBuilder
    = CashuTokensTableCompanion Function({
  required String id,
  required String mintUrl,
  required String unit,
  required String pubkey,
  required int createdAt,
  required List<String> proofs,
  required List<String> deletedTokensIds,
  Value<int> rowid,
});
typedef $$CashuTokensTableTableUpdateCompanionBuilder
    = CashuTokensTableCompanion Function({
  Value<String> id,
  Value<String> mintUrl,
  Value<String> unit,
  Value<String> pubkey,
  Value<int> createdAt,
  Value<List<String>> proofs,
  Value<List<String>> deletedTokensIds,
  Value<int> rowid,
});

class $$CashuTokensTableTableFilterComposer
    extends Composer<_$NostrDatabase, $CashuTokensTableTable> {
  $$CashuTokensTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get mintUrl => $composableBuilder(
      column: $table.mintUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get unit => $composableBuilder(
      column: $table.unit, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get pubkey => $composableBuilder(
      column: $table.pubkey, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
      get proofs => $composableBuilder(
          column: $table.proofs,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
      get deletedTokensIds => $composableBuilder(
          column: $table.deletedTokensIds,
          builder: (column) => ColumnWithTypeConverterFilters(column));
}

class $$CashuTokensTableTableOrderingComposer
    extends Composer<_$NostrDatabase, $CashuTokensTableTable> {
  $$CashuTokensTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get mintUrl => $composableBuilder(
      column: $table.mintUrl, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get unit => $composableBuilder(
      column: $table.unit, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get pubkey => $composableBuilder(
      column: $table.pubkey, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get proofs => $composableBuilder(
      column: $table.proofs, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get deletedTokensIds => $composableBuilder(
      column: $table.deletedTokensIds,
      builder: (column) => ColumnOrderings(column));
}

class $$CashuTokensTableTableAnnotationComposer
    extends Composer<_$NostrDatabase, $CashuTokensTableTable> {
  $$CashuTokensTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get mintUrl =>
      $composableBuilder(column: $table.mintUrl, builder: (column) => column);

  GeneratedColumn<String> get unit =>
      $composableBuilder(column: $table.unit, builder: (column) => column);

  GeneratedColumn<String> get pubkey =>
      $composableBuilder(column: $table.pubkey, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get proofs =>
      $composableBuilder(column: $table.proofs, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get deletedTokensIds =>
      $composableBuilder(
          column: $table.deletedTokensIds, builder: (column) => column);
}

class $$CashuTokensTableTableTableManager extends RootTableManager<
    _$NostrDatabase,
    $CashuTokensTableTable,
    CashuTokensTableData,
    $$CashuTokensTableTableFilterComposer,
    $$CashuTokensTableTableOrderingComposer,
    $$CashuTokensTableTableAnnotationComposer,
    $$CashuTokensTableTableCreateCompanionBuilder,
    $$CashuTokensTableTableUpdateCompanionBuilder,
    (
      CashuTokensTableData,
      BaseReferences<_$NostrDatabase, $CashuTokensTableTable,
          CashuTokensTableData>
    ),
    CashuTokensTableData,
    PrefetchHooks Function()> {
  $$CashuTokensTableTableTableManager(
      _$NostrDatabase db, $CashuTokensTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CashuTokensTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CashuTokensTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CashuTokensTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> mintUrl = const Value.absent(),
            Value<String> unit = const Value.absent(),
            Value<String> pubkey = const Value.absent(),
            Value<int> createdAt = const Value.absent(),
            Value<List<String>> proofs = const Value.absent(),
            Value<List<String>> deletedTokensIds = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CashuTokensTableCompanion(
            id: id,
            mintUrl: mintUrl,
            unit: unit,
            pubkey: pubkey,
            createdAt: createdAt,
            proofs: proofs,
            deletedTokensIds: deletedTokensIds,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String mintUrl,
            required String unit,
            required String pubkey,
            required int createdAt,
            required List<String> proofs,
            required List<String> deletedTokensIds,
            Value<int> rowid = const Value.absent(),
          }) =>
              CashuTokensTableCompanion.insert(
            id: id,
            mintUrl: mintUrl,
            unit: unit,
            pubkey: pubkey,
            createdAt: createdAt,
            proofs: proofs,
            deletedTokensIds: deletedTokensIds,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CashuTokensTableTableProcessedTableManager = ProcessedTableManager<
    _$NostrDatabase,
    $CashuTokensTableTable,
    CashuTokensTableData,
    $$CashuTokensTableTableFilterComposer,
    $$CashuTokensTableTableOrderingComposer,
    $$CashuTokensTableTableAnnotationComposer,
    $$CashuTokensTableTableCreateCompanionBuilder,
    $$CashuTokensTableTableUpdateCompanionBuilder,
    (
      CashuTokensTableData,
      BaseReferences<_$NostrDatabase, $CashuTokensTableTable,
          CashuTokensTableData>
    ),
    CashuTokensTableData,
    PrefetchHooks Function()>;
typedef $$CashuSpendingTableTableCreateCompanionBuilder
    = CashuSpendingTableCompanion Function({
  required String id,
  required String pubkey,
  required int createdAt,
  required int kind,
  required List<List<String>> content,
  required List<List<String>> tags,
  Value<int> rowid,
});
typedef $$CashuSpendingTableTableUpdateCompanionBuilder
    = CashuSpendingTableCompanion Function({
  Value<String> id,
  Value<String> pubkey,
  Value<int> createdAt,
  Value<int> kind,
  Value<List<List<String>>> content,
  Value<List<List<String>>> tags,
  Value<int> rowid,
});

class $$CashuSpendingTableTableFilterComposer
    extends Composer<_$NostrDatabase, $CashuSpendingTableTable> {
  $$CashuSpendingTableTableFilterComposer({
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
      get content => $composableBuilder(
          column: $table.content,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnWithTypeConverterFilters<List<List<String>>, List<List<String>>, String>
      get tags => $composableBuilder(
          column: $table.tags,
          builder: (column) => ColumnWithTypeConverterFilters(column));
}

class $$CashuSpendingTableTableOrderingComposer
    extends Composer<_$NostrDatabase, $CashuSpendingTableTable> {
  $$CashuSpendingTableTableOrderingComposer({
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

  ColumnOrderings<String> get content => $composableBuilder(
      column: $table.content, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get tags => $composableBuilder(
      column: $table.tags, builder: (column) => ColumnOrderings(column));
}

class $$CashuSpendingTableTableAnnotationComposer
    extends Composer<_$NostrDatabase, $CashuSpendingTableTable> {
  $$CashuSpendingTableTableAnnotationComposer({
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

  GeneratedColumnWithTypeConverter<List<List<String>>, String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<List<String>>, String> get tags =>
      $composableBuilder(column: $table.tags, builder: (column) => column);
}

class $$CashuSpendingTableTableTableManager extends RootTableManager<
    _$NostrDatabase,
    $CashuSpendingTableTable,
    CashuSpendingTableData,
    $$CashuSpendingTableTableFilterComposer,
    $$CashuSpendingTableTableOrderingComposer,
    $$CashuSpendingTableTableAnnotationComposer,
    $$CashuSpendingTableTableCreateCompanionBuilder,
    $$CashuSpendingTableTableUpdateCompanionBuilder,
    (
      CashuSpendingTableData,
      BaseReferences<_$NostrDatabase, $CashuSpendingTableTable,
          CashuSpendingTableData>
    ),
    CashuSpendingTableData,
    PrefetchHooks Function()> {
  $$CashuSpendingTableTableTableManager(
      _$NostrDatabase db, $CashuSpendingTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CashuSpendingTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CashuSpendingTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CashuSpendingTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> pubkey = const Value.absent(),
            Value<int> createdAt = const Value.absent(),
            Value<int> kind = const Value.absent(),
            Value<List<List<String>>> content = const Value.absent(),
            Value<List<List<String>>> tags = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CashuSpendingTableCompanion(
            id: id,
            pubkey: pubkey,
            createdAt: createdAt,
            kind: kind,
            content: content,
            tags: tags,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String pubkey,
            required int createdAt,
            required int kind,
            required List<List<String>> content,
            required List<List<String>> tags,
            Value<int> rowid = const Value.absent(),
          }) =>
              CashuSpendingTableCompanion.insert(
            id: id,
            pubkey: pubkey,
            createdAt: createdAt,
            kind: kind,
            content: content,
            tags: tags,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CashuSpendingTableTableProcessedTableManager = ProcessedTableManager<
    _$NostrDatabase,
    $CashuSpendingTableTable,
    CashuSpendingTableData,
    $$CashuSpendingTableTableFilterComposer,
    $$CashuSpendingTableTableOrderingComposer,
    $$CashuSpendingTableTableAnnotationComposer,
    $$CashuSpendingTableTableCreateCompanionBuilder,
    $$CashuSpendingTableTableUpdateCompanionBuilder,
    (
      CashuSpendingTableData,
      BaseReferences<_$NostrDatabase, $CashuSpendingTableTable,
          CashuSpendingTableData>
    ),
    CashuSpendingTableData,
    PrefetchHooks Function()>;
typedef $$CashuWalletTableTableCreateCompanionBuilder
    = CashuWalletTableCompanion Function({
  required String id,
  required int createdAt,
  required String pubkey,
  required String signSecret,
  required List<String> mints,
  Value<int> rowid,
});
typedef $$CashuWalletTableTableUpdateCompanionBuilder
    = CashuWalletTableCompanion Function({
  Value<String> id,
  Value<int> createdAt,
  Value<String> pubkey,
  Value<String> signSecret,
  Value<List<String>> mints,
  Value<int> rowid,
});

class $$CashuWalletTableTableFilterComposer
    extends Composer<_$NostrDatabase, $CashuWalletTableTable> {
  $$CashuWalletTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get pubkey => $composableBuilder(
      column: $table.pubkey, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get signSecret => $composableBuilder(
      column: $table.signSecret, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
      get mints => $composableBuilder(
          column: $table.mints,
          builder: (column) => ColumnWithTypeConverterFilters(column));
}

class $$CashuWalletTableTableOrderingComposer
    extends Composer<_$NostrDatabase, $CashuWalletTableTable> {
  $$CashuWalletTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get pubkey => $composableBuilder(
      column: $table.pubkey, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get signSecret => $composableBuilder(
      column: $table.signSecret, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get mints => $composableBuilder(
      column: $table.mints, builder: (column) => ColumnOrderings(column));
}

class $$CashuWalletTableTableAnnotationComposer
    extends Composer<_$NostrDatabase, $CashuWalletTableTable> {
  $$CashuWalletTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get pubkey =>
      $composableBuilder(column: $table.pubkey, builder: (column) => column);

  GeneratedColumn<String> get signSecret => $composableBuilder(
      column: $table.signSecret, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get mints =>
      $composableBuilder(column: $table.mints, builder: (column) => column);
}

class $$CashuWalletTableTableTableManager extends RootTableManager<
    _$NostrDatabase,
    $CashuWalletTableTable,
    CashuWalletTableData,
    $$CashuWalletTableTableFilterComposer,
    $$CashuWalletTableTableOrderingComposer,
    $$CashuWalletTableTableAnnotationComposer,
    $$CashuWalletTableTableCreateCompanionBuilder,
    $$CashuWalletTableTableUpdateCompanionBuilder,
    (
      CashuWalletTableData,
      BaseReferences<_$NostrDatabase, $CashuWalletTableTable,
          CashuWalletTableData>
    ),
    CashuWalletTableData,
    PrefetchHooks Function()> {
  $$CashuWalletTableTableTableManager(
      _$NostrDatabase db, $CashuWalletTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CashuWalletTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CashuWalletTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CashuWalletTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<int> createdAt = const Value.absent(),
            Value<String> pubkey = const Value.absent(),
            Value<String> signSecret = const Value.absent(),
            Value<List<String>> mints = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CashuWalletTableCompanion(
            id: id,
            createdAt: createdAt,
            pubkey: pubkey,
            signSecret: signSecret,
            mints: mints,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required int createdAt,
            required String pubkey,
            required String signSecret,
            required List<String> mints,
            Value<int> rowid = const Value.absent(),
          }) =>
              CashuWalletTableCompanion.insert(
            id: id,
            createdAt: createdAt,
            pubkey: pubkey,
            signSecret: signSecret,
            mints: mints,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CashuWalletTableTableProcessedTableManager = ProcessedTableManager<
    _$NostrDatabase,
    $CashuWalletTableTable,
    CashuWalletTableData,
    $$CashuWalletTableTableFilterComposer,
    $$CashuWalletTableTableOrderingComposer,
    $$CashuWalletTableTableAnnotationComposer,
    $$CashuWalletTableTableCreateCompanionBuilder,
    $$CashuWalletTableTableUpdateCompanionBuilder,
    (
      CashuWalletTableData,
      BaseReferences<_$NostrDatabase, $CashuWalletTableTable,
          CashuWalletTableData>
    ),
    CashuWalletTableData,
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
  $$RelayInfoListTableTableTableManager get relayInfoListTable =>
      $$RelayInfoListTableTableTableManager(_db, _db.relayInfoListTable);
  $$CashuMintTableTableTableManager get cashuMintTable =>
      $$CashuMintTableTableTableManager(_db, _db.cashuMintTable);
  $$CashuKeysetInfoTableTableTableManager get cashuKeysetInfoTable =>
      $$CashuKeysetInfoTableTableTableManager(_db, _db.cashuKeysetInfoTable);
  $$CashuInvoiceTableTableTableManager get cashuInvoiceTable =>
      $$CashuInvoiceTableTableTableManager(_db, _db.cashuInvoiceTable);
  $$CashuUnblindingDataTableTableTableManager get cashuUnblindingDataTable =>
      $$CashuUnblindingDataTableTableTableManager(
          _db, _db.cashuUnblindingDataTable);
  $$CashuMintInfoTableTableTableManager get cashuMintInfoTable =>
      $$CashuMintInfoTableTableTableManager(_db, _db.cashuMintInfoTable);
  $$CashuLightningInvoiceTableTableTableManager
      get cashuLightningInvoiceTable =>
          $$CashuLightningInvoiceTableTableTableManager(
              _db, _db.cashuLightningInvoiceTable);
  $$CashuTokensTableTableTableManager get cashuTokensTable =>
      $$CashuTokensTableTableTableManager(_db, _db.cashuTokensTable);
  $$CashuSpendingTableTableTableManager get cashuSpendingTable =>
      $$CashuSpendingTableTableTableManager(_db, _db.cashuSpendingTable);
  $$CashuWalletTableTableTableManager get cashuWalletTable =>
      $$CashuWalletTableTableTableManager(_db, _db.cashuWalletTable);
}
