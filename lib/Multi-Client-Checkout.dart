import 'dart:io';

void main() {
  // تعريف المنتجات (رقم المنتج → الاسم والسعر)
  List<String> productNames = [
    "Keyboard",
    "Mouse",
    "Monitor",
    "USB Cable",
    "Headphones",
  ];
  List<double> productPrices = [100, 50, 300, 20, 150];

  while (true) {
    print("Welcome to the store!");
    print("Available products:");
    for (int i = 0; i < productNames.length; i++) {
      print("${i + 1}. ${productNames[i]} - \$${productPrices[i]}");
    }

    // حفظ الطلب
    List<int> productCounts = [0, 0, 0, 0, 0];
    double subtotal = 0;

    while (true) {
      stdout.write("Enter product number to add to cart (0 to finish): ");
      int? productNumber = int.tryParse(stdin.readLineSync()!);

      if (productNumber == 0) break;

      if (productNumber! < 1 || productNumber > 5) {
        print("Invalid product number.");
        continue;
      }

      stdout.write("Enter quantity: ");
      int? quantity = int.tryParse(stdin.readLineSync()!);

      if (quantity == null || quantity <= 0) {
        print("Invalid quantity.");
        continue;
      }

      int index = productNumber - 1;
      productCounts[index] += quantity;
      subtotal += productPrices[index] * quantity;
    }

    // بيانات العميل
    stdout.write("Please enter your name: ");
    String name = stdin.readLineSync()!;
    stdout.write("Please enter your phone number: ");
    String phone = stdin.readLineSync()!;

    // حساب الضريبة
    double tax = subtotal * 0.13;

    // الخصم: لو Subtotal > 1000 → خصم 10%
    double discount = 0;
    if (subtotal > 1000) {
      discount = subtotal * 0.10;
    }

    // التوصيل
    stdout.write("Do you want delivery? (yes/no): ");
    String deliveryChoice = stdin.readLineSync()!.toLowerCase();
    double deliveryFee = 0;

    if (deliveryChoice == "yes") {
      stdout.write("Enter delivery distance in km: ");
      double? distance = double.tryParse(stdin.readLineSync()!);

      if (distance != null) {
        if (distance < 10) {
          deliveryFee = 10;
        } else if (distance <= 20) {
          deliveryFee = 25;
        } else {
          deliveryFee = 45;
        }
      } else {
        print("Invalid distance. No delivery fee added.");
      }
    }

    // الإجمالي النهائي
    double total = subtotal + tax + deliveryFee - discount;

    // طباعة الفاتورة
    print("\n----------------------------");
    print("Receipt for $name");
    print("Phone: $phone");
    print("\nItems purchased:");
    for (int i = 0; i < 5; i++) {
      if (productCounts[i] > 0) {
        print(
          "${productNames[i]} x ${productCounts[i]} = \$${(productPrices[i] * productCounts[i]).toStringAsFixed(2)}",
        );
      }
    }

    print("\nSubtotal: \$${subtotal.toStringAsFixed(2)}");
    print("Tax (13%): \$${tax.toStringAsFixed(2)}");
    print("Discount: \$${discount.toStringAsFixed(2)}");
    print("Delivery fee: \$${deliveryFee.toStringAsFixed(2)}");
    print("----------------------------");
    print("Total amount to pay: \$${total.toStringAsFixed(2)}");
    print("Thank you for shopping with us, $name!");
    print("-----------------------------------------\n");

    // الرجوع لعميل جديد
    print("Ready for next customer...\n");
  }
}
