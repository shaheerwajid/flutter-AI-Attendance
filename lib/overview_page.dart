import 'package:flutter/material.dart';
import 'attendance_history_page.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final users = [
      {'name': 'Ethan Carter', 'status': 'Present', 'avatar': 'https://randomuser.me/api/portraits/men/1.jpg'},
      {'name': 'Sophia Bennett', 'status': 'Absent', 'avatar': 'https://randomuser.me/api/portraits/women/2.jpg'},
      {'name': 'Liam Harper', 'status': 'Late', 'avatar': 'https://randomuser.me/api/portraits/men/3.jpg'},
      {'name': 'Olivia Foster', 'status': 'Present', 'avatar': 'https://randomuser.me/api/portraits/women/4.jpg'},
      {'name': 'Noah Parker', 'status': 'Absent', 'avatar': 'https://randomuser.me/api/portraits/men/5.jpg'},
      {'name': 'Ava Mitchell', 'status': 'Late', 'avatar': 'https://randomuser.me/api/portraits/women/6.jpg'},
      {'name': 'Jackson Reed', 'status': 'Present', 'avatar': 'https://randomuser.me/api/portraits/men/7.jpg'},
      {'name': 'Isabella Hayes', 'status': 'Absent', 'avatar': 'https://randomuser.me/api/portraits/women/8.jpg'},
      {'name': 'Aiden Coleman', 'status': 'Late', 'avatar': 'https://randomuser.me/api/portraits/men/9.jpg'},
      {'name': 'Mia Brooks', 'status': 'Present', 'avatar': 'https://randomuser.me/api/portraits/women/10.jpg'},
    ];
    return Scaffold(
      backgroundColor: const Color(0xFF181C23),
      appBar: AppBar(
        backgroundColor: const Color(0xFF181C23),
        elevation: 0,
        title: const Text('Overview', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {},
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: const TextStyle(color: Colors.white54),
                prefixIcon: const Icon(Icons.search, color: Colors.white54),
                filled: true,
                fillColor: const Color(0xFF232733),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: users.length,
              separatorBuilder: (context, index) => const Divider(color: Color(0xFF232733), height: 1),
              itemBuilder: (context, index) {
                final user = users[index];
                Color statusColor;
                switch (user['status']) {
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
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(user['avatar']!),
                    radius: 26,
                  ),
                  title: Text(user['name']!, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
                  subtitle: Text(user['status']!, style: TextStyle(color: statusColor, fontWeight: FontWeight.bold)),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => AttendanceHistoryPage(employeeName: user['name']!),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
} 