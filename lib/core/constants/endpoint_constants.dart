class EndpointConstants {
  static const String _basePath =
      "http://salahelden18-001-site1.atempurl.com/api";

  // authentication
  static const String loginPath = '$_basePath/Account/User/Login';

  // categories
  static const String categoriesPath = "$_basePath/Categories";

  // sub categories
  static const String subCategoryPath = "$_basePath/SubCategory";
  static const String subCategoriesInsidecategoryPath =
      "$subCategoryPath/Category";

// Countires
  static const String countries = '$_basePath/Countries';

  // Cities
  static const String cities = '$_basePath/Cities';

  // districts
  static const String district = '$_basePath/Districts';

// subdistricts
  static const String subDistrict = '$_basePath/SubDistricts';

  // statistics
  static const String statistics = "$_basePath/Statistics/name-number-stats";

  // branch
  static const String branch = "$_basePath/Branch";
}
