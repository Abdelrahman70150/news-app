abstract class NewsStates {}

class NewsInitialStates extends NewsStates{}

class GetSportsLoadingState extends NewsStates {}

class GetSportsErrorState extends NewsStates {
  final String Error;

  GetSportsErrorState(this.Error);

}

class GetSportsSuccessState extends NewsStates {}

class GetPoliticsLoadingState extends NewsStates {}

class GetPoliticsErrorState extends NewsStates {
  final String Error;

  GetPoliticsErrorState(this.Error);

}

class GetPoliticsSuccessState extends NewsStates {}

class GetHealthLoadingState extends NewsStates {}

class GetHealthErrorState extends NewsStates {
  final String Error;

  GetHealthErrorState(this.Error);

}

class GetHealthSuccessState extends NewsStates {}

class GetBusinessLoadingState extends NewsStates {}

class GetBusinessErrorState extends NewsStates {
  final String Error;

  GetBusinessErrorState(this.Error);

}

class GetBusinessSuccessState extends NewsStates {}

class GetScienceLoadingState extends NewsStates {}

class GetScienceErrorState extends NewsStates {
  final String Error;

  GetScienceErrorState(this.Error);

}

class GetScienceSuccessState extends NewsStates {}

class ChangeAppModeLoadingState extends NewsStates {}

class ChangeAppModeSuccessState extends NewsStates {}

class GetThemeFromSharedLoadingState extends NewsStates{}

class GetThemeFromSharedSuccessState extends NewsStates{}





