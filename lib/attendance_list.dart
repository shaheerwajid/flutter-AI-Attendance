import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AttendanceList extends StatelessWidget {
  const AttendanceList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Attendance Records')),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('attendance').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text("No attendance records found."));
          }

          final docs = snapshot.data!.docs;
          print("Fetched documents: ${docs.length}");

          return ListView(
            children: docs.map((doc) {
              final data = doc.data() as Map<String, dynamic>;
              return ListTile(
                title: Text(data['name'] ?? 'No Name'),
                subtitle: Text(
                  'Day: ${data['day'] ?? 'N/A'}\nIn: ${data['inTime'] ?? 'N/A'}\nOut: ${data['outTime'] ?? 'N/A'}',
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
