/// Generated file. Do not edit.
///
/// Original: lib/features/localization
/// To regenerate, run: `dart run slang`
///
/// Locales: 4
/// Strings: 176 (44 per locale)
///
/// Built on 2024-08-11 at 13:39 UTC

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
	ar(languageCode: 'ar', build: _StringsAr.build),
	tr(languageCode: 'tr', build: _StringsTr.build),
	uk(languageCode: 'uk', build: _StringsUk.build);

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
	late final _StringsBottomNavigationEn bottomNavigation = _StringsBottomNavigationEn._(_root);
	late final _StringsHomeEn home = _StringsHomeEn._(_root);
	late final _StringsRequestsEn requests = _StringsRequestsEn._(_root);
	late final _StringsProfileEn profile = _StringsProfileEn._(_root);
	late final _StringsActionsEn actions = _StringsActionsEn._(_root);
}

// Path: bottomNavigation
class _StringsBottomNavigationEn {
	_StringsBottomNavigationEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get home => 'Home';
	String get requests => 'Requests';
	String get profile => 'Profile';
}

// Path: home
class _StringsHomeEn {
	_StringsHomeEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'We can help.';
	late final _StringsHomeActionsEn actions = _StringsHomeActionsEn._(_root);
	late final _StringsHomeAdditionalServicesEn additionalServices = _StringsHomeAdditionalServicesEn._(_root);
}

// Path: requests
class _StringsRequestsEn {
	_StringsRequestsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Requests';
	late final _StringsRequestsActionsEn actions = _StringsRequestsActionsEn._(_root);
	String get status => 'Status';
	String get caseId => 'Case ID';
	late final _StringsRequestsRequestDetailsEn requestDetails = _StringsRequestsRequestDetailsEn._(_root);
	String get noRequests => 'No requests found. Create a new request to see it here.';
}

// Path: profile
class _StringsProfileEn {
	_StringsProfileEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Profile';
	late final _StringsProfileActionsEn actions = _StringsProfileActionsEn._(_root);
	late final _StringsProfilePersonalInformationEn personalInformation = _StringsProfilePersonalInformationEn._(_root);
	late final _StringsProfileAccountEn account = _StringsProfileAccountEn._(_root);
	late final _StringsProfileUnhcrInformationEn unhcrInformation = _StringsProfileUnhcrInformationEn._(_root);
	late final _StringsProfileSettingsEn settings = _StringsProfileSettingsEn._(_root);
}

// Path: actions
class _StringsActionsEn {
	_StringsActionsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get signIn => 'Sign In';
}

// Path: home.actions
class _StringsHomeActionsEn {
	_StringsHomeActionsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get requestAssistance => 'Request Assistance';
}

// Path: home.additionalServices
class _StringsHomeAdditionalServicesEn {
	_StringsHomeAdditionalServicesEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Additional Services';
	late final _StringsHomeAdditionalServicesScholarshipsEn scholarships = _StringsHomeAdditionalServicesScholarshipsEn._(_root);
	late final _StringsHomeAdditionalServicesJoinJobpoolEn joinJobpool = _StringsHomeAdditionalServicesJoinJobpoolEn._(_root);
	late final _StringsHomeAdditionalServicesFlagSocialTensionEn flagSocialTension = _StringsHomeAdditionalServicesFlagSocialTensionEn._(_root);
	late final _StringsHomeAdditionalServicesFlagFraudEn flagFraud = _StringsHomeAdditionalServicesFlagFraudEn._(_root);
	late final _StringsHomeAdditionalServicesGiveFeedbackEn giveFeedback = _StringsHomeAdditionalServicesGiveFeedbackEn._(_root);
	late final _StringsHomeAdditionalServicesCheckResettlementEn checkResettlement = _StringsHomeAdditionalServicesCheckResettlementEn._(_root);
}

// Path: requests.actions
class _StringsRequestsActionsEn {
	_StringsRequestsActionsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get newRequest => 'Create New Request';
}

// Path: requests.requestDetails
class _StringsRequestsRequestDetailsEn {
	_StringsRequestsRequestDetailsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Request Details';
	String get goToChat => 'Go to Chat';
}

// Path: profile.actions
class _StringsProfileActionsEn {
	_StringsProfileActionsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get editProfile => 'Edit Profile';
}

// Path: profile.personalInformation
class _StringsProfilePersonalInformationEn {
	_StringsProfilePersonalInformationEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Personal Information';
	String get name => 'Name';
	String get surname => 'Surname';
	String get dateOfBirth => 'Date of Birth';
	String get location => 'Location';
	String get householdSize => 'Household Size';
}

// Path: profile.account
class _StringsProfileAccountEn {
	_StringsProfileAccountEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Account';
	String get email => 'Email';
	String get phoneNumber => 'Phone Number';
}

// Path: profile.unhcrInformation
class _StringsProfileUnhcrInformationEn {
	_StringsProfileUnhcrInformationEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'UNHCR Information';
	String get unhcrCaseNumber => 'UNHCR Case Number';
	String get coaIDNumber => 'COA ID Number';
}

// Path: profile.settings
class _StringsProfileSettingsEn {
	_StringsProfileSettingsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Settings';
	String get language => 'Language';
	String get receiveNotifications => 'Receive Notifications';
	String get receiveMessages => 'Receive Messages';
}

// Path: home.additionalServices.scholarships
class _StringsHomeAdditionalServicesScholarshipsEn {
	_StringsHomeAdditionalServicesScholarshipsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Scholarships';
	String get description => 'Find scholarships that match your profile.';
}

// Path: home.additionalServices.joinJobpool
class _StringsHomeAdditionalServicesJoinJobpoolEn {
	_StringsHomeAdditionalServicesJoinJobpoolEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Join Job Pool';
	String get description => 'Get matched with employers looking for your skills.';
}

// Path: home.additionalServices.flagSocialTension
class _StringsHomeAdditionalServicesFlagSocialTensionEn {
	_StringsHomeAdditionalServicesFlagSocialTensionEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Flag Social Tension';
	String get description => 'Report social tension in your community.';
}

// Path: home.additionalServices.flagFraud
class _StringsHomeAdditionalServicesFlagFraudEn {
	_StringsHomeAdditionalServicesFlagFraudEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Flag Fraud';
	String get description => 'Report fraud in your community.';
}

// Path: home.additionalServices.giveFeedback
class _StringsHomeAdditionalServicesGiveFeedbackEn {
	_StringsHomeAdditionalServicesGiveFeedbackEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Give Feedback';
	String get description => 'Help us improve our services.';
}

// Path: home.additionalServices.checkResettlement
class _StringsHomeAdditionalServicesCheckResettlementEn {
	_StringsHomeAdditionalServicesCheckResettlementEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Check Resettlement Status';
	String get description => 'Check the status of your resettlement application.';
}

// Path: <root>
class _StringsAr implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsAr.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.ar,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ar>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	@override late final _StringsAr _root = this; // ignore: unused_field

	// Translations
	@override late final _StringsBottomNavigationAr bottomNavigation = _StringsBottomNavigationAr._(_root);
	@override late final _StringsHomeAr home = _StringsHomeAr._(_root);
	@override late final _StringsRequestsAr requests = _StringsRequestsAr._(_root);
	@override late final _StringsProfileAr profile = _StringsProfileAr._(_root);
	@override late final _StringsActionsAr actions = _StringsActionsAr._(_root);
}

// Path: bottomNavigation
class _StringsBottomNavigationAr implements _StringsBottomNavigationEn {
	_StringsBottomNavigationAr._(this._root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get home => 'الصفحة الرئيسية';
	@override String get requests => 'الطلبات';
	@override String get profile => 'الملف الشخصي';
}

// Path: home
class _StringsHomeAr implements _StringsHomeEn {
	_StringsHomeAr._(this._root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'يمكننا المساعدة.';
	@override late final _StringsHomeActionsAr actions = _StringsHomeActionsAr._(_root);
	@override late final _StringsHomeAdditionalServicesAr additionalServices = _StringsHomeAdditionalServicesAr._(_root);
}

// Path: requests
class _StringsRequestsAr implements _StringsRequestsEn {
	_StringsRequestsAr._(this._root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'الطلبات';
	@override late final _StringsRequestsActionsAr actions = _StringsRequestsActionsAr._(_root);
	@override String get status => 'الحالة';
	@override String get caseId => 'معرف القضية';
	@override late final _StringsRequestsRequestDetailsAr requestDetails = _StringsRequestsRequestDetailsAr._(_root);
	@override String get noRequests => 'لم يتم العثور على طلبات. أنشئ طلبًا جديدًا لرؤيته هنا.';
}

// Path: profile
class _StringsProfileAr implements _StringsProfileEn {
	_StringsProfileAr._(this._root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'الملف الشخصي';
	@override late final _StringsProfileActionsAr actions = _StringsProfileActionsAr._(_root);
	@override late final _StringsProfilePersonalInformationAr personalInformation = _StringsProfilePersonalInformationAr._(_root);
	@override late final _StringsProfileAccountAr account = _StringsProfileAccountAr._(_root);
	@override late final _StringsProfileUnhcrInformationAr unhcrInformation = _StringsProfileUnhcrInformationAr._(_root);
	@override late final _StringsProfileSettingsAr settings = _StringsProfileSettingsAr._(_root);
}

// Path: actions
class _StringsActionsAr implements _StringsActionsEn {
	_StringsActionsAr._(this._root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get signIn => 'تسجيل الدخول';
}

// Path: home.actions
class _StringsHomeActionsAr implements _StringsHomeActionsEn {
	_StringsHomeActionsAr._(this._root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get requestAssistance => 'طلب المساعدة';
}

// Path: home.additionalServices
class _StringsHomeAdditionalServicesAr implements _StringsHomeAdditionalServicesEn {
	_StringsHomeAdditionalServicesAr._(this._root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'خدمات إضافية';
	@override late final _StringsHomeAdditionalServicesScholarshipsAr scholarships = _StringsHomeAdditionalServicesScholarshipsAr._(_root);
	@override late final _StringsHomeAdditionalServicesJoinJobpoolAr joinJobpool = _StringsHomeAdditionalServicesJoinJobpoolAr._(_root);
	@override late final _StringsHomeAdditionalServicesFlagSocialTensionAr flagSocialTension = _StringsHomeAdditionalServicesFlagSocialTensionAr._(_root);
	@override late final _StringsHomeAdditionalServicesFlagFraudAr flagFraud = _StringsHomeAdditionalServicesFlagFraudAr._(_root);
	@override late final _StringsHomeAdditionalServicesGiveFeedbackAr giveFeedback = _StringsHomeAdditionalServicesGiveFeedbackAr._(_root);
	@override late final _StringsHomeAdditionalServicesCheckResettlementAr checkResettlement = _StringsHomeAdditionalServicesCheckResettlementAr._(_root);
}

// Path: requests.actions
class _StringsRequestsActionsAr implements _StringsRequestsActionsEn {
	_StringsRequestsActionsAr._(this._root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get newRequest => 'إنشاء طلب جديد';
}

// Path: requests.requestDetails
class _StringsRequestsRequestDetailsAr implements _StringsRequestsRequestDetailsEn {
	_StringsRequestsRequestDetailsAr._(this._root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'تفاصيل الطلب';
	@override String get goToChat => 'اذهب إلى الدردشة';
}

// Path: profile.actions
class _StringsProfileActionsAr implements _StringsProfileActionsEn {
	_StringsProfileActionsAr._(this._root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get editProfile => 'تعديل الملف الشخصي';
}

// Path: profile.personalInformation
class _StringsProfilePersonalInformationAr implements _StringsProfilePersonalInformationEn {
	_StringsProfilePersonalInformationAr._(this._root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'معلومات شخصية';
	@override String get name => 'الاسم';
	@override String get surname => 'اللقب';
	@override String get dateOfBirth => 'تاريخ الميلاد';
	@override String get location => 'الموقع';
	@override String get householdSize => 'حجم الأسرة';
}

// Path: profile.account
class _StringsProfileAccountAr implements _StringsProfileAccountEn {
	_StringsProfileAccountAr._(this._root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'الحساب';
	@override String get email => 'البريد الإلكتروني';
	@override String get phoneNumber => 'رقم الهاتف';
}

// Path: profile.unhcrInformation
class _StringsProfileUnhcrInformationAr implements _StringsProfileUnhcrInformationEn {
	_StringsProfileUnhcrInformationAr._(this._root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'معلومات المفوضية';
	@override String get unhcrCaseNumber => 'رقم قضية المفوضية';
	@override String get coaIDNumber => 'رقم هوية COA';
}

// Path: profile.settings
class _StringsProfileSettingsAr implements _StringsProfileSettingsEn {
	_StringsProfileSettingsAr._(this._root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'الإعدادات';
	@override String get language => 'اللغة';
	@override String get receiveNotifications => 'تلقي الإشعارات';
	@override String get receiveMessages => 'تلقي الرسائل';
}

// Path: home.additionalServices.scholarships
class _StringsHomeAdditionalServicesScholarshipsAr implements _StringsHomeAdditionalServicesScholarshipsEn {
	_StringsHomeAdditionalServicesScholarshipsAr._(this._root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'المنح الدراسية';
	@override String get description => 'ابحث عن المنح الدراسية التي تتناسب مع ملفك الشخصي.';
}

// Path: home.additionalServices.joinJobpool
class _StringsHomeAdditionalServicesJoinJobpoolAr implements _StringsHomeAdditionalServicesJoinJobpoolEn {
	_StringsHomeAdditionalServicesJoinJobpoolAr._(this._root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'انضم إلى تجمع الوظائف';
	@override String get description => 'تطابق مع أصحاب العمل الذين يبحثون عن مهاراتك.';
}

// Path: home.additionalServices.flagSocialTension
class _StringsHomeAdditionalServicesFlagSocialTensionAr implements _StringsHomeAdditionalServicesFlagSocialTensionEn {
	_StringsHomeAdditionalServicesFlagSocialTensionAr._(this._root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'أبلغ عن التوتر الاجتماعي';
	@override String get description => 'أبلغ عن التوتر الاجتماعي في مجتمعك.';
}

// Path: home.additionalServices.flagFraud
class _StringsHomeAdditionalServicesFlagFraudAr implements _StringsHomeAdditionalServicesFlagFraudEn {
	_StringsHomeAdditionalServicesFlagFraudAr._(this._root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'أبلغ عن الاحتيال';
	@override String get description => 'أبلغ عن الاحتيال في مجتمعك.';
}

// Path: home.additionalServices.giveFeedback
class _StringsHomeAdditionalServicesGiveFeedbackAr implements _StringsHomeAdditionalServicesGiveFeedbackEn {
	_StringsHomeAdditionalServicesGiveFeedbackAr._(this._root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'أعط ملاحظات';
	@override String get description => 'ساعدنا في تحسين خدماتنا.';
}

// Path: home.additionalServices.checkResettlement
class _StringsHomeAdditionalServicesCheckResettlementAr implements _StringsHomeAdditionalServicesCheckResettlementEn {
	_StringsHomeAdditionalServicesCheckResettlementAr._(this._root);

	@override final _StringsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'تحقق من حالة إعادة التوطين';
	@override String get description => 'تحقق من حالة طلب إعادة التوطين الخاص بك.';
}

// Path: <root>
class _StringsTr implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsTr.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.tr,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <tr>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	@override late final _StringsTr _root = this; // ignore: unused_field

	// Translations
	@override late final _StringsBottomNavigationTr bottomNavigation = _StringsBottomNavigationTr._(_root);
	@override late final _StringsHomeTr home = _StringsHomeTr._(_root);
	@override late final _StringsRequestsTr requests = _StringsRequestsTr._(_root);
	@override late final _StringsProfileTr profile = _StringsProfileTr._(_root);
	@override late final _StringsActionsTr actions = _StringsActionsTr._(_root);
}

// Path: bottomNavigation
class _StringsBottomNavigationTr implements _StringsBottomNavigationEn {
	_StringsBottomNavigationTr._(this._root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get home => 'Ana Sayfa';
	@override String get requests => 'Talepler';
	@override String get profile => 'Profil';
}

// Path: home
class _StringsHomeTr implements _StringsHomeEn {
	_StringsHomeTr._(this._root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Yardımcı olabiliriz.';
	@override late final _StringsHomeActionsTr actions = _StringsHomeActionsTr._(_root);
	@override late final _StringsHomeAdditionalServicesTr additionalServices = _StringsHomeAdditionalServicesTr._(_root);
}

// Path: requests
class _StringsRequestsTr implements _StringsRequestsEn {
	_StringsRequestsTr._(this._root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Talepler';
	@override late final _StringsRequestsActionsTr actions = _StringsRequestsActionsTr._(_root);
	@override String get status => 'Durum';
	@override String get caseId => 'Dava ID';
	@override late final _StringsRequestsRequestDetailsTr requestDetails = _StringsRequestsRequestDetailsTr._(_root);
	@override String get noRequests => 'Talep bulunamadı. Burada görmek için yeni bir talep oluşturun.';
}

// Path: profile
class _StringsProfileTr implements _StringsProfileEn {
	_StringsProfileTr._(this._root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Profil';
	@override late final _StringsProfileActionsTr actions = _StringsProfileActionsTr._(_root);
	@override late final _StringsProfilePersonalInformationTr personalInformation = _StringsProfilePersonalInformationTr._(_root);
	@override late final _StringsProfileAccountTr account = _StringsProfileAccountTr._(_root);
	@override late final _StringsProfileUnhcrInformationTr unhcrInformation = _StringsProfileUnhcrInformationTr._(_root);
	@override late final _StringsProfileSettingsTr settings = _StringsProfileSettingsTr._(_root);
}

// Path: actions
class _StringsActionsTr implements _StringsActionsEn {
	_StringsActionsTr._(this._root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get signIn => 'Giriş Yap';
}

// Path: home.actions
class _StringsHomeActionsTr implements _StringsHomeActionsEn {
	_StringsHomeActionsTr._(this._root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get requestAssistance => 'Yardım Talep Et';
}

// Path: home.additionalServices
class _StringsHomeAdditionalServicesTr implements _StringsHomeAdditionalServicesEn {
	_StringsHomeAdditionalServicesTr._(this._root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ek Hizmetler';
	@override late final _StringsHomeAdditionalServicesScholarshipsTr scholarships = _StringsHomeAdditionalServicesScholarshipsTr._(_root);
	@override late final _StringsHomeAdditionalServicesJoinJobpoolTr joinJobpool = _StringsHomeAdditionalServicesJoinJobpoolTr._(_root);
	@override late final _StringsHomeAdditionalServicesFlagSocialTensionTr flagSocialTension = _StringsHomeAdditionalServicesFlagSocialTensionTr._(_root);
	@override late final _StringsHomeAdditionalServicesFlagFraudTr flagFraud = _StringsHomeAdditionalServicesFlagFraudTr._(_root);
	@override late final _StringsHomeAdditionalServicesGiveFeedbackTr giveFeedback = _StringsHomeAdditionalServicesGiveFeedbackTr._(_root);
	@override late final _StringsHomeAdditionalServicesCheckResettlementTr checkResettlement = _StringsHomeAdditionalServicesCheckResettlementTr._(_root);
}

// Path: requests.actions
class _StringsRequestsActionsTr implements _StringsRequestsActionsEn {
	_StringsRequestsActionsTr._(this._root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get newRequest => 'Yeni Talep Oluştur';
}

// Path: requests.requestDetails
class _StringsRequestsRequestDetailsTr implements _StringsRequestsRequestDetailsEn {
	_StringsRequestsRequestDetailsTr._(this._root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Talep Detayları';
	@override String get goToChat => 'Sohbete Git';
}

// Path: profile.actions
class _StringsProfileActionsTr implements _StringsProfileActionsEn {
	_StringsProfileActionsTr._(this._root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get editProfile => 'Profili Düzenle';
}

// Path: profile.personalInformation
class _StringsProfilePersonalInformationTr implements _StringsProfilePersonalInformationEn {
	_StringsProfilePersonalInformationTr._(this._root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Kişisel Bilgiler';
	@override String get name => 'İsim';
	@override String get surname => 'Soyisim';
	@override String get dateOfBirth => 'Doğum Tarihi';
	@override String get location => 'Konum';
	@override String get householdSize => 'Hane Büyüklüğü';
}

// Path: profile.account
class _StringsProfileAccountTr implements _StringsProfileAccountEn {
	_StringsProfileAccountTr._(this._root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Hesap';
	@override String get email => 'E-posta';
	@override String get phoneNumber => 'Telefon Numarası';
}

// Path: profile.unhcrInformation
class _StringsProfileUnhcrInformationTr implements _StringsProfileUnhcrInformationEn {
	_StringsProfileUnhcrInformationTr._(this._root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'UNHCR Bilgileri';
	@override String get unhcrCaseNumber => 'UNHCR Dava Numarası';
	@override String get coaIDNumber => 'COA Kimlik Numarası';
}

// Path: profile.settings
class _StringsProfileSettingsTr implements _StringsProfileSettingsEn {
	_StringsProfileSettingsTr._(this._root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ayarlar';
	@override String get language => 'Dil';
	@override String get receiveNotifications => 'Bildirimleri Al';
	@override String get receiveMessages => 'Mesajları Al';
}

// Path: home.additionalServices.scholarships
class _StringsHomeAdditionalServicesScholarshipsTr implements _StringsHomeAdditionalServicesScholarshipsEn {
	_StringsHomeAdditionalServicesScholarshipsTr._(this._root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Burslar';
	@override String get description => 'Profilinize uygun bursları bulun.';
}

// Path: home.additionalServices.joinJobpool
class _StringsHomeAdditionalServicesJoinJobpoolTr implements _StringsHomeAdditionalServicesJoinJobpoolEn {
	_StringsHomeAdditionalServicesJoinJobpoolTr._(this._root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'İş Havuzuna Katıl';
	@override String get description => 'Becerilerinize uygun işverenlerle eşleşin.';
}

// Path: home.additionalServices.flagSocialTension
class _StringsHomeAdditionalServicesFlagSocialTensionTr implements _StringsHomeAdditionalServicesFlagSocialTensionEn {
	_StringsHomeAdditionalServicesFlagSocialTensionTr._(this._root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Sosyal Gerginliği Bildir';
	@override String get description => 'Topluluğunuzda sosyal gerginliği bildirin.';
}

// Path: home.additionalServices.flagFraud
class _StringsHomeAdditionalServicesFlagFraudTr implements _StringsHomeAdditionalServicesFlagFraudEn {
	_StringsHomeAdditionalServicesFlagFraudTr._(this._root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Dolandırıcılığı Bildir';
	@override String get description => 'Topluluğunuzda dolandırıcılığı bildirin.';
}

// Path: home.additionalServices.giveFeedback
class _StringsHomeAdditionalServicesGiveFeedbackTr implements _StringsHomeAdditionalServicesGiveFeedbackEn {
	_StringsHomeAdditionalServicesGiveFeedbackTr._(this._root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Geri Bildirim Ver';
	@override String get description => 'Hizmetlerimizi geliştirmemize yardımcı olun.';
}

// Path: home.additionalServices.checkResettlement
class _StringsHomeAdditionalServicesCheckResettlementTr implements _StringsHomeAdditionalServicesCheckResettlementEn {
	_StringsHomeAdditionalServicesCheckResettlementTr._(this._root);

	@override final _StringsTr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Yerleşim Durumunu Kontrol Et';
	@override String get description => 'Yerleşim başvurunuzun durumunu kontrol edin.';
}

// Path: <root>
class _StringsUk implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsUk.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.uk,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <uk>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	@override late final _StringsUk _root = this; // ignore: unused_field

	// Translations
	@override late final _StringsBottomNavigationUk bottomNavigation = _StringsBottomNavigationUk._(_root);
	@override late final _StringsHomeUk home = _StringsHomeUk._(_root);
	@override late final _StringsRequestsUk requests = _StringsRequestsUk._(_root);
	@override late final _StringsProfileUk profile = _StringsProfileUk._(_root);
	@override late final _StringsActionsUk actions = _StringsActionsUk._(_root);
}

// Path: bottomNavigation
class _StringsBottomNavigationUk implements _StringsBottomNavigationEn {
	_StringsBottomNavigationUk._(this._root);

	@override final _StringsUk _root; // ignore: unused_field

	// Translations
	@override String get home => 'Головна';
	@override String get requests => 'Запити';
	@override String get profile => 'Профіль';
}

// Path: home
class _StringsHomeUk implements _StringsHomeEn {
	_StringsHomeUk._(this._root);

	@override final _StringsUk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ми можемо допомогти.';
	@override late final _StringsHomeActionsUk actions = _StringsHomeActionsUk._(_root);
	@override late final _StringsHomeAdditionalServicesUk additionalServices = _StringsHomeAdditionalServicesUk._(_root);
}

// Path: requests
class _StringsRequestsUk implements _StringsRequestsEn {
	_StringsRequestsUk._(this._root);

	@override final _StringsUk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Запити';
	@override late final _StringsRequestsActionsUk actions = _StringsRequestsActionsUk._(_root);
	@override String get status => 'Статус';
	@override String get caseId => 'Ідентифікатор справи';
	@override late final _StringsRequestsRequestDetailsUk requestDetails = _StringsRequestsRequestDetailsUk._(_root);
	@override String get noRequests => 'Запити відсутні. Створіть новий запит, щоб побачити його тут.';
}

// Path: profile
class _StringsProfileUk implements _StringsProfileEn {
	_StringsProfileUk._(this._root);

	@override final _StringsUk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Профіль';
	@override late final _StringsProfileActionsUk actions = _StringsProfileActionsUk._(_root);
	@override late final _StringsProfilePersonalInformationUk personalInformation = _StringsProfilePersonalInformationUk._(_root);
	@override late final _StringsProfileAccountUk account = _StringsProfileAccountUk._(_root);
	@override late final _StringsProfileUnhcrInformationUk unhcrInformation = _StringsProfileUnhcrInformationUk._(_root);
	@override late final _StringsProfileSettingsUk settings = _StringsProfileSettingsUk._(_root);
}

// Path: actions
class _StringsActionsUk implements _StringsActionsEn {
	_StringsActionsUk._(this._root);

	@override final _StringsUk _root; // ignore: unused_field

	// Translations
	@override String get signIn => 'Увійти';
}

// Path: home.actions
class _StringsHomeActionsUk implements _StringsHomeActionsEn {
	_StringsHomeActionsUk._(this._root);

	@override final _StringsUk _root; // ignore: unused_field

	// Translations
	@override String get requestAssistance => 'Запросити допомогу';
}

// Path: home.additionalServices
class _StringsHomeAdditionalServicesUk implements _StringsHomeAdditionalServicesEn {
	_StringsHomeAdditionalServicesUk._(this._root);

	@override final _StringsUk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Додаткові послуги';
	@override late final _StringsHomeAdditionalServicesScholarshipsUk scholarships = _StringsHomeAdditionalServicesScholarshipsUk._(_root);
	@override late final _StringsHomeAdditionalServicesJoinJobpoolUk joinJobpool = _StringsHomeAdditionalServicesJoinJobpoolUk._(_root);
	@override late final _StringsHomeAdditionalServicesFlagSocialTensionUk flagSocialTension = _StringsHomeAdditionalServicesFlagSocialTensionUk._(_root);
	@override late final _StringsHomeAdditionalServicesFlagFraudUk flagFraud = _StringsHomeAdditionalServicesFlagFraudUk._(_root);
	@override late final _StringsHomeAdditionalServicesGiveFeedbackUk giveFeedback = _StringsHomeAdditionalServicesGiveFeedbackUk._(_root);
	@override late final _StringsHomeAdditionalServicesCheckResettlementUk checkResettlement = _StringsHomeAdditionalServicesCheckResettlementUk._(_root);
}

// Path: requests.actions
class _StringsRequestsActionsUk implements _StringsRequestsActionsEn {
	_StringsRequestsActionsUk._(this._root);

	@override final _StringsUk _root; // ignore: unused_field

	// Translations
	@override String get newRequest => 'Створити новий запит';
}

// Path: requests.requestDetails
class _StringsRequestsRequestDetailsUk implements _StringsRequestsRequestDetailsEn {
	_StringsRequestsRequestDetailsUk._(this._root);

	@override final _StringsUk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Деталі запиту';
	@override String get goToChat => 'Перейти до чату';
}

// Path: profile.actions
class _StringsProfileActionsUk implements _StringsProfileActionsEn {
	_StringsProfileActionsUk._(this._root);

	@override final _StringsUk _root; // ignore: unused_field

	// Translations
	@override String get editProfile => 'Редагувати профіль';
}

// Path: profile.personalInformation
class _StringsProfilePersonalInformationUk implements _StringsProfilePersonalInformationEn {
	_StringsProfilePersonalInformationUk._(this._root);

	@override final _StringsUk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Особиста інформація';
	@override String get name => 'Ім\'я';
	@override String get surname => 'Прізвище';
	@override String get dateOfBirth => 'Дата народження';
	@override String get location => 'Місцезнаходження';
	@override String get householdSize => 'Розмір домогосподарства';
}

// Path: profile.account
class _StringsProfileAccountUk implements _StringsProfileAccountEn {
	_StringsProfileAccountUk._(this._root);

	@override final _StringsUk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Акаунт';
	@override String get email => 'Електронна пошта';
	@override String get phoneNumber => 'Номер телефону';
}

// Path: profile.unhcrInformation
class _StringsProfileUnhcrInformationUk implements _StringsProfileUnhcrInformationEn {
	_StringsProfileUnhcrInformationUk._(this._root);

	@override final _StringsUk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Інформація UNHCR';
	@override String get unhcrCaseNumber => 'Номер справи UNHCR';
	@override String get coaIDNumber => 'Номер ID COA';
}

// Path: profile.settings
class _StringsProfileSettingsUk implements _StringsProfileSettingsEn {
	_StringsProfileSettingsUk._(this._root);

	@override final _StringsUk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Налаштування';
	@override String get language => 'Мова';
	@override String get receiveNotifications => 'Отримувати сповіщення';
	@override String get receiveMessages => 'Отримувати повідомлення';
}

// Path: home.additionalServices.scholarships
class _StringsHomeAdditionalServicesScholarshipsUk implements _StringsHomeAdditionalServicesScholarshipsEn {
	_StringsHomeAdditionalServicesScholarshipsUk._(this._root);

	@override final _StringsUk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Стипендії';
	@override String get description => 'Знайдіть стипендії, що відповідають вашому профілю.';
}

// Path: home.additionalServices.joinJobpool
class _StringsHomeAdditionalServicesJoinJobpoolUk implements _StringsHomeAdditionalServicesJoinJobpoolEn {
	_StringsHomeAdditionalServicesJoinJobpoolUk._(this._root);

	@override final _StringsUk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Приєднатися до пулу вакансій';
	@override String get description => 'Знайдіть роботодавців, які шукають ваші навички.';
}

// Path: home.additionalServices.flagSocialTension
class _StringsHomeAdditionalServicesFlagSocialTensionUk implements _StringsHomeAdditionalServicesFlagSocialTensionEn {
	_StringsHomeAdditionalServicesFlagSocialTensionUk._(this._root);

	@override final _StringsUk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Повідомити про соціальну напруженість';
	@override String get description => 'Повідомте про соціальну напруженість у вашій громаді.';
}

// Path: home.additionalServices.flagFraud
class _StringsHomeAdditionalServicesFlagFraudUk implements _StringsHomeAdditionalServicesFlagFraudEn {
	_StringsHomeAdditionalServicesFlagFraudUk._(this._root);

	@override final _StringsUk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Повідомити про шахрайство';
	@override String get description => 'Повідомте про шахрайство у вашій громаді.';
}

// Path: home.additionalServices.giveFeedback
class _StringsHomeAdditionalServicesGiveFeedbackUk implements _StringsHomeAdditionalServicesGiveFeedbackEn {
	_StringsHomeAdditionalServicesGiveFeedbackUk._(this._root);

	@override final _StringsUk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Залишити відгук';
	@override String get description => 'Допоможіть нам покращити наші послуги.';
}

// Path: home.additionalServices.checkResettlement
class _StringsHomeAdditionalServicesCheckResettlementUk implements _StringsHomeAdditionalServicesCheckResettlementEn {
	_StringsHomeAdditionalServicesCheckResettlementUk._(this._root);

	@override final _StringsUk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Перевірити статус переселення';
	@override String get description => 'Перевірте статус вашої заявки на переселення.';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'bottomNavigation.home': return 'Home';
			case 'bottomNavigation.requests': return 'Requests';
			case 'bottomNavigation.profile': return 'Profile';
			case 'home.title': return 'We can help.';
			case 'home.actions.requestAssistance': return 'Request Assistance';
			case 'home.additionalServices.title': return 'Additional Services';
			case 'home.additionalServices.scholarships.title': return 'Scholarships';
			case 'home.additionalServices.scholarships.description': return 'Find scholarships that match your profile.';
			case 'home.additionalServices.joinJobpool.title': return 'Join Job Pool';
			case 'home.additionalServices.joinJobpool.description': return 'Get matched with employers looking for your skills.';
			case 'home.additionalServices.flagSocialTension.title': return 'Flag Social Tension';
			case 'home.additionalServices.flagSocialTension.description': return 'Report social tension in your community.';
			case 'home.additionalServices.flagFraud.title': return 'Flag Fraud';
			case 'home.additionalServices.flagFraud.description': return 'Report fraud in your community.';
			case 'home.additionalServices.giveFeedback.title': return 'Give Feedback';
			case 'home.additionalServices.giveFeedback.description': return 'Help us improve our services.';
			case 'home.additionalServices.checkResettlement.title': return 'Check Resettlement Status';
			case 'home.additionalServices.checkResettlement.description': return 'Check the status of your resettlement application.';
			case 'requests.title': return 'Requests';
			case 'requests.actions.newRequest': return 'Create New Request';
			case 'requests.status': return 'Status';
			case 'requests.caseId': return 'Case ID';
			case 'requests.requestDetails.title': return 'Request Details';
			case 'requests.requestDetails.goToChat': return 'Go to Chat';
			case 'requests.noRequests': return 'No requests found. Create a new request to see it here.';
			case 'profile.title': return 'Profile';
			case 'profile.actions.editProfile': return 'Edit Profile';
			case 'profile.personalInformation.title': return 'Personal Information';
			case 'profile.personalInformation.name': return 'Name';
			case 'profile.personalInformation.surname': return 'Surname';
			case 'profile.personalInformation.dateOfBirth': return 'Date of Birth';
			case 'profile.personalInformation.location': return 'Location';
			case 'profile.personalInformation.householdSize': return 'Household Size';
			case 'profile.account.title': return 'Account';
			case 'profile.account.email': return 'Email';
			case 'profile.account.phoneNumber': return 'Phone Number';
			case 'profile.unhcrInformation.title': return 'UNHCR Information';
			case 'profile.unhcrInformation.unhcrCaseNumber': return 'UNHCR Case Number';
			case 'profile.unhcrInformation.coaIDNumber': return 'COA ID Number';
			case 'profile.settings.title': return 'Settings';
			case 'profile.settings.language': return 'Language';
			case 'profile.settings.receiveNotifications': return 'Receive Notifications';
			case 'profile.settings.receiveMessages': return 'Receive Messages';
			case 'actions.signIn': return 'Sign In';
			default: return null;
		}
	}
}

extension on _StringsAr {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'bottomNavigation.home': return 'الصفحة الرئيسية';
			case 'bottomNavigation.requests': return 'الطلبات';
			case 'bottomNavigation.profile': return 'الملف الشخصي';
			case 'home.title': return 'يمكننا المساعدة.';
			case 'home.actions.requestAssistance': return 'طلب المساعدة';
			case 'home.additionalServices.title': return 'خدمات إضافية';
			case 'home.additionalServices.scholarships.title': return 'المنح الدراسية';
			case 'home.additionalServices.scholarships.description': return 'ابحث عن المنح الدراسية التي تتناسب مع ملفك الشخصي.';
			case 'home.additionalServices.joinJobpool.title': return 'انضم إلى تجمع الوظائف';
			case 'home.additionalServices.joinJobpool.description': return 'تطابق مع أصحاب العمل الذين يبحثون عن مهاراتك.';
			case 'home.additionalServices.flagSocialTension.title': return 'أبلغ عن التوتر الاجتماعي';
			case 'home.additionalServices.flagSocialTension.description': return 'أبلغ عن التوتر الاجتماعي في مجتمعك.';
			case 'home.additionalServices.flagFraud.title': return 'أبلغ عن الاحتيال';
			case 'home.additionalServices.flagFraud.description': return 'أبلغ عن الاحتيال في مجتمعك.';
			case 'home.additionalServices.giveFeedback.title': return 'أعط ملاحظات';
			case 'home.additionalServices.giveFeedback.description': return 'ساعدنا في تحسين خدماتنا.';
			case 'home.additionalServices.checkResettlement.title': return 'تحقق من حالة إعادة التوطين';
			case 'home.additionalServices.checkResettlement.description': return 'تحقق من حالة طلب إعادة التوطين الخاص بك.';
			case 'requests.title': return 'الطلبات';
			case 'requests.actions.newRequest': return 'إنشاء طلب جديد';
			case 'requests.status': return 'الحالة';
			case 'requests.caseId': return 'معرف القضية';
			case 'requests.requestDetails.title': return 'تفاصيل الطلب';
			case 'requests.requestDetails.goToChat': return 'اذهب إلى الدردشة';
			case 'requests.noRequests': return 'لم يتم العثور على طلبات. أنشئ طلبًا جديدًا لرؤيته هنا.';
			case 'profile.title': return 'الملف الشخصي';
			case 'profile.actions.editProfile': return 'تعديل الملف الشخصي';
			case 'profile.personalInformation.title': return 'معلومات شخصية';
			case 'profile.personalInformation.name': return 'الاسم';
			case 'profile.personalInformation.surname': return 'اللقب';
			case 'profile.personalInformation.dateOfBirth': return 'تاريخ الميلاد';
			case 'profile.personalInformation.location': return 'الموقع';
			case 'profile.personalInformation.householdSize': return 'حجم الأسرة';
			case 'profile.account.title': return 'الحساب';
			case 'profile.account.email': return 'البريد الإلكتروني';
			case 'profile.account.phoneNumber': return 'رقم الهاتف';
			case 'profile.unhcrInformation.title': return 'معلومات المفوضية';
			case 'profile.unhcrInformation.unhcrCaseNumber': return 'رقم قضية المفوضية';
			case 'profile.unhcrInformation.coaIDNumber': return 'رقم هوية COA';
			case 'profile.settings.title': return 'الإعدادات';
			case 'profile.settings.language': return 'اللغة';
			case 'profile.settings.receiveNotifications': return 'تلقي الإشعارات';
			case 'profile.settings.receiveMessages': return 'تلقي الرسائل';
			case 'actions.signIn': return 'تسجيل الدخول';
			default: return null;
		}
	}
}

extension on _StringsTr {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'bottomNavigation.home': return 'Ana Sayfa';
			case 'bottomNavigation.requests': return 'Talepler';
			case 'bottomNavigation.profile': return 'Profil';
			case 'home.title': return 'Yardımcı olabiliriz.';
			case 'home.actions.requestAssistance': return 'Yardım Talep Et';
			case 'home.additionalServices.title': return 'Ek Hizmetler';
			case 'home.additionalServices.scholarships.title': return 'Burslar';
			case 'home.additionalServices.scholarships.description': return 'Profilinize uygun bursları bulun.';
			case 'home.additionalServices.joinJobpool.title': return 'İş Havuzuna Katıl';
			case 'home.additionalServices.joinJobpool.description': return 'Becerilerinize uygun işverenlerle eşleşin.';
			case 'home.additionalServices.flagSocialTension.title': return 'Sosyal Gerginliği Bildir';
			case 'home.additionalServices.flagSocialTension.description': return 'Topluluğunuzda sosyal gerginliği bildirin.';
			case 'home.additionalServices.flagFraud.title': return 'Dolandırıcılığı Bildir';
			case 'home.additionalServices.flagFraud.description': return 'Topluluğunuzda dolandırıcılığı bildirin.';
			case 'home.additionalServices.giveFeedback.title': return 'Geri Bildirim Ver';
			case 'home.additionalServices.giveFeedback.description': return 'Hizmetlerimizi geliştirmemize yardımcı olun.';
			case 'home.additionalServices.checkResettlement.title': return 'Yerleşim Durumunu Kontrol Et';
			case 'home.additionalServices.checkResettlement.description': return 'Yerleşim başvurunuzun durumunu kontrol edin.';
			case 'requests.title': return 'Talepler';
			case 'requests.actions.newRequest': return 'Yeni Talep Oluştur';
			case 'requests.status': return 'Durum';
			case 'requests.caseId': return 'Dava ID';
			case 'requests.requestDetails.title': return 'Talep Detayları';
			case 'requests.requestDetails.goToChat': return 'Sohbete Git';
			case 'requests.noRequests': return 'Talep bulunamadı. Burada görmek için yeni bir talep oluşturun.';
			case 'profile.title': return 'Profil';
			case 'profile.actions.editProfile': return 'Profili Düzenle';
			case 'profile.personalInformation.title': return 'Kişisel Bilgiler';
			case 'profile.personalInformation.name': return 'İsim';
			case 'profile.personalInformation.surname': return 'Soyisim';
			case 'profile.personalInformation.dateOfBirth': return 'Doğum Tarihi';
			case 'profile.personalInformation.location': return 'Konum';
			case 'profile.personalInformation.householdSize': return 'Hane Büyüklüğü';
			case 'profile.account.title': return 'Hesap';
			case 'profile.account.email': return 'E-posta';
			case 'profile.account.phoneNumber': return 'Telefon Numarası';
			case 'profile.unhcrInformation.title': return 'UNHCR Bilgileri';
			case 'profile.unhcrInformation.unhcrCaseNumber': return 'UNHCR Dava Numarası';
			case 'profile.unhcrInformation.coaIDNumber': return 'COA Kimlik Numarası';
			case 'profile.settings.title': return 'Ayarlar';
			case 'profile.settings.language': return 'Dil';
			case 'profile.settings.receiveNotifications': return 'Bildirimleri Al';
			case 'profile.settings.receiveMessages': return 'Mesajları Al';
			case 'actions.signIn': return 'Giriş Yap';
			default: return null;
		}
	}
}

extension on _StringsUk {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'bottomNavigation.home': return 'Головна';
			case 'bottomNavigation.requests': return 'Запити';
			case 'bottomNavigation.profile': return 'Профіль';
			case 'home.title': return 'Ми можемо допомогти.';
			case 'home.actions.requestAssistance': return 'Запросити допомогу';
			case 'home.additionalServices.title': return 'Додаткові послуги';
			case 'home.additionalServices.scholarships.title': return 'Стипендії';
			case 'home.additionalServices.scholarships.description': return 'Знайдіть стипендії, що відповідають вашому профілю.';
			case 'home.additionalServices.joinJobpool.title': return 'Приєднатися до пулу вакансій';
			case 'home.additionalServices.joinJobpool.description': return 'Знайдіть роботодавців, які шукають ваші навички.';
			case 'home.additionalServices.flagSocialTension.title': return 'Повідомити про соціальну напруженість';
			case 'home.additionalServices.flagSocialTension.description': return 'Повідомте про соціальну напруженість у вашій громаді.';
			case 'home.additionalServices.flagFraud.title': return 'Повідомити про шахрайство';
			case 'home.additionalServices.flagFraud.description': return 'Повідомте про шахрайство у вашій громаді.';
			case 'home.additionalServices.giveFeedback.title': return 'Залишити відгук';
			case 'home.additionalServices.giveFeedback.description': return 'Допоможіть нам покращити наші послуги.';
			case 'home.additionalServices.checkResettlement.title': return 'Перевірити статус переселення';
			case 'home.additionalServices.checkResettlement.description': return 'Перевірте статус вашої заявки на переселення.';
			case 'requests.title': return 'Запити';
			case 'requests.actions.newRequest': return 'Створити новий запит';
			case 'requests.status': return 'Статус';
			case 'requests.caseId': return 'Ідентифікатор справи';
			case 'requests.requestDetails.title': return 'Деталі запиту';
			case 'requests.requestDetails.goToChat': return 'Перейти до чату';
			case 'requests.noRequests': return 'Запити відсутні. Створіть новий запит, щоб побачити його тут.';
			case 'profile.title': return 'Профіль';
			case 'profile.actions.editProfile': return 'Редагувати профіль';
			case 'profile.personalInformation.title': return 'Особиста інформація';
			case 'profile.personalInformation.name': return 'Ім\'я';
			case 'profile.personalInformation.surname': return 'Прізвище';
			case 'profile.personalInformation.dateOfBirth': return 'Дата народження';
			case 'profile.personalInformation.location': return 'Місцезнаходження';
			case 'profile.personalInformation.householdSize': return 'Розмір домогосподарства';
			case 'profile.account.title': return 'Акаунт';
			case 'profile.account.email': return 'Електронна пошта';
			case 'profile.account.phoneNumber': return 'Номер телефону';
			case 'profile.unhcrInformation.title': return 'Інформація UNHCR';
			case 'profile.unhcrInformation.unhcrCaseNumber': return 'Номер справи UNHCR';
			case 'profile.unhcrInformation.coaIDNumber': return 'Номер ID COA';
			case 'profile.settings.title': return 'Налаштування';
			case 'profile.settings.language': return 'Мова';
			case 'profile.settings.receiveNotifications': return 'Отримувати сповіщення';
			case 'profile.settings.receiveMessages': return 'Отримувати повідомлення';
			case 'actions.signIn': return 'Увійти';
			default: return null;
		}
	}
}
