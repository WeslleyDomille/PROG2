import 'dart:convert';
import 'dart:io';

class Country {
  late var code;
  late var name;
  late var continent;
  late var language;

  Country(this.code, this.name, this.continent, this.language);
}

class Countries {
  late List<Country> countries;

  Countries() {
    var fileContent = File('countries.json').readAsStringSync();
    var jsonData = json.decode(fileContent);
    countries = List<Country>.from(jsonData.map((data) => Country(
        data['code'], data['name'], data['continent'], data['language'])));
  }

  void countriesOrder() {
    countries.sort((a, b) => a.code.compareTo(b.code));

    for (var country in countries) {
      print('CCA: ${country.code}, Name: ${country.name}');
    }
  }

  void englishCountries() {
    var englishSpeakingCountries =
        countries.where((country) => country.language == 'English');

    for (var country in englishSpeakingCountries) {
      print('CCA: ${country.code}, Name: ${country.name}');
    }
  }

  void continents() {
    var continentMap = <String, int>{};

    for (var country in countries) {
      var continent = country.continent;
      continentMap[continent] = (continentMap[continent] ?? 0) + 1;
    }

    continentMap.forEach((continent, count) {
      print('$continent: $count países');
    });
  }
}

void main() {
  Countries();
  Countries().countriesOrder();
  Countries().englishCountries();
  Countries().continents();
}
