/// Generated file. Do not edit.
///
/// Original: lib/i18n
/// To regenerate, run: `dart run slang`
///
/// Locales: 3
/// Strings: 57 (19 per locale)
///
/// Built on 2024-08-14 at 13:27 UTC

// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:flutter/widgets.dart';
import 'package:slang/builder/model/node.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

const AppLocale _baseLocale = AppLocale.en;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale with BaseAppLocale<AppLocale, Translations> {
	en(languageCode: 'en', build: Translations.build),
	hi(languageCode: 'hi', build: _StringsHi.build),
	mr(languageCode: 'mr', build: _StringsMr.build);

	const AppLocale({required this.languageCode, this.scriptCode, this.countryCode, required this.build}); // ignore: unused_element

	@override final String languageCode;
	@override final String? scriptCode;
	@override final String? countryCode;
	@override final TranslationBuilder<AppLocale, Translations> build;

	/// Gets current instance managed by [LocaleSettings].
	Translations get translations => LocaleSettings.instance.translationMap[this]!;
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = t.someKey.anotherKey;
/// String b = t['someKey.anotherKey']; // Only for edge cases!
Translations get t => LocaleSettings.instance.currentTranslations;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
/// String b = t['someKey.anotherKey']; // Only for edge cases!
class TranslationProvider extends BaseTranslationProvider<AppLocale, Translations> {
	TranslationProvider({required super.child}) : super(settings: LocaleSettings.instance);

	static InheritedLocaleData<AppLocale, Translations> of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.t.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
	Translations get t => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings extends BaseFlutterLocaleSettings<AppLocale, Translations> {
	LocaleSettings._() : super(utils: AppLocaleUtils.instance);

	static final instance = LocaleSettings._();

	// static aliases (checkout base methods for documentation)
	static AppLocale get currentLocale => instance.currentLocale;
	static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
	static AppLocale setLocale(AppLocale locale, {bool? listenToDeviceLocale = false}) => instance.setLocale(locale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale setLocaleRaw(String rawLocale, {bool? listenToDeviceLocale = false}) => instance.setLocaleRaw(rawLocale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale useDeviceLocale() => instance.useDeviceLocale();
	@Deprecated('Use [AppLocaleUtils.supportedLocales]') static List<Locale> get supportedLocales => instance.supportedLocales;
	@Deprecated('Use [AppLocaleUtils.supportedLocalesRaw]') static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
	static void setPluralResolver({String? language, AppLocale? locale, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver}) => instance.setPluralResolver(
		language: language,
		locale: locale,
		cardinalResolver: cardinalResolver,
		ordinalResolver: ordinalResolver,
	);
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, Translations> {
	AppLocaleUtils._() : super(baseLocale: _baseLocale, locales: AppLocale.values);

	static final instance = AppLocaleUtils._();

	// static aliases (checkout base methods for documentation)
	static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
	static AppLocale parseLocaleParts({required String languageCode, String? scriptCode, String? countryCode}) => instance.parseLocaleParts(languageCode: languageCode, scriptCode: scriptCode, countryCode: countryCode);
	static AppLocale findDeviceLocale() => instance.findDeviceLocale();
	static List<Locale> get supportedLocales => instance.supportedLocales;
	static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
}

// translations

// Path: <root>
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	// Translations
	String get language => 'English';
	String get hello => 'Hello';
	String get forgot_password => 'Forgot password';
	String get login => 'Login';
	String get dont_have_account => 'Don\'t have an account';
	String get email_address => 'Email Address';
	String get password => 'Password';
	String get signup => 'Sign Up';
	String get food_to_blow_your_mind => 'Food to blow your mind!';
	String get craving => 'Whether you\'re craving pizza, sushi, or..., we have got your back.';
	String get get_started => 'Get Started';
	String get deliver_to => 'Deliver to:';
	String get search_for_vendor_or_product => 'Search for a vendor or product';
	String get popular_restaurants => 'Popular Restaurants';
	String get view_all => 'View all';
	String get home => 'Home';
	String get bag => 'Bag';
	String get orders => 'Orders';
	String get profile => 'Profile';
}

// Path: <root>
class _StringsHi implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsHi.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.hi,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <hi>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	@override late final _StringsHi _root = this; // ignore: unused_field

	// Translations
	@override String get language => 'Hindi';
	@override String get hello => 'नमस्ते';
	@override String get forgot_password => 'पासवर्ड भूल गए';
	@override String get login => 'लॉगिन';
	@override String get dont_have_account => 'क्या आपके पास खाता नहीं है?';
	@override String get email_address => 'ईमेल पता';
	@override String get password => 'पासवर्ड';
	@override String get signup => 'साइन अप करें';
	@override String get food_to_blow_your_mind => 'खाना जो आपके होश उड़ा देगा!';
	@override String get craving => 'चाहे आपको पिज्जा, सुशी, या... की तलब हो, हम आपके साथ हैं।';
	@override String get get_started => 'शुरू करें';
	@override String get deliver_to => 'यहां डिलीवर करें:';
	@override String get search_for_vendor_or_product => 'वेंडर या उत्पाद खोजें';
	@override String get popular_restaurants => 'लोकप्रिय रेस्टोरेंट्स';
	@override String get view_all => 'सभी देखें';
	@override String get home => 'होम';
	@override String get bag => 'बैग';
	@override String get orders => 'आर्डर';
	@override String get profile => 'प्रोफ़ाइल';
}

// Path: <root>
class _StringsMr implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsMr.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.mr,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <mr>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	@override late final _StringsMr _root = this; // ignore: unused_field

	// Translations
	@override String get language => 'Marathi';
	@override String get hello => 'नमस्कार';
	@override String get forgot_password => 'पासवर्ड विसरलात';
	@override String get login => 'लॉगिन';
	@override String get dont_have_account => 'तुमच्याकडे खाते नाही?';
	@override String get email_address => 'ईमेल पत्ता';
	@override String get password => 'पासवर्ड';
	@override String get signup => 'साइन अप करा';
	@override String get food_to_blow_your_mind => 'अतिशय चविष्ट खाद्यपदार्थ!';
	@override String get craving => 'तुम्हाला पिझ्झा, सुशी किंवा ...ची इच्छा असली तरी, आम्ही तुमच्यासोबत आहोत.';
	@override String get get_started => 'सुरु करा';
	@override String get deliver_to => 'डिलिव्हर करा:';
	@override String get search_for_vendor_or_product => 'विक्रेता किंवा उत्पादने शोधा';
	@override String get popular_restaurants => 'लोकप्रिय रेस्टॉरंट्स';
	@override String get view_all => 'सर्व पाहा';
	@override String get home => 'होम';
	@override String get bag => 'बॅग';
	@override String get orders => 'ऑर्डर';
	@override String get profile => 'प्रोफाइल';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'language': return 'English';
			case 'hello': return 'Hello';
			case 'forgot_password': return 'Forgot password';
			case 'login': return 'Login';
			case 'dont_have_account': return 'Don\'t have an account';
			case 'email_address': return 'Email Address';
			case 'password': return 'Password';
			case 'signup': return 'Sign Up';
			case 'food_to_blow_your_mind': return 'Food to blow your mind!';
			case 'craving': return 'Whether you\'re craving pizza, sushi, or..., we have got your back.';
			case 'get_started': return 'Get Started';
			case 'deliver_to': return 'Deliver to:';
			case 'search_for_vendor_or_product': return 'Search for a vendor or product';
			case 'popular_restaurants': return 'Popular Restaurants';
			case 'view_all': return 'View all';
			case 'home': return 'Home';
			case 'bag': return 'Bag';
			case 'orders': return 'Orders';
			case 'profile': return 'Profile';
			default: return null;
		}
	}
}

extension on _StringsHi {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'language': return 'Hindi';
			case 'hello': return 'नमस्ते';
			case 'forgot_password': return 'पासवर्ड भूल गए';
			case 'login': return 'लॉगिन';
			case 'dont_have_account': return 'क्या आपके पास खाता नहीं है?';
			case 'email_address': return 'ईमेल पता';
			case 'password': return 'पासवर्ड';
			case 'signup': return 'साइन अप करें';
			case 'food_to_blow_your_mind': return 'खाना जो आपके होश उड़ा देगा!';
			case 'craving': return 'चाहे आपको पिज्जा, सुशी, या... की तलब हो, हम आपके साथ हैं।';
			case 'get_started': return 'शुरू करें';
			case 'deliver_to': return 'यहां डिलीवर करें:';
			case 'search_for_vendor_or_product': return 'वेंडर या उत्पाद खोजें';
			case 'popular_restaurants': return 'लोकप्रिय रेस्टोरेंट्स';
			case 'view_all': return 'सभी देखें';
			case 'home': return 'होम';
			case 'bag': return 'बैग';
			case 'orders': return 'आर्डर';
			case 'profile': return 'प्रोफ़ाइल';
			default: return null;
		}
	}
}

extension on _StringsMr {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'language': return 'Marathi';
			case 'hello': return 'नमस्कार';
			case 'forgot_password': return 'पासवर्ड विसरलात';
			case 'login': return 'लॉगिन';
			case 'dont_have_account': return 'तुमच्याकडे खाते नाही?';
			case 'email_address': return 'ईमेल पत्ता';
			case 'password': return 'पासवर्ड';
			case 'signup': return 'साइन अप करा';
			case 'food_to_blow_your_mind': return 'अतिशय चविष्ट खाद्यपदार्थ!';
			case 'craving': return 'तुम्हाला पिझ्झा, सुशी किंवा ...ची इच्छा असली तरी, आम्ही तुमच्यासोबत आहोत.';
			case 'get_started': return 'सुरु करा';
			case 'deliver_to': return 'डिलिव्हर करा:';
			case 'search_for_vendor_or_product': return 'विक्रेता किंवा उत्पादने शोधा';
			case 'popular_restaurants': return 'लोकप्रिय रेस्टॉरंट्स';
			case 'view_all': return 'सर्व पाहा';
			case 'home': return 'होम';
			case 'bag': return 'बॅग';
			case 'orders': return 'ऑर्डर';
			case 'profile': return 'प्रोफाइल';
			default: return null;
		}
	}
}
