import '../models/sale.dart';
import '../models/harvest.dart';

class AppData {
  // All harvest records
  static final List<Harvest> harvests = [];

  // All sales records
  static final List<Sale> sales = [];

  // Current market price per quintal
  static double currentMarketPrice = 52500;

  // -------------------------------------------------
  // TOTAL HARVESTED
  // -------------------------------------------------

  static double get totalHarvested {
    double total = 0;

    for (final harvest in harvests) {
      total += harvest.quantity;
    }

    return total;
  }

  // -------------------------------------------------
  // TOTAL SOLD
  // -------------------------------------------------

  static double get totalSold {
    double total = 0;

    for (final sale in sales) {
      total += sale.quantity;
    }

    return total;
  }

  // -------------------------------------------------
  // AVAILABLE STOCK
  // -------------------------------------------------

  static double get availableStock {
    return totalHarvested - totalSold;
  }

  // -------------------------------------------------
  // ESTIMATED STOCK VALUE
  // -------------------------------------------------

  static double get estimatedStockValue {
    return availableStock * currentMarketPrice;
  }

  // -------------------------------------------------
  // TOTAL SALES VALUE
  // -------------------------------------------------

  static double get totalSalesAmount {
    double total = 0;

    for (final sale in sales) {
      total += sale.totalAmount;
    }

    return total;
  }
}