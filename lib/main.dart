import 'package:flutter/material.dart';

void main() {
  runApp(const RestaurantMenuApp());
}

class RestaurantMenuApp extends StatelessWidget {
  const RestaurantMenuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'restaurant menu',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepOrange,
        ),
        useMaterial3: true,
      ),
      home: const RestaurantMenuScreen(),
    );
  }
}

class RestaurantMenuScreen extends StatelessWidget {
  const RestaurantMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'restaurant menu',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          MenuCard(
            name: 'Classic Burger',
            description: 'Juicy beef patty with fresh vegetables.',
            price: 'RM 18.90',
            icon: Icons.lunch_dining,
            color: Colors.orange,
          ),
          MenuCard(
            name: 'Italian Pizza',
            description: 'Cheesy pizza topped with tomato and basil.',
            price: 'RM 25.90',
            icon: Icons.local_pizza,
            color: Colors.redAccent,
          ),
          MenuCard(
            name: 'Fresh Salad',
            description: 'A healthy mix of fresh greens and vegetables.',
            price: 'RM 12.90',
            icon: Icons.eco,
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}

class MenuCard extends StatelessWidget {
  final String name;
  final String description;
  final String price;
  final IconData icon;
  final Color color;

  const MenuCard({
    super.key,
    required this.name,
    required this.description,
    required this.price,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(
              radius: 32,
              backgroundColor: color.withAlpha(35),
              child: Icon(
                icon,
                size: 36,
                color: color,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    price,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: color,
                    ),
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