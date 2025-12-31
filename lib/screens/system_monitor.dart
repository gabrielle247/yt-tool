// ==========================================
// FILE: lib/screens/system_monitor.dart
// ==========================================

import 'package:clue_player/system/system_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SystemMonitor extends StatefulWidget {
  const SystemMonitor({super.key});

  @override
  State<SystemMonitor> createState() => _SystemMonitorState();
}

class _SystemMonitorState extends State<SystemMonitor> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final ScrollController _logScroll = ScrollController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600, // Fixed height bottom sheet
      decoration: const BoxDecoration(
        color: Color(0xFF0D1117),
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        border: Border(top: BorderSide(color: Color(0xFF00AAFF), width: 2)),
      ),
      child: Column(
        children: [
          // HEADER
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: Color(0xFF30363D))),
            ),
            child: Row(
              children: [
                const Icon(Icons.terminal, color: Color(0xFF00AAFF)),
                const SizedBox(width: 12),
                Text("SYSTEM MONITOR", style: GoogleFonts.jetBrainsMono(color: Colors.white, fontWeight: FontWeight.bold)),
                const Spacer(),
                IconButton(icon: const Icon(Icons.close, color: Colors.grey), onPressed: () => Navigator.pop(context)),
              ],
            ),
          ),

          // TABS
          TabBar(
            controller: _tabController,
            indicatorColor: const Color(0xFF00AAFF),
            labelColor: const Color(0xFF00AAFF),
            unselectedLabelColor: Colors.grey,
            tabs: const [
              Tab(text: "TERMINAL"),
              Tab(text: "ACTIVE TASKS"),
            ],
          ),

          // CONTENT
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // TAB 1: LOGS
                StreamBuilder<List<String>>(
                  stream: SystemService().logStream,
                  initialData: const [],
                  builder: (context, snapshot) {
                    final logs = snapshot.data ?? [];
                    // Auto-scroll logic could go here
                    return ListView.builder(
                      controller: _logScroll,
                      padding: const EdgeInsets.all(16),
                      itemCount: logs.length,
                      itemBuilder: (context, index) {
                        // Reverse index to show newest at bottom if preferred, or just standard
                        final log = logs[index];
                        final isError = log.contains("ERR") || log.contains("FAIL");
                        final isSuccess = log.contains("COMPLETE") || log.contains("SUCCESS");
                        
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 4),
                          child: Text(
                            log,
                            style: GoogleFonts.jetBrainsMono(
                              fontSize: 11,
                              color: isError ? Colors.redAccent : (isSuccess ? Colors.greenAccent : Colors.grey[400]),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),

                // TAB 2: TASKS
                StreamBuilder<Map<String, double>>(
                  stream: SystemService().taskStream,
                  initialData: const {},
                  builder: (context, snapshot) {
                    final tasks = snapshot.data ?? {};
                    if (tasks.isEmpty) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.check_circle_outline, size: 48, color: Colors.grey[800]),
                            const SizedBox(height: 16),
                            const Text("All Systems Nominal. No Active Tasks.", style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                      );
                    }
                    return ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: tasks.length,
                      itemBuilder: (context, index) {
                        final key = tasks.keys.elementAt(index);
                        final progress = tasks[key]!;
                        return Container(
                          margin: const EdgeInsets.only(bottom: 12),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: const Color(0xFF161B22),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: const Color(0xFF30363D)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(key, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                                  Text("${(progress * 100).toStringAsFixed(1)}%", style: const TextStyle(color: Color(0xFF00AAFF))),
                                ],
                              ),
                              const SizedBox(height: 8),
                              LinearProgressIndicator(
                                value: progress,
                                backgroundColor: Colors.black,
                                color: const Color(0xFF00AAFF),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}