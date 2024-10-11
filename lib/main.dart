/*import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart'; // SVG paketini ekliyoruz

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PremiumPage(),
    );
  }
}

class PremiumPage extends StatelessWidget {
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
        title: Text('Premium', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            // Icon yerine SVG resmi kullanıyoruz
            SvgPicture.asset(
              'assets/images/tac_son.svg', // SVG dosyanızın yolunu belirtin
              height: 90, // SVG boyutu
            ),
            SizedBox(height: 10.0),
            Text(
              'PREMIUM',
              style: GoogleFonts.philosopher(
                textStyle: TextStyle(
                  foreground: Paint()
                    ..shader = LinearGradient(
                      colors: [
                        Color(0xFFFFCE50),
                        Color(0xFFF3922C),
                        Color(0xFFFFCE50)
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              'İle Ayrıcalıklısınız',
              style: GoogleFonts.philosopher(
                textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 27,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 40),

            Padding(
              padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.22),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      _buildFeatureRow('assets/images/coins_son.svg', 'Her Gün\n10 Altın'),
                      SizedBox(height: 15),
                      _buildFeatureRow('assets/images/resume_son.svg', 'Hızlı\nFal Yorumu'),
                    ],
                  ),
                  SizedBox(width: 10.0,),
                  Column(
                    children: [
                      _buildFeatureRow('assets/images/false_son.svg', 'Reklamsız\nDeneyim'),
                      SizedBox(height: 15),
                      _buildFeatureRow('assets/images/lock_son.svg', 'Tüm\nÖzellikler'),
                    ],
                  ),
                ],
              ),
            ),

            //Spacer(),

            SizedBox(height: 40.0),
            _buildPriceOptions(),
            SizedBox(height: 10.0,),
            Text(
              '7 Gün ücretsiz deneme ile',
              style: GoogleFonts.philosopher(
                textStyle: TextStyle(
                    color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(height: 10.0),
            GestureDetector(
              onTap: () {
                // Premium başlatma işlemi
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30), // Kenarları yuvarlatma
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFFF8C6A),  // Daha açık kırmızı ton (parlak)
                      Color(0xFFE9442D).withOpacity(0.5),  // Orta ton (şeffaflık artırıldı)
                      Color(0xFF8B0000),  // Koyu kırmızı ton (daha parlak bir geçiş)
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Center(
                  child: Text(
                    'Yıllık Premium Başlat',
                    style: GoogleFonts.philosopher(
                      textStyle: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),


            SizedBox(height: 10),
            Text(
              'İstediğin zaman iptal edebilirsin.',
              style: TextStyle(color: Colors.white70, fontSize: 12),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureRow(String asset, String text) {
    return Column(
      children: [
        SvgPicture.asset(
          asset, // SVG dosyanızın yolunu belirtin
          height: 50, // SVG boyutu
        ),
        SizedBox(height: 10.0,),
        Text(
          text,
          style: GoogleFonts.philosopher(
            textStyle: TextStyle(
                color: Colors.white, fontSize: 19, fontWeight: FontWeight.w400),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildPriceOptions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildPriceCard('Yıllık', '₺299.00', '₺199.99'),
        _buildPriceCard('Aylık', '₺299.00', '₺199.99'),
        _buildPriceCard('Haftalık', '₺299.00', '₺199.99'),
      ],
    );
  }

  Widget _buildPriceCard(String period, String originalPrice, String discountedPrice) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20), // Kenarları yuvarlatma
        gradient: LinearGradient(
          colors: [
            Color(0xFFFF8C6A),  // Daha açık kırmızı ton (parlak)
            Color(0xFFE9442D).withOpacity(0.5),  // Orta ton (şeffaflık artırıldı)
            Color(0xFF8B0000),  // Koyu kırmızı ton (daha parlak bir geçiş)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            period,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          SizedBox(height: 5),
          Text(
            originalPrice,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              decoration: TextDecoration.lineThrough,
            ),
          ),
          Text(
            discountedPrice,
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


}*/
