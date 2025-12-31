// ==========================================
// FILE: lib/data/mock_data.dart
// ==========================================

class MockData {
  static final List<Map<String, dynamic>> videos = [
    {
      "id": "1",
      "title": "Midnight Lo-Fi Radio - Beats to Relax/Study to",
      "channel": "Lofi Productions",
      "views": "24,532 views",
      "desc": "A soothing collection of beats perfect for late night coding sessions or winding down. This video is stored locally on your device for seamless playback without buffering.",
      "duration": "24:00",
      "size": "128 MB",
      "thumbnailUrl": "https://f4.bcbits.com/img/a1962363222_65",
      "category": "CHILLING",
      "status": "READY",
      "daysLeft": 30,
      "videoUrl": "https://user-images.githubusercontent.com/28951144/229373695-22f88f13-d18f-4288-9bf1-c3e078d83722.mp4", // Test Video
    },
    {
      "id": "2",
      "title": "Advanced React Hooks Patterns",
      "channel": "CodeMastery",
      "views": "85K views",
      "desc": "Master useEffect and useMemo with these advanced techniques...",
      "duration": "15:45",
      "size": "45 MB",
      "thumbnailUrl": "https://legacy.reactjs.org/logo-og.png",
      "category": "LEARNING",
      "status": "READY",
      "daysLeft": 28,
      "videoUrl": "https://user-images.githubusercontent.com/28951144/229373720-14d69157-1a56-4a78-a2f4-d7a134d7c3e9.mp4",
    },
    {
      "id": "3",
      "title": "4K Forest Ambience Soundscape",
      "channel": "Nature Sounds",
      "views": "1.2M views",
      "desc": "Immersive nature sounds for deep focus or sleep...",
      "duration": "60:00",
      "size": "500 MB",
      "thumbnailUrl": "https://img.youtube.com/vi/xNN7iTA57jM/maxresdefault.jpg",
      "category": "NATURE",
      "status": "EXPIRED",
      "daysLeft": 0,
      "videoUrl": "",
    },
    {
      "id": "4",
      "title": "Visual Meditation Loop",
      "channel": "Mindful Tech",
      "views": "12K views",
      "desc": "Relax your eyes with these satisfying color gradients...",
      "duration": "05:00",
      "size": "80 MB",
      "thumbnailUrl": "https://i.ytimg.com/vi/iLL2A7gN200/maxresdefault.jpg",
      "category": "CHILLING",
      "status": "READY",
      "daysLeft": 12,
      "videoUrl": "https://user-images.githubusercontent.com/28951144/229373718-5e6089d4-531e-451e-813c-4c0792357d6e.mp4",
    },
    {
      "id": "5",
      "title": "Productivity Systems Explained",
      "channel": "LifeHacker Pro",
      "views": "205K views",
      "desc": "Building a second brain using modern note taking apps...",
      "duration": "32:15",
      "size": "150 MB",
      "thumbnailUrl": "https://img.youtube.com/vi/Yf3_C1f2wKw/maxresdefault.jpg",
      "category": "LEARNING",
      "status": "EXPIRING",
      "daysLeft": 2,
      "videoUrl": "",
    },
    {
      "id": "6",
      "title": "Team Strategy Session Recording",
      "channel": "Internal",
      "views": "Private",
      "desc": "Confidential internal meeting discussing Q4...",
      "duration": "08:20",
      "size": "45 MB",
      "thumbnailUrl": "", // Locked
      "category": "PRIVATE",
      "status": "LOCKED",
      "daysLeft": 0,
      "videoUrl": "",
    },
  ];

  static final Map<String, dynamic> userProfile = {
    "name": "Nyasha Gabriel",
    "initials": "NG",
    "email": "boss@greyway.co",
    "isVerified": true, 
  };
}