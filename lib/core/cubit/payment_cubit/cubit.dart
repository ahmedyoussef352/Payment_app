// ignore_for_file: avoid_print, prefer_interpolation_to_compose_strings

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/core/cubit/payment_cubit/states.dart';
import 'package:payment_app/data/models/authentication_request_model.dart';
import 'package:payment_app/data/models/order_registration_model.dart';
import 'package:payment_app/data/models/payment_reqeust_model.dart';
import 'package:payment_app/data/network/constants.dart';
import 'package:payment_app/data/network/dio_helper.dart';

class PaymentCubit extends Cubit<PaymentStates> {
  PaymentCubit() : super(PaymentInitialState());

  static PaymentCubit get(
    context,
  ) =>
      BlocProvider.of(context);
  AuthenticationRequestModel? authTokenModel;
  Future<void> getAuthToken() async {
    await (PaymentAuthLoadingState());
    DioHelper.postData(url: Endpoint.getAuthToken, data: {
      "api_key": Endpoint.paymentApikey,
    }).then((value) {
      authTokenModel = AuthenticationRequestModel.fromJson(value.data);
      Endpoint.paymentFirstToken = authTokenModel!.token;
      Endpoint.paymentFirstToken = authTokenModel!.token;
      print('token is ${Endpoint.paymentFirstToken.toString()}');
      emit(PaymentAuthSuccessState());
    }).catchError((onError) {
      emit(PaymentAuthErrorState());
      print("00000000000000" + onError);
    });
  }

  Future getOrderRegistrationId({
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String price,
  }) async {
    emit(PaymentGetOrderRegistrationLoadingState());
    DioHelper.postData(url: Endpoint.getOrderId, data: {
      "auth_token": Endpoint.paymentFirstToken,
      "delivery_needed": "false",
      "amount_cents": price,
      "currency": "EGP",
      "items": [],
    }).then((value) {
      OrderRegistrationModel orderRegistrationModel =
          OrderRegistrationModel.fromJson(value.data);
      Endpoint.paymentOrderId = orderRegistrationModel.id.toString();
      print('000000000000000000000000');
      getPaymentRequest(
        email: email,
        firstName: firstName,
        lastName: lastName,
        phone: phone,
        price: price,
      );
      emit(PaymentGetOrderRegistrationSuccessState());

      print('//////////////////////////////');
    }).catchError((onError) {
      emit(PaymentGetOrderRegistrationErrorState());
      print(onError);
    });
  }

  Future<void> getPaymentRequest({
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String price,
  }) async {
    await (PaymentRequestTokenLoadingStates());
    DioHelper.postData(url: Endpoint.getPaymentRequest, data: {
      "auth_token": Endpoint.paymentFirstToken,
      "amount_cents": price,
      "expiration": 3600,
      "order_id": Endpoint.paymentOrderId,
      "billing_data": {
        "apartment": "NA",
        "email": email,
        "floor": "NA",
        "first_name": firstName,
        "street": "NA",
        "building": "NA",
        "phone_number": phone,
        "shipping_method": "NA",
        "postal_code": "NA",
        "city": "NA",
        "country": "NA",
        "last_name": lastName,
        "state": "NA"
      },
      "currency": "EGP",
      "integration_id": Endpoint.integrationIdCard,
      "lock_order_when_paid": "false"
    }).then((value) {
      PaymentRequestModel paymentRequestModel =
          PaymentRequestModel.fromJson(value.data);
      Endpoint.paymentFinalToken = paymentRequestModel.token;
      print('000000000000000000000000');
      print('000000000000000000000000');
      print('000000000000000000000000');
      print('000000000000000000000000');
      print('000000000000000000000000');
      print('token9999 is ${Endpoint.paymentFinalToken}');
      emit(PaymentRequestSuccessState());
    }).catchError((onError) {
      emit(PaymentRequestErrorState());
      print(onError);
    });
  }

  ///getKioskPaymentsId
  Future getRefCode() async {
    await (PaymentGetRefcodeLoadingStates());
    DioHelper.postData(url: Endpoint.getRefCode, data: {
      "source": {"identifier": "AGGREGATOR", "subtype": "AGGREGATOR"},
      "payment_token": Endpoint.paymentFinalToken
    }).then((value) {
      Endpoint.refCode = value.data['id'].toString();
      print('000000000000000000000000');
      print('000000000000000000000000');
      print('tokenssssss is ${Endpoint.refCode}');
      emit(PaymentRefCodeSuccessStates());
    }).catchError((onError) {
      emit(PaymentRefCodeErrorStates());
      print(onError);
    });
  }
}
