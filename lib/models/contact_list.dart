// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:nostr_core_enhanced/db/drift_database.dart';
import 'package:nostr_core_enhanced/nostr/nostr.dart';
import 'package:nostr_core_enhanced/utils/utils.dart';
import 'package:string_validator/string_validator.dart';

class ContactList {
  late String pubkey;

  List<String> contacts = [];
  List<String> contactRelays = [];
  List<String> petnames = [];

  List<String> followedTags = [];
  List<String> followedCommunities = [];
  List<String> followedEvents = [];

  int createdAt = DateTime.now().millisecondsSinceEpoch ~/ 1000;
  int? loadedTimestamp;

  List<String> sources = [];

  ContactList({required this.pubkey, required this.contacts});

  factory ContactList.fromContactListTableData(ContactListTableData data) {
    return ContactList(pubkey: data.pubkey, contacts: data.contacts)
      ..contactRelays = data.contactRelays
      ..createdAt = data.createdAt
      ..loadedTimestamp = data.loadedTimestamp
      ..petnames = data.petnames
      ..followedTags = data.followedTags
      ..followedCommunities = data.followedCommunities
      ..followedEvents = data.followedEvents
      ..sources = data.sources;
  }

  ContactListTableCompanion toCompanion() {
    return ContactListTableCompanion.insert(
      pubkey: pubkey,
      contacts: Value(contacts),
      contactRelays: Value(contactRelays),
      petnames: Value(petnames),
      followedTags: Value(followedTags),
      followedCommunities: Value(followedCommunities),
      followedEvents: Value(followedEvents),
      createdAt: createdAt,
      loadedTimestamp: Value(loadedTimestamp),
      sources: Value(sources),
    );
  }

  factory ContactList.fromEvent(Event event) {
    final pubkey = event.pubkey;
    final createdAt = event.createdAt;
    final loadedTimestamp = DateTime.now().millisecondsSinceEpoch ~/ 1000;

    List<String> contacts = [];
    List<String> contactRelays = [];
    List<String> petnames = [];

    List<String> followedTags = [];
    List<String> followedCommunities = [];
    List<String> followedEvents = [];

    for (var tag in event.tags) {
      final length = tag.length;
      final name = tag[0];
      final contact = tag[1];

      if (name == "p" && isHexadecimal(contact)) {
        String relay = '';
        // String petname = '';
        if (length > 2) {
          relay = tag[2];
          // if (length > 3) {
          //   petname = tag[3];
          // }
        }
        contacts.add(contact);
        final r = Relay.clean(relay);

        if (r != null) {
          contactRelays.add(r);
        }

        // petnames.add(petname);
      } else if (name == "t" && length > 1) {
        var tagName = tag[1];
        followedTags.add(tagName);
      } else if (name == "a" && length > 1) {
        var id = tag[1];
        followedCommunities.add(id);
      } else if (name == "e" && length > 1) {
        var id = tag[1];
        followedEvents.add(id);
      }
    }

    final c = ContactList(pubkey: pubkey, contacts: contacts)
      ..createdAt = createdAt
      ..loadedTimestamp = loadedTimestamp
      ..contactRelays = contactRelays
      ..petnames = petnames
      ..followedTags = followedTags
      ..followedCommunities = followedCommunities
      ..followedEvents = followedEvents;

    return c;
  }

  static Map<String, ReadWriteMarker> relaysFromContent(Event event) {
    Map<String, ReadWriteMarker> map = {};
    if (Helpers.isNotBlank(event.content)) {
      try {
        Map<String, dynamic> json = jsonDecode(event.content);
        if (json.entries.isNotEmpty) {
          for (var entry in json.entries) {
            final r = Relay.clean(entry.key);

            if (r != null) {
              try {
                bool read = entry.value["read"] ?? false;
                bool write = entry.value["write"] ?? false;
                if (read || write) {
                  map[entry.key] =
                      ReadWriteMarker.from(read: read, write: write);
                }
              } catch (e) {
                try {
                  Map<String, dynamic> decodedValue = jsonDecode(entry.value);
                  bool read = decodedValue["read"] ?? false;
                  bool write = decodedValue["write"] ?? false;
                  if (read || write) {
                    map[entry.key] =
                        ReadWriteMarker.from(read: read, write: write);
                  }
                  continue;
                } catch (e) {
                  if (kDebugMode) {
                    print(
                        "Could not parse relay ${entry.key} , entry : ${entry.value}");
                  }
                }
                if (kDebugMode) {
                  print(
                      "Could not parse relay ${entry.key} , content : ${event.content}");
                }
              }
            }
          }
        }
      } catch (e) {
        // invalid json in content, ignore
      }
    }
    return map;
  }

  List<List<String>> contactsToJson() {
    return contacts.map((contact) {
      int idx = contacts.indexOf(contact);
      List<String> list = [
        "p",
        contact,
        contactRelays.length > idx ? contactRelays[idx] : "",
        petnames.length > idx ? petnames[idx] : ""
      ];
      return list;
    }).toList();
  }

  List<List<String>> tagListToJson(final List<String> list, String tag) {
    return list.map((value) {
      List<String> list = [
        tag,
        value,
      ];
      return list;
    }).toList();
  }

  Event toEvent() {
    return Event.partial(
      pubkey: pubkey,
      kind: EventKind.CONTACT_LIST,
      tags: contactsToJson()
        ..addAll(tagListToJson(followedTags, "t"))
        ..addAll(tagListToJson(followedCommunities, "a"))
        ..addAll(tagListToJson(followedEvents, "e")),
      content: "",
      createdAt: createdAt,
    );
  }

  List<List<String>> toAllTags() {
    return contactsToJson()
      ..addAll(tagListToJson(followedTags, "t"))
      ..addAll(tagListToJson(followedCommunities, "a"))
      ..addAll(tagListToJson(followedEvents, "e"));
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ContactList &&
          runtimeType == other.runtimeType &&
          pubkey == other.pubkey;

  @override
  int get hashCode => pubkey.hashCode;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pubkey': pubkey,
      'contacts': contacts,
      'contactRelays': contactRelays,
      'petnames': petnames,
      'followedTags': followedTags,
      'followedCommunities': followedCommunities,
      'followedEvents': followedEvents,
      'createdAt': createdAt,
      'loadedTimestamp': loadedTimestamp,
      'sources': sources,
    };
  }
}
