import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MarketPage(),
    );
  }
}

class MarketPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            // Geri gitme işlemi
          },
        ),
        title: Text('Market', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            // Üst Bilgilendirme
            const Text(
              'İşlem için yeterli altınınız bulunamadı.',
              style: TextStyle(color: Colors.red, fontSize: 16),
            ),
            SizedBox(height: 20),

            // Altın Paketleri Başlık
            const Text(
              'Altın Paketleri',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),

            // Altın Paketleri 2x2 Grid
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0), // Sol ve sağdanboşluklar
              child: GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                crossAxisSpacing: 14,
                mainAxisSpacing: 20,
                childAspectRatio: 1.6,
                children: [
                  _buildPriceCard('10 Altın', '₺199.99'),
                  _buildPriceCard('25 Altın', '₺199.99'),
                  _buildPriceCard('50 Altın', '₺199.99'),
                  _buildPriceCard('100 Altın', '₺199.99'),
                ],
              ),
            ),
            SizedBox(height: 30),

            // "Veya" Yazısı
            Text(
              'Veya',
              style: GoogleFonts.philosopher(
                textStyle: const TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(height: 30),

            // Premium Bölümü
            SvgPicture.asset(
              'assets/images/tac_son.svg',
              height: 90,
            ),
            SizedBox(height: 10),
            Text(
              'PREMIUM',
              style: GoogleFonts.philosopher(
                textStyle: TextStyle(
                  foreground: Paint()
                    ..shader = const LinearGradient(
                      colors: [
                        Color(0xFFFFCE50),
                        Color(0xFFF3922C),
                        Color(0xFFFFCE50)
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10),
            const Text(
              'Premium ile öncelikli olduğunu hisset.\nReklam İzleme.\nBekleme.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),

            // Premium Butonu
            GestureDetector(
              onTap: () {
                // Premium başlatma işlemi
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 80),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFFF8C6A),
                      Color(0xFFE9442D).withOpacity(0.5),
                      Color(0xFF8B0000),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Center(
                  child: Text(
                    'Premiumu Keşfet',
                    style: GoogleFonts.philosopher(
                      textStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Altın Paketleri Kartı
  Widget _buildPriceCard(String altin, String price) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [
            Color(0xFFD76D5E),
            Color(0xFFE9442D).withOpacity(0.3),
            Color(0xFF000000),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/images/coins_son.svg',
            height: 50,
          ),
          Text(
            altin,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            price,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
