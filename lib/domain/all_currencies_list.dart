import '../api/api_client.dart';
import 'currency.dart';

class AllCurrenciesList {
  Future<Map<String, dynamic>> getRateList() async {
    Map<String, dynamic> rates = await ApiClient().get();
    return rates['rates'];
  }

  static final allCurrenciesList = <String, Currency>{
    "AED": Currency(code: "AED", symbol: '', icon: '', title: 'Дирхам ОАЭ	', country: '	ОАЭ'),
    "AFN": Currency(code: "AFN", symbol: '؋', icon: '', title: '	Афгани	', country: '	Афганистан'),
    "ALL": Currency(code: "ALL", symbol: 'L', icon: '', title: 'Лек', country: 'Албания'),
    "AMD": Currency(code: "AMD", symbol: '֏', icon: '', title: 'Армянский драм', country: 'Армения'),
    "ANG":
        Currency(code: "ANG", symbol: 'ƒ', icon: '', title: 'Нидерландскийантильский гульден', country: 'Синт-Мартен'),
    "AOA": Currency(code: "AOA", symbol: 'Kz', icon: '', title: 'Кванза', country: 'Ангола'),
    "ARS": Currency(code: "ARS", symbol: '', icon: '', title: 'Аргентинское песо', country: 'Аргентина'),
    "AUD": Currency(code: "AUD", symbol: '\$', icon: '', title: 'Австралийский доллар', country: 'Австралия'),
    "AWG": Currency(code: "AWG", symbol: 'ƒ', icon: '', title: 'Арубанский флорин', country: 'Аруба'),
    "AZN": Currency(code: "AZN", symbol: '₼', icon: '', title: 'Азербайджанский манат', country: 'Азербайджан'),
    "BAM":
        Currency(code: "BAM", symbol: 'KM', icon: '', title: 'Конвертируемая марка', country: 'Босния и Герцеговина'),
    "BBD": Currency(code: "BBD", symbol: '\$', icon: '', title: 'Барбадосский доллар', country: 'Барбадос'),
    "BDT": Currency(code: "BDT", symbol: '৳', icon: '', title: 'Така', country: 'Бангладеш'),
    "BGN": Currency(code: "BGN", symbol: '', icon: '', title: 'Болгарский лев', country: 'Болгария'),
    "BHD": Currency(code: "BHD", symbol: '', icon: '', title: 'Бахрейнский динар', country: 'Бахрейн'),
    "BIF": Currency(code: "BIF", symbol: '₣', icon: '', title: 'Бурундийский франк', country: 'Бурунди'),
    "BMD": Currency(code: "BMD", symbol: '\$', icon: '', title: 'Бермудский доллар', country: 'Бермуды'),
    "BND": Currency(code: "BND", symbol: '', icon: '', title: 'Брунейский доллар', country: 'Бруней'),
    "BOB": Currency(code: "BOB", symbol: '', icon: '', title: 'Боливиано', country: 'Боливия'),
    "BRL": Currency(code: "BRL", symbol: '', icon: '', title: 'Бразильский реал', country: 'Бразилия'),
    "BSD": Currency(code: "BSD", symbol: '\$', icon: '', title: 'Багамский доллар', country: 'Багамские Острова'),
    "BTC": Currency(code: "BTC", symbol: '₿', icon: '', title: 'Биткойн', country: 'Биткойн'),
    "BTN": Currency(code: "BTN", symbol: 'Nu', icon: '', title: 'Нгултрум', country: 'Бутан'),
    // "BTS": Currency(code: "BTS", symbol: '', icon: '', title: '', country: ''), //TODO Search cur
    "BWP": Currency(code: "BWP", symbol: '', icon: '', title: 'Пула', country: 'Ботсвана'),
    "BYN": Currency(code: "BYN", symbol: '', icon: '', title: 'Белорусский рубль', country: 'Белоруссия'),
    "BZD": Currency(code: "BZD", symbol: '', icon: '', title: 'Белизский доллар', country: 'Белиз'),
    "CAD": Currency(code: "CAD", symbol: '', icon: '', title: 'Канадский доллар', country: 'Канада'),
    "CDF": Currency(code: "CDF", symbol: '', icon: '', title: 'Конголезский франк', country: 'ДР Конго'),
    "CHF": Currency(code: "CHF", symbol: '', icon: '', title: 'Швейцарский франк', country: 'Швейцария'),
    // "CLF": Currency(code: "CLF", symbol: '', icon: '', title: '', country: ''), //TODO Search cur
    "CLP": Currency(code: "CLP", symbol: '', icon: '', title: 'Чилийское песо', country: 'Чили'),
    // "CNH": Currency(code: "CNH", symbol: '', icon: '', title: '', country: ''), //TODO Search cur
    "CNY": Currency(code: "CNY", symbol: '¥', icon: '', title: 'Юань', country: 'Китай'),
    "COP": Currency(code: "COP", symbol: '', icon: '', title: 'Колумбийское песо', country: 'Колумбия'),
    "CRC": Currency(code: "CRC", symbol: '', icon: '', title: 'Коста-риканский колон', country: 'Коста-Рика'),
    // "CUC": Currency(code: "CUC", symbol: '', icon: '', title: '', country: ''), //TODO Search cur
    "CUP": Currency(code: "CUP", symbol: '', icon: '', title: 'Кубинское песо', country: 'Куба'),
    "CVE": Currency(code: "CVE", symbol: '', icon: '', title: 'Эскудо Кабо-Верде', country: 'Кабо-Верде'),
    "CZK": Currency(code: "CZK", symbol: '', icon: '', title: 'Чешская крона', country: 'Чехия'),
    // "DASH": Currency(code: "DASH", symbol: '', icon: '', title: '', country: ''), //TODO Search cur
    "DJF": Currency(code: "DJF", symbol: '', icon: '', title: 'Франк Джибути', country: 'Джибути'),
    "DKK": Currency(code: "DKK", symbol: '', icon: '', title: 'Датская крона', country: 'Дания'),
    // "DOGE": Currency(code: "DOGE", symbol: '', icon: '', title: '', country: ''), //TODO Search cur
    "DOP":
        Currency(code: "DOP", symbol: '', icon: '', title: 'Доминиканское песо', country: 'Доминиканская Республика'),
    "DZD": Currency(code: "DZD", symbol: '', icon: '', title: 'Алжирский динар', country: 'Алжир'),
    "EGP": Currency(code: "EGP", symbol: '', icon: '', title: 'Египетский фунт', country: 'Египет'),
    "ERN": Currency(code: "ERN", symbol: '', icon: '', title: 'Накфа', country: 'Эритрея'),
    "ETB": Currency(code: "ETB", symbol: '', icon: '', title: 'Эфиопский быр', country: 'Эфиопия'),
    // "ETH": Currency(code: "ETH", symbol: '', icon: '', title: '', country: ''), //TODO Search cur
    "EUR": Currency(code: "EUR", symbol: '€', icon: '🇪🇺', title: 'Евро', country: 'Европа'),
    "FJD": Currency(code: "FJD", symbol: '', icon: '', title: 'Доллар Фиджи', country: 'Фиджи'),
    "FKP": Currency(
        code: "FKP", symbol: '', icon: '', title: 'ФунтФолклендских островов', country: 'Фолклендские острова'),
    "GBP": Currency(code: "GBP", symbol: '', icon: '', title: 'Фунт стерлингов', country: 'Великобритания'),
    "GEL": Currency(code: "GEL", symbol: '', icon: '', title: 'Лари', country: 'Грузия'),
    // "GGP": Currency(code: "GGP", symbol: '', icon: '', title: '', country: ''), //TODO Search cur
    "GHS": Currency(code: "GHS", symbol: '', icon: '', title: 'Ганский седи', country: 'Гана'),
    "GIP": Currency(code: "GIP", symbol: '', icon: '', title: 'Гибралтарский фунт', country: 'Гибралтар'),
    "GMD": Currency(code: "GMD", symbol: '', icon: '', title: 'Даласи', country: 'Гамбия'),
    "GNF": Currency(code: "GNF", symbol: '', icon: '', title: 'Гвинейский франк', country: 'Гвинея'),
    "GTQ": Currency(code: "GTQ", symbol: '', icon: '', title: 'Кетсаль', country: 'Гватемала'),
    "GYD": Currency(code: "GYD", symbol: '', icon: '', title: 'Гайанский доллар', country: 'Гайана'),
    "HKD": Currency(code: "HKD", symbol: '', icon: '', title: 'Гонконгский доллар', country: 'Гонконг'),
    "HNL": Currency(code: "HNL", symbol: '', icon: '', title: 'Лемпира', country: 'Гондурас'),
    "HRK": Currency(code: "HRK", symbol: '', icon: '', title: 'Хорватская куна', country: 'Хорватия'),
    "HTG": Currency(code: "HTG", symbol: '', icon: '', title: 'Гурд', country: 'Гаити'),
    "HUF": Currency(code: "HUF", symbol: '', icon: '', title: 'Форинт', country: 'Венгрия'),
    "IDR": Currency(code: "IDR", symbol: '', icon: '', title: 'Индонезийская рупия', country: 'Индонезия'),
    "ILS": Currency(code: "ILS", symbol: '', icon: '', title: 'Новый израильский шекель', country: 'Израиль'),
    // "IMP": Currency(code: "IMP", symbol: '', icon: '', title: '', country: ''), //TODO Search cur
    "INR": Currency(code: "INR", symbol: '', icon: '', title: 'Индийская рупия', country: 'Индия'),
    "IQD": Currency(code: "IQD", symbol: '', icon: '', title: 'Иракский динар', country: 'Ирак'),
    "IRR": Currency(code: "IRR", symbol: '', icon: '', title: 'Иранский риал', country: 'Иран'),
    "ISK": Currency(code: "ISK", symbol: '', icon: '', title: 'Исландская крона', country: 'Исландия'),
    // "JEP": Currency(code: "JEP", symbol: '', icon: '', title: '', country: ''), //TODO Search cur
    "JMD": Currency(code: "JMD", symbol: '', icon: '', title: 'Ямайский доллар', country: 'Ямайка'),
    "JOD": Currency(code: "JOD", symbol: '', icon: '', title: 'Иорданский динар', country: 'Иордания'),
    "JPY": Currency(code: "JPY", symbol: '', icon: '', title: 'Иена', country: 'Япония'),
    // "KES": Currency(code: "KES", symbol: '', icon: '', title: '', country: ''), //TODO Search cur
    "KGS": Currency(code: "KGS", symbol: '', icon: '', title: 'Сом', country: 'Киргизия'),
    "KHR": Currency(code: "KHR", symbol: '', icon: '', title: 'Риель', country: 'Камбоджа'),
    "KMF": Currency(code: "KMF", symbol: '', icon: '', title: 'Франк Комор', country: 'Коморы'),
    "KPW": Currency(code: "KPW", symbol: '', icon: '', title: 'Северокорейская вона', country: 'КНДР'),
    "KRW": Currency(code: "KRW", symbol: '', icon: '', title: 'Южнокорейская вона', country: 'Республика Корея'),
    "KWD": Currency(code: "KWD", symbol: '', icon: '', title: 'Кувейтский динар', country: 'Кувейт'),
    "KYD": Currency(code: "KYD", symbol: '', icon: '', title: 'Доллар Островов Кайман', country: 'Острова Кайман'),
    "KZT": Currency(code: "KZT", symbol: '', icon: '', title: 'Тенге', country: 'Казахстан'),
    "LAK": Currency(code: "LAK", symbol: '', icon: '', title: 'Кип', country: 'Лаос'),
    "LBP": Currency(code: "LBP", symbol: '', icon: '', title: 'Ливанский фунт', country: 'Ливан'),
    // "LD": Currency(code: "LD", symbol: '', icon: '', title: '', country: ''), //TODO Search cur
    "LKR": Currency(code: "LKR", symbol: '', icon: '', title: 'Шри-ланкийская рупия', country: 'Шри-Ланка'),
    "LRD": Currency(code: "LRD", symbol: '', icon: '', title: 'Либерийский доллар', country: 'Либерия'),
    "LSL": Currency(code: "LSL", symbol: '', icon: '', title: 'Мн. Малоти', country: 'Лесото'),
    // "LTC": Currency(code: "LTC", symbol: '', icon: '', title: '', country: ''), //TODO Search cur
    "LYD": Currency(code: "LYD", symbol: '', icon: '', title: 'Ливийский динар', country: 'Ливия'),
    "MAD": Currency(code: "MAD", symbol: '', icon: '', title: 'Марокканский дирхам', country: 'Марокко'),
    "MDL": Currency(code: "MDL", symbol: '', icon: '', title: 'Молдавский лей', country: 'Молдавия'),
    "MGA": Currency(code: "MGA", symbol: '', icon: '', title: 'Малагасийский ариари', country: 'Мадагаскар'),
    "MKD": Currency(code: "MKD", symbol: '', icon: '', title: 'Денар', country: 'Северная Македония'),
    "MMK": Currency(code: "MMK", symbol: '', icon: '', title: 'Кьят', country: 'Мьянма'),
    "MNT": Currency(code: "MNT", symbol: '', icon: '', title: 'Тугрик', country: 'Монголия'),
    "MOP": Currency(code: "MOP", symbol: '', icon: '', title: 'Патака', country: 'Макао'),
    // "MRO": Currency(code: "MRO", symbol: '', icon: '', title: '', country: ''), //TODO Search cur
    "MRU": Currency(code: "MRU", symbol: '', icon: '', title: 'Угия', country: 'Мавритания'),
    "MUR": Currency(code: "MUR", symbol: '', icon: '', title: 'Маврикийская рупия', country: 'Маврикий'),
    "MVR": Currency(code: "MVR", symbol: '', icon: '', title: 'Руфия', country: 'Мальдивы'),
    "MWK": Currency(code: "MWK", symbol: '', icon: '', title: 'Квача', country: 'Малави'),
    "MXN": Currency(code: "MXN", symbol: '', icon: '', title: 'Мексиканское песо', country: 'Мексика'),
    "MYR": Currency(code: "MYR", symbol: '', icon: '', title: 'Малайзийский ринггит', country: 'Малайзия'),
    "MZN": Currency(code: "MZN", symbol: '', icon: '', title: 'Мозамбикский метикал', country: 'Мозамбик'),
    "NAD": Currency(code: "NAD", symbol: '', icon: '', title: 'Доллар Намибии', country: 'Намибия'),
    "NGN": Currency(code: "NGN", symbol: '', icon: '', title: 'Найра', country: 'Нигерия'),
    "NIO": Currency(code: "NIO", symbol: '', icon: '', title: 'Золотая кордоба', country: 'Никарагуа'),
    "NOK": Currency(code: "NOK", symbol: '', icon: '', title: 'Норвежская крона', country: 'Норвегия'),
    "NPR": Currency(code: "NPR", symbol: '', icon: '', title: 'Непальская рупия', country: 'Непал'),
    // "NXT": Currency(code: "NXT", symbol: '', icon: '', title: '', country: ''), //TODO Search cur
    "NZD": Currency(code: "NZD", symbol: '', icon: '', title: 'Новозеландский доллар', country: 'Новая Зеландия'),
    "OMR": Currency(code: "OMR", symbol: '', icon: '', title: 'Оманский риал', country: 'Оман'),
    "PAB": Currency(code: "PAB", symbol: '', icon: '', title: 'Бальбоа', country: 'Панама'),
    "PEN": Currency(code: "PEN", symbol: '', icon: '', title: 'Новый соль', country: 'Перу'),
    "PGK": Currency(code: "PGK", symbol: '', icon: '', title: 'Кина', country: 'Папуа — Новая Гвинея'),
    "PHP": Currency(code: "PHP", symbol: '', icon: '', title: 'Филиппинское песо', country: 'Филиппины'),
    "PKR": Currency(code: "PKR", symbol: '', icon: '', title: 'Пакистанская рупия', country: 'Пакистан'),
    "PLN": Currency(code: "PLN", symbol: '', icon: '', title: 'Злотый', country: 'Польша'),
    "PYG": Currency(code: "PYG", symbol: '', icon: '', title: 'Гуарани', country: 'Парагвай'),
    "QAR": Currency(code: "QAR", symbol: '', icon: '', title: 'Катарский риал', country: 'Катар'),
    "RON": Currency(code: "RON", symbol: '', icon: '', title: 'Румынский лей', country: 'Румыния'),
    "RSD": Currency(code: "RSD", symbol: '', icon: '', title: 'Сербский динар', country: 'Сербия'),
    "RUB": Currency(code: "RUB", symbol: '₽', icon: '🇷🇺', title: 'Российский рубль', country: 'Россия'),
    "RWF": Currency(code: "RWF", symbol: '', icon: '', title: 'Франк Руанды', country: 'Руанда'),
    "SAR": Currency(code: "SAR", symbol: '', icon: '', title: 'Саудовский риял', country: 'Саудовская Аравия'),
    "SBD": Currency(
        code: "SBD", symbol: '', icon: '', title: 'Доллар Соломоновых Островов', country: 'Соломоновы Острова'),
    "SCR": Currency(code: "SCR", symbol: '', icon: '', title: 'Сейшельская рупия', country: 'Сейшельские Острова'),
    "SDG": Currency(code: "SDG", symbol: '', icon: '', title: 'Суданский фунт', country: 'Судан'),
    "SEK": Currency(code: "SEK", symbol: '', icon: '', title: 'Шведская крона', country: 'Швеция'),
    "SGD": Currency(code: "SGD", symbol: '', icon: '', title: 'Сингапурский доллар', country: 'Сингапур'),
    "SHP": Currency(
        code: "SHP",
        symbol: '',
        icon: '',
        title: 'Фунт Святой Елены',
        country: 'Остров Святой ЕленыОстров ВознесенияТристан-да-Кунья'),
    "SLL": Currency(code: "SLL", symbol: '', icon: '', title: 'Леоне', country: 'Сьерра-Леоне'),
    "SOS": Currency(code: "SOS", symbol: '', icon: '', title: 'Сомалийский шиллинг', country: 'Сомали'),
    "SRD": Currency(code: "SRD", symbol: '', icon: '', title: 'Суринамский доллар', country: 'Суринам'),
    "SSP": Currency(code: "SSP", symbol: '', icon: '', title: 'Южносуданский фунт', country: 'Южный Судан'),
    // "STD": Currency(code: "STD", symbol: '', icon: '', title: '', country: ''), //TODO Search cur
    "STN": Currency(code: "STN", symbol: '', icon: '', title: 'Добра', country: 'Сан-Томе и Принсипи'),
    // "STR": Currency(code: "STR", symbol: '', icon: '', title: '', country: ''), //TODO Search cur
    "SVC": Currency(code: "SVC", symbol: '', icon: '', title: 'Сальвадорский колон', country: 'Сальвадор'),
    "SYP": Currency(code: "SYP", symbol: '', icon: '', title: 'Сирийский фунт', country: 'Сирия'),
    "SZL": Currency(code: "SZL", symbol: '', icon: '', title: 'Мн. Эмалангени', country: 'Эсватини'),
    "THB": Currency(code: "THB", symbol: '', icon: '', title: 'Бат', country: 'Таиланд'),
    "TJS": Currency(code: "TJS", symbol: '', icon: '', title: 'Сомони', country: 'Таджикистан'),
    "TMT": Currency(code: "TMT", symbol: '', icon: '', title: 'Новый туркменский манат', country: 'Туркмения'),
    "TND": Currency(code: "TND", symbol: '', icon: '', title: 'Тунисский динар', country: 'Тунис'),
    "TOP": Currency(code: "TOP", symbol: '', icon: '', title: 'Паанга', country: 'Тонга'),
    "TRY": Currency(code: "TRY", symbol: '', icon: '', title: 'Турецкая лира', country: 'Турция'),
    "TTD":
        Currency(code: "TTD", symbol: '', icon: '', title: 'Доллар Тринидада и Тобаго', country: 'Тринидад и Тобаго'),
    "TWD":
        Currency(code: "TWD", symbol: '', icon: '', title: 'Новый тайваньский доллар', country: 'Китайская Республика'),
    "TZS": Currency(code: "TZS", symbol: '', icon: '', title: 'Танзанийский шиллинг', country: 'Танзания'),
    "UAH": Currency(code: "UAH", symbol: '', icon: '', title: 'Гривна', country: 'Украина'),
    "UGX": Currency(code: "UGX", symbol: '', icon: '', title: 'Угандийский шиллинг', country: 'Уганда'),
    "USD": Currency(code: "USD", symbol: '\$', icon: '🇺🇸', title: 'Доллар', country: 'Америка'),
    "UYU": Currency(code: "UYU", symbol: '', icon: '', title: 'Уругвайское песо', country: 'Уругвай'),
    "UZS": Currency(code: "UZS", symbol: '', icon: '', title: 'Узбекский сум', country: 'Узбекистан'),
    // "VEF_BLKMKT": Currency(code: "VEF_BLKMKT", symbol: '', icon: '', title: '', country: ''), //TODO Search cur
    // "VEF_DICOM": Currency(code: "VEF_DICOM", symbol: '', icon: '', title: '', country: ''), //TODO Search cur
    // "VEF_DIPRO": Currency(code: "VEF_DIPRO", symbol: '', icon: '', title: '', country: ''), //TODO Search cur
    "VES": Currency(code: "VES", symbol: '', icon: '', title: 'Суверенный боливар', country: 'Венесуэла'),
    "VND": Currency(code: "VND", symbol: '', icon: '', title: 'Донг', country: 'Вьетнам'),
    "VUV": Currency(code: "VUV", symbol: '', icon: '', title: 'Вату', country: 'Вануату'),
    "WST": Currency(code: "WST", symbol: '', icon: '', title: 'Тала', country: 'Самоа'),
    "XAF": Currency(code: "XAF", symbol: '', icon: '', title: 'Франк КФА BEAC', country: 'Республика Конго'),
    // "XAG": Currency(code: "XAG", symbol: '', icon: '', title: '', country: ''), //TODO Search cur
    // "XAU": Currency(code: "XAU", symbol: '', icon: '', title: '', country: ''), //TODO Search cur
    "XCD": Currency(code: "XCD", symbol: '', icon: '', title: 'Восточно-карибский доллар', country: 'Ангилья'),
    // "XDR": Currency(code: "XDR", symbol: '', icon: '', title: '', country: ''), //TODO Search cur
    // "XMR": Currency(code: "XMR", symbol: '', icon: '', title: '', country: ''), //TODO Search cur
    "XOF": Currency(code: "XOF", symbol: '', icon: '', title: 'Франк КФА BCEAO', country: 'Сенегал'),
    // "XPD": Currency(code: "XPD", symbol: '', icon: '', title: '', country: ''), //TODO Search cur
    "XPF": Currency(code: "XPF", symbol: '', icon: '', title: 'Франк КФП', country: 'Французская Полинезия'),
    // "XPT": Currency(code: "XPT", symbol: '', icon: '', title: '', country: ''), //TODO Search cur
    // "XRP": Currency(code: "XRP", symbol: '', icon: '', title: '', country: ''), //TODO Search cur
    "YER": Currency(code: "YER", symbol: '', icon: '', title: 'Йеменский риал', country: 'Йемен'),
    "ZAR": Currency(code: "ZAR", symbol: '', icon: '', title: 'Рэнд', country: 'ЮАР'),
    "ZMW": Currency(code: "ZMW", symbol: '', icon: '', title: 'Замбийская квача', country: 'Замбия'),
    "ZWL": Currency(code: "ZWL", symbol: '', icon: '', title: 'Доллар Зимбабве', country: 'Зимбабве'),
    // "NMC": Currency(code: "NMC", symbol: '', icon: '', title: '', country: ''), //TODO Search cur
    // "PPC": Currency(code: "PPC", symbol: '', icon: '', title: '', country: ''), //TODO Search cur
    // "NVC": Currency(code: "NVC", symbol: '', icon: '', title: '', country: ''), //TODO Search cur
    // "XPM": Currency(code: "XPM", symbol: '', icon: '', title: '', country: ''), //TODO Search cur
    // "EAC": Currency(code: "EAC", symbol: '', icon: '', title: '', country: ''), //TODO Search cur
    // "VTC": Currency(code: "VTC", symbol: '', icon: '', title: '', country: ''), //TODO Search cur
    // "EMC": Currency(code: "EMC", symbol: '', icon: '', title: '', country: ''), //TODO Search cur
    // "FCT": Currency(code: "FCT", symbol: '', icon: '', title: '', country: ''), //TODO Search cur
    // "BNB": Currency(code: "BNB", symbol: '', icon: '', title: '', country: ''), //TODO Search cur
  };
}
