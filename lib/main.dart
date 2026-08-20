import 'package:flutter/material.dart';

void main() {
  runApp(const ArecaSmartApp());
}

class ArecaSmartApp extends StatelessWidget {
  const ArecaSmartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ArecaSmart',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.green,
        scaffoldBackgroundColor: const Color(0xFFF6F8F4),
      ),
      home: const DashboardScreen(),
    );
  }
}

// =====================================================
// DASHBOARD SCREEN
// =====================================================

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ArecaSmart 🌴',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome
            const Text(
              'Welcome, Farmer',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 6),

            Text(
              'Your arecanut market at a glance',
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey.shade700,
              ),
            ),

            const SizedBox(height: 24),

            // =====================================================
            // CURRENT PRICE CARD
            // =====================================================

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.green.shade700,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Today's Arecanut Price",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 15,
                    ),
                  ),

                  SizedBox(height: 8),

                  Text(
                    '₹ 52,500 / quintal',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 8),

                  Text(
                    'Market: Shivamogga',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),

                  SizedBox(height: 4),

                  Text(
                    'Latest market price',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // =====================================================
            // QUICK ACCESS
            // =====================================================

            const Text(
              'Quick Access',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            // First row
            Row(
              children: [
                Expanded(
                  child: _featureCard(
                    context: context,
                    icon: Icons.show_chart,
                    title: 'Price Trends',
                    subtitle: 'View market trends',
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: _featureCard(
                    context: context,
                    icon: Icons.receipt_long,
                    title: 'My Sales',
                    subtitle: 'Track transactions',
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // Second row
            Row(
              children: [
                Expanded(
                  child: _featureCard(
                    context: context,
                    icon: Icons.inventory_2_outlined,
                    title: 'My Stock',
                    subtitle: 'Manage harvest',
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: _featureCard(
                    context: context,
                    icon: Icons.account_balance_wallet_outlined,
                    title: 'Profit / Loss',
                    subtitle: 'View earnings',
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // =====================================================
            // PRICE ALERT SECTION
            // =====================================================

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.orange.shade50,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: Colors.orange.shade200,
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.notifications_active_outlined,
                    color: Colors.orange.shade800,
                    size: 30,
                  ),

                  const SizedBox(width: 14),

                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Price Alerts',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 4),

                        Text(
                          'Get notified when the market reaches your target price.',
                          style: TextStyle(
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // =====================================================
  // FEATURE CARD
  // =====================================================

  Widget _featureCard({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),

      onTap: () {
        // Price Trends navigation
        if (title == 'Price Trends') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const MarketPricesScreen(),
            ),
          );
        }
      },

      child: Container(
        padding: const EdgeInsets.all(16),

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              size: 30,
              color: Colors.green.shade700,
            ),

            const SizedBox(height: 14),

            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 4),

            Text(
              subtitle,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// =====================================================
// MARKET PRICES SCREEN
// =====================================================

class MarketPricesScreen extends StatelessWidget {
  const MarketPricesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Market Prices',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Arecanut Market Rates',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 6),

            Text(
              'Compare prices across markets',
              style: TextStyle(
                color: Colors.grey.shade700,
              ),
            ),

            const SizedBox(height: 20),

            // =====================================================
            // BEST PRICE
            // =====================================================

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: Colors.green.shade700,
                borderRadius: BorderRadius.circular(20),
              ),

              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Best Available Price',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),

                  SizedBox(height: 8),

                  Text(
                    '₹ 52,500 / quintal',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 6),

                  Text(
                    'Shivamogga Market',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              'Nearby Markets',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            // Markets
            _marketCard(
              market: 'Shivamogga',
              price: '₹ 52,500',
              change: '+₹ 1,200',
              positive: true,
            ),

            _marketCard(
              market: 'Channagiri',
              price: '₹ 51,300',
              change: '+₹ 650',
              positive: true,
            ),

            _marketCard(
              market: 'Sagar',
              price: '₹ 50,850',
              change: '-₹ 300',
              positive: false,
            ),

            _marketCard(
              market: 'Thirthahalli',
              price: '₹ 50,500',
              change: '+₹ 150',
              positive: true,
            ),

            const SizedBox(height: 20),

            // =====================================================
            // INFORMATION BOX
            // =====================================================

            Container(
              padding: const EdgeInsets.all(16),

              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(16),
              ),

              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.info_outline,
                  ),

                  SizedBox(width: 12),

                  Expanded(
                    child: Text(
                      'Market prices shown here are currently sample values. '
                      'Live market data will be connected later.',
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

  // =====================================================
  // MARKET CARD
  // =====================================================

  Widget _marketCard({
    required String market,
    required String price,
    required String change,
    required bool positive,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),

      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),

      child: Row(
        children: [
          // Market icon
          CircleAvatar(
            backgroundColor: Colors.green.shade50,

            child: Icon(
              Icons.storefront_outlined,
              color: Colors.green.shade700,
            ),
          ),

          const SizedBox(width: 14),

          // Market name
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  market,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  'Arecanut • per quintal',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),

          // Price
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                price,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 4),

              Text(
                change,
                style: TextStyle(
                  color: positive ? Colors.green : Colors.red,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}