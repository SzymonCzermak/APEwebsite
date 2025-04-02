import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Container(
        // 🔹 Tło strony (obrazek)
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/Background.png'),
            fit: BoxFit.cover,
          ),
        ),

        // 🔹 Treść przewijalna
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Column(
                      children: [
                        Text(
                          'Witamy w Alvedor!',
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Odkryj miejsce, gdzie edukacja spotyka przygodę.',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white70,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  // i dalej Twoje kafelki
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBox(BuildContext context, String title, String description,
      IconData icon, Color background) {
    return Container(
      margin: EdgeInsets.only(bottom: 24),
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: background.withOpacity(0.9),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 48, color: Colors.black87),
          SizedBox(height: 16),
          Text(
            title,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(description, style: TextStyle(fontSize: 16)),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text("Strona \"$title\" będzie wkrótce dostępna")),
              );
            },
            child: Text('Dowiedz się więcej'),
          )
        ],
      ),
    );
  }
}
