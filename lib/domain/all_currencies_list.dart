import 'package:cur_val/resources/resources.dart';

import '../api/api_client.dart';
import 'currency.dart';

class AllCurrenciesList {
  Future<Map<String, dynamic>> getRateList() async {
    Map<String, dynamic> rates = await ApiClient().get();
    return rates['rates'];
  }

  static final allCurrenciesList = <String, Currency>{
    "AED": Currency(
      code: "AED",
      flag: Svgs.unitedArabEmirates,
      symbol: '.د.إ',
      title: 'Дирхам ОАЭ',
      country: 'ОАЭ',
    ),
    "AFN": Currency(
      code: "AFN",
      flag: Svgs.afghanistan,
      symbol: '؋',
      title: 'Афгани	',
      country: 'Афганистан',
    ),
    "ALL": Currency(
      code: "ALL",
      flag: Svgs.albania,
      symbol: 'L',
      title: 'Лек',
      country: 'Албания',
    ),
    "AMD": Currency(
      code: "AMD",
      flag: Svgs.armenia,
      symbol: '֏',
      title: 'Армянский драм',
      country: 'Армения',
    ),
    "ANG": Currency(
        code: "ANG",
        flag: Svgs.sintMaarten,
        symbol: 'ƒ',
        title: 'Нидерландскийантильский гульден',
        country: 'Синт-Мартен'),
    "AOA": Currency(
      code: "AOA",
      flag: Svgs.angola,
      symbol: 'Kz',
      title: 'Кванза',
      country: 'Ангола',
    ),
    "ARS": Currency(
      code: "ARS",
      flag: Svgs.argentina,
      symbol: '\$',
      title: 'Аргентинское песо',
      country: 'Аргентина',
    ),
    "AUD": Currency(
      code: "AUD",
      flag: Svgs.australia,
      symbol: '\$',
      title: 'Австралийский доллар',
      country: 'Австралия',
    ),
    "AWG": Currency(
      code: "AWG",
      flag: Svgs.aruba,
      symbol: 'ƒ',
      title: 'Арубанский флорин',
      country: 'Аруба',
    ),
    "AZN": Currency(
      code: "AZN",
      flag: Svgs.azerbaijan,
      symbol: '₼',
      title: 'Азербайджанский манат',
      country: 'Азербайджан',
    ),
    "BAM": Currency(
      code: "BAM",
      flag: Svgs.bosniaAndHerzegovina,
      symbol: 'KM',
      title: 'Конвертируемая марка',
      country: 'Босния и Герцеговина',
    ),
    "BBD": Currency(
      code: "BBD",
      flag: Svgs.barbados,
      symbol: '\$',
      title: 'Барбадосский доллар',
      country: 'Барбадос',
    ),
    "BDT": Currency(
      code: "BDT",
      flag: Svgs.bangladesh,
      symbol: '৳',
      title: 'Така',
      country: 'Бангладеш',
    ),
    "BGN": Currency(
      code: "BGN",
      flag: Svgs.bulgaria,
      symbol: 'лв',
      title: 'Болгарский лев',
      country: 'Болгария',
    ),
    "BHD": Currency(code: "BHD", symbol: '', title: 'Бахрейнский динар', country: 'Бахрейн'),
    "BIF": Currency(code: "BIF", symbol: '₣', title: 'Бурундийский франк', country: 'Бурунди'),
    "BMD": Currency(code: "BMD", symbol: '\$', title: 'Бермудский доллар', country: 'Бермуды'),
    "BND": Currency(code: "BND", symbol: '', title: 'Брунейский доллар', country: 'Бруней'),
    "BOB": Currency(code: "BOB", symbol: '', title: 'Боливиано', country: 'Боливия'),
    "BRL": Currency(code: "BRL", symbol: '', title: 'Бразильский реал', country: 'Бразилия'),
    "BSD": Currency(code: "BSD", symbol: '\$', title: 'Багамский доллар', country: 'Багамские Острова'),
    "BTC": Currency(code: "BTC", symbol: '₿', title: 'Биткойн', country: 'Биткойн'),
    "BTN": Currency(code: "BTN", symbol: 'Nu', title: 'Нгултрум', country: 'Бутан'),
    // "BTS": Currency(code: "BTS", symbol: '',  title: '', country: ''), //TODO Search cur
    "BWP": Currency(code: "BWP", symbol: '', title: 'Пула', country: 'Ботсвана'),
    "BYN": Currency(code: "BYN", symbol: '', title: 'Белорусский рубль', country: 'Белоруссия'),
    "BZD": Currency(code: "BZD", symbol: '', title: 'Белизский доллар', country: 'Белиз'),
    "CAD": Currency(code: "CAD", symbol: '', title: 'Канадский доллар', country: 'Канада'),
    "CDF": Currency(code: "CDF", symbol: '', title: 'Конголезский франк', country: 'ДР Конго'),
    "CHF": Currency(code: "CHF", symbol: '', title: 'Швейцарский франк', country: 'Швейцария'),
    // "CLF": Currency(code: "CLF", symbol: '',  title: '', country: ''), //TODO Search cur
    "CLP": Currency(code: "CLP", symbol: '', title: 'Чилийское песо', country: 'Чили'),
    // "CNH": Currency(code: "CNH", symbol: '',  title: '', country: ''), //TODO Search cur
    "CNY": Currency(code: "CNY", symbol: '¥', title: 'Юань', country: 'Китай'),
    "COP": Currency(code: "COP", symbol: '', title: 'Колумбийское песо', country: 'Колумбия'),
    "CRC": Currency(code: "CRC", symbol: '', title: 'Коста-риканский колон', country: 'Коста-Рика'),
    // "CUC": Currency(code: "CUC", symbol: '',  title: '', country: ''), //TODO Search cur
    "CUP": Currency(code: "CUP", symbol: '', title: 'Кубинское песо', country: 'Куба'),
    "CVE": Currency(code: "CVE", symbol: '', title: 'Эскудо Кабо-Верде', country: 'Кабо-Верде'),
    "CZK": Currency(code: "CZK", symbol: '', title: 'Чешская крона', country: 'Чехия'),
    // "DASH": Currency(code: "DASH", symbol: '',  title: '', country: ''), //TODO Search cur
    "DJF": Currency(code: "DJF", symbol: '', title: 'Франк Джибути', country: 'Джибути'),
    "DKK": Currency(code: "DKK", symbol: '', title: 'Датская крона', country: 'Дания'),
    // "DOGE": Currency(code: "DOGE", symbol: '',  title: '', country: ''), //TODO Search cur
    "DOP": Currency(code: "DOP", symbol: '', title: 'Доминиканское песо', country: 'Доминиканская Республика'),
    "DZD": Currency(code: "DZD", symbol: '', title: 'Алжирский динар', country: 'Алжир'),
    "EGP": Currency(code: "EGP", symbol: '', title: 'Египетский фунт', country: 'Египет'),
    "ERN": Currency(code: "ERN", symbol: '', title: 'Накфа', country: 'Эритрея'),
    "ETB": Currency(code: "ETB", symbol: '', title: 'Эфиопский быр', country: 'Эфиопия'),
    // "ETH": Currency(code: "ETH", symbol: '',  title: '', country: ''), //TODO Search cur
    "EUR": Currency(code: "EUR", symbol: '€', flag: '🇪🇺', title: 'Евро', country: 'Европа'),
    "FJD": Currency(code: "FJD", symbol: '', title: 'Доллар Фиджи', country: 'Фиджи'),
    "FKP": Currency(code: "FKP", symbol: '', title: 'ФунтФолклендских островов', country: 'Фолклендские острова'),
    "GBP": Currency(code: "GBP", symbol: '', title: 'Фунт стерлингов', country: 'Великобритания'),
    "GEL": Currency(code: "GEL", symbol: '', title: 'Лари', country: 'Грузия'),
    // "GGP": Currency(code: "GGP", symbol: '',  title: '', country: ''), //TODO Search cur
    "GHS": Currency(code: "GHS", symbol: '', title: 'Ганский седи', country: 'Гана'),
    "GIP": Currency(code: "GIP", symbol: '', title: 'Гибралтарский фунт', country: 'Гибралтар'),
    "GMD": Currency(code: "GMD", symbol: '', title: 'Даласи', country: 'Гамбия'),
    "GNF": Currency(code: "GNF", symbol: '', title: 'Гвинейский франк', country: 'Гвинея'),
    "GTQ": Currency(code: "GTQ", symbol: '', title: 'Кетсаль', country: 'Гватемала'),
    "GYD": Currency(code: "GYD", symbol: '', title: 'Гайанский доллар', country: 'Гайана'),
    "HKD": Currency(code: "HKD", symbol: '', title: 'Гонконгский доллар', country: 'Гонконг'),
    "HNL": Currency(code: "HNL", symbol: '', title: 'Лемпира', country: 'Гондурас'),
    "HRK": Currency(code: "HRK", symbol: '', title: 'Хорватская куна', country: 'Хорватия'),
    "HTG": Currency(code: "HTG", symbol: '', title: 'Гурд', country: 'Гаити'),
    "HUF": Currency(code: "HUF", symbol: '', title: 'Форинт', country: 'Венгрия'),
    "IDR": Currency(code: "IDR", symbol: '', title: 'Индонезийская рупия', country: 'Индонезия'),
    "ILS": Currency(code: "ILS", symbol: '', title: 'Новый израильский шекель', country: 'Израиль'),
    // "IMP": Currency(code: "IMP", symbol: '',  title: '', country: ''), //TODO Search cur
    "INR": Currency(code: "INR", symbol: '', title: 'Индийская рупия', country: 'Индия'),
    "IQD": Currency(code: "IQD", symbol: '', title: 'Иракский динар', country: 'Ирак'),
    "IRR": Currency(code: "IRR", symbol: '', title: 'Иранский риал', country: 'Иран'),
    "ISK": Currency(code: "ISK", symbol: '', title: 'Исландская крона', country: 'Исландия'),
    // "JEP": Currency(code: "JEP", symbol: '',  title: '', country: ''), //TODO Search cur
    "JMD": Currency(code: "JMD", symbol: '', title: 'Ямайский доллар', country: 'Ямайка'),
    "JOD": Currency(code: "JOD", symbol: '', title: 'Иорданский динар', country: 'Иордания'),
    "JPY": Currency(code: "JPY", symbol: '', title: 'Иена', country: 'Япония'),
    // "KES": Currency(code: "KES", symbol: '',  title: '', country: ''), //TODO Search cur
    "KGS": Currency(code: "KGS", symbol: '', title: 'Сом', country: 'Киргизия'),
    "KHR": Currency(code: "KHR", symbol: '', title: 'Риель', country: 'Камбоджа'),
    "KMF": Currency(code: "KMF", symbol: '', title: 'Франк Комор', country: 'Коморы'),
    "KPW": Currency(code: "KPW", symbol: '', title: 'Северокорейская вона', country: 'КНДР'),
    "KRW": Currency(code: "KRW", symbol: '', title: 'Южнокорейская вона', country: 'Республика Корея'),
    "KWD": Currency(code: "KWD", symbol: '', title: 'Кувейтский динар', country: 'Кувейт'),
    "KYD": Currency(code: "KYD", symbol: '', title: 'Доллар Островов Кайман', country: 'Острова Кайман'),
    "KZT": Currency(code: "KZT", symbol: '', title: 'Тенге', country: 'Казахстан'),
    "LAK": Currency(code: "LAK", symbol: '', title: 'Кип', country: 'Лаос'),
    "LBP": Currency(code: "LBP", symbol: '', title: 'Ливанский фунт', country: 'Ливан'),
    // "LD": Currency(code: "LD", symbol: '',  title: '', country: ''), //TODO Search cur
    "LKR": Currency(code: "LKR", symbol: '', title: 'Шри-ланкийская рупия', country: 'Шри-Ланка'),
    "LRD": Currency(code: "LRD", symbol: '', title: 'Либерийский доллар', country: 'Либерия'),
    "LSL": Currency(code: "LSL", symbol: '', title: 'Мн. Малоти', country: 'Лесото'),
    // "LTC": Currency(code: "LTC", symbol: '',  title: '', country: ''), //TODO Search cur
    "LYD": Currency(code: "LYD", symbol: '', title: 'Ливийский динар', country: 'Ливия'),
    "MAD": Currency(code: "MAD", symbol: '', title: 'Марокканский дирхам', country: 'Марокко'),
    "MDL": Currency(code: "MDL", symbol: '', title: 'Молдавский лей', country: 'Молдавия'),
    "MGA": Currency(code: "MGA", symbol: '', title: 'Малагасийский ариари', country: 'Мадагаскар'),
    "MKD": Currency(code: "MKD", symbol: '', title: 'Денар', country: 'Северная Македония'),
    "MMK": Currency(code: "MMK", symbol: '', title: 'Кьят', country: 'Мьянма'),
    "MNT": Currency(code: "MNT", symbol: '', title: 'Тугрик', country: 'Монголия'),
    "MOP": Currency(code: "MOP", symbol: '', title: 'Патака', country: 'Макао'),
    // "MRO": Currency(code: "MRO", symbol: '',  title: '', country: ''), //TODO Search cur
    "MRU": Currency(code: "MRU", symbol: '', title: 'Угия', country: 'Мавритания'),
    "MUR": Currency(code: "MUR", symbol: '', title: 'Маврикийская рупия', country: 'Маврикий'),
    "MVR": Currency(code: "MVR", symbol: '', title: 'Руфия', country: 'Мальдивы'),
    "MWK": Currency(code: "MWK", symbol: '', title: 'Квача', country: 'Малави'),
    "MXN": Currency(code: "MXN", symbol: '', title: 'Мексиканское песо', country: 'Мексика'),
    "MYR": Currency(code: "MYR", symbol: '', title: 'Малайзийский ринггит', country: 'Малайзия'),
    "MZN": Currency(code: "MZN", symbol: '', title: 'Мозамбикский метикал', country: 'Мозамбик'),
    "NAD": Currency(code: "NAD", symbol: '', title: 'Доллар Намибии', country: 'Намибия'),
    "NGN": Currency(code: "NGN", symbol: '', title: 'Найра', country: 'Нигерия'),
    "NIO": Currency(code: "NIO", symbol: '', title: 'Золотая кордоба', country: 'Никарагуа'),
    "NOK": Currency(code: "NOK", symbol: '', title: 'Норвежская крона', country: 'Норвегия'),
    "NPR": Currency(code: "NPR", symbol: '', title: 'Непальская рупия', country: 'Непал'),
    // "NXT": Currency(code: "NXT", symbol: '',  title: '', country: ''), //TODO Search cur
    "NZD": Currency(code: "NZD", symbol: '', title: 'Новозеландский доллар', country: 'Новая Зеландия'),
    "OMR": Currency(code: "OMR", symbol: '', title: 'Оманский риал', country: 'Оман'),
    "PAB": Currency(code: "PAB", symbol: '', title: 'Бальбоа', country: 'Панама'),
    "PEN": Currency(code: "PEN", symbol: '', title: 'Новый соль', country: 'Перу'),
    "PGK": Currency(code: "PGK", symbol: '', title: 'Кина', country: 'Папуа — Новая Гвинея'),
    "PHP": Currency(code: "PHP", symbol: '', title: 'Филиппинское песо', country: 'Филиппины'),
    "PKR": Currency(code: "PKR", symbol: '', title: 'Пакистанская рупия', country: 'Пакистан'),
    "PLN": Currency(code: "PLN", symbol: '', title: 'Злотый', country: 'Польша'),
    "PYG": Currency(code: "PYG", symbol: '', title: 'Гуарани', country: 'Парагвай'),
    "QAR": Currency(code: "QAR", symbol: '', title: 'Катарский риал', country: 'Катар'),
    "RON": Currency(code: "RON", symbol: '', title: 'Румынский лей', country: 'Румыния'),
    "RSD": Currency(code: "RSD", symbol: '', title: 'Сербский динар', country: 'Сербия'),
    "RUB": Currency(code: "RUB", symbol: '₽', flag: '🇷🇺', title: 'Российский рубль', country: 'Россия'),
    "RWF": Currency(code: "RWF", symbol: '', title: 'Франк Руанды', country: 'Руанда'),
    "SAR": Currency(code: "SAR", symbol: '', title: 'Саудовский риял', country: 'Саудовская Аравия'),
    "SBD": Currency(code: "SBD", symbol: '', title: 'Доллар Соломоновых Островов', country: 'Соломоновы Острова'),
    "SCR": Currency(code: "SCR", symbol: '', title: 'Сейшельская рупия', country: 'Сейшельские Острова'),
    "SDG": Currency(code: "SDG", symbol: '', title: 'Суданский фунт', country: 'Судан'),
    "SEK": Currency(code: "SEK", symbol: '', title: 'Шведская крона', country: 'Швеция'),
    "SGD": Currency(code: "SGD", symbol: '', title: 'Сингапурский доллар', country: 'Сингапур'),
    "SHP": Currency(
        code: "SHP",
        symbol: '',
        title: 'Фунт Святой Елены',
        country: 'Остров Святой ЕленыОстров ВознесенияТристан-да-Кунья'),
    "SLL": Currency(code: "SLL", symbol: '', title: 'Леоне', country: 'Сьерра-Леоне'),
    "SOS": Currency(code: "SOS", symbol: '', title: 'Сомалийский шиллинг', country: 'Сомали'),
    "SRD": Currency(code: "SRD", symbol: '', title: 'Суринамский доллар', country: 'Суринам'),
    "SSP": Currency(code: "SSP", symbol: '', title: 'Южносуданский фунт', country: 'Южный Судан'),
    // "STD": Currency(code: "STD", symbol: '',  title: '', country: ''), //TODO Search cur
    "STN": Currency(code: "STN", symbol: '', title: 'Добра', country: 'Сан-Томе и Принсипи'),
    // "STR": Currency(code: "STR", symbol: '',  title: '', country: ''), //TODO Search cur
    "SVC": Currency(code: "SVC", symbol: '', title: 'Сальвадорский колон', country: 'Сальвадор'),
    "SYP": Currency(code: "SYP", symbol: '', title: 'Сирийский фунт', country: 'Сирия'),
    "SZL": Currency(code: "SZL", symbol: '', title: 'Мн. Эмалангени', country: 'Эсватини'),
    "THB": Currency(code: "THB", symbol: '', title: 'Бат', country: 'Таиланд'),
    "TJS": Currency(code: "TJS", symbol: '', title: 'Сомони', country: 'Таджикистан'),
    "TMT": Currency(code: "TMT", symbol: '', title: 'Новый туркменский манат', country: 'Туркмения'),
    "TND": Currency(code: "TND", symbol: '', title: 'Тунисский динар', country: 'Тунис'),
    "TOP": Currency(code: "TOP", symbol: '', title: 'Паанга', country: 'Тонга'),
    "TRY": Currency(code: "TRY", symbol: '', title: 'Турецкая лира', country: 'Турция'),
    "TTD": Currency(code: "TTD", symbol: '', title: 'Доллар Тринидада и Тобаго', country: 'Тринидад и Тобаго'),
    "TWD": Currency(code: "TWD", symbol: '', title: 'Новый тайваньский доллар', country: 'Китайская Республика'),
    "TZS": Currency(code: "TZS", symbol: '', title: 'Танзанийский шиллинг', country: 'Танзания'),
    "UAH": Currency(code: "UAH", symbol: '', title: 'Гривна', country: 'Украина'),
    "UGX": Currency(code: "UGX", symbol: '', title: 'Угандийский шиллинг', country: 'Уганда'),
    "USD": Currency(code: "USD", symbol: '\$', flag: '🇺🇸', title: 'Доллар', country: 'Америка'),
    "UYU": Currency(code: "UYU", symbol: '', title: 'Уругвайское песо', country: 'Уругвай'),
    "UZS": Currency(code: "UZS", symbol: '', title: 'Узбекский сум', country: 'Узбекистан'),
    // "VEF_BLKMKT": Currency(code: "VEF_BLKMKT", symbol: '',  title: '', country: ''), //TODO Search cur
    // "VEF_DICOM": Currency(code: "VEF_DICOM", symbol: '',  title: '', country: ''), //TODO Search cur
    // "VEF_DIPRO": Currency(code: "VEF_DIPRO", symbol: '',  title: '', country: ''), //TODO Search cur
    "VES": Currency(code: "VES", symbol: '', title: 'Суверенный боливар', country: 'Венесуэла'),
    "VND": Currency(code: "VND", symbol: '', title: 'Донг', country: 'Вьетнам'),
    "VUV": Currency(code: "VUV", symbol: '', title: 'Вату', country: 'Вануату'),
    "WST": Currency(code: "WST", symbol: '', title: 'Тала', country: 'Самоа'),
    "XAF": Currency(code: "XAF", symbol: '', title: 'Франк КФА BEAC', country: 'Республика Конго'),
    // "XAG": Currency(code: "XAG", symbol: '',  title: '', country: ''), //TODO Search cur
    // "XAU": Currency(code: "XAU", symbol: '',  title: '', country: ''), //TODO Search cur
    "XCD": Currency(code: "XCD", symbol: '', title: 'Восточно-карибский доллар', country: 'Ангилья'),
    // "XDR": Currency(code: "XDR", symbol: '',  title: '', country: ''), //TODO Search cur
    // "XMR": Currency(code: "XMR", symbol: '',  title: '', country: ''), //TODO Search cur
    "XOF": Currency(code: "XOF", symbol: '', title: 'Франк КФА BCEAO', country: 'Сенегал'),
    // "XPD": Currency(code: "XPD", symbol: '',  title: '', country: ''), //TODO Search cur
    "XPF": Currency(code: "XPF", symbol: '', title: 'Франк КФП', country: 'Французская Полинезия'),
    // "XPT": Currency(code: "XPT", symbol: '',  title: '', country: ''), //TODO Search cur
    // "XRP": Currency(code: "XRP", symbol: '',  title: '', country: ''), //TODO Search cur
    "YER": Currency(code: "YER", symbol: '', title: 'Йеменский риал', country: 'Йемен'),
    "ZAR": Currency(code: "ZAR", symbol: '', title: 'Рэнд', country: 'ЮАР'),
    "ZMW": Currency(code: "ZMW", symbol: '', title: 'Замбийская квача', country: 'Замбия'),
    "ZWL": Currency(code: "ZWL", symbol: '', title: 'Доллар Зимбабве', country: 'Зимбабве'),
    // "NMC": Currency(code: "NMC", symbol: '',  title: '', country: ''), //TODO Search cur
    // "PPC": Currency(code: "PPC", symbol: '',  title: '', country: ''), //TODO Search cur
    // "NVC": Currency(code: "NVC", symbol: '',  title: '', country: ''), //TODO Search cur
    // "XPM": Currency(code: "XPM", symbol: '',  title: '', country: ''), //TODO Search cur
    // "EAC": Currency(code: "EAC", symbol: '',  title: '', country: ''), //TODO Search cur
    // "VTC": Currency(code: "VTC", symbol: '',  title: '', country: ''), //TODO Search cur
    // "EMC": Currency(code: "EMC", symbol: '',  title: '', country: ''), //TODO Search cur
    // "FCT": Currency(code: "FCT", symbol: '',  title: '', country: ''), //TODO Search cur
    // "BNB": Currency(code: "BNB", symbol: '',  title: '', country: ''), //TODO Search cur
  };
}
