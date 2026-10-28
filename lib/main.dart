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
      title: 'Restaurant Menu',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.pink,
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
      backgroundColor: const Color(0xFFFFF7F9),
      appBar: AppBar(
        title: const Text(
          'Restaurant Menu',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
        elevation: 2,
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isSmallScreen = constraints.maxWidth < 360;

            return ListView(
              padding: EdgeInsets.all(
                isSmallScreen ? 12 : 16,
              ),
              children: [
                const Text(
                  'Our Delicious Menu',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Choose your favourite meal',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(height: 20),

                MenuCard(
                  name: 'Classic Burger',
                  description:
                      'Juicy beef patty with fresh vegetables.',
                  price: 'RM 18.90',
                  icon: Icons.lunch_dining,
                  color: Colors.orange,
                  compact: isSmallScreen,
                ),
                MenuCard(
                  name: 'Italian Pizza',
                  description:
                      'Cheesy pizza topped with tomato and basil.',
                  price: 'RM 25.90',
                  icon: Icons.local_pizza,
                  color: Colors.redAccent,
                  compact: isSmallScreen,
                ),
                MenuCard(
                  name: 'Fresh Salad',
                  description:
                      'A healthy mix of fresh greens and vegetables.',
                  price: 'RM 12.90',
                  icon: Icons.eco,
                  color: Colors.green,
                  compact: isSmallScreen,
                ),
              ],
            );
          },
        ),
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
  final bool compact;

  const MenuCard({
    super.key,
    required this.name,
    required this.description,
    required this.price,
    required this.icon,
    required this.color,
    this.compact = false,
  });

  @override
  Widget build(BuildContext context) {
    final iconRadius = compact ? 24.0 : 30.0;
    final iconSize = compact ? 28.0 : 34.0;

    return Card(
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 14),
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: EdgeInsets.all(compact ? 12 : 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: iconRadius,
              backgroundColor: color.withAlpha(35),
              child: Icon(
                icon,
                size: iconSize,
                color: color,
              ),
            ),
            SizedBox(width: compact ? 10 : 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: compact ? 16 : 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: compact ? 12 : 13,
                      color: Colors.grey.shade700,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    price,
                    style: TextStyle(
                      fontSize: compact ? 15 : 16,
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