part of 'add_car_cubit.dart';

sealed class AddCarState extends Equatable {
  const AddCarState();

  @override
  List<Object> get props => [];
}

final class AddCarInitial extends AddCarState {}

final class SearchState extends AddCarState {
  final List<String> cities;

  const SearchState({required this.cities});

  @override
  List<Object> get props => [cities];
}

final class SelectCity extends AddCarState {
  final String city;

  const SelectCity({required this.city});

  @override
  List<Object> get props => [city];
}

final class SelectCountry extends AddCarState {
  final String country;

  const SelectCountry({required this.country});

  @override
  List<Object> get props => [country];
}

final class GetAllCountriesLoading extends AddCarState {}

final class GetAllCountriesSuccess extends AddCarState {
  final List<String> countries;

  const GetAllCountriesSuccess({required this.countries});

  @override
  List<Object> get props => [countries];
}

final class GetAllCountriesError extends AddCarState {
  final String message;

  const GetAllCountriesError({required this.message});

  @override
  List<Object> get props => [message];
}

final class AddCountryLoading extends AddCarState {}

final class AddCountrySuccess extends AddCarState {
  final String message;

  const AddCountrySuccess({required this.message});

  @override
  List<Object> get props => [message];
}

final class AddCountryError extends AddCarState {
  final String message;

  const AddCountryError({required this.message});

  @override
  List<Object> get props => [message];
}

final class GetAllCitiesLoading extends AddCarState {}

final class GetAllCitiesSuccess extends AddCarState {
  final List<String> cities;

  const GetAllCitiesSuccess({required this.cities});

  @override
  List<Object> get props => [cities];
}

final class GetAllCitiesError extends AddCarState {
  final String message;

  const GetAllCitiesError({required this.message});

  @override
  List<Object> get props => [message];
}

final class AddCityLoading extends AddCarState {}

final class AddCitySuccess extends AddCarState {
  final String message;

  const AddCitySuccess({required this.message});

  @override
  List<Object> get props => [message];
}

final class AddCityError extends AddCarState {
  final String message;

  const AddCityError({required this.message});

  @override
  List<Object> get props => [message];
}
