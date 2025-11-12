import 'package:flutter/material.dart';

class DashboardStatsPanel extends StatelessWidget {
  const DashboardStatsPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF181C23),
      appBar: AppBar(
        backgroundColor: const Color(0xFF181C23),
        elevation: 0,
        title: const Text('Overview', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: ListView(
          children: [
            Row(
              children: [
                Expanded(
                  child: _StatCard(
                    title: 'Attendance Rate',
                    value: '95%',
                    subtitle: '+2%',
                    subtitleColor: Colors.greenAccent,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _StatCard(
                    title: 'Avg. Late Arrival',
                    value: '15 min',
                    subtitle: '-5 min',
                    subtitleColor: Colors.redAccent,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _StatCard(
              title: 'Total Absences',
              value: '12',
              subtitle: '-3',
              subtitleColor: Colors.redAccent,
            ),
            const SizedBox(height: 32),
            const Text('Attendance Trends', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF232733),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Attendance Rate Over Time', style: TextStyle(color: Colors.white54)),
                  const SizedBox(height: 8),
                  const Text('95%', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24)),
                  const Text('Last 30 Days +2%', style: TextStyle(color: Colors.greenAccent, fontSize: 14)),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 100,
                    child: CustomPaint(
                      painter: _LineChartPainter(),
                      size: const Size(double.infinity, 100),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Jan', style: TextStyle(color: Colors.white54)),
                      Text('Feb', style: TextStyle(color: Colors.white54)),
                      Text('Mar', style: TextStyle(color: Colors.white54)),
                      Text('Apr', style: TextStyle(color: Colors.white54)),
                      Text('May', style: TextStyle(color: Colors.white54)),
                      Text('Jun', style: TextStyle(color: Colors.white54)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            const Text('Filter Reports', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 12),
            Wrap(
              spacing: 12,
              children: [
                FilterChip(
                  label: const Text('Date Range'),
                  selected: false,
                  onSelected: (_) {},
                  backgroundColor: const Color(0xFF232733),
                  labelStyle: const TextStyle(color: Colors.white),
                ),
                FilterChip(
                  label: const Text('Department'),
                  selected: false,
                  onSelected: (_) {},
                  backgroundColor: const Color(0xFF232733),
                  labelStyle: const TextStyle(color: Colors.white),
                ),
                FilterChip(
                  label: const Text('Employee'),
                  selected: false,
                  onSelected: (_) {},
                  backgroundColor: const Color(0xFF232733),
                  labelStyle: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
      // No bottomNavigationBar here
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final String subtitle;
  final Color subtitleColor;
  const _StatCard({required this.title, required this.value, required this.subtitle, required this.subtitleColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF232733),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(color: Colors.white54, fontSize: 14)),
          const SizedBox(height: 8),
          Text(value, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24)),
          const SizedBox(height: 4),
          Text(subtitle, style: TextStyle(color: subtitleColor, fontSize: 14)),
        ],
      ),
    );
  }
}

class _LineChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blueAccent
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;
    final points = [
      Offset(0, size.height * 0.7),
      Offset(size.width * 0.2, size.height * 0.5),
      Offset(size.width * 0.4, size.height * 0.8),
      Offset(size.width * 0.6, size.height * 0.4),
      Offset(size.width * 0.8, size.height * 0.6),
      Offset(size.width, size.height * 0.5),
    ];
    final path = Path()..moveTo(points[0].dx, points[0].dy);
    for (var i = 1; i < points.length; i++) {
      path.lineTo(points[i].dx, points[i].dy);
    }
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
} 