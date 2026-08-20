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