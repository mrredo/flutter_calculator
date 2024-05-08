String formatLargeNumbers(double number) {
  String formattedNumber;
  if (number >= 1e7) {
    formattedNumber = number.toStringAsExponential();
    // Remove trailing zeros after the decimal point
    formattedNumber = formattedNumber.replaceAll(RegExp(r"(\.[0-9]*[1-9])0+$"), r"$1");
  } else {
    formattedNumber = number.toStringAsFixed(9); // Round to nearest integer
  }
  return formattedNumber;
}