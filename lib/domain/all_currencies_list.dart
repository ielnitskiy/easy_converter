import 'package:cur_val/resources/resources.dart';
import '../api/api_client.dart';
import 'currency.dart';

class AllCurrenciesList {
  Future<Map<String, dynamic>> getRateList() async {
    Map<String, dynamic> rates = await ApiClient().get();
    return rates['rates'];
  }

  static final allCurrenciesList = <String, Currency>{
    "AED": Currency(code: "AED", flag: Svgs.unitedArabEmirates, symbol: '.د.إ', title: 'Дирхам ОАЭ', country: 'ОАЭ'),
    "AFN": Currency(code: "AFN", flag: Svgs.afghanistan, symbol: '؋', title: 'Афгани	', country: 'Афганистан'),
    "ALL": Currency(code: "ALL", flag: Svgs.albania, symbol: 'L', title: 'Лек', country: 'Албания'),
    "AMD": Currency(code: "AMD", flag: Svgs.armenia, symbol: '֏', title: 'Армянский драм', country: 'Армения'),
    "ANG": Currency(code: "ANG", flag: Svgs.sintMaarten, symbol: 'ƒ', title: 'Нидерландскийантильский гульден', country: 'Синт-Мартен'),
    "AOA": Currency(code: "AOA", flag: Svgs.angola, symbol: 'Kz', title: 'Кванза', country: 'Ангола'),
    "ARS": Currency(code: "ARS", flag: Svgs.argentina, symbol: '\$', title: 'Аргентинское песо', country: 'Аргентина'),
    "AUD": Currency(code: "AUD", flag: Svgs.australia, symbol: '\$', title: 'Австралийский доллар', country: 'Австралия'),
    "AWG": Currency(code: "AWG", flag: Svgs.aruba, symbol: 'ƒ', title: 'Арубанский флорин', country: 'Аруба'),
    "AZN": Currency(code: "AZN", flag: Svgs.azerbaijan, symbol: '₼', title: 'Азербайджанский манат', country: 'Азербайджан'),
    "BAM": Currency(code: "BAM", flag: Svgs.bosniaAndHerzegovina, symbol: 'KM', title: 'Конвертируемая марка', country: 'Босния и Герцеговина'),
    "BBD": Currency(code: "BBD", flag: Svgs.barbados, symbol: '\$', title: 'Барбадосский доллар', country: 'Барбадос'),
    "BDT": Currency(code: "BDT", flag: Svgs.bangladesh, symbol: '৳', title: 'Така', country: 'Бангладеш'),
    "BGN": Currency(code: "BGN", flag: Svgs.bulgaria, symbol: 'лв', title: 'Болгарский лев', country: 'Болгария'),
    "BHD": Currency(code: "BHD", flag: Svgs.bahrain, symbol: 'BD', title: 'Бахрейнский динар', country: 'Бахрейн'),
    "BIF": Currency(code: "BIF", flag: Svgs.burundi, symbol: '₣', title: 'Бурундийский франк', country: 'Бурунди'),
    "BMD": Currency(code: "BMD", flag: Svgs.bermuda, symbol: '\$', title: 'Бермудский доллар', country: 'Бермуды'),
    "BND": Currency(code: "BND",flag: Svgs.brunei, symbol: 'B\$', title: 'Брунейский доллар', country: 'Бруней'),
    "BOB": Currency(code: "BOB",flag: Svgs.bolivia, symbol: 'Bs', title: 'Боливиано', country: 'Боливия'),
    "BRL": Currency(code: "BRL",flag: Svgs.brazil, symbol: 'R\$', title: 'Бразильский реал', country: 'Бразилия'),
    "BSD": Currency(code: "BSD",flag: Svgs.bahamas, symbol: '\$', title: 'Багамский доллар', country: 'Багамские Острова'),
    "BTC": Currency(code: "BTC", symbol: '₿', title: 'Биткойн', country: 'Bitcion'), //todo get flag/icon
    "BTN": Currency(code: "BTN",flag: Svgs.bhutan, symbol: 'Nu', title: 'Нгултрум', country: 'Бутан'),
    "BTS": Currency(code: "BTS", symbol: 'BTS', title: 'BitShares', country: 'BitShares'),//todo get flag/icon
    "BWP": Currency(code: "BWP",flag: Svgs.botswana, symbol: 'P', title: 'Пула', country: 'Ботсвана'),
    "BYN": Currency(code: "BYN",flag: Svgs.belarus, symbol: 'Br', title: 'Белорусский рубль', country: 'Белоруссия'),
    "BZD": Currency(code: "BZD",flag: Svgs.belize, symbol: 'Bz\$', title: 'Белизский доллар', country: 'Белиз'),
    "CAD": Currency(code: "CAD",flag: Svgs.canada, symbol: 'C\$', title: 'Канадский доллар', country: 'Канада'),
    "CDF": Currency(code: "CDF",flag: Svgs.democraticRepublicOfCongo , symbol: '₣', title: 'Конголезский франк', country: 'ДР Конго'),
    "CHF": Currency(code: "CHF",flag: Svgs.switzerland , symbol: '₣', title: 'Швейцарский франк', country: 'Швейцария'),
    "CLP": Currency(code: "CLP",flag: Svgs.chile , symbol: '\$', title: 'Чилийское песо', country: 'Чили'),
    "CNY": Currency(code: "CNY",flag: Svgs.china , symbol: '¥', title: 'Юань', country: 'Китай'),
    "COP": Currency(code: "COP",flag: Svgs.colombia , symbol: 'COL\$', title: 'Колумбийское песо', country: 'Колумбия'),
    "CRC": Currency(code: "CRC",flag: Svgs.costaRica , symbol: '₡', title: 'Коста-риканский колон', country: 'Коста-Рика'),
    "CUP": Currency(code: "CUP",flag: Svgs.cuba , symbol: '\$MN', title: 'Кубинское песо', country: 'Куба'),
    "CVE": Currency(code: "CVE",flag: Svgs.capeVerde , symbol: 'Esc', title: 'Эскудо Кабо-Верде', country: 'Кабо-Верде'),
    "CZK": Currency(code: "CZK",flag: Svgs.czechRepublic , symbol: 'Kč', title: 'Чешская крона', country: 'Чехия'),
    "DASH": Currency(code: "DASH", symbol: '',  title: 'Dash', country: 'Даш'), //todo get flag/icon
    "DJF": Currency(code: "DJF",flag: Svgs.djibouti  , symbol: '₣', title: 'Франк Джибути', country: 'Джибути'),
    "DKK": Currency(code: "DKK",flag: Svgs.denmark, symbol: 'kr', title: 'Датская крона', country: 'Дания'),
    "DOGE": Currency(code: "DOGE", symbol: '',  title: 'Dogecoin', country: 'Dogecoin'), //todo get flag/icon
    "DOP": Currency(code: "DOP",flag: Svgs.dominicanRepublic  , symbol: 'RD\$', title: 'Доминиканское песо', country: 'Доминиканская Республика'),
    "DZD": Currency(code: "DZD",flag: Svgs.algeria  , symbol: 'DA', title: 'Алжирский динар', country: 'Алжир'),
    "EGP": Currency(code: "EGP",flag: Svgs.egypt  , symbol: 'LE', title: 'Египетский фунт', country: 'Египет'),
    "ERN": Currency(code: "ERN",flag: Svgs.eritrea  , symbol: '	Nfk', title: 'Накфа', country: 'Эритрея'),
    "ETB": Currency(code: "ETB" , symbol: 'Br', title: 'Эфиопский быр', country: 'Эфиопия'),//todo get flag/icon
    "ETH": Currency(code: "ETH", symbol: '',  title: 'Эфириум', country: 'Ethereum'), //todo get flag/icon
    "EUR": Currency(code: "EUR",flag: Svgs.europeanUnion  , symbol: '€', title: 'Евро', country: 'Европейский союз'),
    "FJD": Currency(code: "FJD",flag: Svgs.fiji  , symbol: 'FJ\$', title: 'Доллар Фиджи', country: 'Фиджи'),
    "FKP": Currency(code: "FKP",flag: Svgs.falklandIslands  , symbol: '£', title: 'ФунтФолклендских островов', country: 'Фолклендские острова'),
    "GBP": Currency(code: "GBP",flag: Svgs.unitedKingdom, symbol: '£', title: 'Фунт стерлингов', country: 'Великобритания'),
    "GEL": Currency(code: "GEL",flag: Svgs.georgia  , symbol: '₾', title: 'Лари', country: 'Грузия'),
    "GGP": Currency(code: "GGP",flag: Svgs.guernsey, symbol: '£',  title: 'Гернсийский фунт', country: 'Гернси'),
    "GHS": Currency(code: "GHS",flag: Svgs.ghana  , symbol: 'GH₵', title: 'Ганский седи', country: 'Гана'),
    "GIP": Currency(code: "GIP",flag: Svgs.gibraltar  , symbol: '£', title: 'Гибралтарский фунт', country: 'Гибралтар'),
    "GMD": Currency(code: "GMD",flag: Svgs.gambia  , symbol: 'D', title: 'Даласи', country: 'Гамбия'),
    "GNF": Currency(code: "GNF",flag: Svgs.guinea  , symbol: '₣', title: 'Гвинейский франк', country: 'Гвинея'),
    "GTQ": Currency(code: "GTQ",flag: Svgs.guatemala  , symbol: 'Q', title: 'Кетсаль', country: 'Гватемала'),
    "GYD": Currency(code: "GYD",flag: Svgs.guyana  , symbol: 'GY\$', title: 'Гайанский доллар', country: 'Гайана'),
    "HKD": Currency(code: "HKD",flag: Svgs.hongKong  , symbol: 'HK\$', title: 'Гонконгский доллар', country: 'Гонконг'),
    "HNL": Currency(code: "HNL",flag: Svgs.honduras  , symbol: '	L', title: 'Лемпира', country: 'Гондурас'),
    "HRK": Currency(code: "HRK", flag:Svgs.croatia , symbol: 'Kn', title: 'Хорватская куна', country: 'Хорватия'),
    "HTG": Currency(code: "HTG",flag: Svgs.haiti  , symbol: 'G', title: 'Гурд', country: 'Гаити'),
    "HUF": Currency(code: "HUF",flag: Svgs.hungary  , symbol: 'Ft', title: 'Форинт', country: 'Венгрия'),
    "IDR": Currency(code: "IDR",flag: Svgs.indonesia  , symbol: 'Rp', title: 'Индонезийская рупия', country: 'Индонезия'),
    "ILS": Currency(code: "ILS",flag: Svgs.israel  , symbol: '₪', title: 'Новый израильский шекель', country: 'Израиль'),
    "IMP": Currency(code: "IMP",flag: Svgs.isleOfMan, symbol: '£',  title: 'Фунт Острова Мэн', country: 'Остров Мэн'),
    "INR": Currency(code: "INR",flag: Svgs.india , symbol: '₹', title: 'Индийская рупия', country: 'Индия'),
    "IQD": Currency(code: "IQD",flag: Svgs.iraq , symbol: 'د.ع', title: 'Иракский динар', country: 'Ирак'),
    "IRR": Currency(code: "IRR",flag: Svgs.iran , symbol: '﷼', title: 'Иранский риал', country: 'Иран'),
    "ISK": Currency(code: "ISK",flag: Svgs.iceland , symbol: 'kr', title: 'Исландская крона', country: 'Исландия'),
    "JEP": Currency(code: "JEP",flag: Svgs.jersey , symbol: '£',  title: 'Джерсийский фунт', country: 'Джерси'),
    "JMD": Currency(code: "JMD",flag: Svgs.jamaica , symbol: 'J\$', title: 'Ямайский доллар', country: 'Ямайка'),
    "JOD": Currency(code: "JOD",flag: Svgs.jordan , symbol: 'JD', title: 'Иорданский динар', country: 'Иордания'),
    "JPY": Currency(code: "JPY",flag: Svgs.japan , symbol: '¥', title: 'Иена', country: 'Япония'),
    "KES": Currency(code: "KES",flag: Svgs.kenya , symbol: '',  title: 'Кенийский шиллинг', country: 'Республика Кения'),
    "KGS": Currency(code: "KGS",flag: Svgs.kyrgyzstan , symbol: 'с', title: 'Сом', country: 'Киргизия'),
    "KHR": Currency(code: "KHR", symbol: '៛', title: 'Риель', country: 'Камбоджа'),//todo get flag/icon
    "KMF": Currency(code: "KMF",flag: Svgs.comoros , symbol: '₣', title: 'Франк Комор', country: 'Коморы'),
    "KPW": Currency(code: "KPW",flag: Svgs.northKorea , symbol: '₩', title: 'Северокорейская вона', country: 'КНДР'),
    "KRW": Currency(code: "KRW",flag: Svgs.southKorea , symbol: '₩', title: 'Южнокорейская вона', country: 'Республика Корея'),
    "KWD": Currency(code: "KWD",flag: Svgs.kuwait , symbol: 'KD', title: 'Кувейтский динар', country: 'Кувейт'),
    "KYD": Currency(code: "KYD",flag: Svgs.caymanIslands , symbol: '\$', title: 'Доллар Островов Кайман', country: 'Острова Кайман'),
    "KZT": Currency(code: "KZT",flag: Svgs.kazakhstan , symbol: '₸', title: 'Тенге', country: 'Казахстан'),
    "LAK": Currency(code: "LAK",flag: Svgs.laos , symbol: '₭', title: 'Кип', country: 'Лаос'),
    "LBP": Currency(code: "LBP",flag: Svgs.lebanon , symbol: 'ل.ل', title: 'Ливанский фунт', country: 'Ливан'),
    // "LD": Currency(code: "LD",flag: Svgs , symbol: '',  title: '', country: ''), //TODO Search cur
    "LKR": Currency(code: "LKR",flag: Svgs.sriLanka , symbol: 'Rs', title: 'Шри-ланкийская рупия', country: 'Шри-Ланка'),
    "LRD": Currency(code: "LRD",flag: Svgs.liberia , symbol: 'L\$', title: 'Либерийский доллар', country: 'Либерия'),
    "LSL": Currency(code: "LSL",flag: Svgs.lesotho , symbol: 'L', title: 'Лоти', country: 'Лесото'),
    // "LTC": Currency(code: "LTC",flag: Svgs , symbol: '',  title: '', country: ''), //TODO Search cur
    "LYD": Currency(code: "LYD",flag: Svgs.libya , symbol: 'LD', title: 'Ливийский динар', country: 'Ливия'),
    "MAD": Currency(code: "MAD",flag: Svgs.morocco , symbol: 'DH', title: 'Марокканский дирхам', country: 'Марокко'),
    "MDL": Currency(code: "MDL",flag: Svgs.moldova , symbol: 'L', title: 'Молдавский лей', country: 'Молдавия'),
    "MGA": Currency(code: "MGA",flag: Svgs.madagascar , symbol: 'Ar', title: 'Малагасийский ариари', country: 'Мадагаскар'),
    "MKD": Currency(code: "MKD",flag: Svgs.republicOfMacedonia , symbol: 'DEN', title: 'Денар', country: 'Северная Македония'),
    "MMK": Currency(code: "MMK", flag: Svgs.myanmar, symbol: 'K', title: 'Кьят', country: 'Мьянма'),
    "MNT": Currency(code: "MNT",flag: Svgs.mongolia, symbol: '₮', title: 'Тугрик', country: 'Монголия'),
    "MOP": Currency(code: "MOP",flag: Svgs.macao, symbol: 'MOP\$', title: 'Патака', country: 'Макао'),
    // "MRO": Currency(code: "MRO",flag: Svgs , symbol: '',  title: '', country: ''), //TODO Search cur
    "MRU": Currency(code: "MRU",flag: Svgs.mauritania, symbol: 'UM', title: 'Угия', country: 'Мавритания'),
    "MUR": Currency(code: "MUR",flag: Svgs.mauritius, symbol: '	₨', title: 'Маврикийская рупия', country: 'Маврикий'),

    "MVR": Currency(code: "MVR",flag: Svgs.maldives, symbol: 'Rf', title: 'Руфия', country: 'Мальдивы'),
    "MWK": Currency(code: "MWK",flag: Svgs.malawi, symbol: 'MK', title: 'Квача', country: 'Малави'),
    "MXN": Currency(code: "MXN",flag: Svgs.mexico, symbol: '\$', title: 'Мексиканское песо', country: 'Мексика'),
    "MYR": Currency(code: "MYR",flag: Svgs.malaysia, symbol: 'RM', title: 'Малайзийский ринггит', country: 'Малайзия'),
    "MZN": Currency(code: "MZN",flag: Svgs.mozambique, symbol: 'MT', title: 'Мозамбикский метикал', country: 'Мозамбик'),
    "NAD": Currency(code: "NAD",flag: Svgs.namibia, symbol: 'N\$', title: 'Доллар Намибии', country: 'Намибия'),
    "NGN": Currency(code: "NGN",flag: Svgs.nigeria, symbol: '₦', title: 'Найра', country: 'Нигерия'),
    "NIO": Currency(code: "NIO",flag: Svgs.nicaragua, symbol: 'C\$', title: 'Золотая кордоба', country: 'Никарагуа'),
    "NOK": Currency(code: "NOK",flag: Svgs.norway, symbol: 'kr', title: 'Норвежская крона', country: 'Норвегия'),
    "NPR": Currency(code: "NPR",flag: Svgs.nepal, symbol: 'N₨', title: 'Непальская рупия', country: 'Непал'),
    // "NXT": Currency(code: "NXT", symbol: '',  title: '', country: ''), //TODO Search cur
    "NZD": Currency(code: "NZD",flag: Svgs.newZealand, symbol: '\$', title: 'Новозеландский доллар', country: 'Новая Зеландия'),
    "OMR": Currency(code: "OMR",flag: Svgs.oman, symbol: 'ر.ع.', title: 'Оманский риал', country: 'Оман'),
    "PAB": Currency(code: "PAB",flag: Svgs.panama, symbol: 'B/', title: 'Бальбоа', country: 'Панама'),
    "PEN": Currency(code: "PEN",flag: Svgs.peru, symbol: 'S/', title: 'Новый соль', country: 'Перу'),
    "PGK": Currency(code: "PGK",flag: Svgs.papuaNewGuinea, symbol: 'K', title: 'Кина', country: 'Папуа — Новая Гвинея'),
    "PHP": Currency(code: "PHP",flag: Svgs.philippines, symbol: '₱', title: 'Филиппинское песо', country: 'Филиппины'),
    "PKR": Currency(code: "PKR",flag: Svgs.pakistan , symbol: 'Re', title: 'Пакистанская рупия', country: 'Пакистан'),
    "PLN": Currency(code: "PLN",flag: Svgs.poland , symbol: 'zł', title: 'Злотый', country: 'Польша'),
    "PYG": Currency(code: "PYG",flag: Svgs.paraguay , symbol: '₲', title: 'Гуарани', country: 'Парагвай'),
    "QAR": Currency(code: "QAR",flag: Svgs. , symbol: '﷼', title: 'Катарский риал', country: 'Катар'),//todo get flag/icon
    "RON": Currency(code: "RON",flag: Svgs.romania , symbol: 'L', title: 'Румынский лей', country: 'Румыния'),
    "RSD": Currency(code: "RSD",flag: Svgs.serbia , symbol: 'din', title: 'Сербский динар', country: 'Сербия'),
    "RUB": Currency(code: "RUB", flag: Svgs.russia, symbol: '₽',  title: 'Российский рубль', country: 'Россия'),
    "RWF": Currency(code: "RWF",flag: Svgs.rwanda , symbol: '₣', title: 'Франк Руанды', country: 'Руанда'),
    "SAR": Currency(code: "SAR",flag: Svgs.saudiArabia , symbol: '﷼', title: 'Саудовский риял', country: 'Саудовская Аравия'),
    "SBD": Currency(code: "SBD",flag: Svgs.solomonIslands , symbol: '\$', title: 'Доллар Соломоновых Островов', country: 'Соломоновы Острова'),
    "SCR": Currency(code: "SCR",flag: Svgs.seychelles , symbol: 'Re', title: 'Сейшельская рупия', country: 'Сейшельские Острова'),

    "SDG": Currency(code: "SDG",flag: Svgs.sudan , symbol: '£', title: 'Суданский фунт', country: 'Судан'),
    "SEK": Currency(code: "SEK",flag: Svgs.sweden , symbol: 'kr', title: 'Шведская крона', country: 'Швеция'),
    "SGD": Currency(code: "SGD",flag: Svgs.singapore , symbol: '\$', title: 'Сингапурский доллар', country: 'Сингапур'),
    "SHP": Currency(code: "SHP",flag: Svgs.unitedKingdom , symbol: '£', title: 'Фунт Святой Елены', country: 'Остров Святой ЕленыОстров ВознесенияТристан-да-Кунья'),
    "SLL": Currency(code: "SLL",flag: Svgs.sierraLeone , symbol: 'Le', title: 'Леоне', country: 'Сьерра-Леоне'),
    "SOS": Currency(code: "SOS",flag: Svgs.somalia , symbol: 'S', title: 'Сомалийский шиллинг', country: 'Сомали'),
    "SRD": Currency(code: "SRD",flag: Svgs.suriname , symbol: '\$', title: 'Суринамский доллар', country: 'Суринам'),
    "SSP": Currency(code: "SSP",flag: Svgs.southSudan , symbol: 'SSP', title: 'Южносуданский фунт', country: 'Южный Судан'),
    // "STD": Currency(code: "STD", symbol: '',  title: '', country: ''), //TODO Search cur
    "STN": Currency(code: "STN",flag: Svgs.saoTomeAndPrince , symbol: 'Db', title: 'Добра', country: 'Сан-Томе и Принсипи'),
    // "STR": Currency(code: "STR", symbol: '',  title: '', country: ''), //TODO Search cur
    "SVC": Currency(code: "SVC",flag: Svgs.elSalvador , symbol: '₡', title: 'Сальвадорский колон', country: 'Сальвадор'),
    "SYP": Currency(code: "SYP",flag: Svgs.syria , symbol: '.ل.س', title: 'Сирийский фунт', country: 'Сирия'),
    "SZL": Currency(code: "SZL",flag: Svgs.swaziland , symbol: 'L', title: 'Мн. Эмалангени', country: 'Эсватини'), //TODO repaint flag
    "THB": Currency(code: "THB",flag: Svgs.thailand , symbol: '฿', title: 'Бат', country: 'Таиланд'),
    "TJS": Currency(code: "TJS",flag: Svgs.tajikistan , symbol: 'с.', title: 'Сомони', country: 'Таджикистан'),
    "TMT": Currency(code: "TMT",flag: Svgs.turkmenistan , symbol: 'm', title: 'Новый туркменский манат', country: 'Туркмения'),
    "TND": Currency(code: "TND",flag: Svgs.tunisia , symbol: '.د.ت', title: 'Тунисский динар', country: 'Тунис'),
    "TOP": Currency(code: "TOP",flag: Svgs.tonga , symbol: '\$', title: 'Паанга', country: 'Тонга'),
    "TRY": Currency(code: "TRY",flag: Svgs.turkey , symbol: '₺', title: 'Турецкая лира', country: 'Турция'),
    "TTD": Currency(code: "TTD",flag: Svgs.trinidadAndTobago , symbol: '\$', title: 'Доллар Тринидада и Тобаго', country: 'Тринидад и Тобаго'),
    "TWD": Currency(code: "TWD",flag: Svgs.taiwan , symbol: 'NT\$', title: 'Новый тайваньский доллар', country: 'Тайвань'),
    "TZS": Currency(code: "TZS",flag: Svgs.tanzania , symbol: 'TSh', title: 'Танзанийский шиллинг', country: 'Танзания'),
    "UAH": Currency(code: "UAH",flag: Svgs.ukraine , symbol: '₴', title: 'Гривна', country: 'Украина'),
    "UGX": Currency(code: "UGX",flag: Svgs.uganda , symbol: 'USh', title: 'Угандийский шиллинг', country: 'Уганда'),
    "USD": Currency(code: "USD",  flag: Svgs.unitedStates, symbol: '\$', title: 'Доллар', country: 'Америка'),
    "UYU": Currency(code: "UYU",flag: Svgs.uruguay , symbol: '\$', title: 'Уругвайское песо', country: 'Уругвай'),
    "UZS": Currency(code: "UZS",flag: Svgs.uzbekistan , symbol: 'so’m', title: 'Узбекский сум', country: 'Узбекистан'),
    // "VEF_BLKMKT": Currency(code: "VEF_BLKMKT", symbol: '',  title: '', country: ''), //TODO Search cur
    // "VEF_DICOM": Currency(code: "VEF_DICOM", symbol: '',  title: '', country: ''), //TODO Search cur
    // "VEF_DIPRO": Currency(code: "VEF_DIPRO", symbol: '',  title: '', country: ''), //TODO Search cur
    "VES": Currency(code: "VES",flag: Svgs.venezuela , symbol: 'Bs. ', title: 'Суверенный боливар', country: 'Венесуэла'),
    "VND": Currency(code: "VND",flag: Svgs.vietnam , symbol: '₫', title: 'Донг', country: 'Вьетнам'),
    "VUV": Currency(code: "VUV",flag: Svgs.vanuatu , symbol: 'Vt', title: 'Вату', country: 'Вануату'),
    "WST": Currency(code: "WST",flag: Svgs.samoa , symbol: '\$', title: 'Тала', country: 'Самоа'),
    "XAF": Currency(code: "XAF",flag: Svgs.republicOfTheCongo , symbol: '₣', title: 'Франк КФА BEAC', country: 'Республика Конго'),
    // "XAG": Currency(code: "XAG", symbol: '',  title: '', country: ''), //TODO Search cur
    // "XAU": Currency(code: "XAU", symbol: '',  title: '', country: ''), //TODO Search cur
    "XCD": Currency(code: "XCD",flag: Svgs.anguilla , symbol: '\$', title: 'Восточно-карибский доллар', country: 'Ангилья'),
    // "XDR": Currency(code: "XDR", symbol: '',  title: '', country: ''), //TODO Search cur
    // "XMR": Currency(code: "XMR", symbol: '',  title: '', country: ''), //TODO Search cur
    "XOF": Currency(code: "XOF",flag: Svgs.senegal , symbol: '₣', title: 'Франк КФА', country: 'Сенегал'),
    // "XPD": Currency(code: "XPD", symbol: '',  title: '', country: ''), //TODO Search cur
    "XPF": Currency(code: "XPF",flag: Svgs.frenchPolynesia , symbol: '₣', title: 'Франк КФП', country: 'Французская Полинезия'),
    // "XPT": Currency(code: "XPT", symbol: '',  title: '', country: ''), //TODO Search cur
    // "XRP": Currency(code: "XRP", symbol: '',  title: '', country: ''), //TODO Search cur
    "YER": Currency(code: "YER",flag: Svgs.yemen , symbol: '﷼', title: 'Йеменский риал', country: 'Йемен'),
    "ZAR": Currency(code: "ZAR",flag: Svgs.southAfrica , symbol: 'R', title: 'Рэнд', country: 'ЮАР'),
    "ZMW": Currency(code: "ZMW",flag: Svgs.zambia , symbol: 'K', title: 'Замбийская квача', country: 'Замбия'),
    "ZWL": Currency(code: "ZWL",flag: Svgs.zimbabwe , symbol: 'Z\$', title: 'Доллар Зимбабве', country: 'Зимбабве'),
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
