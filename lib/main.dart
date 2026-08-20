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
// DASHBOARD
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

            // CURRENT PRICE
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

            // QUICK ACCESS
            const Text(
              'Quick Access',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

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

            // PRICE ALERT
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

  Widget _featureCard({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),

      onTap: () {
        if (title == 'Price Trends') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const MarketPricesScreen(),
            ),
          );
        }

        if (title == 'My Sales') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SalesScreen(),
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

            Container(
              padding: const EdgeInsets.all(16),

              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(16),
              ),

              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.info_outline),

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
          CircleAvatar(
            backgroundColor: Colors.green.shade50,

            child: Icon(
              Icons.storefront_outlined,
              color: Colors.green.shade700,
            ),
          ),

          const SizedBox(width: 14),

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

// =====================================================
// SALES MODEL
// =====================================================

class Sale {
  final DateTime date;
  final double quantity;
  final double pricePerQuintal;
  final String buyer;

  Sale({
    required this.date,
    required this.quantity,
    required this.pricePerQuintal,
    required this.buyer,
  });

  double get totalAmount {
    return quantity * pricePerQuintal;
  }
}

// =====================================================
// SALES SCREEN
// =====================================================

class SalesScreen extends StatefulWidget {
  const SalesScreen({super.key});

  @override
  State<SalesScreen> createState() => _SalesScreenState();
}

class _SalesScreenState extends State<SalesScreen> {
  final List<Sale> sales = [];

  final TextEditingController quantityController =
      TextEditingController();

  final TextEditingController priceController =
      TextEditingController();

  final TextEditingController buyerController =
      TextEditingController();

  DateTime selectedDate = DateTime.now();

  @override
  void dispose() {
    quantityController.dispose();
    priceController.dispose();
    buyerController.dispose();

    super.dispose();
  }

  // =====================================================
  // DATE PICKER
  // =====================================================

  Future<void> selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  // =====================================================
  // ADD SALE
  // =====================================================

  void addSale() {
    final double? quantity =
        double.tryParse(quantityController.text);

    final double? price =
        double.tryParse(priceController.text);

    final String buyer =
        buyerController.text.trim();

    if (quantity == null ||
        quantity <= 0 ||
        price == null ||
        price <= 0 ||
        buyer.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Please enter valid sale details.',
          ),
        ),
      );

      return;
    }

    setState(() {
      sales.add(
        Sale(
          date: selectedDate,
          quantity: quantity,
          pricePerQuintal: price,
          buyer: buyer,
        ),
      );
    });

    quantityController.clear();
    priceController.clear();
    buyerController.clear();

    Navigator.pop(context);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Sale added successfully!',
        ),
      ),
    );
  }

  // =====================================================
  // ADD SALE FORM
  // =====================================================

  void showAddSaleForm() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,

      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),

              child: Container(
                padding: const EdgeInsets.all(22),

                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(25),
                  ),
                ),

                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Add New Sale',
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 20),

                      // DATE
                      const Text(
                        'Sale Date',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 8),

                      InkWell(
                        onTap: () async {
                          final DateTime? picked =
                              await showDatePicker(
                            context: context,
                            initialDate: selectedDate,
                            firstDate: DateTime(2020),
                            lastDate: DateTime.now(),
                          );

                          if (picked != null) {
                            setState(() {
                              selectedDate = picked;
                            });

                            setModalState(() {});
                          }
                        },

                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(15),

                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey.shade300,
                            ),
                            borderRadius:
                                BorderRadius.circular(12),
                          ),

                          child: Row(
                            children: [
                              const Icon(
                                Icons.calendar_today_outlined,
                              ),

                              const SizedBox(width: 12),

                              Text(
                                '${selectedDate.day.toString().padLeft(2, '0')}/'
                                '${selectedDate.month.toString().padLeft(2, '0')}/'
                                '${selectedDate.year}',
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 18),

                      // QUANTITY
                      TextField(
                        controller: quantityController,
                        keyboardType:
                            const TextInputType.numberWithOptions(
                          decimal: true,
                        ),

                        decoration: InputDecoration(
                          labelText: 'Quantity (quintals)',
                          hintText: 'Example: 5',
                          prefixIcon:
                              const Icon(Icons.scale_outlined),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(12),
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // PRICE
                      TextField(
                        controller: priceController,
                        keyboardType:
                            const TextInputType.numberWithOptions(
                          decimal: true,
                        ),

                        decoration: InputDecoration(
                          labelText: 'Price per quintal',
                          hintText: 'Example: 52500',
                          prefixIcon:
                              const Icon(Icons.currency_rupee),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(12),
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // BUYER
                      TextField(
                        controller: buyerController,

                        decoration: InputDecoration(
                          labelText: 'Market / Buyer',
                          hintText: 'Example: Shivamogga APMC',
                          prefixIcon:
                              const Icon(Icons.storefront_outlined),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(12),
                          ),
                        ),
                      ),

                      const SizedBox(height: 22),

                      SizedBox(
                        width: double.infinity,
                        height: 52,

                        child: ElevatedButton.icon(
                          onPressed: addSale,

                          icon: const Icon(
                            Icons.add,
                          ),

                          label: const Text(
                            'Add Sale',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Colors.green.shade700,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(14),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  // =====================================================
  // TOTAL SALES
  // =====================================================

  double get totalSalesAmount {
    double total = 0;

    for (final sale in sales) {
      total += sale.totalAmount;
    }

    return total;
  }

  double get totalQuantity {
    double total = 0;

    for (final sale in sales) {
      total += sale.quantity;
    }

    return total;
  }

  // =====================================================
  // FORMAT DATE
  // =====================================================

  String formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/'
        '${date.month.toString().padLeft(2, '0')}/'
        '${date.year}';
  }

  // =====================================================
  // SALES SCREEN UI
  // =====================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Sales',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: showAddSaleForm,

        backgroundColor: Colors.green.shade700,
        foregroundColor: Colors.white,

        icon: const Icon(
          Icons.add,
        ),

        label: const Text(
          'Add Sale',
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Sales Overview',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 6),

            Text(
              'Track your arecanut sales and earnings',
              style: TextStyle(
                color: Colors.grey.shade700,
              ),
            ),

            const SizedBox(height: 20),

            // SUMMARY CARDS
            Row(
              children: [
                Expanded(
                  child: _summaryCard(
                    title: 'Total Quantity',
                    value:
                        '${totalQuantity.toStringAsFixed(2)} q',
                    icon: Icons.scale_outlined,
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: _summaryCard(
                    title: 'Total Sales',
                    value:
                        '₹${totalSalesAmount.toStringAsFixed(0)}',
                    icon:
                        Icons.account_balance_wallet_outlined,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 25),

            const Text(
              'Transactions',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            if (sales.isEmpty)
              _emptySalesWidget()
            else
              Column(
                children: List.generate(
                  sales.length,
                  (index) {
                    final sale = sales[index];

                    return _saleCard(
                      sale: sale,
                      index: index,
                    );
                  },
                ),
              ),

            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  // =====================================================
  // SUMMARY CARD
  // =====================================================

  Widget _summaryCard({
    required String title,
    required String value,
    required IconData icon,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),

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

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: Colors.green.shade700,
          ),

          const SizedBox(height: 10),

          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade600,
            ),
          ),

          const SizedBox(height: 4),

          Text(
            value,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  // =====================================================
  // EMPTY SALES
  // =====================================================

  Widget _emptySalesWidget() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(30),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),

      child: Column(
        children: [
          Icon(
            Icons.receipt_long_outlined,
            size: 60,
            color: Colors.grey.shade400,
          ),

          const SizedBox(height: 15),

          const Text(
            'No sales recorded yet',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 6),

          Text(
            'Tap "Add Sale" to record your first transaction.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }

  // =====================================================
  // SALE CARD
  // =====================================================

  Widget _saleCard({
    required Sale sale,
    required int index,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.green.shade50,

                child: Icon(
                  Icons.receipt_long_outlined,
                  color: Colors.green.shade700,
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Text(
                      sale.buyer,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      formatDate(sale.date),
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),

              IconButton(
                onPressed: () {
                  setState(() {
                    sales.removeAt(index);
                  });
                },

                icon: const Icon(
                  Icons.delete_outline,
                  color: Colors.red,
                ),
              ),
            ],
          ),

          const Divider(height: 25),

          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
            children: [
              _saleDetail(
                label: 'Quantity',
                value:
                    '${sale.quantity.toStringAsFixed(2)} q',
              ),

              _saleDetail(
                label: 'Rate',
                value:
                    '₹${sale.pricePerQuintal.toStringAsFixed(0)}',
              ),

              _saleDetail(
                label: 'Total',
                value:
                    '₹${sale.totalAmount.toStringAsFixed(0)}',
              ),
            ],
          ),
        ],
      ),
    );
  }

  // =====================================================
  // SALE DETAIL
  // =====================================================

  Widget _saleDetail({
    required String label,
    required String value,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 11,
            color: Colors.grey.shade600,
          ),
        ),

        const SizedBox(height: 4),

        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}