import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class BiodataPage extends StatefulWidget {
  const BiodataPage({super.key});

  @override
  State<BiodataPage> createState() => _BiodataPageState();
}

class _BiodataPageState extends State<BiodataPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  String? _gender;
  String? _nationality;
  DateTime? _selectedDate;
  File? _image;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final picked = await _picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() => _image = File(picked.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFe0f7fa), Color(0xFF80deea)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Card(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      radius: 65,
                      backgroundImage: _image != null
                          ? FileImage(_image!)
                          : const AssetImage('assets/images/fotoprofile.png')
                                as ImageProvider,
                    ),
                    Positioned(
                      bottom: 4,
                      right: 4,
                      child: InkWell(
                        onTap: _pickImage,
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: const BoxDecoration(
                            color: Colors.teal,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Text(
                  'Form Biodata',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
                const SizedBox(height: 20),

                // Nama Lengkap
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Nama Lengkap',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),

                // Email
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),

                // Dropdown Kewarganegaraan
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'Kewarganegaraan',
                    prefixIcon: Icon(Icons.flag),
                    border: OutlineInputBorder(),
                  ),
                  items: const [
                    DropdownMenuItem(
                      value: 'Indonesia',
                      child: Text('Indonesia'),
                    ),
                    DropdownMenuItem(
                      value: 'Malaysia',
                      child: Text('Malaysia'),
                    ),
                    DropdownMenuItem(
                      value: 'Singapura',
                      child: Text('Singapura'),
                    ),
                    DropdownMenuItem(
                      value: 'Thailand',
                      child: Text('Thailand'),
                    ),
                    DropdownMenuItem(value: 'Vietnam', child: Text('Vietnam')),
                    DropdownMenuItem(
                      value: 'Filipina',
                      child: Text('Filipina'),
                    ),
                    DropdownMenuItem(value: 'Laos', child: Text('Laos')),
                    DropdownMenuItem(value: 'Kamboja', child: Text('Kamboja')),
                    DropdownMenuItem(
                      value: 'Brunei Darussalam',
                      child: Text('Brunei Darussalam'),
                    ),
                    DropdownMenuItem(value: 'Myanmar', child: Text('Myanmar')),
                  ],
                  onChanged: (value) => setState(() => _nationality = value),
                ),
                const SizedBox(height: 16),

                // Jenis Kelamin
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Jenis Kelamin:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Radio<String>(
                              value: 'Laki-laki',
                              groupValue: _gender,
                              activeColor: Colors.teal,
                              onChanged: (value) =>
                                  setState(() => _gender = value),
                            ),
                            const Text('Laki-laki'),
                          ],
                        ),
                        const SizedBox(width: 30), // atur jarak antar opsi
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Radio<String>(
                              value: 'Perempuan',
                              groupValue: _gender,
                              activeColor: Colors.teal,
                              onChanged: (value) =>
                                  setState(() => _gender = value),
                            ),
                            const Text('Perempuan'),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Tanggal Lahir
                Row(
                  children: [
                    const Icon(Icons.calendar_month, color: Colors.teal),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        _selectedDate == null
                            ? 'Tanggal lahir belum dipilih'
                            : 'Tanggal lahir: ${_selectedDate!.day}-${_selectedDate!.month}-${_selectedDate!.year}',
                      ),
                    ),
                    ElevatedButton.icon(
                      icon: const Icon(Icons.date_range),
                      label: const Text('Pilih'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                      ),
                      onPressed: () async {
                        final date = await showDatePicker(
                          context: context,
                          firstDate: DateTime(1970),
                          lastDate: DateTime(2100),
                          initialDate: DateTime.now(),
                        );
                        if (date != null) {
                          setState(() => _selectedDate = date);
                        }
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Tombol Simpan
                ElevatedButton.icon(
                  icon: const Icon(Icons.save),
                  label: const Text('Simpan'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 14,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Tersimpan (simulasi)')),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
