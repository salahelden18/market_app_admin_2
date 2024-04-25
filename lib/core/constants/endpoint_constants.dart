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
}
