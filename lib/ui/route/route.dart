import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sakhy/ui/views/auth/create_passcode.dart';
import 'package:sakhy/ui/views/auth/id_verification_screen.dart';
import 'package:sakhy/ui/views/auth/otp_screen.dart';
import 'package:sakhy/ui/views/auth/sign_in/sign_in_screen.dart';
import 'package:sakhy/ui/views/auth/sign_up/sign_up_screen.dart';
import 'package:sakhy/ui/views/auth/verification_complete_screen.dart';
import 'package:sakhy/ui/views/home/bottom_nav_controller.dart';
import 'package:sakhy/ui/views/home/nav_accounts/add_card.dart';
import 'package:sakhy/ui/views/home/nav_accounts/added_card_successfully.dart';
import 'package:sakhy/ui/views/home/nav_accounts/card_details.dart';
import 'package:sakhy/ui/views/home/nav_accounts/card_settings.dart';
import 'package:sakhy/ui/views/home/nav_accounts/confirm_with_face_id.dart';
import 'package:sakhy/ui/views/home/nav_accounts/send_request_money.dart';
import 'package:sakhy/ui/views/home/nav_accounts/transfer-successful.dart';
import 'package:sakhy/ui/views/home/nav_accounts/transfer.dart';
import 'package:sakhy/ui/views/home/nav_home/income.dart';
import 'package:sakhy/ui/views/home/nav_home/spending.dart';
import 'package:sakhy/ui/views/home/nav_payments/add_contact.dart';
import 'package:sakhy/ui/views/home/nav_payments/add_international_beneficiary.dart';
import 'package:sakhy/ui/views/home/nav_payments/add_local_beneficiary.dart';
import 'package:sakhy/ui/views/home/nav_payments/add_local_beneficiary_sarie.dart';
import 'package:sakhy/ui/views/home/nav_payments/beneficiaries.dart';
import 'package:sakhy/ui/views/home/nav_payments/beneficiaries_list.dart';
import 'package:sakhy/ui/views/home/nav_payments/beneficiary_details.dart';
import 'package:sakhy/ui/views/home/nav_payments/bill_details.dart';
import 'package:sakhy/ui/views/home/nav_payments/bill_payments.dart';
import 'package:sakhy/ui/views/home/nav_payments/donation.dart';
import 'package:sakhy/ui/views/home/nav_payments/international_beneficiaries.dart';
import 'package:sakhy/ui/views/home/nav_payments/local_beneficiaries.dart';
import 'package:sakhy/ui/views/home/nav_payments/request_money.dart';
import 'package:sakhy/ui/views/home/nav_payments/send_money.dart';
import 'package:sakhy/ui/views/home/nav_payments/transfer_screen_from_transactions.dart';
import 'package:sakhy/ui/views/home/nav_pfm/account_aggregation/Account_aggregator.dart';
import 'package:sakhy/ui/views/home/nav_pfm/auto_financial_liquidity/auto_financial_liquidity.dart';
import 'package:sakhy/ui/views/home/nav_pfm/auto_financial_liquidity/auto_financial_liquidity_pay.dart';

import 'package:sakhy/ui/views/onboarding/onboarding.dart';
import 'package:sakhy/ui/views/reports/reports.dart';
import 'package:sakhy/ui/views/splash/splash_screen.dart';

// Route Names
const String splashScreen = "splash";
//const String onboardingScreen = "onboarding-Screen";
const String signUp = "sign-up";
const String signIn = "sign-in";
const String otp = "otp";
const String idVerification = "id-verification";
const String verificationComplete = "verification-complete";
const String createPasscode = "passcode";
const String bottomNavController = "Bottom-Nav-Controller";
const String income = "Income";
const String sepending = "Sepending";
const String cardDetails = "Card-Details";
const String cardSettings = "Card-Settings";
const String addCards = "Add-Cards";
const String addedCardSuccessfully = "Added Card Successfully";
const String transfer = "Transfer";
const String confirmWithFaceID = "confirm-with-face-id";
const String transferSuccessful = "transfer-successful";
const String donation = "donation";
const String billPayments = "Bill-Payments";
const String billDetails = "Bill-Details";
const String transferScreenFromTransactions =
    "Transfer-Screen-From-Transactions";
const String sendMoney = "Send Money";
const String requestMoney = "Request Money";
const String beneficiaries = "Beneficiaries";
const String addLocalBeneficiary = "Add Local Beneficiary";
const String addInternationalBeneficiary = "Add International Beneficiary";
const String addLocalBeneficiarySarie = "Add-Local-Beneficiary-Sarie";
const String addContact = "Add-Contact";
const String beneficiariesList = "Beneficiaries List";
const String localBeneficiaries = "Local-Beneficiaries";
const String internationalBeneficiaries = "International-Beneficiaries";
const String beneficiaryDetails = "Beneficiary-Details";
const String sendRequestMoney = "Send_Request_money";
const String accountAggregator = "Account_aggregator";
const String autoFinancialLiquidity = "Auto_Financial_liquidity";
const String autoFinancialLiquidityPay = "Auto_FinancialLiquidity_Pay";
const String reports = "Reports";

// Control our page route flow
Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case splashScreen:
      return CupertinoPageRoute(
        builder: (context) => SplashScreen(),
      );
    // case onboardingScreen:
    //   return CupertinoPageRoute(
    //     builder: (context) => Onboarding(),
    //   );
    case signUp:
      return CupertinoPageRoute(
        builder: (context) => SignUp(),
      );
    case signIn:
      return CupertinoPageRoute(
        builder: (context) => SignIn(),
      );
    case otp:
      return CupertinoPageRoute(
        builder: (context) => OtpScreen(),
      );
    case idVerification:
      return CupertinoPageRoute(
        builder: (context) => IDVerification(),
      );
    case verificationComplete:
      return CupertinoPageRoute(
        builder: (context) => VerificationCompleteScreen(),
      );
    case createPasscode:
      return CupertinoPageRoute(
        builder: (context) => CreatePasscode(),
      );
    case bottomNavController:
      return MaterialPageRoute(
        builder: (context) => BottomNavController(),
      );
    case income:
      return CupertinoPageRoute(
        builder: (context) => Income(),
      );
    case sepending:
      return CupertinoPageRoute(
        builder: (context) => Spending(),
      );
    // case cardDetails:
    //   return CupertinoPageRoute(
    //     builder: (context) => CardDetails(),
    //   );
    // case sendRequestMoney:
    //   return CupertinoPageRoute(
    //     builder: (context) => SendRequestMoney(),
    //   );
    case cardSettings:
      return CupertinoPageRoute(
        builder: (context) => CardSettings(),
      );
    case addCards:
      return CupertinoPageRoute(
        builder: (context) => AddCard(),
      );
    case addedCardSuccessfully:
      return CupertinoPageRoute(
        builder: (context) => AddCardSuccessfully(),
      );
    case transfer:
      return CupertinoPageRoute(
        builder: (context) => Transfer(),
      );
    case confirmWithFaceID:
      return CupertinoPageRoute(
        builder: (context) => ConfirmWithFaceID(),
      );
    case transferSuccessful:
      return CupertinoPageRoute(
        builder: (context) => TransferSuccessful(),
      );
    case donation:
      return CupertinoPageRoute(
        builder: (context) => Donation(),
      );
    case billPayments:
      return CupertinoPageRoute(
        builder: (context) => BillPayments(),
      );
    case billDetails:
      return CupertinoPageRoute(
        builder: (context) => BillDetails(),
      );
    case transferScreenFromTransactions:
      return CupertinoPageRoute(
        builder: (context) => TransferScreenFromTransactions(),
      );
    case sendMoney:
      return CupertinoPageRoute(
        builder: (context) => SendMoney(),
      );
    case requestMoney:
      return CupertinoPageRoute(
        builder: (context) => RequestMoney(),
      );
    case beneficiaries:
      return CupertinoPageRoute(
        builder: (context) => Beneficiaries(),
      );
    case addLocalBeneficiary:
      return CupertinoPageRoute(
        builder: (context) => AddLocalBeneficiary(),
      );
    case addLocalBeneficiarySarie:
      return CupertinoPageRoute(
        builder: (context) => AddLocalBeneficiarySarie(),
      );
    case addContact:
      return CupertinoPageRoute(
        builder: (context) => AddContact(),
      );
    case addInternationalBeneficiary:
      return CupertinoPageRoute(
        builder: (context) => AddlnternationalBeneficiary(),
      );
    case beneficiariesList:
      return CupertinoPageRoute(
        builder: (context) => BeneficiariesList(),
      );
    case localBeneficiaries:
      return CupertinoPageRoute(
        builder: (context) => LocalBeneficiaries(),
      );
    case internationalBeneficiaries:
      return CupertinoPageRoute(
        builder: (context) => InternationalBeneficiaries(),
      );
    // case beneficiaryDetails:
    //   return CupertinoPageRoute(
    //     builder: (context) => BeneficiaryDetails(),
    //   );
    case accountAggregator:
      return CupertinoPageRoute(
        builder: (context) => AccountAggregator(),
      );
    case autoFinancialLiquidity:
      return CupertinoPageRoute(
        builder: (context) => AutoFinancialLiquidity(),
      );
    case autoFinancialLiquidityPay:
      return CupertinoPageRoute(
        builder: (context) => AutoFinancialLiquidityPay(),
      );
    case reports:
      return CupertinoPageRoute(
        builder: (context) => ReportsScreen(),
      );
    default:
      throw ("This route name does not exist");
  }
}
