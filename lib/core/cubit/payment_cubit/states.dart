abstract class PaymentStates {}

class PaymentInitialState extends PaymentStates {}

//auth

class PaymentAuthLoadingState extends PaymentStates {}

class PaymentAuthSuccessState extends PaymentStates {}

class PaymentAuthErrorState extends PaymentStates {}

//GetOrderRegistration
class PaymentGetOrderRegistrationLoadingState extends PaymentStates {}

class PaymentGetOrderRegistrationSuccessState extends PaymentStates {}

class PaymentGetOrderRegistrationErrorState extends PaymentStates {}
//payment

class PaymentRequestTokenLoadingStates extends PaymentStates {}

class PaymentRequestSuccessState extends PaymentStates {}

class PaymentRequestErrorState extends PaymentStates {}

///getKioskPaymentsId
class PaymentGetRefcodeLoadingStates extends PaymentStates {}

class PaymentRefCodeSuccessStates extends PaymentStates {}

class PaymentRefCodeErrorStates extends PaymentStates {}
