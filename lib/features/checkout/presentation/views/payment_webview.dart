import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:looqma/core/common/widgets/custom_appbar.dart';
import 'package:looqma/core/utils/app_colors.dart';
import 'package:looqma/features/checkout/presentation/views/widgets/show_payment_result_dialog.dart';

class PaymentWebView extends StatefulWidget {
  const PaymentWebView({required this.paymentUrl, super.key});

  final String paymentUrl;
  @override
  State<PaymentWebView> createState() => _PaymentWebViewState();
}

class _PaymentWebViewState extends State<PaymentWebView> {
  late InAppWebViewController webViewController;
  bool isCompleted = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const CustomAppBar(title: 'Payment With Stripe'),
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: WebUri(widget.paymentUrl)),
        onWebViewCreated: (controller) {
          webViewController = controller;
        },
        onLoadStart: (controller, url) {
          if (url != null) {
            final urlString = url.toString();
            if (urlString.contains('/payment/sucess')) {
              isCompleted = true;
              Navigator.pop(context);
              showPaymentResultDialog(context: context, isSuccess: true);
            } else if (urlString.contains('/payment/cancel')) {
              isCompleted = true;
              showPaymentResultDialog(context: context, isSuccess: false);
              Navigator.pop(context);
            }
          }
        },
        onLoadStop: (controller, url) {
          log('Page finished loading: $url');
        },
        // ignore: deprecated_member_use
        onLoadError: (controller, url, code, message) {
          if (!isCompleted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('⚠️ Error loading page: $message')),
            );
          } else {
            log('Ignoring error after completion...');
          }
        },
      ),
    );
  }
}
