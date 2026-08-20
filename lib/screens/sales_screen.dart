import 'package:flutter/material.dart';
import '../data/app_data.dart';
import '../models/sale.dart';

class SalesScreen extends StatefulWidget {
  const SalesScreen({super.key});

  @override
  State<SalesScreen> createState() => _SalesScreenState();
}

class _SalesScreenState extends State<SalesScreen> {
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

  String formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/'
        '${date.month.toString().padLeft(2, '0')}/'
        '${date.year}';
  }

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
          content: Text('Please enter valid sale details.'),
        ),
      );
      return;
    }

    setState(() {
      AppData.sales.add(
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
        content: Text('Sale added successfully!'),
      ),
    );
  }

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
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Add New Sale',
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 20),

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
                                formatDate(selectedDate),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 18),

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

                      TextField(
                        controller: buyerController,
                        decoration: InputDecoration(
                          labelText: 'Market / Buyer',
                          hintText: 'Example: Shivamogga APMC',
                          prefixIcon: const Icon(
                            Icons.storefront_outlined,
                          ),
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
                          icon: const Icon(Icons.add),
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

  @override
  Widget build(BuildContext context) {
    final double totalQuantity =
        AppData.totalSold;

    final double totalAmount =
        AppData.totalSalesAmount;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Sales',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: showAddSaleForm,
        backgroundColor: Colors.green.shade700,
        foregroundColor: Colors.white,
        icon: const Icon(Icons.add),
        label: const Text('Add Sale'),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
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

            Row(
              children: [
                Expanded(
                  child: _summaryCard(
                    'Total Quantity',
                    '${totalQuantity.toStringAsFixed(2)} q',
                    Icons.scale_outlined,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _summaryCard(
                    'Total Sales',
                    '₹${totalAmount.toStringAsFixed(0)}',
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

            if (AppData.sales.isEmpty)
              _emptySales()
            else
              Column(
                children: List.generate(
                  AppData.sales.length,
                  (index) {
                    final sale = AppData.sales[index];

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

  Widget _summaryCard(
    String title,
    String value,
    IconData icon,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
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

  Widget _emptySales() {
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
      ),
      child: Column(
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
                    AppData.sales.removeAt(index);
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
              _detail(
                'Quantity',
                '${sale.quantity.toStringAsFixed(2)} q',
              ),
              _detail(
                'Rate',
                '₹${sale.pricePerQuintal.toStringAsFixed(0)}',
              ),
              _detail(
                'Total',
                '₹${sale.totalAmount.toStringAsFixed(0)}',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _detail(String label, String value) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,
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