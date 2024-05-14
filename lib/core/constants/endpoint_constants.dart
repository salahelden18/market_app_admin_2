class EndpointConstants {
  static const String _base = "http://salahelden18-001-site1.atempurl.com";
  static const String _basePath = "$_base/api";

  // real time
  static const String ordersReal = "$_base/orders-hub";

  // orders
  static const String orderBase = "$_basePath/Order";
  static const String updateOrder = "$_basePath/Order/update-status";
  static const String orderSearch = "$_basePath/Order/order-search";

  // order status
  static const String orderStatusBase = "$_basePath/OrderStatus";

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
  static String branchProducts(String branchId) =>
      "$_basePath/BranchProduct/$branchId";
  static String editbranchProducts(int branchProductId) =>
      "$_basePath/BranchProduct/$branchProductId";
  static String getUnAddedProducts(String branchId) =>
      "$_basePath/BranchProduct/missing-products/$branchId";

  static const String branchProduct = "$_basePath/BranchProduct";

  // product
  static const String product = "$_basePath/Product";

  // banners
  static const String banners = "$_basePath/Banners";

  // branch subcategories
  static const String branchSubcategory = "$_basePath/BranchSubCategory";
  static const String branchCategory = "$_basePath/BranchCategory";
}
