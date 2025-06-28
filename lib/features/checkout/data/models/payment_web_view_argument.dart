class PaymentWebViewArgument {
  final String paymentUrl;
  final void Function()? onSuccess;
  final void Function()? onFailure;

  PaymentWebViewArgument({
    required this.paymentUrl,
    this.onSuccess,
    this.onFailure,
  });
}
