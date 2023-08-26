import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'fr', 'de', 'nl', 'sv', 'da', 'es'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? frText = '',
    String? deText = '',
    String? nlText = '',
    String? svText = '',
    String? daText = '',
    String? esText = '',
  }) =>
      [enText, frText, deText, nlText, svText, daText, esText][languageIndex] ??
      '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Retrouvervelo
  {
    'lm4su0n5': {
      'en': 'Last Tag',
      'da': 'Sidste tag',
      'de': 'Letzter Tag',
      'es': 'Última etiqueta',
      'fr': 'Dernier Tag',
      'nl': 'Laatste label',
      'sv': 'Sista taggen',
    },
    '0vjh2qvf': {
      'en': 'Details',
      'da': 'detaljer',
      'de': 'Einzelheiten',
      'es': 'Detalles',
      'fr': 'Détails',
      'nl': 'Details',
      'sv': 'Detaljer',
    },
    'soxfsiww': {
      'en': 'Route to my bike',
      'da': 'Vej til min cykel',
      'de': 'Route zu meinem Fahrrad',
      'es': 'Ruta a mi bicicleta',
      'fr': 'Itinéraire vers mon vélo',
      'nl': 'Route naar mijn fiets',
      'sv': 'Väg till min cykel',
    },
    'kkbbheic': {
      'en': 'Location',
      'da': 'Beliggenhed',
      'de': 'Standort',
      'es': 'Ubicación',
      'fr': 'Emplacement',
      'nl': 'Plaats',
      'sv': 'Plats',
    },
  },
  // Concept
  {
    'ugfwbaiv': {
      'en': 'Home',
      'da': '',
      'de': '',
      'es': '',
      'fr': '',
      'nl': '',
      'sv': '',
    },
  },
  // Bitmoji
  {
    'ld2yn4w3': {
      'en': 'Choose your BikeMoji',
      'da': 'Vælg din BikeMoji',
      'de': 'Wählen Sie Ihr BikeMoji',
      'es': 'Elige tu BikeMoji',
      'fr': 'Choisis ton BikeMoji',
      'nl': 'Kies je BikeMoji',
      'sv': 'Välj din BikeMoji',
    },
    '0khtig2c': {
      'en': 'Let\'s ride!',
      'da': 'Lad os køre!',
      'de': 'Lass uns reiten!',
      'es': '¡Montemos!',
      'fr': 'En selle !',
      'nl': 'Laten we rijden!',
      'sv': 'Nu kör vi!',
    },
    'dffe51mv': {
      'en': '',
      'da': '',
      'de': '',
      'es': '',
      'fr': '',
      'nl': '',
      'sv': '',
    },
  },
  // Langue
  {
    'nibgjql5': {
      'en': 'Select language',
      'da': 'Select language',
      'de': 'Select language',
      'es': 'Select language',
      'fr': 'Select language',
      'nl': 'Select language',
      'sv': 'Select language',
    },
    'srjrtgl4': {
      'en': 'You won\'t be able to change it afterwards.',
      'da': 'You won\'t be able to change it afterwards.',
      'de': 'You won\'t be able to change it afterwards.',
      'es': 'You won\'t be able to change it afterwards.',
      'fr': 'You won\'t be able to change it afterwards.',
      'nl': 'You won\'t be able to change it afterwards.',
      'sv': 'You won\'t be able to change it afterwards.',
    },
    '61gqkpnc': {
      'en': 'French',
      'da': 'French',
      'de': 'French',
      'es': 'French',
      'fr': 'French',
      'nl': 'French',
      'sv': 'French',
    },
    '1xrqz4o4': {
      'en': 'English',
      'da': 'English',
      'de': 'English',
      'es': 'English',
      'fr': 'English',
      'nl': 'English',
      'sv': 'English',
    },
    'c67k4jr0': {
      'en': 'Dutch',
      'da': 'Dutch',
      'de': 'Dutch',
      'es': 'Dutch',
      'fr': 'Dutch',
      'nl': 'Dutch',
      'sv': 'Dutch',
    },
    '367lvxj8': {
      'en': 'German',
      'da': 'German',
      'de': 'German',
      'es': 'German',
      'fr': 'German',
      'nl': 'German',
      'sv': 'German',
    },
    '16sr6i59': {
      'en': 'Swedish',
      'da': 'Swedish',
      'de': 'Swedish',
      'es': 'Swedish',
      'fr': 'Swedish',
      'nl': 'Swedish',
      'sv': 'Swedish',
    },
    'apko0am0': {
      'en': 'Danish',
      'da': 'Danish',
      'de': 'Danish',
      'es': 'Danish',
      'fr': 'Danish',
      'nl': 'Danish',
      'sv': 'Danish',
    },
    'lijx1fgz': {
      'en': 'Spanish',
      'da': 'Spanish',
      'de': 'Spanish',
      'es': 'Spanish',
      'fr': 'Spanish',
      'nl': 'Spanish',
      'sv': 'Spanish',
    },
    'yzcm7xkm': {
      'en': '',
      'da': '',
      'de': '',
      'es': '',
      'fr': '',
      'nl': '',
      'sv': '',
    },
  },
  // Ajouteruntag
  {
    '4eudq5r5': {
      'en': 'Where are you going?',
      'da': 'Hvor skal du hen?',
      'de': 'Wo gehst du hin?',
      'es': '¿Adónde vas?',
      'fr': 'Où vas-tu?',
      'nl': 'Waar ga je heen?',
      'sv': 'Vart ska du?',
    },
    'ydo9234j': {
      'en': 'Add a note',
      'da': 'Tilføj en note',
      'de': 'Füg ein Notiz hinzu',
      'es': 'Agrega una nota',
      'fr': 'Ajouter une note',
      'nl': 'Voeg een notitie toe',
      'sv': 'Lägg till en anteckning',
    },
    'cv57l4ur': {
      'en': 'Create a tag here',
      'da': 'Opret et tag her',
      'de': 'Erstellen Sie hier einen Tag',
      'es': 'Crea una etiqueta aquí',
      'fr': 'Créer un tag ici',
      'nl': 'Maak hier een tag aan',
      'sv': 'Skapa en tagg här',
    },
    'wqt6wm95': {
      'en': 'New tag',
      'da': 'Ny tag',
      'de': 'Neuer Tag',
      'es': 'Nueva etiqueta',
      'fr': 'Nouveau tag',
      'nl': 'Nieuw label',
      'sv': 'Ny tag',
    },
  },
  // Probleme
  {
    'vz2vypfd': {
      'en': 'Set your location \nservices',
      'da': '',
      'de': '',
      'es': '',
      'fr': 'Choix de la langue',
      'nl': '',
      'sv': '',
    },
    'vsmw8pvt': {
      'en': 'We use your location to show you potential\nmatches in your area.',
      'da': '',
      'de': '',
      'es': '',
      'fr': '',
      'nl': '',
      'sv': '',
    },
    '03tpdewb': {
      'en': 'Set location services',
      'da': 'Lad os køre!',
      'de': 'Lass uns reiten!',
      'es': '¡Montemos!',
      'fr': 'Créer unj',
      'nl': 'Laten we rijden!',
      'sv': 'Nu kör vi!',
    },
    'gedppbss': {
      'en': 'Home',
      'da': '',
      'de': '',
      'es': '',
      'fr': '',
      'nl': '',
      'sv': '',
    },
  },
  // success
  {
    '5n1geuy3': {
      'en': 'Tag saved',
      'da': '',
      'de': '',
      'es': '',
      'fr': 'Tag enregistré',
      'nl': '',
      'sv': '',
    },
  },
  // aucunresultat
  {
    '3bhhblrs': {
      'en': 'No bike rake here',
      'da': 'Ingen cykelrive her',
      'de': 'Hier gibt es keinen Fahrradrechen',
      'es': 'No hay rastrillo de bicicletas aquí',
      'fr': 'Pas d\'arceau à vélo ici',
      'nl': 'Geen fietshark hier',
      'sv': 'Ingen cykelkratta här',
    },
  },
  // Miscellaneous
  {
    'pffpfy16': {
      'en':
          'Tag My Bike would like to access your location. This allows us to locate nearby bike racks and to save where you\'ve parked your bike. Keep your bike safe and easily find it again!',
      'da':
          'Tag My Bike vil gerne have adgang til din placering. Dette giver os mulighed for at lokalisere nærliggende cykelstativer og gemme, hvor du har parkeret din cykel. Parker din cykel sikkert og find den nemt igen!',
      'de':
          'Tag My Bike möchte auf Ihren Standort zugreifen. Dadurch können wir Fahrradständer in der Nähe lokalisieren und speichern, wo Sie Ihr Fahrrad abgestellt haben. Parken Sie Ihr Fahrrad sicher und finden Sie es leicht wieder!',
      'es':
          'Tag My Bike desea acceder a su ubicación. Esto nos permite localizar aparcabicicletas cercanos y guardar dónde ha aparcado su bicicleta. ¡Estacione su bicicleta de manera segura y vuelva a encontrarla fácilmente!',
      'fr':
          'Tag My Bike souhaite accéder à votre position. Cela nous permet de localiser les arceaux à vélos à proximité et de sauvegarder où vous avez garé votre vélo. Garez votre vélo en sécurité et retrouvez-le facilement !',
      'nl':
          'Tag My Bike wil graag toegang tot je locatie. Zo kunnen we fietsenrekken in de buurt vinden en opslaan waar je je fiets hebt geparkeerd. Parkeer je fiets veilig en vind hem gemakkelijk terug!',
      'sv':
          'Tag My Bike vill komma åt din plats. Detta gör att vi kan hitta närliggande cykelställ och spara var du har parkerat din cykel. Parkera din cykel säkert och hitta den enkelt igen!',
    },
    't7ezt3ne': {
      'en': '',
      'da': '',
      'de': '',
      'es': '',
      'fr': '',
      'nl': '',
      'sv': '',
    },
    'wbtou8ic': {
      'en': '',
      'da': '',
      'de': '',
      'es': '',
      'fr': '',
      'nl': '',
      'sv': '',
    },
    'fzfgk1fz': {
      'en': '',
      'da': '',
      'de': '',
      'es': '',
      'fr': '',
      'nl': '',
      'sv': '',
    },
    'eaz9g48l': {
      'en': '',
      'da': '',
      'de': '',
      'es': '',
      'fr': '',
      'nl': '',
      'sv': '',
    },
    '0wq0f601': {
      'en': '',
      'da': '',
      'de': '',
      'es': '',
      'fr': '',
      'nl': '',
      'sv': '',
    },
    '5zos2vbk': {
      'en': '',
      'da': '',
      'de': '',
      'es': '',
      'fr': '',
      'nl': '',
      'sv': '',
    },
    '6rxheuux': {
      'en': '',
      'da': '',
      'de': '',
      'es': '',
      'fr': '',
      'nl': '',
      'sv': '',
    },
    'tvrxsqbd': {
      'en': '',
      'da': '',
      'de': '',
      'es': '',
      'fr': '',
      'nl': '',
      'sv': '',
    },
    'qchtbief': {
      'en': '',
      'da': '',
      'de': '',
      'es': '',
      'fr': '',
      'nl': '',
      'sv': '',
    },
    '7q81rxz1': {
      'en': '',
      'da': '',
      'de': '',
      'es': '',
      'fr': '',
      'nl': '',
      'sv': '',
    },
    'l6glg06t': {
      'en': '',
      'da': '',
      'de': '',
      'es': '',
      'fr': '',
      'nl': '',
      'sv': '',
    },
    'ctlks58d': {
      'en': '',
      'da': '',
      'de': '',
      'es': '',
      'fr': '',
      'nl': '',
      'sv': '',
    },
    '28hmgjr8': {
      'en': '',
      'da': '',
      'de': '',
      'es': '',
      'fr': '',
      'nl': '',
      'sv': '',
    },
    'kwhwmxzz': {
      'en': '',
      'da': '',
      'de': '',
      'es': '',
      'fr': '',
      'nl': '',
      'sv': '',
    },
    'ekhc4m4v': {
      'en': '',
      'da': '',
      'de': '',
      'es': '',
      'fr': '',
      'nl': '',
      'sv': '',
    },
    'vkaijguv': {
      'en': '',
      'da': '',
      'de': '',
      'es': '',
      'fr': '',
      'nl': '',
      'sv': '',
    },
    't8i8erye': {
      'en': '',
      'da': '',
      'de': '',
      'es': '',
      'fr': '',
      'nl': '',
      'sv': '',
    },
    'w7re55qh': {
      'en': '',
      'da': '',
      'de': '',
      'es': '',
      'fr': '',
      'nl': '',
      'sv': '',
    },
    'ok7cleab': {
      'en': '',
      'da': '',
      'de': '',
      'es': '',
      'fr': '',
      'nl': '',
      'sv': '',
    },
    'ykzlg0f1': {
      'en': '',
      'da': '',
      'de': '',
      'es': '',
      'fr': '',
      'nl': '',
      'sv': '',
    },
    'jth1u9s1': {
      'en': '',
      'da': '',
      'de': '',
      'es': '',
      'fr': '',
      'nl': '',
      'sv': '',
    },
    'o3fhif65': {
      'en': '',
      'da': '',
      'de': '',
      'es': '',
      'fr': '',
      'nl': '',
      'sv': '',
    },
    'xpq81qal': {
      'en': '',
      'da': '',
      'de': '',
      'es': '',
      'fr': '',
      'nl': '',
      'sv': '',
    },
  },
].reduce((a, b) => a..addAll(b));
