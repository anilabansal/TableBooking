const baseURL = 'https://kickass.harishparas.com/api';

const logInEndPoint = 'LoginRegister/LoginUser';
const signUpEndPoint = 'LoginRegister/RegisterUserBasic';
const processPaymentEndPoint = 'BusinessMasters/ProcessPayment';
const forgotPasswordEndPoint = 'LoginRegister/SendForgetPasswordLink';
const editUserProfile = 'LoginRegister/EditUserProfile';
const userSubscriptionList = 'BusinessMasters/GetAllSubscriptionPlan';
const userPremiumSubscriptionList =
    'BusinessMasters/GetPremiumSubscriptionPlan';
const currentSubscriptionList = 'BusinessMasters/GetUserSubscriptionPlan';
const uploadImage = 'LoginRegister/UploadImage';
const addTransaction = "BusinessMasters/AddTranscationMaster";
const listSubCategory = "BusinessMasters/ListSubCategory";
const listCategory = "BusinessMasters/ListCategory";
const addCategory = "BusinessMasters/AddCategory";
const deleteCategory = "BusinessMasters/DeleteCategory";
const deleteBusinessMileageRate = "BusinessMasters/DeleteBusinessMileageRate";
const updateCategory = "BusinessMasters/UpdateCategory";
const listBusiness = "BusinessMasters/ListUserBusiness";
const addSubCategory = "BusinessMasters/AddSubCategory";
const updateSubCategory = "BusinessMasters/UpdateSubCategory";
const deleteSubCategory = "BusinessMasters/deleteSubCategory";
const addBusinessEndPoint = "BusinessMasters/AddBusiness";
const updateBusinessEndPoint = "BusinessMasters/UpdateBusiness";
const validateCouponEndPoint = "LoginRegister/ValidateCoupon";
const updatePasswordEndPoint = "LoginRegister/ResetPasswordResult";
const addBusinessMileageRate = "BusinessMasters/AddBusinessMileageRate";
const updateBusinessMileageRate = "BusinessMasters/UpdateBusinessMileageRate";
const listBusinessMileageRate = "BusinessMasters/ListBusinessMileageRate";
const addTranscationMaster = "BusinessMasters/AddTranscationMaster";
const listTranscationMaster = "BusinessMasters/ListTranscationMaster";
const verifyTransactionMaster = "BusinessMasters/PreviewImportedData";
const updateTranscationMaster = "BusinessMasters/UpdateTranscationMaster";
const deleteTranscationMaster = "BusinessMasters/DeleteTranscationMaster";
const searchTranscationMaster = "BusinessMasters/SearchTranscationMaster";
const importTransactionMaster = "BusinessMasters/UploadTransactionCSV";
const contactUs = "LoginRegister/SendContactMessage";
const listPaymentTermsEndPoint = "BusinessMasters/ListPaymentTerms";
const addInvoiceEndPoint = "Invoice/AddInvoiceWithoutImage";
const deleteInvoiceEndPoint = "Invoice/DeleteInvoice";
const markPaidInvoiceEndPoint = "Invoice/MarkPaidInvoice";
const writeOffInvoiceEndPoint = "Invoice/MarkInvoiceWriteOffBalance";
const invoicePDFInvoiceEndPoint = "Invoice/GenerateInvoicePDF";
const editInvoiceEndPoint = "Invoice/EditInvoiceWithoutImage";
const listInvoiceEndPoint = "Invoice/ListInvoiceMaster";
const listPaymentTypes = "BusinessMasters/ListPaymentTypes";
const listCategoryTypes = "BusinessMasters/ListAllCategoryUrl";
const listSubCategoriesTypes = "BusinessMasters/ListCategory";
const reportDataEndPoint = "BusinessMasters/GetBusinessYearlyReport";
const addAllCSVTransactionsEndPoint = "BusinessMasters/SubmitCSVFinalData";

///Payment
const stripePublishableKey = 'pk_test_v6mQmgIwxFEq26Byof5rsyIQ';

///Strings
const isLogInString = 'isLogInString';
const userIdString = 'userId';
const userEmailString = 'userEmailString';
const userNameString = 'userNameString';
const userProfileString = 'userProfileString';
const tokenString = 'tokenString';
