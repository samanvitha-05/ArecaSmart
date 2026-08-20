import 'package:flutter/material.dart';
import '../data/app_data.dart';
import '../models/harvest.dart';

class StockScreen extends StatefulWidget {
  const StockScreen({super.key});

  @override
  State<StockScreen> createState() => _StockScreenState();
}

class _StockScreenState extends State<StockScreen> {
  final TextEditingController quantityController =
      TextEditingController();

  final TextEditingController varietyController =
      TextEditingController();

  DateTime selectedDate = DateTime.now();

  @override
  void dispose() {
    quantityController.dispose();
    varietyController.dispose();
    super.dispose();
  }

  // -------------------------------------------------
  // DATE PICKER
  // -------------------------------------------------

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

  // -------------------------------------------------
  // ADD HARVEST
  // -------------------------------------------------

  void addHarvest() {
    final double? quantity =
        double.tryParse(quantityController.text);

    final String variety =
        varietyController.text.trim();

    if (quantity == null || quantity <= 0 || variety.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Please enter a valid quantity and variety.',
          ),
        ),
      );

      return;
    }

    setState(() {
      AppData.harvests.add(
        Harvest(
          date: selectedDate,
          quantity: quantity,
          variety: variety,
        ),
      );
    });

    quantityController.clear();
    varietyController.clear();

    Navigator.pop(context);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Harvest added successfully!',
        ),
      ),
    );
  }

  // -------------------------------------------------
  // ADD HARVEST FORM
  // -------------------------------------------------

  void showAddHarvestForm() {
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
                        'Add Harvest',
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 20),

                      // DATE
                      const Text(
                        'Harvest Date',
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
                          hintText: 'Example: 20',
                          prefixIcon: const Icon(
                            Icons.scale_outlined,
                          ),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(12),
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // VARIETY
                      TextField(
                        controller: varietyController,
                        decoration: InputDecoration(
                          labelText: 'Arecanut Variety',
                          hintText:
                              'Example: Red Variety',
                          prefixIcon: const Icon(
                            Icons.eco_outlined,
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
                          onPressed: addHarvest,
                          icon: const Icon(Icons.add),
                          label: const Text(
                            'Add Harvest',
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

  // -------------------------------------------------
  // DATE FORMAT
  // -------------------------------------------------

  String formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/'
        '${date.month.toString().padLeft(2, '0')}/'
        '${date.year}';
  }

  // -------------------------------------------------
  // STOCK DETAIL CARD
  // -------------------------------------------------

  Widget stockDetail({
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

  // -------------------------------------------------
  // HARVEST CARD
  // -------------------------------------------------

  Widget harvestCard({
    required Harvest harvest,
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
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.green.shade50,
            child: Icon(
              Icons.eco_outlined,
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
                  harvest.variety,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  formatDate(harvest.date),
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),

          Column(
            crossAxisAlignment:
                CrossAxisAlignment.end,
            children: [
              Text(
                '${harvest.quantity.toStringAsFixed(2)} q',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 4),

              IconButton(
                onPressed: () {
                  setState(() {
                    AppData.harvests.removeAt(index);
                  });
                },
                icon: const Icon(
                  Icons.delete_outline,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // -------------------------------------------------
  // BUILD
  // -------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final double harvested =
        AppData.totalHarvested;

    final double sold =
        AppData.totalSold;

    final double available =
        AppData.availableStock;

    final double estimatedValue =
        AppData.estimatedStockValue;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Stock',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      floatingActionButton:
          FloatingActionButton.extended(
        onPressed: showAddHarvestForm,
        backgroundColor: Colors.green.shade700,
        foregroundColor: Colors.white,
        icon: const Icon(Icons.add),
        label: const Text('Add Harvest'),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            const Text(
              'Stock Overview',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 6),

            Text(
              'Manage your harvested arecanut',
              style: TextStyle(
                color: Colors.grey.shade700,
              ),
            ),

            const SizedBox(height: 20),

            // AVAILABLE STOCK
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.green.shade700,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Available Stock',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    '${available.toStringAsFixed(2)} quintals',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    'Estimated value: ₹${estimatedValue.toStringAsFixed(0)}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    'Current rate: ₹${AppData.currentMarketPrice.toStringAsFixed(0)} / quintal',
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 18),

            // SUMMARY
            Row(
              children: [
                Expanded(
                  child: stockDetail(
                    title: 'Harvested',
                    value:
                        '${harvested.toStringAsFixed(2)} q',
                    icon: Icons.agriculture_outlined,
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: stockDetail(
                    title: 'Sold',
                    value:
                        '${sold.toStringAsFixed(2)} q',
                    icon: Icons.local_shipping_outlined,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 25),

            const Text(
              'Harvest History',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            if (AppData.harvests.isEmpty)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.circular(18),
                ),
                child: Column(
                  children: [
                    Icon(
                      Icons.inventory_2_outlined,
                      size: 60,
                      color: Colors.grey.shade400,
                    ),

                    const SizedBox(height: 15),

                    const Text(
                      'No harvest recorded yet',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 6),

                    Text(
                      'Tap "Add Harvest" to record your harvest.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              )
            else
              Column(
                children: List.generate(
                  AppData.harvests.length,
                  (index) {
                    return harvestCard(
                      harvest:
                          AppData.harvests[index],
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
}