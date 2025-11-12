import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  void _navigateTo(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => page),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF232733),
        title: const Text('Logout', style: TextStyle(color: Colors.white)),
        content: const Text('Are you sure you want to logout?', style: TextStyle(color: Colors.white70)),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel', style: TextStyle(color: Colors.white54)),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              // Add your logout logic here
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Logged out!')),
              );
            },
            child: const Text('Logout', style: TextStyle(color: Colors.redAccent)),
          ),
        ],
      ),
    );
  }

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
        title: const Text('Settings', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          const Text('Account', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
          const SizedBox(height: 12),
          ListTile(
            leading: const Icon(Icons.person_outline, color: Colors.white),
            title: const Text('Personal Details', style: TextStyle(color: Colors.white)),
            subtitle: const Text('Edit your name and contact information', style: TextStyle(color: Colors.white54)),
            onTap: () => _navigateTo(context, const PersonalDetailsPage()),
          ),
          const SizedBox(height: 24),
          const Text('Preferences', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
          const SizedBox(height: 12),
          ListTile(
            leading: const Icon(Icons.notifications_none, color: Colors.white),
            title: const Text('Notifications', style: TextStyle(color: Colors.white)),
            subtitle: const Text('Enable or disable specific types of notifications', style: TextStyle(color: Colors.white54)),
            onTap: () => _navigateTo(context, const NotificationsPage()),
          ),
          ListTile(
            leading: const Icon(Icons.brightness_6, color: Colors.white),
            title: const Text('Display Options', style: TextStyle(color: Colors.white)),
            subtitle: const Text('Customize the app\'s appearance with themes', style: TextStyle(color: Colors.white54)),
            onTap: () => _navigateTo(context, const DisplayOptionsPage()),
          ),
          const SizedBox(height: 24),
          const Text('Support', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
          const SizedBox(height: 12),
          ListTile(
            leading: const Icon(Icons.help_outline, color: Colors.white),
            title: const Text('FAQs', style: TextStyle(color: Colors.white)),
            subtitle: const Text('Find answers to common questions', style: TextStyle(color: Colors.white54)),
            onTap: () => _navigateTo(context, const FAQsPage()),
          ),
          ListTile(
            leading: const Icon(Icons.description_outlined, color: Colors.white),
            title: const Text('Terms of Service', style: TextStyle(color: Colors.white)),
            subtitle: const Text('Read our terms of service', style: TextStyle(color: Colors.white54)),
            onTap: () => _navigateTo(context, const TermsOfServicePage()),
          ),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF232733),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () => _showLogoutDialog(context),
              child: const Text('Logout', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}

class PersonalDetailsPage extends StatelessWidget {
  const PersonalDetailsPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF181C23),
      appBar: AppBar(
        backgroundColor: const Color(0xFF181C23),
        elevation: 0,
        title: const Text('Personal Details', style: TextStyle(color: Colors.white)),
      ),
      body: const Center(
        child: Text('Personal Details Page', style: TextStyle(color: Colors.white70)),
      ),
    );
  }
}

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF181C23),
      appBar: AppBar(
        backgroundColor: const Color(0xFF181C23),
        elevation: 0,
        title: const Text('Notifications', style: TextStyle(color: Colors.white)),
      ),
      body: const Center(
        child: Text('Notifications Page', style: TextStyle(color: Colors.white70)),
      ),
    );
  }
}

class DisplayOptionsPage extends StatelessWidget {
  const DisplayOptionsPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF181C23),
      appBar: AppBar(
        backgroundColor: const Color(0xFF181C23),
        elevation: 0,
        title: const Text('Display Options', style: TextStyle(color: Colors.white)),
      ),
      body: const Center(
        child: Text('Display Options Page', style: TextStyle(color: Colors.white70)),
      ),
    );
  }
}

class FAQsPage extends StatelessWidget {
  const FAQsPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF181C23),
      appBar: AppBar(
        backgroundColor: const Color(0xFF181C23),
        elevation: 0,
        title: const Text('FAQs', style: TextStyle(color: Colors.white)),
      ),
      body: const Center(
        child: Text('FAQs Page', style: TextStyle(color: Colors.white70)),
      ),
    );
  }
}

class TermsOfServicePage extends StatelessWidget {
  const TermsOfServicePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF181C23),
      appBar: AppBar(
        backgroundColor: const Color(0xFF181C23),
        elevation: 0,
        title: const Text('Terms of Service', style: TextStyle(color: Colors.white)),
      ),
      body: const Center(
        child: Text('Terms of Service Page', style: TextStyle(color: Colors.white70)),
      ),
    );
  }
} 