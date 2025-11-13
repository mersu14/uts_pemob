import 'package:flutter/material.dart';

class BeritaPage extends StatelessWidget {
  const BeritaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> beritaList = [
      {
        "judul": "Satelit Baru Indonesia Diluncurkan",
        "deskripsi":
            "Satelit Nusantara Lima (N5) berhasil diluncurkan dan akan meningkatkan konektivitas internet di seluruh pelosok Nusantara.",
        "tanggal": "9 Nov 2025",
        "gambar": "assets/images/satelite.jpeg",
      },
      {
        "judul":
            "Indonesia dan Australia Tegaskan Kemitraan Bilateral Mulai Babak Baru",
        "deskripsi":
            "Presiden Prabowo Subianto menyampaikan kunjungan negara ke Australia sebagai tonggak penguatan kemitraan strategis di kawasan Indo-Pasifik.",
        "tanggal": "12 Nov 2025",
        "gambar": "assets/images/indoaus.jpeg",
      },
      {
        "judul":
            "Keputusan Kontroversial: Suharto Dinobatkan Pahlawan Nasional",
        "deskripsi":
            "Pemerintah memberi gelar Pahlawan Nasional kepada mantan Presiden Suharto, memicu protes dari aktivis HAM dan civitas akademika terkait warisan rezimnya yang kontroversial.",
        "tanggal": "10 Nov 2025",
        "gambar": "assets/images/soeharto.jpeg",
      },
      {
        "judul":
            "Garuda Spark Innovation Hub Diluncurkan untuk 2 Juta Wirausahawan Teknologi",
        "deskripsi":
            "Kementerian Komunikasi dan Digital meluncurkan Garuda Spark Innovation Hub sebagai bagian dari upaya mencetak 2 juta entrepreneur teknologi hingga akhir 2025.",
        "tanggal": "22 Okt 2025",
        "gambar": "assets/images/garudaspark.jpg",
      },
      {
        "judul":
            "Indonesia Setujui Pembelian 42 Jet Tempur China, Strategi Alutsista Berubah",
        "deskripsi":
            "Indonesia mengumumkan rencana pembelian 42 jet tempur tipe J-10C dari China senilai lebih dari US\$9 miliar — menandai pertama kalinya Tanah Air membuat pembelian besar dari pemasok non-Barat.",
        "tanggal": "15 Okt 2025",
        "gambar": "assets/images/rafale.jpeg",
      },
      {
        "judul":
            "Indonesia Gantung Registrasi TikTok Karena Gagal Serahkan Data",
        "deskripsi":
            "Pemerintah Indonesia menangguhkan pendaftaran TikTok sebagai penyedia sistem elektronik karena perusahaan gagal menyerahkan data terkait monetisasi dan aktivitas platform.",
        "tanggal": "3 Okt 2025",
        "gambar": "assets/images/tikttok.jpg",
      },
      {
        "judul": "Jakarta Masuk 20 Besar Dunia Biaya Konstruksi Data Centre",
        "deskripsi":
            "Jakarta menduduki peringkat ke-20 global dari segi biaya pembangunan data centre, sekitar US\$11,20 per watt — lebih rendah dibanding negara tetangga seperti Singapura.",
        "tanggal": "9 Nov 2025",
        "gambar": "assets/images/jakarta.jpeg",
      },
    ];

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFB3E5FC), // biru muda lembut
              Color(0xFF81D4FA), // biru langit
              Color(0xFFE1BEE7), // ungu lembut
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Judul halaman
                Row(
                  children: const [
                    Icon(Icons.article_rounded, color: Colors.white, size: 32),
                    SizedBox(width: 10),
                    Text(
                      "Berita Terkini",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // List berita
                Expanded(
                  child: ListView.builder(
                    itemCount: beritaList.length,
                    itemBuilder: (context, index) {
                      final berita = beritaList[index];
                      return _buildNewsCard(
                        berita['gambar']!,
                        berita['judul']!,
                        berita['deskripsi']!,
                        berita['tanggal']!,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNewsCard(
    String imagePath,
    String title,
    String description,
    String date,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.95),
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.blueGrey.withOpacity(0.25),
            blurRadius: 10,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar berita
            Image.asset(
              imagePath,
              width: double.infinity,
              height: 190,
              fit: BoxFit.cover,
            ),

            // Isi berita
            Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18.5,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    description,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Icon(
                        Icons.calendar_month,
                        size: 16,
                        color: Color(0xFF64B5F6),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        date,
                        style: const TextStyle(
                          color: Color(0xFF64B5F6),
                          fontSize: 13.5,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
