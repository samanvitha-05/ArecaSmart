import '../models/sale.dart';
import '../models/harvest.dart';
import '../models/expense.dart';

class AppData {
  static final List<Harvest> harvests = [];

  static final List<Sale> sales = [];

  static final List<Expense> expenses = [];

  static double currentMarketPrice = 52500;

  // -----------------------------
  // HARVEST
  // -----------------------------

  static double get totalHarvested {
    double total = 0;

    for (final harvest in harvests) {
      total += harvest.quantity;
    }

    return total;
  }

  // -----------------------------
  // SALES
  // -----------------------------

  static double get totalSold {
    double total = 0;

    for (final sale in sales) {
      total += sale.quantity;
    }

    return total;
  }

  static double get totalSalesAmount {
    double total = 0;

    for (final sale in sales) {
      total += sale.totalAmount;
    }

    return total;
  }

  // -----------------------------
  // STOCK
  // -----------------------------

  static double get availableStock {
    return totalHarvested - totalSold;
  }

  static double get estimatedStockValue {
    return availableStock * currentMarketPrice;
  }

  // -----------------------------
  // EXPENSES
  // -----------------------------

  static double get totalExpenses {
    double total = 0;

    for (final expense in expenses) {
      total += expense.amount;
    }

    return total;
  }

  // -----------------------------
  // PROFIT / LOSS
  // -----------------------------

  static double get netProfit {
    return totalSalesAmount - totalExpenses;
  }

  static double get profitMargin {
    if (totalSalesAmount == 0) {
      return 0;
    }

    return (netProfit / totalSalesAmount) * 100;
  }

  static double get averageSellingPrice {
    if (totalSold == 0) {
      return 0;
    }

    return totalSalesAmount / totalSold;
  }
}