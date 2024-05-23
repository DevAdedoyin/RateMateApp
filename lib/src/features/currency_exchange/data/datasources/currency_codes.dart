class CurrencyCodes {
  static Map<String, String> currencyFlagMap = {
    'USD': '🇺🇸', // United States Dollar
    'EUR': '🇪🇺', // Euro
    'GBP': '🇬🇧', // British Pound
    'JPY': '🇯🇵', // Japanese Yen
    'AUD': '🇦🇺', // Australian Dollar
    'CAD': '🇨🇦', // Canadian Dollar
    'CHF': '🇨🇭', // Swiss Franc
    'CNY': '🇨🇳', // Chinese Yuan
    'SEK': '🇸🇪', // Swedish Krona
    'NZD': '🇳🇿', // New Zealand Dollar
    'MXN': '🇲🇽', // Mexican Peso
    'SGD': '🇸🇬', // Singapore Dollar
    'HKD': '🇭🇰', // Hong Kong Dollar
    'NOK': '🇳🇴', // Norwegian Krone
    'KRW': '🇰🇷', // South Korean Won
    'TRY': '🇹🇷', // Turkish Lira
    'RUB': '🇷🇺', // Russian Ruble
    'INR': '🇮🇳', // Indian Rupee
    'BRL': '🇧🇷', // Brazilian Real
    'ZAR': '🇿🇦', // South African Rand
    'PLN': '🇵🇱', // Polish Zloty
    'IDR': '🇮🇩', // Indonesian Rupiah
    'THB': '🇹🇭', // Thai Baht
    'MYR': '🇲🇾', // Malaysian Ringgit
    'PHP': '🇵🇭', // Philippine Peso
    'CZK': '🇨🇿', // Czech Koruna
    'HUF': '🇭🇺', // Hungarian Forint
    'ILS': '🇮🇱', // Israeli New Shekel
    'CLP': '🇨🇱', // Chilean Peso
    'PKR': '🇵🇰', // Pakistani Rupee
    'EGP': '🇪🇬', // Egyptian Pound
    'BDT': '🇧🇩', // Bangladeshi Taka
    'NGN': '🇳🇬', // Nigerian Naira
    'KES': '🇰🇪', // Kenyan Shilling
    'GHS': '🇬🇭', // Ghanaian Cedi
    'TWD': '🇹🇼', // New Taiwan Dollar
    'SAR': '🇸🇦', // Saudi Riyal
    'AED': '🇦🇪', // UAE Dirham
    'QAR': '🇶🇦', // Qatari Riyal
    'KWD': '🇰🇼', // Kuwaiti Dinar
    'BHD': '🇧ahrain', // Bahraini Dinar
    'OMR': '🇴🇲', // Omani Rial
    'VND': '🇻🇳', // Vietnamese Dong
    'LKR': '🇱🇰', // Sri Lankan Rupee
    'MMK': '🇲🇲', // Myanmar Kyat
    'NPR': '🇳🇵', // Nepalese Rupee
    'UAH': '🇺🇦', // Ukrainian Hryvnia
    'BGN': '🇧🇬', // Bulgarian Lev
    'RON': '🇷🇴', // Romanian Leu
    'HRK': '🇭🇷', // Croatian Kuna
    'ISK': '🇮🇸', // Icelandic Krona
    'DKK': '🇩🇰', // Danish Krone
    'MAD': '🇲🇦', // Moroccan Dirham
    'DZD': '🇩🇿', // Algerian Dinar
    'TND': '🇹🇳', // Tunisian Dinar
    'LBP': '🇱🇧', // Lebanese Pound
    'JOD': '🇯🇴', // Jordanian Dinar
    'IQD': '🇮🇶', // Iraqi Dinar
    'LYD': '🇱🇾', // Libyan Dinar
    'YER': '🇾🇪', // Yemeni Rial
    'SYP': '🇸🇾', // Syrian Pound
    'MUR': '🇲🇺', // Mauritian Rupee
    'ETB': '🇪🇹', // Ethiopian Birr
    'ZMW': '🇿🇲', // Zambian Kwacha
    'MZN': '🇲🇿', // Mozambican Metical
    'AOA': '🇦🇴', // Angolan Kwanza
    'GEL': '🇬🇪', // Georgian Lari
    'AMD': '🇦🇲', // Armenian Dram
    'AZN': '🇦🇿', // Azerbaijani Manat
    'UZS': '🇺🇿', // Uzbekistani Som
    'KZT': '🇰🇿', // Kazakhstani Tenge
    'MNT': '🇲🇳', // Mongolian Tugrik
    'KHR': '🇰🇭', // Cambodian Riel
    'LAK': '🇱🇦', // Lao Kip
    'KGS': '🇰🇬', // Kyrgyzstani Som
    'TJS': '🇹🇯', // Tajikistani Somoni
    'IRR': '🇮🇷', // Iranian Rial
    'AFN': '🇦🇫', // Afghan Afghani
    'MVR': '🇲🇻', // Maldivian Rufiyaa
    'SCR': '🇸🇨', // Seychellois Rupee
    'BND': '🇧🇳', // Brunei Dollar
    'BTN': '🇧🇹', // Bhutanese Ngultrum
    'PGK': '🇵🇬', // Papua New Guinean Kina
    'SBD': '🇸🇧', // Solomon Islands Dollar
    'FJD': '🇫🇯', // Fijian Dollar
    'TOP': '🇹🇴', // Tongan Pa'anga
    'WST': '🇼🇸', // Samoan Tala
    'VUV': '🇻🇺', // Vanuatu Vatu
    'XPF': '🇵🇫', // CFP Franc
    'BBD': '🇧🇧', // Barbadian Dollar
    'BZD': '🇧🇿', // Belize Dollar
    'GYD': '🇬🇾', // Guyanese Dollar
    'JMD': '🇯🇲', // Jamaican Dollar
    'TTD': '🇹🇹', // Trinidad and Tobago Dollar
    'BMD': '🇧🇲', // Bermudian Dollar
    'BSD': '🇧🇸', // Bahamian Dollar
    'KYD': '🇰🇾', // Cayman Islands Dollar
    'SHP': '🇸🇭', // Saint Helena Pound
    'XCD': '🇦🇬', // East Caribbean Dollar
    'ANG': '🇨🇼', // Netherlands Antillean Guilder
    'AWG': '🇦🇼', // Aruban Florin
    'SRD': '🇸🇷', // Surinamese Dollar
    'HTG': '🇭🇹', // Haitian Gourde
    'PAB': '🇵🇦', // Panamanian Balboa
    'PYG': '🇵🇾', // Paraguayan Guarani
    'BOB': '🇧🇴', // Bolivian Boliviano
    'PEN': '🇵🇪', // Peruvian Sol
    'UYU': '🇺🇾', // Uruguayan Peso
    'COP': '🇨🇴', // Colombian Peso
    'VEF': '🇻🇪', // Venezuelan Bolívar
    'CRC': '🇨🇷', // Costa Rican Colón
    'DOP': '🇩🇴', // Dominican Peso
    'GTQ': '🇬🇹', // Guatemalan Quetzal
    'HNL': '🇭🇳', // Honduran Lempira
    'NIO': '🇳🇮', // Nicaraguan Córdoba
    'ARS': '🇦🇷', // Argentine Peso
    'PYG': '🇵🇾', // Paraguayan Guarani
    'UYU': '🇺🇾', // Uruguayan Peso
    'BWP': '🇧🇼', // Botswanan Pula
  };
}
