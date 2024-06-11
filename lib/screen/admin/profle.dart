import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.deepPurple,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Profile Picture
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 2, color: Colors.white),
                image: DecorationImage(
                  image: AssetImage('../asset/images/profile_picture.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 16),

            // Profile Information
            Text(
              'Mas Koko',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple),
            ),
            Text(
              'as.koko@example.com',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            Text(
              '081234567890',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            SizedBox(height: 16),

            // Profile Menu
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.edit, color: Colors.deepPurple),
                      title: Text('Edit Profile',
                          style: TextStyle(
                              fontSize: 18, color: Colors.deepPurple)),
                      onTap: () {
                        // Navigate to edit profile page
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.password, color: Colors.deepPurple),
                      title: Text('Change Password',
                          style: TextStyle(
                              fontSize: 18, color: Colors.deepPurple)),
                      onTap: () {
                        // Navigate to change password page
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.logout, color: Colors.deepPurple),
                      title: Text('Logout',
                          style: TextStyle(
                              fontSize: 18, color: Colors.deepPurple)),
                      onTap: () {
                        // Logout logic here
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
