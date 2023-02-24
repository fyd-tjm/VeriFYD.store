enum SharedInfo {
  apparel,
  footwear,
  other,
  callingHours,
  operatingHours,
  launchingSoon,
  stockout,
  mail,
  phone,
  whatsapp,
}

enum StoreInfo {
  facebook,
  instagram,
  youtube,
  whatsapp,
  website,
}

//?-----------------------------------------------------------------------------
class DbHelpers {
//?-----------------------------------------------------------------------------
  static String getSharedInfoField(SharedInfo field) {
    switch (field) {
      case SharedInfo.apparel:
        return 'APPAREL';
      case SharedInfo.footwear:
        return 'FOOTWEAR';
      case SharedInfo.other:
        return 'OTHER';
      case SharedInfo.callingHours:
        return 'CALLING HOURS';
      case SharedInfo.operatingHours:
        return 'OPERATING HOURS';
      case SharedInfo.launchingSoon:
        return 'LAUNCHING SOON';
      case SharedInfo.stockout:
        return 'STOCKOUT';
      case SharedInfo.mail:
        return 'MAIL';
      case SharedInfo.phone:
        return 'PHONE';
      case SharedInfo.whatsapp:
        return 'WHATSAPP';
      default:
        return 'Invalid Field';
    }
  }

//?-----------------------------------------------------------------------------
  static String getStoreInfoField(StoreInfo field) {
    switch (field) {
      case StoreInfo.facebook:
        return 'FACEBOOK';
      case StoreInfo.instagram:
        return 'INSTAGRAM';
      case StoreInfo.youtube:
        return 'YOUTUBE';
      case StoreInfo.whatsapp:
        return 'WHATSAPP';
      case StoreInfo.website:
        return 'WEBSITE';
      default:
        return 'Invalid Field';
    }
  }
//?-----------------------------------------------------------------------------
}
