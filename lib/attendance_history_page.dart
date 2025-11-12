import 'package:flutter/material.dart';

class AttendanceHistoryPage extends StatefulWidget {
  final String employeeName;
  const AttendanceHistoryPage({Key? key, required this.employeeName}) : super(key: key);

  @override
  State<AttendanceHistoryPage> createState() => _AttendanceHistoryPageState();
}

class _AttendanceHistoryPageState extends State<AttendanceHistoryPage> {
  int _selectedTab = 0;
  final List<String> _tabs = ['Week', 'Month', 'Year'];

  final List<Map<String, dynamic>> _records = [
    {
      'date': '2024-03-01',
      'status': 'Present',
      'time': '09:00 AM - 06:00 PM',
      'image': 'https://assets7.lottiefiles.com/packages/lf20_4kx2q32n.json',
    },
    {
      'date': '2024-03-02',
      'status': 'Present',
      'time': '09:00 AM - 06:00 PM',
      'image': 'https://assets7.lottiefiles.com/packages/lf20_4kx2q32n.json',
    },
    {
      'date': '2024-03-03',
      'status': 'Absent',
      'time': 'No record',
      'image': 'https://assets7.lottiefiles.com/packages/lf20_4kx2q32n.json',
    },
    {
      'date': '2024-03-04',
      'status': 'Present',
      'time': '09:00 AM - 06:00 PM',
      'image': 'https://assets7.lottiefiles.com/packages/lf20_4kx2q32n.json',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF181C23),
      appBar: AppBar(
        backgroundColor: const Color(0xFF181C23),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Attendance History', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.employeeName, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(_tabs.length, (index) {
                final selected = _selectedTab == index;
                return Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: ChoiceChip(
                    label: Text(_tabs[index], style: TextStyle(color: selected ? Colors.black : Colors.white)),
                    selected: selected,
                    selectedColor: Colors.white,
                    backgroundColor: const Color(0xFF232733),
                    onSelected: (_) => setState(() => _selectedTab = index),
                  ),
                );
              }),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView.separated(
                itemCount: _records.length,
                separatorBuilder: (context, index) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final record = _records[index];
                  Color statusColor;
                  switch (record['status']) {
                    case 'Present':
                      statusColor = Colors.greenAccent;
                      break;
                    case 'Absent':
                      statusColor = Colors.redAccent;
                      break;
                    case 'Late':
                      statusColor = Colors.orangeAccent;
                      break;
                    default:
                      statusColor = Colors.grey;
                  }
                  return Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF232733),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16),
                      leading: Container(
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(
                          color: Colors.white10,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(Icons.image, color: Colors.white38, size: 36), // Placeholder for illustration
                      ),
                      title: Text(record['date'], style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(record['status'], style: TextStyle(color: statusColor, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 4),
                          Text(record['time'], style: const TextStyle(color: Colors.white54)),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
} 