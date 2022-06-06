abstract class ApiStates {}

class InitApiappState extends ApiStates {}

class NewLoginLoadingState extends ApiStates {}

class GetLoginDataSuccessState extends ApiStates {}

class GetLoginDataErorrState extends ApiStates {
  final String error;
  GetLoginDataErorrState(this.error);
}

class GetwrongAccountState extends ApiStates {}

class NewLoadinGetContactsState extends ApiStates {}

class GetContactsSuccessState extends ApiStates {}

class GetContactsErorrState extends ApiStates {
  final String error;
  GetContactsErorrState(this.error);
}

class NewLoadinGetOrdersDataState extends ApiStates {}

class GetOrdersDataSuccessState extends ApiStates {}

class GetOrdersDataErorrState extends ApiStates {
  final String error;
  GetOrdersDataErorrState(this.error);
}

class NewLoadingCustomersDataState extends ApiStates {}

class GetCustomerDataSuccessState extends ApiStates {}

class GetCustomerDataErorrState extends ApiStates {
  final String error;
  GetCustomerDataErorrState(this.error);
}

class NewLoadingShearchCustomersDataState extends ApiStates {}

class GetSearchedCustomerDataSuccessState extends ApiStates {}

class GetSearchedCustomerDataErorrState extends ApiStates {
  final String error;
  GetSearchedCustomerDataErorrState(this.error);
}

class NewLoadingGetSearchedOrdersDataState extends ApiStates {}

class GetSearchedOrdersDataSuccessState extends ApiStates {}

class GetSearchedOrdersDataErorrState extends ApiStates {
  final String error;
  GetSearchedOrdersDataErorrState(this.error);
}

class NewLoadingUpDateCustomerDataState extends ApiStates {}

class UpDateCustomerDataSuccessState extends ApiStates {}

class UpDateCustomerDataErorrState extends ApiStates {
  final String error;
  UpDateCustomerDataErorrState(this.error);
}

class NewLoadinMdkDriverState extends ApiStates {}

class GetMdkDriverSuccessState extends ApiStates {}

class GetMdkDriverErorrState extends ApiStates {
  final String error;
  GetMdkDriverErorrState(this.error);
}

class NewLoadinStatisticsState extends ApiStates {}

class GetStatisticsSuccessState extends ApiStates {}

class GetStatisticsErorrState extends ApiStates {
  final String error;
  GetStatisticsErorrState(this.error);
}

class NewLoadinggetCurrentLocationState extends ApiStates {}

class GetCurrentLocationSuccessState extends ApiStates {}

class NewLoadingNotificationsDataState extends ApiStates {}

class GetNotificationsDataSuccessState extends ApiStates {}

class GetNotificationsDataErorrState extends ApiStates {
  final String error;
  GetNotificationsDataErorrState(this.error);
}
