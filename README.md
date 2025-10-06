# Nostr Core Enhanced

[![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)](https://flutter.dev/)
[![Nostr](https://img.shields.io/badge/Nostr-8A2BE2?style=for-the-badge&logo=nostr&logoColor=white)](https://nostr.com/)

A comprehensive Flutter implementation of the Nostr protocol, providing core functionality for building decentralized social networking applications.

## Features

- **Event Management**: Handle Nostr events with support for various event kinds
- **Database Integration**: Built-in SQLite database with Drift for efficient data storage
- **NIP Support**: Implementation of various Nostr Improvement Proposals (NIPs)
- **Cache Management**: Efficient caching system for improved performance
- **Key Management**: Secure handling of public/private key pairs
- **Contact Management**: Manage contact lists and social graphs
- **Zap Support**: Lightning Network integration for value-for-value content

## Getting Started

### Prerequisites

- Flutter SDK (>=3.0.0)
- Dart SDK (>=2.19.0 <4.0.0)

### Installation

1. Add the package to your `pubspec.yaml`:

```yaml
dependencies:
  nostr_core_enhanced:
    git:
      url: https://github.com/yourusername/nostr_core_enhanced.git
      ref: main
```

2. Run `flutter pub get`

## Usage

### Basic Setup

```dart
import 'package:nostr_core_enhanced/nostr_core_enhanced.dart';

void main() async {
  // Initialize Nostr core
  final nostrCore = NostrCore();
  await nostrCore.initialize();
  
  // Your Nostr application logic here
}
```

### Working with Events

```dart
// Create a new event
final event = Event(
  kind: 1,  // Text note
  content: 'Hello, Nostr!',
  tags: [],
  createdAt: DateTime.now().millisecondsSinceEpoch ~/ 1000,
);

// Sign the event with a private key
event.sign(privateKey);

// Publish the event
await nostrCore.publishEvent(event);
```

## Project Structure

- `/lib/core` - Core Nostr protocol implementation
- `/lib/db` - Database models and migrations
- `/lib/models` - Data models
- `/lib/nostr` - Nostr protocol specific implementations
  - `/nips` - NIP (Nostr Improvement Proposals) implementations
  - `/zaps` - Lightning Network zaps implementation
- `/lib/cache` - Caching mechanisms
- `/lib/services` - External service integrations
- `/lib/utils` - Utility functions and helpers

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- The Nostr community for their amazing protocol
- All contributors who helped with development
- The Flutter team for their excellent framework

## Support

For support, please open an issue in the GitHub repository.
