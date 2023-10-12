import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/core/components/components.dart';
import 'package:payment_app/core/constants/styles/color_app.dart';
import 'package:payment_app/core/cubit/payment_cubit/cubit.dart';
import 'package:payment_app/core/cubit/payment_cubit/states.dart';
import 'package:payment_app/data/network/constants.dart';
import 'package:payment_app/view/screens/payment/ref_code_screen.dart';
import 'package:payment_app/view/screens/payment/visa_screen.dart';
import 'package:payment_app/view/widget/show_snack.dart';

class ToggleScreen extends StatelessWidget {
  const ToggleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaymentCubit(),
      child: SafeArea(
        child: BlocConsumer<PaymentCubit, PaymentStates>(
          listener: (context, state) {
            if (state is PaymentRefCodeSuccessStates) {
              showSnackBar(
                context: context,
                text: "Success get ref code ",
                color: yellow400,
              );
              navigateTo(context, const ReferenceScreen());
            }
            if (state is PaymentRefCodeErrorStates) {
              showSnackBar(
                context: context,
                text: "Error get ref code ",
                color: red,
              );
            }
          },
          builder: (context, state) {
            var cubit = PaymentCubit.get(context);
            return Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          cubit.getRefCode();
                        },
                        child: Expanded(
                          flex: 0,
                          child: Container(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * .45,
                            decoration: BoxDecoration(
                              // color: black12,

                              borderRadius: BorderRadius.circular(15.0),
                              border: Border.all(color: black87, width: 2.0),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 0,
                                  child: Image(
                                    height:
                                        MediaQuery.of(context).size.width < 560
                                            ? 200
                                            : 100,
                                    image: NetworkImage(
                                      AppImages.refCodeImage,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 15.0),
                                Text(
                                  'Payment with Ref code',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          navigateTo(context, const VisaScreen());
                        },
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: black12,
                            borderRadius: BorderRadius.circular(15.0),
                            border: Border.all(color: black, width: 2.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 0,
                                child: Image(
                                  height:
                                      MediaQuery.of(context).size.width < 560
                                          ? 200
                                          : 100,
                                  image: const NetworkImage(
                                    AppImages.visaImage,
                                  ),
                                ),
                              ),
                              const Text(
                                'Payment with visa',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
