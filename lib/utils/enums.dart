enum ReadWriteMarker {
  readOnly,
  writeOnly,
  readWrite;

  static ReadWriteMarker from({required bool read, required bool write}) {
    if (read) {
      if (write) {
        return ReadWriteMarker.readWrite;
      }
      return ReadWriteMarker.readOnly;
    }
    if (write) {
      return ReadWriteMarker.writeOnly;
    }
    throw Exception("illegal read & write false values for this marker");
  }

  bool get isRead =>
      this == ReadWriteMarker.readOnly || this == ReadWriteMarker.readWrite;

  bool get isWrite =>
      this == ReadWriteMarker.writeOnly || this == ReadWriteMarker.readWrite;
}

enum RelayDirection {
  inbox,
  outbox;

  bool matchesMarker(ReadWriteMarker marker) {
    return this == RelayDirection.inbox && marker.isRead ||
        this == RelayDirection.outbox && marker.isWrite;
  }
}

enum DvmType { notesContent, articlesContent }

enum CurationTypes { all, videos, articles }

enum VideoSourceTypes { all, youtube, vimeo, others }
