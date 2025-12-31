# Batch Tech: Future Distribution Strategy (The "Can")

**Goal:** Create a single, portable executable file for Linux that contains the App, the Video Engine (MPV), and the Downloader (yt-dlp).
**User Experience:** The user downloads one file, double-clicks it, and it works. No terminal, no `apt-get install`.

---

## 1. The Technology: AppImage

We will package the app as an **.AppImage**.

* **Concept:** It's a digital box. Inside the box, we put our own private versions of the system libraries.
* **Benefit:** It runs on Ubuntu, Fedora, Debian, and Arch without changes.

---

## 2. The Code Changes (Required for Bundling)

When the app runs inside an AppImage, it cannot just call `yt-dlp` because the user might not have it installed. We must tell the app to look **inside itself**.

### Update `lib/yt_service.dart`

We need to create a "Tool Locator" function that detects if we are in the "Can" or in "Dev Mode".

```dart
import 'dart:io';

// ... inside YtService class ...

/// DETECTS THE ENVIRONMENT TO FIND THE TOOLS
Future<String> get _toolPath async {
  // 1. Check if we are running inside an AppImage "Can"
  // The AppImage runtime sets this environment variable automatically.
  final appDir = Platform.environment['APPDIR']; 
  
  if (appDir != null) {
    // WE ARE INSIDE THE CAN!
    // The tools will be located at: /usr/bin/ inside the bundle
    final bundledPath = '$appDir/usr/bin/yt-dlp';
    if (await File(bundledPath).exists()) {
      return bundledPath;
    }
  }

  // 2. Dev Mode Fallback
  // If we are coding on our laptop, just use the system version.
  return 'yt-dlp'; 
}

// HOW TO USE IT:
// Old way: Process.run('yt-dlp', args);
// New way: 
//   final tool = await _toolPath;
//   Process.run(tool, args);
