// ignore_for_file: public_member_api_docs, sort_constructors_first, constant_identifier_names
import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:nostr_core_enhanced/db/drift_database.dart';
import 'package:nostr_core_enhanced/nostr/nostr.dart';

import '../utils/utils.dart';
import 'dvm_model.dart';

const SOURCE_NETWORK = 'network';
const SOURCE_TOP = 'top';
const SOURCE_GLOBAL = 'global';
const SOURCE_RECENT = 'recent';
const SOURCE_RECENT_WITH_REPLIES = 'recent_with_replies';
const SOURCE_PAID = 'paid';
const SOURCE_WIDGETS = 'widgets';

class AppSharedSettings {
  String pubkey;
  ContentFilters filters;
  ContentSources contentSources;

  UserAppSettingsTableCompanion toCompanion() {
    return UserAppSettingsTableCompanion(
      pubkey: Value(pubkey),
      filters: Value(filters.toJson()),
      contentSources: Value(contentSources.toJson()),
    );
  }

  factory AppSharedSettings.fromAppSharedSettingsTableData(
    UserAppSettingsTableData data,
  ) {
    return AppSharedSettings(
      pubkey: data.pubkey,
      filters: ContentFilters.fromMap2(jsonDecode(data.filters)),
      contentSources: ContentSources.fromMap(
        jsonDecode(data.contentSources),
      ),
    );
  }

  AppSharedSettings({
    required this.pubkey,
    required this.filters,
    required this.contentSources,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pubkey': pubkey,
      'content_filters': filters.toEventList(),
      'content_sources': contentSources.toMap(),
    };
  }

  AppSharedSettings deepCopy() {
    return AppSharedSettings(
      pubkey: pubkey,
      filters: filters.deepCopy(),
      contentSources: contentSources.deepCopy(),
    );
  }

  factory AppSharedSettings.defaultSettings({String? pubkey}) {
    return AppSharedSettings(
      pubkey: pubkey ?? '',
      filters: ContentFilters.defaultFilters(),
      contentSources: ContentSources.defaultSources(),
    );
  }

  factory AppSharedSettings.defaultEmptySettings({String? pubkey}) {
    return AppSharedSettings(
      pubkey: pubkey ?? '',
      filters: ContentFilters.defaultFilters(),
      contentSources: ContentSources.defaultEmptySources(pubkey),
    );
  }

  factory AppSharedSettings.fromMap(Map<String, dynamic> map) {
    return AppSharedSettings(
      pubkey: map['pubkey'],
      filters: map['content_filters'] != null
          ? ContentFilters.fromMap(map['content_filters'])
          : ContentFilters.defaultFilters(),
      contentSources: map['content_sources'] != null
          ? ContentSources.fromMap(
              map['content_sources'] as Map<String, dynamic>,
            )
          : ContentSources.defaultSources(),
    );
  }

  String toJson() => json.encode(toMap());

  factory AppSharedSettings.fromEvent(Event event) {
    final contentMap = jsonDecode(event.content);

    return AppSharedSettings.fromMap(
      {
        'pubkey': event.pubkey,
        ...contentMap,
      },
    );
  }

  factory AppSharedSettings.fromJson(String source) =>
      AppSharedSettings.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  String eventContent() {
    final contentMap = {};

    contentMap['content_filters'] = filters.toEventList();
    contentMap['content_sources'] = contentSources.toEventMap();

    return jsonEncode(contentMap);
  }

  AppSharedSettings copyWith({
    String? pubkey,
    ContentFilters? filters,
    ContentSources? contentSources,
  }) {
    return AppSharedSettings(
      pubkey: pubkey ?? this.pubkey,
      filters: filters ?? this.filters,
      contentSources: contentSources ?? this.contentSources,
    );
  }
}

class ContentFilters {
  List<DiscoverFilter> discoverFilters;
  List<MediaFilter> mediaFilters;
  List<NotesFilter> notesFilters;

  ContentFilters({
    required this.discoverFilters,
    required this.mediaFilters,
    required this.notesFilters,
  });

  Map<String, DiscoverFilter> getDiscoverMappedContent() {
    return {
      for (final filter in discoverFilters) filter.id: filter,
    };
  }

  Map<String, NotesFilter> getNotesMappedContent() {
    return {
      for (final filter in notesFilters) filter.id: filter,
    };
  }

  Map<String, MediaFilter> getMediaMappedContent() {
    return {
      for (final filter in mediaFilters) filter.id: filter,
    };
  }

  ContentFilters deepCopy() {
    return ContentFilters(
      discoverFilters: List.from(discoverFilters),
      mediaFilters: List.from(mediaFilters),
      notesFilters: List.from(notesFilters),
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'discoverFilters': discoverFilters.map((x) => x.toMap()).toList(),
      'mediaFilters': mediaFilters.map((x) => x.toMap()).toList(),
      'notesFilters': notesFilters.map((x) => x.toMap()).toList(),
    };
  }

  factory ContentFilters.defaultFilters() {
    return ContentFilters(
      discoverFilters: [],
      notesFilters: [],
      mediaFilters: [],
    );
  }

  factory ContentFilters.fromMap(List list) {
    List<DiscoverFilter> discoverFilters = [];
    List<MediaFilter> mediaFilters = [];
    List<NotesFilter> notesFilters = [];

    for (final item in list) {
      if (item['type'] == 1) {
        discoverFilters.add(DiscoverFilter.fromMap(item));
      } else if (item['type'] == 2) {
        notesFilters.add(NotesFilter.fromMap(item));
      } else {
        mediaFilters.add(MediaFilter.fromMap(item));
      }
    }

    return ContentFilters(
      discoverFilters: discoverFilters,
      mediaFilters: mediaFilters,
      notesFilters: notesFilters,
    );
  }

  factory ContentFilters.fromMap2(Map<String, dynamic> map) {
    List<DiscoverFilter> discoverFilters = List<DiscoverFilter>.from(
      (map['discoverFilters'] as List).map((x) => DiscoverFilter.fromMap(x)),
    );

    List<NotesFilter> notesFilters = List<NotesFilter>.from(
      (map['notesFilters'] as List).map((x) => NotesFilter.fromMap(x)),
    );

    List<MediaFilter> mediaFilter = map['mediaFilters'] != null
        ? List<MediaFilter>.from(
            (map['mediaFilters'] as List).map((x) => MediaFilter.fromMap(x)),
          )
        : [];

    return ContentFilters(
      discoverFilters: discoverFilters,
      notesFilters: notesFilters,
      mediaFilters: mediaFilter,
    );
  }

  String toJson() => json.encode(toMap());

  List<Map<String, dynamic>> toEventList() {
    return [
      for (final filter in discoverFilters) filter.toEventMap(),
      for (final filter in notesFilters) filter.toEventMap()
    ];
  }

  factory ContentFilters.fromJson(String source) =>
      ContentFilters.fromMap(json.decode(source) as List);
}

// ** Discover Filter **
class DiscoverFilter {
  String id;
  String title;
  List<String> includedKeywords;
  List<String> excludedKeywords;
  List<String> postedBy;
  bool hideSensitive;
  bool inludeThumbnail;
  DiscoverArticleFilter articleFilter;
  DiscoverCurationFilter curationFilter;
  DiscoverVideoFilter videoFilter;
  int? from;
  int? to;

  DiscoverFilter({
    required this.hideSensitive,
    required this.inludeThumbnail,
    required this.articleFilter,
    required this.curationFilter,
    required this.videoFilter,
    required this.id,
    required this.title,
    required this.includedKeywords,
    required this.excludedKeywords,
    required this.postedBy,
    this.from,
    this.to,
  });

  bool isDefault() {
    return id == '';
  }

  factory DiscoverFilter.defaultFilter() {
    return DiscoverFilter(
      hideSensitive: false,
      inludeThumbnail: false,
      articleFilter: DiscoverArticleFilter(
        minWords: 150,
        onlyMedia: false,
      ),
      curationFilter: DiscoverCurationFilter(
        type: CurationTypes.articles,
        minItems: 4,
      ),
      videoFilter: DiscoverVideoFilter(source: VideoSourceTypes.all),
      id: '',
      title: '',
      includedKeywords: [],
      excludedKeywords: [],
      postedBy: [],
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'included_words': includedKeywords,
      'excluded_words': excludedKeywords,
      'posted_by': postedBy,
      'hide_sensitive': hideSensitive,
      'thumbnail': inludeThumbnail,
      'for_articles': articleFilter.toMap(),
      'for_curations': curationFilter.toMap(),
      'for_videos': videoFilter.toMap(),
    };
  }

  @override
  factory DiscoverFilter.fromMap(Map<String, dynamic> map) {
    return DiscoverFilter(
      id: map['id'] as String? ?? uuid.v4(),
      title: map['title'] as String,
      from: map['from'] as int?,
      to: map['to'] as int?,
      includedKeywords: List<String>.from(map['included_words'] as List),
      excludedKeywords: List<String>.from(map['excluded_words'] as List),
      postedBy: List<String>.from(map['posted_by'] as List),
      hideSensitive: map['hide_sensitive'] as bool,
      inludeThumbnail: map['thumbnail'] as bool,
      articleFilter: DiscoverArticleFilter.fromMap(
        map['for_articles'] as Map<String, dynamic>,
      ),
      curationFilter: DiscoverCurationFilter.fromMap(
        map['for_curations'] as Map<String, dynamic>,
      ),
      videoFilter: DiscoverVideoFilter.fromMap(
        map['for_videos'] as Map<String, dynamic>,
      ),
    );
  }

  Map<String, dynamic> toEventMap() {
    return <String, dynamic>{
      'type': 1,
      'title': title,
      'included_words': includedKeywords,
      'excluded_words': excludedKeywords,
      'posted_by': postedBy,
      'hide_sensitive': hideSensitive,
      'thumbnail': inludeThumbnail,
      'for_articles': articleFilter.toEventMap(),
      'for_curations': curationFilter.toEventMap(),
      'for_videos': videoFilter.toMap(),
      'from': from,
      'to': to,
    };
  }

  String toJson() => json.encode(toMap());

  factory DiscoverFilter.fromJson(String source) =>
      DiscoverFilter.fromMap(json.decode(source) as Map<String, dynamic>);
}

class MediaFilter {
  String id;
  String title;
  List<String> includedKeywords;
  List<String> excludedKeywords;
  List<String> postedBy;
  bool hideSensitive;
  int? from;
  int? to;

  MediaFilter({
    required this.hideSensitive,
    required this.id,
    required this.title,
    required this.includedKeywords,
    required this.excludedKeywords,
    required this.postedBy,
    this.from,
    this.to,
  });

  bool isDefault() {
    return id == '';
  }

  factory MediaFilter.defaultFilter() {
    return MediaFilter(
      hideSensitive: false,
      id: '',
      title: '',
      includedKeywords: [],
      excludedKeywords: [],
      postedBy: [],
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'included_words': includedKeywords,
      'excluded_words': excludedKeywords,
      'posted_by': postedBy,
      'hide_sensitive': hideSensitive,
      'from': from,
      'to': to,
    };
  }

  @override
  factory MediaFilter.fromMap(Map<String, dynamic> map) {
    return MediaFilter(
      id: map['id'] as String? ?? uuid.v4(),
      title: map['title'] as String,
      from: map['from'] as int?,
      to: map['to'] as int?,
      includedKeywords: List<String>.from(map['included_words'] as List),
      excludedKeywords: List<String>.from(map['excluded_words'] as List),
      postedBy: List<String>.from(map['posted_by'] as List),
      hideSensitive: map['hide_sensitive'] as bool,
    );
  }

  Map<String, dynamic> toEventMap() {
    return <String, dynamic>{
      'type': 3,
      'title': title,
      'included_words': includedKeywords,
      'excluded_words': excludedKeywords,
      'posted_by': postedBy,
      'hide_sensitive': hideSensitive,
      'from': from,
      'to': to,
    };
  }

  String toJson() => json.encode(toMap());

  factory MediaFilter.fromJson(String source) =>
      MediaFilter.fromMap(json.decode(source) as Map<String, dynamic>);
}

class DiscoverArticleFilter {
  int minWords;
  bool onlyMedia;

  DiscoverArticleFilter({
    required this.minWords,
    required this.onlyMedia,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'min_words': minWords,
      'media_only': onlyMedia,
    };
  }

  Map<String, dynamic> toEventMap() {
    return <String, dynamic>{
      'min_words': minWords,
      'media_only': onlyMedia,
    };
  }

  factory DiscoverArticleFilter.fromMap(Map<String, dynamic> map) {
    return DiscoverArticleFilter(
      minWords: map['min_words'] as int? ?? 150,
      onlyMedia: map['media_only'] as bool? ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory DiscoverArticleFilter.fromJson(String source) =>
      DiscoverArticleFilter.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );
}

class DiscoverCurationFilter {
  CurationTypes type;
  int minItems;

  DiscoverCurationFilter({
    required this.type,
    required this.minItems,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'type': type.name,
      'min_items': minItems,
    };
  }

  Map<String, dynamic> toEventMap() {
    return <String, dynamic>{
      'type': type.name,
      'min_items': minItems,
    };
  }

  factory DiscoverCurationFilter.fromMap(Map<String, dynamic> map) {
    return DiscoverCurationFilter(
      type: CurationTypes.values.firstWhere(
        (element) => element.name == map['type'],
        orElse: () => CurationTypes.all,
      ),
      minItems: map['min_items'] as int? ?? 4,
    );
  }

  String toJson() => json.encode(toMap());

  factory DiscoverCurationFilter.fromJson(String source) =>
      DiscoverCurationFilter.fromMap(
          json.decode(source) as Map<String, dynamic>);
}

class DiscoverVideoFilter {
  VideoSourceTypes source;

  DiscoverVideoFilter({
    required this.source,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'source': source.name,
    };
  }

  factory DiscoverVideoFilter.fromMap(Map<String, dynamic> map) {
    return DiscoverVideoFilter(
      source: VideoSourceTypes.values.firstWhere(
        (element) => element.name == map['source'],
        orElse: () => VideoSourceTypes.all,
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory DiscoverVideoFilter.fromJson(String source) =>
      DiscoverVideoFilter.fromMap(json.decode(source) as Map<String, dynamic>);
}

// ** Notes Filter **
class NotesFilter {
  String id;
  String title;
  List<String> includedKeywords;
  List<String> excludedKeywords;
  List<String> postedBy;
  bool onlyMedia;
  int? from;
  int? to;

  bool isDefault() {
    return id == '';
  }

  NotesFilter({
    required this.onlyMedia,
    required this.id,
    required this.title,
    required this.includedKeywords,
    required this.excludedKeywords,
    required this.postedBy,
    this.from,
    this.to,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'included_words': includedKeywords,
      'excluded_words': excludedKeywords,
      'posted_by': postedBy,
      'media_only': onlyMedia,
      'from': from,
      'to': to,
    };
  }

  Map<String, dynamic> toEventMap() {
    return <String, dynamic>{
      'type': 2,
      'title': title,
      'included_words': includedKeywords,
      'excluded_words': excludedKeywords,
      'posted_by': postedBy,
      'media_only': onlyMedia,
      'from': from,
      'to': to,
    };
  }

  factory NotesFilter.defaultFilter() {
    return NotesFilter(
      onlyMedia: false,
      id: '',
      title: '',
      includedKeywords: [],
      excludedKeywords: [],
      postedBy: [],
    );
  }

  factory NotesFilter.fromMap(Map<String, dynamic> map) {
    return NotesFilter(
      id: map['id'] as String? ?? uuid.v4(),
      title: map['title'] as String,
      includedKeywords: List<String>.from(map['included_words'] as List? ?? []),
      excludedKeywords: List<String>.from(map['excluded_words'] as List? ?? []),
      postedBy: List<String>.from(map['posted_by'] as List? ?? []),
      onlyMedia: map['media_only'] as bool? ?? false,
      from: map['from'] as int?,
      to: map['to'] as int?,
    );
  }

  String toJson() => json.encode(toMap());

  factory NotesFilter.fromJson(String source) =>
      NotesFilter.fromMap(json.decode(source) as Map<String, dynamic>);
}

class ContentSources {
  NotesSources notesSources;
  DiscoverSources discoverSources;
  MediaSources mediaSources;

  ContentSources({
    required this.notesSources,
    required this.discoverSources,
    required this.mediaSources,
  });

  ContentSources deepCopy() {
    return ContentSources(
      notesSources: notesSources.deepCopy(),
      discoverSources: discoverSources.deepCopy(),
      mediaSources: mediaSources.deepCopy(),
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'notes': notesSources.toMap(),
      'mixed_content': discoverSources.toMap(),
      'media': mediaSources.toMap(),
    };
  }

  Map<String, dynamic> toEventMap() {
    return <String, dynamic>{
      'notes': notesSources.toEventMap(),
      'mixed_content': discoverSources.toEventMap(),
      'media': mediaSources.toEventMap(),
    };
  }

  factory ContentSources.defaultSources() {
    return ContentSources(
      notesSources: NotesSources(
        communityFeed: NotesCommunityFeed(
          recent: CommunityFeedOption(
            name: SOURCE_RECENT,
            enabled: true,
            index: 0,
            id: uuid.v4(),
          ),
          recentWithReplies: CommunityFeedOption(
            name: SOURCE_RECENT_WITH_REPLIES,
            enabled: true,
            index: 1,
            id: uuid.v4(),
          ),
          global: CommunityFeedOption(
            name: SOURCE_GLOBAL,
            enabled: true,
            index: 2,
            id: uuid.v4(),
          ),
          paid: CommunityFeedOption(
            name: SOURCE_PAID,
            enabled: true,
            index: 3,
            id: uuid.v4(),
          ),
          widgets: CommunityFeedOption(
            name: SOURCE_WIDGETS,
            enabled: true,
            index: 4,
            id: uuid.v4(),
          ),
          index: 0,
        ),
      ),
      discoverSources: DiscoverSources(
        communityFeed: DiscoverCommunityFeed(
          top: CommunityFeedOption(
            name: SOURCE_TOP,
            enabled: true,
            index: 0,
            id: uuid.v4(),
          ),
          network: CommunityFeedOption(
            name: SOURCE_NETWORK,
            enabled: true,
            index: 1,
            id: uuid.v4(),
          ),
          global: CommunityFeedOption(
            name: SOURCE_GLOBAL,
            enabled: true,
            index: 2,
            id: uuid.v4(),
          ),
          index: 0,
        ),
      ),
      mediaSources: MediaSources(
        communityFeed: MediaCommunityFeed(
          recent: CommunityFeedOption(
            name: SOURCE_RECENT,
            enabled: true,
            index: 0,
            id: uuid.v4(),
          ),
          global: CommunityFeedOption(
            name: SOURCE_GLOBAL,
            enabled: true,
            index: 1,
            id: uuid.v4(),
          ),
          index: 0,
        ),
      ),
    );
  }

  factory ContentSources.defaultEmptySources(String? pubkey) {
    return ContentSources(
      notesSources: NotesSources(
        communityFeed: NotesCommunityFeed(
          recent: CommunityFeedOption(
            name: SOURCE_RECENT,
            enabled: pubkey != null,
            index: 0,
            id: uuid.v4(),
          ),
          recentWithReplies: CommunityFeedOption(
            name: SOURCE_RECENT_WITH_REPLIES,
            enabled: pubkey != null,
            index: 1,
            id: uuid.v4(),
          ),
          global: CommunityFeedOption(
            name: SOURCE_GLOBAL,
            enabled: true,
            index: 2,
            id: uuid.v4(),
          ),
          paid: CommunityFeedOption(
            name: SOURCE_PAID,
            enabled: true,
            index: 3,
            id: uuid.v4(),
          ),
          widgets: CommunityFeedOption(
            name: SOURCE_WIDGETS,
            enabled: true,
            index: 4,
            id: uuid.v4(),
          ),
          index: 0,
        ),
      ),
      discoverSources: DiscoverSources(
        communityFeed: DiscoverCommunityFeed(
          top: CommunityFeedOption(
            name: SOURCE_TOP,
            enabled: true,
            index: 0,
            id: uuid.v4(),
          ),
          network: CommunityFeedOption(
            name: SOURCE_NETWORK,
            enabled: true,
            index: 1,
            id: uuid.v4(),
          ),
          global: CommunityFeedOption(
            name: SOURCE_GLOBAL,
            enabled: true,
            index: 2,
            id: uuid.v4(),
          ),
          index: 0,
        ),
      ),
      mediaSources: MediaSources(
        communityFeed: MediaCommunityFeed(
          recent: CommunityFeedOption(
            name: SOURCE_RECENT,
            enabled: true,
            index: 0,
            id: uuid.v4(),
          ),
          global: CommunityFeedOption(
            name: SOURCE_GLOBAL,
            enabled: true,
            index: 1,
            id: uuid.v4(),
          ),
          index: 0,
        ),
      ),
    );
  }

  factory ContentSources.fromMap(Map<String, dynamic> map) {
    return ContentSources(
      notesSources: map['notes'] != null
          ? NotesSources.fromMap(
              map['notes'] as Map<String, dynamic>,
            )
          : NotesSources.defaultSources(),
      discoverSources: map['mixed_content'] != null
          ? DiscoverSources.fromMap(
              map['mixed_content'] as Map<String, dynamic>,
            )
          : DiscoverSources.defaultSources(),
      mediaSources: map['media'] != null
          ? MediaSources.fromMap(
              map['media'] as Map<String, dynamic>,
            )
          : MediaSources.defaultSources(),
    );
  }

  String toJson() => json.encode(toMap());

  factory ContentSources.fromJson(String source) =>
      ContentSources.fromMap(json.decode(source) as Map<String, dynamic>);

  ContentSources copyWith({
    NotesSources? notesSources,
    DiscoverSources? discoverSources,
    MediaSources? mediaSources,
  }) {
    return ContentSources(
      notesSources: notesSources ?? this.notesSources,
      discoverSources: discoverSources ?? this.discoverSources,
      mediaSources: mediaSources ?? this.mediaSources,
    );
  }
}

class NotesSources {
  NotesCommunityFeed communityFeed;

  NotesSources({
    required this.communityFeed,
  });

  factory NotesSources.defaultSources() {
    return NotesSources(
      communityFeed: NotesCommunityFeed(
        recent: CommunityFeedOption(
          name: SOURCE_RECENT,
          enabled: true,
          index: 0,
          id: uuid.v4(),
        ),
        recentWithReplies: CommunityFeedOption(
          name: SOURCE_RECENT_WITH_REPLIES,
          enabled: true,
          index: 1,
          id: uuid.v4(),
        ),
        global: CommunityFeedOption(
          name: SOURCE_GLOBAL,
          enabled: true,
          index: 2,
          id: uuid.v4(),
        ),
        paid: CommunityFeedOption(
          name: SOURCE_PAID,
          enabled: true,
          index: 3,
          id: uuid.v4(),
        ),
        widgets: CommunityFeedOption(
          name: SOURCE_WIDGETS,
          enabled: true,
          index: 4,
          id: uuid.v4(),
        ),
        index: 0,
      ),
    );
  }

  NotesSources deepCopy() {
    return NotesSources(
      communityFeed: communityFeed.deepCopy(),
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'community': communityFeed.toMap(),
    };
  }

  Map<String, dynamic> toEventMap() {
    return <String, dynamic>{
      'community': communityFeed.toEventMap(),
    };
  }

  MapEntry<String, String> getFirstNotesSource() {
    String selectedNotesSource = '';
    String name = '';
    final feeds = getFeedsByOrder();

    if (feeds.isNotEmpty) {
      final firstFeed = feeds.first;
      if (firstFeed is NotesCommunityFeed) {
        final options = [
          communityFeed.recent,
          communityFeed.recentWithReplies,
          communityFeed.global
        ]..sort((a, b) => a.index.compareTo(b.index));
        if (options.isNotEmpty) {
          final o = options.firstWhere(
            (element) => element.enabled,
            orElse: () => options.first,
          );

          selectedNotesSource = o.id;
          name = o.name;
        }
      }
    }

    return MapEntry(selectedNotesSource, name);
  }

  MapEntry<String, String> getCurrentSelectedNoteSource(
    MapEntry<String, String> currentSource,
  ) {
    bool isEnabled = false;

    for (final feed in getFeedsByOrder()) {
      if (feed is NotesCommunityFeed) {
        isEnabled =
            (feed.recent.id == currentSource.key && feed.recent.enabled) ||
                (feed.recentWithReplies.id == currentSource.key &&
                    feed.recentWithReplies.enabled) ||
                (feed.global.id == currentSource.key && feed.global.enabled);
        if (isEnabled) {
          return currentSource;
        }
      } else if (feed is DvmFeed) {
        isEnabled = feed.dvms
            .where(
              (element) => element.id == currentSource.key && element.enabled,
            )
            .isNotEmpty;

        if (isEnabled) {
          return currentSource;
        }
      }
    }

    return getFirstNotesSource();
  }

  List<BaseFeed> getFeedsByOrder() {
    return [communityFeed];
  }

  factory NotesSources.fromMap(Map<String, dynamic> map) {
    return NotesSources(
      communityFeed:
          NotesCommunityFeed.fromMap(map['community'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory NotesSources.fromJson(String source) => NotesSources.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  NotesSources copyWith({
    NotesCommunityFeed? communityFeed,
  }) {
    return NotesSources(
      communityFeed: communityFeed ?? this.communityFeed,
    );
  }
}

class DiscoverSources {
  DiscoverCommunityFeed communityFeed;

  DiscoverSources({
    required this.communityFeed,
  });

  factory DiscoverSources.defaultSources() {
    return DiscoverSources(
      communityFeed: DiscoverCommunityFeed(
        top: CommunityFeedOption(
          name: SOURCE_TOP,
          enabled: true,
          index: 0,
          id: uuid.v4(),
        ),
        network: CommunityFeedOption(
          name: SOURCE_NETWORK,
          enabled: true,
          index: 1,
          id: uuid.v4(),
        ),
        global: CommunityFeedOption(
          name: SOURCE_GLOBAL,
          enabled: true,
          index: 2,
          id: uuid.v4(),
        ),
        index: 0,
      ),
    );
  }

  DiscoverSources deepCopy() {
    return DiscoverSources(
      communityFeed: communityFeed.deepCopy(),
    );
  }

  MapEntry<String, String> getFirstDiscoverSource() {
    String selectedDiscoverSource = '';
    String name = '';
    final feeds = getFeedsByOrder();

    if (feeds.isNotEmpty) {
      final firstFeed = feeds.first;
      if (firstFeed is DiscoverCommunityFeed) {
        final options = [
          communityFeed.top,
          communityFeed.network,
          communityFeed.global
        ]..sort((a, b) => a.index.compareTo(b.index));
        if (options.isNotEmpty) {
          final o = options.firstWhere(
            (element) => element.enabled,
            orElse: () => options.first,
          );

          selectedDiscoverSource = o.id;
          name = o.name;
        }
      }
    }

    return MapEntry(selectedDiscoverSource, name);
  }

  MapEntry<String, String> getCurrentSelectedDiscoverSource(
    MapEntry<String, String> currentSource,
  ) {
    bool isEnabled = false;

    for (final feed in getFeedsByOrder()) {
      if (feed is DiscoverCommunityFeed) {
        isEnabled =
            (feed.network.id == currentSource.key && feed.network.enabled) ||
                (feed.top.id == currentSource.key && feed.top.enabled) ||
                (feed.global.id == currentSource.key && feed.global.enabled);
        if (isEnabled) {
          return currentSource;
        }
      } else if (feed is DvmFeed) {
        isEnabled = feed.dvms
            .where(
              (element) => element.id == currentSource.key && element.enabled,
            )
            .isNotEmpty;

        if (isEnabled) {
          return currentSource;
        }
      }
    }

    return getFirstDiscoverSource();
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'community': communityFeed.toMap(),
    };
  }

  Map<String, dynamic> toEventMap() {
    return <String, dynamic>{
      'community': communityFeed.toEventMap(),
    };
  }

  List<BaseFeed> getFeedsByOrder() {
    return [communityFeed];
  }

  factory DiscoverSources.fromMap(Map<String, dynamic> map) {
    return DiscoverSources(
      communityFeed: DiscoverCommunityFeed.fromMap(
        map['community'] as Map<String, dynamic>,
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory DiscoverSources.fromJson(String source) =>
      DiscoverSources.fromMap(json.decode(source) as Map<String, dynamic>);

  DiscoverSources copyWith({
    DiscoverCommunityFeed? communityFeed,
  }) {
    return DiscoverSources(
      communityFeed: communityFeed ?? this.communityFeed,
    );
  }
}

class MediaSources {
  MediaCommunityFeed communityFeed;

  MediaSources({
    required this.communityFeed,
  });

  factory MediaSources.defaultSources() {
    return MediaSources(
      communityFeed: MediaCommunityFeed(
        recent: CommunityFeedOption(
          name: SOURCE_RECENT,
          enabled: true,
          index: 0,
          id: uuid.v4(),
        ),
        global: CommunityFeedOption(
          name: SOURCE_GLOBAL,
          enabled: true,
          index: 1,
          id: uuid.v4(),
        ),
        index: 0,
      ),
    );
  }

  MediaSources deepCopy() {
    return MediaSources(
      communityFeed: communityFeed.deepCopy(),
    );
  }

  MapEntry<String, String> getFirstMediaSource() {
    String selectedDiscoverSource = '';
    String name = '';
    final feeds = getFeedsByOrder();

    if (feeds.isNotEmpty) {
      final firstFeed = feeds.first;
      if (firstFeed is MediaCommunityFeed) {
        final options = [communityFeed.recent, communityFeed.global]
          ..sort((a, b) => a.index.compareTo(b.index));
        if (options.isNotEmpty) {
          final o = options.firstWhere(
            (element) => element.enabled,
            orElse: () => options.first,
          );

          selectedDiscoverSource = o.id;
          name = o.name;
        }
      }
    }

    return MapEntry(selectedDiscoverSource, name);
  }

  MapEntry<String, String> getCurrentSelectedMediaSource(
    MapEntry<String, String> currentSource,
  ) {
    bool isEnabled = false;

    for (final feed in getFeedsByOrder()) {
      if (feed is MediaCommunityFeed) {
        isEnabled =
            (feed.recent.id == currentSource.key && feed.recent.enabled) ||
                (feed.global.id == currentSource.key && feed.global.enabled);
        if (isEnabled) {
          return currentSource;
        }
      } else if (feed is DvmFeed) {
        isEnabled = feed.dvms
            .where(
              (element) => element.id == currentSource.key && element.enabled,
            )
            .isNotEmpty;

        if (isEnabled) {
          return currentSource;
        }
      }
    }

    return getFirstMediaSource();
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'community': communityFeed.toMap(),
    };
  }

  Map<String, dynamic> toEventMap() {
    return <String, dynamic>{
      'community': communityFeed.toEventMap(),
    };
  }

  List<BaseFeed> getFeedsByOrder() {
    return [communityFeed];
  }

  factory MediaSources.fromMap(Map<String, dynamic> map) {
    return MediaSources(
      communityFeed: MediaCommunityFeed.fromMap(
        map['community'] as Map<String, dynamic>,
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory MediaSources.fromJson(String source) =>
      MediaSources.fromMap(json.decode(source) as Map<String, dynamic>);

  MediaSources copyWith({
    MediaCommunityFeed? communityFeed,
  }) {
    return MediaSources(
      communityFeed: communityFeed ?? this.communityFeed,
    );
  }
}

class BaseFeed {
  int index;

  BaseFeed({
    required this.index,
  });
}

class NotesCommunityFeed extends BaseFeed {
  CommunityFeedOption recent;
  CommunityFeedOption recentWithReplies;
  CommunityFeedOption global;
  CommunityFeedOption paid;
  CommunityFeedOption widgets;

  NotesCommunityFeed({
    required this.recent,
    required this.recentWithReplies,
    required this.global,
    required this.paid,
    required this.widgets,
    required super.index,
  });

  NotesCommunityFeed deepCopy() {
    return NotesCommunityFeed(
      index: index,
      recent: recent.deepCopy(),
      recentWithReplies: recentWithReplies.deepCopy(),
      global: global.deepCopy(),
      paid: paid.deepCopy(),
      widgets: widgets.deepCopy(),
    );
  }

  Map<String, CommunityFeedOption> getMappedContent() {
    List<CommunityFeedOption> options = [
      recent,
      recentWithReplies,
      global,
      paid,
      widgets
    ]..sort((a, b) => a.index.compareTo(b.index));

    return {
      for (final option in options) option.id: option,
    };
  }

  bool isDisabled() {
    return !recent.enabled &&
        !recentWithReplies.enabled &&
        !global.enabled &&
        !paid.enabled &&
        !widgets.enabled;
  }

  Map<String, dynamic> toMap() {
    List<CommunityFeedOption> options = [
      recent,
      recentWithReplies,
      global,
      paid,
      widgets
    ];

    options.sort((a, b) => a.index.compareTo(b.index));

    return <String, dynamic>{
      'index': index,
      'list': options
          .map(
            (e) => [e.name, e.enabled],
          )
          .toList(),
    };
  }

  Map<String, dynamic> toEventMap() {
    List<CommunityFeedOption> options = [
      recent,
      recentWithReplies,
      global,
      paid,
      widgets
    ];

    options.sort((a, b) => a.index.compareTo(b.index));

    return <String, dynamic>{
      'index': index,
      'list': options
          .map(
            (e) => [e.name, e.enabled],
          )
          .toList(),
    };
  }

  factory NotesCommunityFeed.fromMap(Map<String, dynamic> map) {
    final list = map['list'] as List?;
    CommunityFeedOption recent = CommunityFeedOption(
      name: SOURCE_RECENT,
      enabled: true,
      index: 0,
      id: uuid.v4(),
    );

    CommunityFeedOption recentWithReplies = CommunityFeedOption(
      name: SOURCE_RECENT_WITH_REPLIES,
      enabled: true,
      index: 1,
      id: uuid.v4(),
    );

    CommunityFeedOption global = CommunityFeedOption(
      name: SOURCE_GLOBAL,
      enabled: true,
      index: 2,
      id: uuid.v4(),
    );

    CommunityFeedOption paid = CommunityFeedOption(
      name: SOURCE_PAID,
      enabled: true,
      index: 3,
      id: uuid.v4(),
    );

    CommunityFeedOption widgets = CommunityFeedOption(
      name: SOURCE_WIDGETS,
      enabled: true,
      index: 4,
      id: uuid.v4(),
    );

    if (list != null && list.isNotEmpty) {
      for (int i = 0; i < list.length; i++) {
        final item = list[i];
        if (item is List && item.length >= 2) {
          if (item.first == SOURCE_RECENT) {
            recent = CommunityFeedOption(
              name: item.first,
              enabled: item[1] as bool,
              index: i,
              id: uuid.v4(),
            );
          }

          if (item.first == SOURCE_RECENT_WITH_REPLIES) {
            recentWithReplies = CommunityFeedOption(
              name: item.first,
              enabled: item[1] as bool,
              index: i,
              id: uuid.v4(),
            );
          }

          if (item.first == SOURCE_GLOBAL) {
            global = CommunityFeedOption(
              name: item.first,
              enabled: item[1] as bool,
              index: i,
              id: uuid.v4(),
            );
          }

          if (item.first == SOURCE_PAID) {
            paid = CommunityFeedOption(
              name: item.first,
              enabled: item[1] as bool,
              index: i,
              id: uuid.v4(),
            );
          }

          if (item.first == SOURCE_WIDGETS) {
            widgets = CommunityFeedOption(
              name: item.first,
              enabled: item[1] as bool,
              index: i,
              id: uuid.v4(),
            );
          }
        }
      }
    }

    return NotesCommunityFeed(
      index: map['index'],
      recent: recent,
      recentWithReplies: recentWithReplies,
      global: global,
      paid: paid,
      widgets: widgets,
    );
  }

  String toJson() => json.encode(toMap());

  factory NotesCommunityFeed.fromJson(String source) =>
      NotesCommunityFeed.fromMap(json.decode(source) as Map<String, dynamic>);

  NotesCommunityFeed copyWith({
    CommunityFeedOption? recent,
    CommunityFeedOption? recentWithReplies,
    CommunityFeedOption? global,
    CommunityFeedOption? paid,
    CommunityFeedOption? widgets,
    int? index,
  }) {
    return NotesCommunityFeed(
      index: index ?? this.index,
      recent: recent ?? this.recent,
      recentWithReplies: recentWithReplies ?? this.recentWithReplies,
      global: global ?? this.global,
      paid: paid ?? this.paid,
      widgets: widgets ?? this.widgets,
    );
  }
}

class CommunityFeedOption {
  String id;
  String name;
  bool enabled;
  int index;

  CommunityFeedOption({
    required this.id,
    required this.name,
    required this.enabled,
    required this.index,
  });

  CommunityFeedOption deepCopy() {
    return CommunityFeedOption(
      id: id,
      name: name,
      enabled: enabled,
      index: index,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'enabled': enabled,
      'index': index,
    };
  }

  factory CommunityFeedOption.fromMap(Map<String, dynamic> map) {
    return CommunityFeedOption(
      id: uuid.v4(),
      name: map['name'] as String,
      enabled: map['enabled'] as bool,
      index: map['index'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory CommunityFeedOption.fromJson(String source) =>
      CommunityFeedOption.fromMap(json.decode(source) as Map<String, dynamic>);

  CommunityFeedOption copyWith({
    String? id,
    String? name,
    bool? enabled,
    int? index,
  }) {
    return CommunityFeedOption(
      id: id ?? this.id,
      name: name ?? this.name,
      enabled: enabled ?? this.enabled,
      index: index ?? this.index,
    );
  }
}

class DiscoverCommunityFeed extends BaseFeed {
  CommunityFeedOption network;
  CommunityFeedOption top;
  CommunityFeedOption global;

  DiscoverCommunityFeed({
    required this.network,
    required this.top,
    required this.global,
    required super.index,
  });

  DiscoverCommunityFeed deepCopy() {
    return DiscoverCommunityFeed(
      index: index,
      network: network.deepCopy(),
      top: top.deepCopy(),
      global: global.deepCopy(),
    );
  }

  Map<String, CommunityFeedOption> getMappedContent() {
    List<CommunityFeedOption> options = [network, top, global]
      ..sort((a, b) => a.index.compareTo(b.index));

    return {
      for (final option in options) option.id: option,
    };
  }

  bool isDisabled() {
    return !network.enabled && !top.enabled && !global.enabled;
  }

  Map<String, dynamic> toMap() {
    List<CommunityFeedOption> options = [network, top, global];

    options.sort((a, b) => a.index.compareTo(b.index));

    return <String, dynamic>{
      'index': index,
      'list': options
          .map(
            (e) => [e.name, e.enabled],
          )
          .toList(),
    };
  }

  Map<String, dynamic> toEventMap() {
    List<CommunityFeedOption> options = [top, network, global];

    options.sort((a, b) => a.index.compareTo(b.index));

    return <String, dynamic>{
      'index': index,
      'list': options
          .map(
            (e) => [e.name, e.enabled],
          )
          .toList(),
    };
  }

  factory DiscoverCommunityFeed.fromMap(Map<String, dynamic> map) {
    final list = map['list'] as List?;
    CommunityFeedOption newest = CommunityFeedOption(
      name: SOURCE_TOP,
      enabled: true,
      index: 0,
      id: uuid.v4(),
    );

    CommunityFeedOption top = CommunityFeedOption(
      name: SOURCE_NETWORK,
      enabled: true,
      index: 1,
      id: uuid.v4(),
    );

    CommunityFeedOption global = CommunityFeedOption(
      name: SOURCE_GLOBAL,
      enabled: true,
      index: 2,
      id: uuid.v4(),
    );

    if (list != null && list.isNotEmpty) {
      for (int i = 0; i < list.length; i++) {
        final item = list[i];
        if (item is List && item.length >= 2) {
          if (item.first == SOURCE_NETWORK) {
            newest = CommunityFeedOption(
              name: item.first,
              enabled: item[1] as bool,
              index: i,
              id: uuid.v4(),
            );
          }

          if (item.first == SOURCE_TOP) {
            top = CommunityFeedOption(
              name: item.first,
              enabled: item[1] as bool,
              index: i,
              id: uuid.v4(),
            );
          }

          if (item.first == SOURCE_GLOBAL) {
            global = CommunityFeedOption(
              name: item.first,
              enabled: item[1] as bool,
              index: i,
              id: uuid.v4(),
            );
          }
        }
      }
    }

    return DiscoverCommunityFeed(
      index: map['index'],
      network: newest,
      top: top,
      global: global,
    );
  }

  String toJson() => json.encode(toMap());

  factory DiscoverCommunityFeed.fromJson(String source) =>
      DiscoverCommunityFeed.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  DiscoverCommunityFeed copyWith({
    int? index,
    CommunityFeedOption? network,
    CommunityFeedOption? top,
    CommunityFeedOption? global,
  }) {
    return DiscoverCommunityFeed(
      index: index ?? this.index,
      network: network ?? this.network,
      top: top ?? this.top,
      global: global ?? this.global,
    );
  }
}

class MediaCommunityFeed extends BaseFeed {
  CommunityFeedOption recent;
  CommunityFeedOption global;

  MediaCommunityFeed({
    required this.recent,
    required this.global,
    required super.index,
  });

  MediaCommunityFeed deepCopy() {
    return MediaCommunityFeed(
      index: index,
      recent: recent.deepCopy(),
      global: global.deepCopy(),
    );
  }

  Map<String, CommunityFeedOption> getMappedContent() {
    List<CommunityFeedOption> options = [recent, global]
      ..sort((a, b) => a.index.compareTo(b.index));

    return {
      for (final option in options) option.id: option,
    };
  }

  bool isDisabled() {
    return !recent.enabled && !global.enabled;
  }

  Map<String, dynamic> toMap() {
    List<CommunityFeedOption> options = [recent, global];

    options.sort((a, b) => a.index.compareTo(b.index));

    return <String, dynamic>{
      'index': index,
      'list': options
          .map(
            (e) => [e.name, e.enabled],
          )
          .toList(),
    };
  }

  Map<String, dynamic> toEventMap() {
    List<CommunityFeedOption> options = [recent, global];

    options.sort((a, b) => a.index.compareTo(b.index));

    return <String, dynamic>{
      'index': index,
      'list': options
          .map(
            (e) => [e.name, e.enabled],
          )
          .toList(),
    };
  }

  factory MediaCommunityFeed.fromMap(Map<String, dynamic> map) {
    final list = map['list'] as List?;
    CommunityFeedOption recent = CommunityFeedOption(
      name: SOURCE_RECENT,
      enabled: true,
      index: 0,
      id: uuid.v4(),
    );

    CommunityFeedOption global = CommunityFeedOption(
      name: SOURCE_GLOBAL,
      enabled: true,
      index: 1,
      id: uuid.v4(),
    );

    if (list != null && list.isNotEmpty) {
      for (int i = 0; i < list.length; i++) {
        final item = list[i];
        if (item is List && item.length >= 2) {
          if (item.first == SOURCE_RECENT) {
            recent = CommunityFeedOption(
              name: item.first,
              enabled: item[1] as bool,
              index: i,
              id: uuid.v4(),
            );
          }

          if (item.first == SOURCE_GLOBAL) {
            global = CommunityFeedOption(
              name: item.first,
              enabled: item[1] as bool,
              index: i,
              id: uuid.v4(),
            );
          }
        }
      }
    }

    return MediaCommunityFeed(
      index: map['index'],
      recent: recent,
      global: global,
    );
  }

  String toJson() => json.encode(toMap());

  factory MediaCommunityFeed.fromJson(String source) =>
      MediaCommunityFeed.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  MediaCommunityFeed copyWith({
    int? index,
    CommunityFeedOption? recent,
    CommunityFeedOption? global,
  }) {
    return MediaCommunityFeed(
      index: index ?? this.index,
      recent: recent ?? this.recent,
      global: global ?? this.global,
    );
  }
}

class DvmFeed extends BaseFeed {
  List<DvmModel> dvms;

  DvmFeed({
    required this.dvms,
    required super.index,
  });

  DvmFeed deepCopy() {
    return DvmFeed(
      index: index,
      dvms: List.from(dvms),
    );
  }

  Map<String, DvmModel> getMappedContent() {
    return {
      for (final dvm in dvms) dvm.id: dvm,
    };
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'index': 2,
      'list': dvms.map((dvm) => [dvm.pubkey, dvm.enabled]).toList(),
    };
  }

  Map<String, dynamic> toEventMap() {
    return <String, dynamic>{
      'index': 2,
      'list': dvms.map((dvm) => [dvm.pubkey, dvm.enabled]).toList(),
    };
  }

  bool isDisabled() {
    return dvms.where((element) => element.enabled).isEmpty;
  }

  factory DvmFeed.fromMap(Map<String, dynamic> map, DvmType dvmType) {
    final list = map['list'] as List?;
    List<DvmModel> dvms = [];

    if (list != null && list.isNotEmpty) {
      for (int i = 0; i < list.length; i++) {
        final item = list[i];
        if (item is List && item.length >= 2) {
          final dvm = DvmModel(
            id: uuid.v4(),
            dvmType: dvmType,
            pubkey: item[0],
            enabled: item[1] as bool,
          );

          dvms.add(dvm);
        }
      }
    }

    return DvmFeed(index: 2, dvms: dvms);
  }

  String toJson() => json.encode(toMap());

  DvmFeed copyWith({
    int? index,
    List<DvmModel>? dvms,
  }) {
    return DvmFeed(
      index: index ?? this.index,
      dvms: dvms ?? this.dvms,
    );
  }
}

const defaultDiscoverDvm =
    'df3fd2ad2f13b692f76abf533c0c1275c00c774c5d121c9c46ec74f80f08b224';

const defaultAlgo = 'wss://algo.utxo.one';

const defaultNotesDvm =
    '9e09a914f41db178ba442b7372944b021135c08439516464a9bd436588af0b58';
