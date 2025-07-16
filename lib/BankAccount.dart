import 'dart:io';

void main() {
  print("Enter your name:");
  String? name = stdin.readLineSync();

  print("Enter account number:");
  int accountNumber = int.parse(stdin.readLineSync()!);

  print("Enter your account type (saving/checking):");
  String? accountType = stdin.readLineSync();

  if (accountType != "saving" && accountType != "checking") {
    print("Incorrect account type. Program will exit.");
    return;
  }

  print("Enter the initial balance:");
  double balance = double.parse(stdin.readLineSync()!);

  print(
    "Welcome, $name!\n"
    "Your account number is: $accountNumber\n"
    "Your initial balance is: ${balance.toStringAsFixed(2)}",
  );

  String? choice;

  do {
    print(
      "Menu:\n"
      "1. Deposit\n"
      "2. Withdraw\n"
      "3. Predict Future Balance\n"
      "4. View Account Summary\n"
      "5. Exit\n"
      "Choose an option: ",
    );

    choice = stdin.readLineSync()!.trim();

    if (choice == "1") {
      // Deposit
      print("Enter amount to deposit:");
      try {
        double depositAmount = double.parse(stdin.readLineSync()!);
        if (depositAmount <= 0) {
          print("Invalid amount. Deposit failed.");
        } else {
          balance += depositAmount;
          print(
            "Deposit successful. New balance: ${balance.toStringAsFixed(2)} ",
          );
        }
      } catch (e) {
        print(" Invalid input. Please enter a valid number.");
      }
    } else if (choice == "2") {
      // Withdraw
      print("Enter amount to withdraw:");
      try {
        double withdrawAmount = double.parse(stdin.readLineSync()!);
        if (withdrawAmount <= 0) {
          print("Invalid amount. Withdrawal failed.");
        } else if (withdrawAmount > balance) {
          print("Insufficient balance. Withdrawal denied.");
        } else {
          balance -= withdrawAmount;
          print(
            "Withdrawal successful. New balance: ${balance.toStringAsFixed(2)} ",
          );
        }
      } catch (e) {
        print(" Invalid input. Please enter a valid number.");
      }
    } else if (choice == "3") {
      // Predict future balance
      try {
        print("Enter number of years:");
        int years = int.parse(stdin.readLineSync()!);

        print("Enter annual profit rate (in %):");
        double rate = double.parse(stdin.readLineSync()!);

        if (years < 0 || rate < 0) {
          print("Invalid input. Years and rate must be non-negative.");
        } else {
          double futureBalance = balance * (1 + (rate / 100) * years);
          print(
            "Predicted future balance after $years years: ${futureBalance.toStringAsFixed(2)} ",
          );
          print("Rounded balance: ${futureBalance.toInt()} EGP");
        }
      } catch (e) {
        print(" Invalid input. Please enter numbers only.");
      }
    } else if (choice == "4") {
      // Account summary
      print(
        "account summary : \n"
        "name : $name \n "
        "Account Number: $accountNumber \n"
        "Account Type: $accountType \n "
        "Current Balance: ${balance.toStringAsFixed(2)} \n "
        "Rounded Balance: ${balance.toInt()} \n",
      );
    } else if (choice == "5") {
      print("Thank you for using the banking system. Goodbye!");
    } else {
      print(" Invalid option. Please try again.");
    }
  } while (choice != "5");
}
