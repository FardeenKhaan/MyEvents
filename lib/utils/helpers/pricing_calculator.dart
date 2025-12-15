class FkPricingCalculator {
  /// -- Calculate Price based on tax and shipping
  static double calculateTotalPrice(double productPrice) {
    double taxRate = getTaxRateForLocation();
    double taxAmount = productPrice * taxRate;

    double shippingCost = getShippingCost();

    double totalPrice = taxAmount + shippingCost + productPrice;
    return totalPrice;
  }

  /// -- Calculate shipping cost
  static String calculateShippingCost() {
    double shippingCost = getShippingCost();
    return shippingCost.toStringAsFixed(2);
  }

  /// -- Calculate tax
  static String calculateTax(double productPrice) {
    double taxRate = getTaxRateForLocation();
    double taxAmount = productPrice * taxRate;
    return taxAmount.toStringAsFixed(2);
  }

  static double getTaxRateForLocation() {
    // Lookup the tax rate for the given location from a tax rate database or API.
    // Return the appropriate tax rate.
    return 0.10; // Example tax rate of 10%
  }

  static double getShippingCost() {
    // Lookup the shipping cost for the given location using a shipping rate API.
    // Calculate the shipping cost based on various factors like distance, weight, etc.
    return 5.00; // Example shipping cost of $5
  }

  /// -- Sum all cart values and return total amount
  // static double calculateCartTotal(CartModel cart) {
  //   return cart.items.map((e) => e.price).fold(0, (previousPrice, currentPrice) => previousPrice + (currentPrice ?? 0));
  // }

  static double calculateDiscountedPrice(double totalPrice, double discountPercent) {
    double discountedPrice = totalPrice * (discountPercent / 100);
    totalPrice = totalPrice - discountedPrice;
    return totalPrice;
  }
}
