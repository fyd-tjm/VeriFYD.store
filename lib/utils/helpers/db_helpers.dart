enum SharedInfoFields {
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

enum StoreInfoFields {
  facebook,
  instagram,
  youtube,
  whatsapp,
  website,
}

//?-----------------------------------------------------------------------------
class DbHelpers {
//?-----------------------------------------------------------------------------
  static String getSharedInfoField(SharedInfoFields field) {
    switch (field) {
      case SharedInfoFields.apparel:
        return 'APPAREL';
      case SharedInfoFields.footwear:
        return 'FOOTWEAR';
      case SharedInfoFields.other:
        return 'OTHER';
      case SharedInfoFields.callingHours:
        return 'CALLING HOURS';
      case SharedInfoFields.operatingHours:
        return 'OPERATING HOURS';
      case SharedInfoFields.launchingSoon:
        return 'LAUNCHING SOON';
      case SharedInfoFields.stockout:
        return 'STOCKOUT';
      case SharedInfoFields.mail:
        return 'MAIL';
      case SharedInfoFields.phone:
        return 'PHONE';
      case SharedInfoFields.whatsapp:
        return 'WHATSAPP';
      default:
        return 'Invalid Field';
    }
  }

//?-----------------------------------------------------------------------------
  static String getStoreInfoField(StoreInfoFields field) {
    switch (field) {
      case StoreInfoFields.facebook:
        return 'FACEBOOK';
      case StoreInfoFields.instagram:
        return 'INSTAGRAM';
      case StoreInfoFields.youtube:
        return 'YOUTUBE';
      case StoreInfoFields.whatsapp:
        return 'WHATSAPP';
      case StoreInfoFields.website:
        return 'WEBSITE';
      default:
        return 'Invalid Field';
    }
  }
//?-----------------------------------------------------------------------------
}
