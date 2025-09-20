import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:sear_soqe/core/data/firebase/firestore_database_service.dart';

part 'add_car_state.dart';

class AddCarCubit extends Cubit<AddCarState> {
  AddCarCubit() : super(AddCarInitial());

  List<String> countries = [];

  List<String> searchCities = [];

  String? selectedCity;
  String? selectedCountry;

  void search(String query, List<String> list) {
    if (query.isEmpty) {
      searchCities = List.from(list);
    } else {
      searchCities = list
          .where((city) => city.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    emit(SearchState(cities: searchCities));
  }

  choise(String choice) {
    if (countries.contains(choice)) {
      selectedCountry = choice;
      emit(SelectCountry(country: choice));
    } else if (cities.contains(choice)) {
      selectedCity = choice;
      emit(SelectCity(city: choice));
    }
  }

  // selectCountry(String country) {
  //   selectedCountry = country;
  //   emit(SelectCountry(country: country));
  // }

  // void selectCity(String city) {
  //   selectedCity = city;
  //   emit(SelectCity(city: city));
  // }

  getAllCountries() async {
    emit(GetAllCountriesLoading());
    try {
      final ids = await FirestoreService().getDocumentIds(
        collectionPath: 'cities',
      );
      countries = ids;
      emit(GetAllCountriesSuccess(countries: ids));
    } catch (e) {
      emit(GetAllCountriesError(message: e.toString()));
    }
  }

  List<String> cities = [];

  getAllCities(String country) async {
    emit(GetAllCitiesLoading());
    try {
      final doc = await FirestoreService().getDocument(
        collectionPath: 'cities',
        docId: country,
      );

      final data = doc.data() as Map<String, dynamic>?;

      if (data != null) {
        cities = data.values.map((e) => e.toString()).toList();
      } else {
        cities = [];
      }
      emit(GetAllCitiesSuccess(cities: cities));
    } catch (e) {
      emit(GetAllCitiesError(message: e.toString()));
    }
  }

  static String? id;
  static createDocRef() {
    final docRef = FirebaseFirestore.instance
        .collection("users")
        .doc('user.uid')
        .collection("cars")
        .doc();

    id = docRef.id;
  }

  addCountry(String country) async {
    emit(AddCountryLoading());
    try {
      await FirebaseFirestore.instance
          .collection("users")
          .doc('user.uid')
          .collection("cars")
          .doc(id!)
          .set({'country': country});
      emit(AddCountrySuccess(message: 'Country added successfully'));
    } catch (e) {
      emit(AddCountryError(message: e.toString()));
    }
  }

  addCity(String city) async {
    emit(AddCityLoading());
    try {
      await FirebaseFirestore.instance
          .collection("users")
          .doc('user.uid')
          .collection("cars")
          .doc(id!)
          .set({'city': city});
      emit(AddCitySuccess(message: 'City added successfully'));
    } catch (e) {
      emit(AddCityError(message: e.toString()));
    }
  }
}
