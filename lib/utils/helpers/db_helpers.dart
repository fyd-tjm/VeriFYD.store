enum SharedInfo {
  callingHours,
  operatingHours,
  comingSoon,
  stockout,
  mail,
  phone,
  whatsapp,
}

//?-----------------------------------------------------------------------------
class DbHelpers {
//?-----------------------------------------------------------------------------
  static String getSharedInfoField(SharedInfo field) {
    switch (field) {
      case SharedInfo.callingHours:
        return 'CALLING HOURS';
      case SharedInfo.operatingHours:
        return 'OPERATING HOURS';
      case SharedInfo.comingSoon:
        return 'COMING SOON';
      case SharedInfo.stockout:
        return 'STOCKOUT';
      case SharedInfo.mail:
        return 'MAIL';
      case SharedInfo.phone:
        return 'PHONE';
      case SharedInfo.whatsapp:
        return 'WHATSAPP';
      default:
        return 'Invalid input';
    }
  }
//?-----------------------------------------------------------------------------
}
