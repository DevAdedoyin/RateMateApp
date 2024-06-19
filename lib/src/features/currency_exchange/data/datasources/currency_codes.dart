class CurrencyCodes {
  static Map<String, String> currencyFlagMap = {
    'USD': '🇺🇸', // United States Dollar
    'EUR': '🇪🇺', // Euro
    'GBP': '🇬🇧', // British Pound
    'CNY': '🇨🇳', // Chinese Yuan
    'JPY': '🇯🇵', // Japanese Yen
    'AUD': '🇦🇺', // Australian Dollar
    'CAD': '🇨🇦', // Canadian Dollar
    'NGN': '🇳🇬', // Nigerian Naira
    'AFN': '🇦🇫', // Afghan Afghani
    'AED': '🇦🇪', // UAE Dirham
    'AMD': '🇦🇲', // Armenian Dram
    'ANG': '🇨🇼', // Netherlands Antillean Guilder
    'AOA': '🇦🇴', // Angolan Kwanza
    'ARS': '🇦🇷', // Argentine Peso
    'AUD': '🇦🇺', // Australian Dollar
    'AWG': '🇦🇼', // Aruban Florin
    'AZN': '🇦🇿', // Azerbaijani Manat
    'BBD': '🇧🇧', // Barbadian Dollar
    'BDT': '🇧🇩', // Bangladeshi Taka
    'BGN': '🇧🇬', // Bulgarian Lev
    'BHD': '🇧ahrain', // Bahraini Dinar
    'BMD': '🇧🇲', // Bermudian Dollar
    'BND': '🇧🇳', // Brunei Dollar
    'BOB': '🇧🇴', // Bolivian Boliviano
    'BRL': '🇧🇷', // Brazilian Real
    'BSD': '🇧🇸', // Bahamian Dollar
    'BTN': '🇧🇹', // Bhutanese Ngultrum
    'BWP': '🇧🇼', // Botswanan Pula
    'BZD': '🇧🇿', // Belize Dollar// Canadian Dollar
    'CHF': '🇨🇭', // Swiss Franc
    'CLP': '🇨🇱', // Chilean Peso
    'COP': '🇨🇴', // Colombian Peso
    'CRC': '🇨🇷', // Costa Rican Colón
    'CUP': '🇨🇺', // Cuban Peso
    'CZK': '🇨🇿', // Czech Koruna
    'DKK': '🇩🇰', // Danish Krone
    'DOP': '🇩🇴', // Dominican Peso
    'DZD': '🇩🇿', // Algerian Dinar
    'EGP': '🇪🇬', // Egyptian Pound
    'ETB': '🇪🇹', // Ethiopian Birr
    'FJD': '🇫🇯', // Fijian Dollar
    'GEL': '🇬🇪', // Georgian Lari
    'GHS': '🇬🇭', // Ghanaian Cedi
    'GTQ': '🇬🇹', // Guatemalan Quetzal
    'GYD': '🇬🇾', // Guyanese Dollar
    'HKD': '🇭🇰', // Hong Kong Dollar
    'HNL': '🇭🇳', // Honduran Lempira
    'HRK': '🇭🇷', // Croatian Kuna
    'HTG': '🇭🇹', // Haitian Gourde
    'HUF': '🇭🇺', // Hungarian Forint
    'IDR': '🇮🇩', // Indonesian Rupiah
    'ILS': '🇮🇱', // Israeli New Shekel
    'INR': '🇮🇳', // Indian Rupee
    'IQD': '🇮🇶', // Iraqi Dinar
    'IRR': '🇮🇷', // Iranian Rial
    'ISK': '🇮🇸', // Icelandic Krona
    'JMD': '🇯🇲', // Jamaican Dollar
    'JOD': '🇯🇴', // Jordanian Dinar
    'KES': '🇰🇪', // Kenyan Shilling
    'KGS': '🇰🇬', // Kyrgyzstani Som
    'KHR': '🇰🇭', // Cambodian Riel
    'KMF': '🇰🇲', // Comorian Franc
    'KRW': '🇰🇷', // South Korean Won
    'KWD': '🇰🇼', // Kuwaiti Dinar
    'KYD': '🇰🇾', // Cayman Islands Dollar
    'KZT': '🇰🇿', // Kazakhstani Tenge
    'LAK': '🇱🇦', // Lao Kip
    'LBP': '🇱🇧', // Lebanese Pound
    'LKR': '🇱🇰', // Sri Lankan Rupee
    'LYD': '🇱🇾', // Libyan Dinar
    'MAD': '🇲🇦', // Moroccan Dirham
    'MDL': '🇲🇩', // Moldovan Leu
    'MGA': '🇲🇬', // Malagasy Ariary
    'MMK': '🇲🇲', // Myanmar Kyat
    'MNT': '🇲🇳', // Mongolian Tugrik
    'MOP': '🇲🇴', // Macanese Pataca
    'MUR': '🇲🇺', // Mauritian Rupee
    'MVR': '🇲🇻', // Maldivian Rufiyaa
    'MWK': '🇲🇼', // Malawian Kwacha
    'MXN': '🇲🇽', // Mexican Peso
    'MYR': '🇲🇾', // Malaysian Ringgit
    'MZN': '🇲🇿', // Mozambican Metical
    'NAD': '🇳🇦', // Namibian Dollar
    'NIO': '🇳🇮', // Nicaraguan Córdoba
    'NOK': '🇳🇴', // Norwegian Krone
    'NPR': '🇳🇵', // Nepalese Rupee
    'NZD': '🇳🇿', // New Zealand Dollar
    'OMR': '🇴🇲', // Omani Rial
    'PAB': '🇵🇦', // Panamanian Balboa
    'PEN': '🇵🇪', // Peruvian Sol
    'PGK': '🇵🇬', // Papua New Guinean Kina
    'PHP': '🇵🇭', // Philippine Peso
    'PKR': '🇵🇰', // Pakistani Rupee
    'PLN': '🇵🇱', // Polish Zloty
    'PYG': '🇵🇾', // Paraguayan Guarani
    'QAR': '🇶🇦', // Qatari Riyal
    'RON': '🇷🇴', // Romanian Leu
    'RUB': '🇷🇺', // Russian Ruble
    'RWF': '🇷🇼', // Rwandan Franc
    'SAR': '🇸🇦', // Saudi Riyal
    'SBD': '🇸🇧', // Solomon Islands Dollar
    'SCR': '🇸🇨', // Seychellois Rupee
    'SDG': '🇸🇩', // Sudanese Pound
    'SEK': '🇸🇪', // Swedish Krona
    'SGD': '🇸🇬', // Singapore Dollar
    'SHP': '🇸🇭', // Saint Helena Pound
    'SLL': '🇸🇱', // Sierra Leonean Leone
    'SOS': '🇸🇴', // Somali Shilling
    'SRD': '🇸🇷', // Surinamese Dollar
    'SSP': '🇸🇸', // South Sudanese Pound
    'STN': '🇸🇹', // São Tomé and Príncipe Dobra
    'SYP': '🇸🇾', // Syrian Pound
    'SZL': '🇸🇿', // Eswatini Lilangeni
    'THB': '🇹🇭', // Thai Baht
    'TJS': '🇹🇯', // Tajikistani Somoni
    'TMT': '🇹🇲', // Turkmenistani Manat
    'TND': '🇹🇳', // Tunisian Dinar
    'TOP': '🇹🇴', // Tongan Pa'anga
    'TRY': '🇹🇷', // Turkish Lira
    'TTD': '🇹🇹', // Trinidad and Tobago Dollar
    'TWD': '🇹🇼', // New Taiwan Dollar
    'TZS': '🇹🇿', // Tanzanian Shilling
    'UAH': '🇺🇦', // Ukrainian Hryvnia
    'UGX': '🇺🇬', // Ugandan Shilling
    'UYU': '🇺🇾', // Uruguayan Peso
    'UZS': '🇺🇿', // Uzbekistani Som
    'VEF': '🇻🇪', // Venezuelan Bolívar
    'VND': '🇻🇳', // Vietnamese Dong
    'VUV': '🇻🇺', // Vanuatu Vatu
    'WST': '🇼🇸', // Samoan Tala
    'XAF': '🇨🇲', // Central African CFA Franc
    'XCD': '🇦🇬', // East Caribbean Dollar
    'XOF': '🇸🇳', // West African CFA Franc
    'XPF': '🇵🇫', // CFP Franc
    'YER': '🇾🇪', // Yemeni Rial
    'ZAR': '🇿'
  };
}
