import 'package:flutter/material.dart';

class KontakPage extends StatelessWidget {
  const KontakPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> contacts = [
      {
        'name': 'Luffy',
        'phone': '0812-3456-7850',
        'image': 'assets/images/pp1.jpg',
      },
      {
        'name': 'Sari',
        'phone': '0812-3456-7860',
        'image': 'assets/images/pp2.png',
      },
      {
        'name': 'Dewi',
        'phone': '0812-3456-7870',
        'image': 'assets/images/pp3.jpeg',
      },
      {
        'name': 'Senja',
        'phone': '0812-3456-7880',
        'image': 'assets/images/pp4.jpg',
      },
      {
        'name': 'Eko',
        'phone': '0812-3456-7889',
        'image': 'assets/images/pp5.png',
      },
      {
        'name': 'Fajar',
        'phone': '0812-3456-7890',
        'image': 'assets/images/pp6.jpg',
      },
      {
        'name': 'Dodo',
        'phone': '0812-3456-7891',
        'image': 'assets/images/pp7.jpeg',
      },
      {
        'name': 'Ujang',
        'phone': '0812-3456-7892',
        'image': 'assets/images/pp8.jpeg',
      },
      {
        'name': 'Joko',
        'phone': '0812-3456-7893',
        'image': 'assets/images/user.png',
      },
      {
        'name': 'Gilang',
        'phone': '0812-3456-7894',
        'image': 'assets/images/user.png',
      },
      {
        'name': 'Fikri',
        'phone': '0812-3456-7895',
        'image': 'assets/images/user.png',
      },
      {
        'name': 'Lukman',
        'phone': '0812-3456-7896',
        'image': 'assets/images/user.png',
      },
      {
        'name': 'Risu',
        'phone': '0812-3456-7897',
        'image': 'assets/images/user.png',
      },
      {
        'name': 'Kobo',
        'phone': '0812-3456-7898',
        'image': 'assets/images/user.png',
      },
      {
        'name': 'Zeta',
        'phone': '0812-3456-7899',
        'image': 'assets/images/user.png',
      },
    ];

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFe0f7fa), Color(0xFF80deea)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final contact = contacts[index];
          return Card(
            elevation: 6,
            margin: const EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: ListTile(
              leading: CircleAvatar(
                radius: 28,
                backgroundImage: AssetImage(contact['image']!),
              ),
              title: Text(
                contact['name']!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              subtitle: Text(contact['phone']!),
              trailing: Wrap(
                spacing: 12,
                children: const [
                  Icon(Icons.call, color: Colors.teal),
                  Icon(Icons.message, color: Colors.teal),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
//     final List<Map<String, String>> contacts = List.generate(
//       15,
//       (i) => {
//         'name': 'Teman ${i + 1}',
//         'phone': '08123${10000 + i}',
//       },
//     );

//     return ListView.builder(
//       padding: const EdgeInsets.all(8),
//       itemCount: contacts.length,
//       itemBuilder: (context, index) {
//         final c = contacts[index];
//         return Card(
//           child: ListTile(
//             leading: CircleAvatar(
//               backgroundColor: Colors.indigo.shade200,
//               child: Text(c['name']![0]),
//             ),
//             title: Text(c['name']!),
//             subtitle: Text(c['phone']!),
//           ),
//         );
//       },
//     );
//   }
// }
