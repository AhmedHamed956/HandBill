abstract class HomeStates {}

class HomeIntialStates extends HomeStates {}

class HomeSuccessStates extends HomeStates {}

class HomeLoadingState extends HomeStates {}

class HomeErrorStates extends HomeStates {
  final String error;
  HomeErrorStates(this.error);
}

class JoinedSuccessStates extends HomeStates {}

class JoinedErrorStates extends HomeStates {}



// class GetProductsLoadingState extends HomeState {}

// class GetProductsSuccesState extends HomeState {}

// class GetProductsErrorState extends HomeState {
//   final String error;
//   GetProductsErrorState(this.error);
// }
