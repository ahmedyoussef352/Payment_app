class Endpoint {
  //https://accept.paymob.com/api/auth/tokens
  static const String baseUrl = 'https://accept.paymob.com/api';
  static const String getAuthToken = '/auth/tokens';
  static const String getOrderId = "/ecommerce/orders";
  static String paymentApikey =
      "ZXlKaGJHY2lPaUpJVXpVeE1pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SmpiR0Z6Y3lJNklrMWxjbU5vWVc1MElpd2ljSEp2Wm1sc1pWOXdheUk2T1RFMU9EZzBMQ0p1WVcxbElqb2lhVzVwZEdsaGJDSjkuMFpTMm8xaXlMQnQzQTc1cm82UzNvdVNTVUxjS1pZU1ZNZEpnM29NVTRaRDNnNmg4WWpEM3dUWHRuWkxkTWM4Ry1Ec3dtZXZ1Tm9aNGJuWEVxaENOZmc=";
  static const String getPaymentRequest = "/acceptance/payment_keys";
  static const String getRefCode = "/acceptance/payments/pay";
  static String visaUrl =
      '$baseUrl/acceptance/iframes/792090?payment_token=$paymentFinalToken';
  static String refCode = ''; //
  static String paymentFirstToken = ''; //
  static String paymentFinalToken = ''; //
  static String paymentOrderId = ''; //
  static String integrationIdCard = "4259388";
  static String integrationIdKiosk = "4260290";
}

class AppImages {
  static const String refCodeImage =
      "https://cdn-icons-png.flaticon.com/128/4090/4090458.png";
  static const String visaImage =
      "https://cdn-icons-png.flaticon.com/128/349/349221.png";
}

//token
//ZXlKaGJHY2lPaUpJVXpVeE1pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SmpiR0Z6Y3lJNklrMWxjbU5vWVc1MElpd2ljSEp2Wm1sc1pWOXdheUk2T1RFMU9EZzBMQ0p3YUdGemFDSTZJbUl6TkRJd05EaGxZekpsTm1Gak16WTNZbVEyWWprMVpXTmlOREl4TW1VNU5tRmxPR0UyWVRRd09EWTVZelpsWTJSa01tSTFZMlExTXpFMU5XTmtOellpTENKbGVIQWlPakUyT1RZMU9EVTBNVFI5LlY0VmNGUW51UkppTjdPQUxSYkVUNVJXdXRvY2Zla1VOZ29oRDlrelNuTVNxVVlzeGZXNk9kbWRHMnFFUnlWLWVaR2Y4T19HRlI0R0lEVGkyalNFbEx3