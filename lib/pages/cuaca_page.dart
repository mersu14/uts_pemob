import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class CuacaPage extends StatefulWidget {
  const CuacaPage({super.key});

  @override
  State<CuacaPage> createState() => _CuacaPageState();
}

class _CuacaPageState extends State<CuacaPage> {
  String kota = "Bandung";
  double suhu = 28.5;
  String kondisi = "Cerah Berawan";
  IconData ikon = WeatherIcons.day_cloudy;

  final Map<String, Map<String, dynamic>> dataCuaca = {
    "Bandung": {
      "suhu": 28.5,
      "kondisi": "Cerah Berawan",
      "ikon": WeatherIcons.day_cloudy,
    },
    "Jakarta": {
      "suhu": 32.0,
      "kondisi": "Panas Terik",
      "ikon": WeatherIcons.day_sunny,
    },
    "Yogyakarta": {
      "suhu": 30.2,
      "kondisi": "Berawan",
      "ikon": WeatherIcons.cloud,
    },
    "Surabaya": {
      "suhu": 33.5,
      "kondisi": "Sangat Panas",
      "ikon": WeatherIcons.hot,
    },
    "Bali": {
      "suhu": 31.0,
      "kondisi": "Cerah",
      "ikon": WeatherIcons.day_sunny_overcast,
    },
    "Medan": {
      "suhu": 29.8,
      "kondisi": "Hujan Ringan",
      "ikon": WeatherIcons.rain,
    },
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF87CEEB), // biru langit
              Color(0xFFFFD180), // oranye lembut
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Stack(
          children: [
            // Awan dekoratif di background
            Positioned(
              top: 60,
              left: -40,
              child: Opacity(
                opacity: 0.2,
                child: Image(
                  image: AssetImage('assets/images/cloud1.png'),
                  width: 180,
                ),
              ),
            ),
            Positioned(
              top: 150,
              right: -50,
              child: Opacity(
                opacity: 0.25,
                child: Image(
                  image: AssetImage('assets/images/cloud2.png'),
                  width: 220,
                ),
              ),
            ),

            SafeArea(
              child: SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Cuaca Hari Ini",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Dropdown Pilihan Kota
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: DropdownButtonFormField<String>(
                        value: kota,
                        dropdownColor: Colors.white,
                        icon: const Icon(Icons.arrow_drop_down,
                            color: Colors.white),
                        style: const TextStyle(color: Colors.black),
                        decoration: const InputDecoration(
                          labelText: "Pilih Kota",
                          labelStyle: TextStyle(color: Colors.white),
                          border: InputBorder.none,
                        ),
                        items: dataCuaca.keys.map((String city) {
                          return DropdownMenuItem<String>(
                            value: city,
                            child: Text(city),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            kota = value!;
                            suhu = dataCuaca[value]!["suhu"];
                            kondisi = dataCuaca[value]!["kondisi"];
                            ikon = dataCuaca[value]!["ikon"];
                          });
                        },
                      ),
                    ),

                    const SizedBox(height: 30),

                    // Kartu cuaca utama
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.25),
                        borderRadius: BorderRadius.circular(30),
                        border:
                            Border.all(color: Colors.white.withOpacity(0.3)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Text(
                            kota,
                            style: const TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 10),
                          BoxedIcon(
                            ikon,
                            size: 75,
                            color: Colors.white,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "${suhu.toStringAsFixed(1)}°C",
                            style: const TextStyle(
                              fontSize: 54,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            kondisi,
                            style: const TextStyle(
                              fontSize: 22,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 35),

                    // 3 Info card sejajar
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildInfoCard(
                          WeatherIcons.wind,
                          "Angin",
                          "4.8 m/s",
                        ),
                        _buildInfoCard(
                          WeatherIcons.humidity,
                          "Kelembapan",
                          "73%",
                        ),
                        _buildInfoCard(
                          WeatherIcons.thermometer,
                          "Realfeel",
                          "${(suhu + 2).toStringAsFixed(1)}°C",
                        ),
                      ],
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

  Widget _buildInfoCard(IconData icon, String label, String value) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.25),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white.withOpacity(0.3)),
        ),
        child: Column(
          children: [
            BoxedIcon(icon, color: Colors.white, size: 30),
            const SizedBox(height: 6),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
