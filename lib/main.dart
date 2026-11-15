import 'package:flutter/material.dart';

void main() {
  runApp(const SchoolManagerApp());
}

class SchoolManagerApp extends StatelessWidget {
  const SchoolManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'School Manager',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;
  final List<String> students = ['Ahmad - Class 5', 'Fatima - Class 6', 'Ali - Class 5', 'Ayesha - Class 7'];
  final List<String> teachers = ['Sir Bilal - Maths', 'Miss Sara - English', 'Sir Usman - Science'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('School Manager'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: _index == 0 ? _buildHome() : _index == 1 ? _buildStudents() : _buildTeachers(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Students'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Teachers'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('New Student Added!')),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildHome() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _card('Total Students', '120', Icons.people, Colors.blue),
          _card('Total Teachers', '12', Icons.school, Colors.green),
          _card('Today Attendance', '95%', Icons.check_circle, Colors.orange),
          _card('Fees Collected', 'Rs. 45,000', Icons.money, Colors.purple),
          const SizedBox(height: 16),
          const Text('Welcome to School Manager!', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
          const Text('Students, Teachers, Attendance aur Fees sab yahan se manage karein.', textAlign: TextAlign.center),
        ],
      ),
    );
  }

  Widget _card(String title, String value, IconData icon, Color color) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(backgroundColor: color, child: Icon(icon, color: Colors.white)),
        title: Text(title),
        trailing: Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _buildStudents() {
    return ListView.builder(
      itemCount: students.length,
      itemBuilder: (context, i) => Card(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: ListTile(
          leading: const CircleAvatar(child: Icon(Icons.person)),
          title: Text(students[i]),
          trailing: const Icon(Icons.check_circle, color: Colors.green),
        ),
      ),
    );
  }

  Widget _buildTeachers() {
    return ListView.builder(
      itemCount: teachers.length,
      itemBuilder: (context, i) => Card(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: ListTile(
          leading: const CircleAvatar(child: Icon(Icons.school)),
          title: Text(teachers[i]),
          trailing: const Icon(Icons.phone, color: Colors.blue),
        ),
      ),
    );
  }
}
