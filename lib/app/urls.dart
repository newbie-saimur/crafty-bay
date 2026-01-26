class Urls {
  static final String _baseUrl = "https://ecom-rs8e.onrender.com/api";

  static final String signUpUserUrl = "$_baseUrl/auth/signup";
  static final String verifyOtpUrl = "$_baseUrl/auth/verify-otp";
  static final String resendOtpUrl = "$_baseUrl/auth/resend-otp";
  static final String loginUrl = "$_baseUrl/auth/login";

  static final String homeBannerCarouselSliderUrl = "$_baseUrl/slides";
  static String productCategoryListUrl({
    required int count,
    required int currentPage,
  }) => "$_baseUrl/categories?count=$count&page=$currentPage";

  static String productListUrl({
    required int count,
    required int currentPage,
    required String categoryId,
  }) => "$_baseUrl/products?count=$count&page=$currentPage&category=$categoryId";
}
