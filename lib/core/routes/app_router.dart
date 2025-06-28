import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:looqma/core/common/models/get_recipes_response_model.dart';
import 'package:looqma/core/common/models/ingredient_model.dart';
import 'package:looqma/core/common/screens/no_internet_connection.dart';
import 'package:looqma/core/common/screens/no_route_screen.dart';
import 'package:looqma/core/di/dependecy_injection.dart';
import 'package:looqma/core/routes/routes.dart';
import 'package:looqma/features/all_ingredients/presentation/views/all_ingredients_screen.dart';
import 'package:looqma/features/cart/presentation/cubit/cart_cubit/cart_cubit.dart';
import 'package:looqma/features/cart/presentation/views/cart_screen.dart';
import 'package:looqma/features/category_recipes/presentation/views/category_recipes.dart';
import 'package:looqma/features/change_password/presentation/cubit/change_password/change_password_cubit.dart';
import 'package:looqma/features/change_password/presentation/views/change_user_password.dart';
import 'package:looqma/features/chat_bot/presentation/cubit/chat_bot_cubit.dart';
import 'package:looqma/features/chat_bot/presentation/views/chat_screen.dart';
import 'package:looqma/features/checkout/data/models/payment_web_view_argument.dart';
import 'package:looqma/features/checkout/presentation/cubit/checkout/checkout_cubit.dart';
import 'package:looqma/features/checkout/presentation/views/checkout_screen.dart';
import 'package:looqma/features/payment/payment_webview.dart';
import 'package:looqma/features/diet_plan/presentation/cubit/diet_plan_cubit.dart';
import 'package:looqma/features/diet_plan/presentation/views/diet_plan_screen.dart';
import 'package:looqma/features/forget_password/data/repos/forget_password_repo.dart';
import 'package:looqma/features/forget_password/presentation/cubit/forget_password_cubit.dart';
import 'package:looqma/features/forget_password/presentation/views/forget_password_screen.dart';
import 'package:looqma/features/home/data/models/all_categories_model.dart';
import 'package:looqma/features/home/presentation/views/home_screen.dart';
import 'package:looqma/features/home_market/presentation/cubit/cubit/home_market_cubit.dart';
import 'package:looqma/features/login/data/repos/login_repo.dart';
import 'package:looqma/features/login/presentation/cubit/login_cubit.dart';
import 'package:looqma/features/login/presentation/views/login_screen.dart';
import 'package:looqma/features/market_ingredient_details/presentation/views/market_ingredient_details_screen.dart';
import 'package:looqma/features/my_profile/data/models/user_profile_response_model.dart';
import 'package:looqma/features/my_profile/presentation/cubit/update_user_profile/update_user_profile_cubit.dart';
import 'package:looqma/features/my_profile/presentation/views/screens/my_profile.dart';
import 'package:looqma/features/my_profile/presentation/views/screens/update_profile_info.dart';
import 'package:looqma/features/nav_bar_screen_switcher.dart';
import 'package:looqma/features/on_boarding/on_boarding_screen.dart';
import 'package:looqma/features/orders/data/models/order_details_argument.dart';
import 'package:looqma/features/orders/presentation/cubit/orders_cubit/orders_cubit.dart';
import 'package:looqma/features/orders/presentation/views/order_details.dart';
import 'package:looqma/features/orders/presentation/views/orders_screen.dart';
import 'package:looqma/features/otp_verify/data/repos/verfication_repo.dart';
import 'package:looqma/features/otp_verify/presentation/cubit/resend_otp/resend_otp_cubit.dart';
import 'package:looqma/features/otp_verify/presentation/cubit/verification_cubit/verification_cubit.dart';
import 'package:looqma/features/otp_verify/presentation/views/otp_verify_screen.dart';
import 'package:looqma/features/recipe_details/presentation/views/recipe_details_screen.dart';
import 'package:looqma/features/recipe_details/presentation/views/widgets/recipe_video_player.dart';
import 'package:looqma/features/reviews/data/models/review_screen_args.dart';
import 'package:looqma/features/reviews/presentation/cubit/reviews_cubit/reviews_cubit.dart';
import 'package:looqma/features/reviews/presentation/views/users_review.dart';
import 'package:looqma/features/search_market/presentation/cubit/search_market/search_market_cubit.dart';
import 'package:looqma/features/search_market/presentation/views/search_market_screen.dart';
import 'package:looqma/features/search_recipes/presentation/cubit/search_recipe/search_recipe_cubit.dart';
import 'package:looqma/features/search_recipes/presentation/views/search_recipes.dart';
import 'package:looqma/features/search_recipes_with_ai/data/models/search_recipe_with_ai_response_model.dart';
import 'package:looqma/features/search_recipes_with_ai/presentation/cubit/search_recipes_with_ai/search_recipes_with_ai_cubit.dart';
import 'package:looqma/features/search_recipes_with_ai/presentation/views/ai_recommended_recipe_details_screen.dart';
import 'package:looqma/features/search_recipes_with_ai/presentation/views/search_recipes_with_ai_screen.dart';
import 'package:looqma/features/sigh_up/data/repos/sighn_up_repo.dart';
import 'package:looqma/features/sigh_up/presentation/cubit/sighn_up_cubit.dart';
import 'package:looqma/features/sigh_up/presentation/views/sighn_up_screen.dart';

class AppRouter {
  static Route<void> getRoute(RouteSettings settings) {
    final argument = settings.arguments;
    switch (settings.name) {
      case Routes.onBording:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingScreen(),
        );
      case Routes.login:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => LoginCubit(getIt<LoginRepo>()),
            child: const LoginScreen(),
          ),
        );
      case Routes.forgetPassword:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                ForgetPasswordCubit(getIt<ForgetPasswordRepo>()),
            child: const ForgetPasswordScreen(),
          ),
        );
      case Routes.verification:
        final email = argument as String;
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                  create: (context) =>
                      VerificationCubit(getIt<VerficationRepo>())),
              BlocProvider(
                  create: (context) =>
                      ResendOtpCubit(getIt<VerficationRepo>())),
            ],
            child: OtpVerifyScreen(email: email),
          ),
        );
      case Routes.sighnUp:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => SighnUpCubit(getIt<SighnUpRepo>()),
            child: const SighnUpScreen(),
          ),
        );
      case Routes.navBarScreensSwitcher:
        return MaterialPageRoute(
          builder: (_) => const NavBarScreensSwitcher(),
        );
      case Routes.home:
        return MaterialPageRoute(
          builder: (_) => const MyHomePage(),
        );
      case Routes.searchRecipeScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<SearchRecipeCubit>(),
            child: const SearchRecipes(),
          ),
        );
      case Routes.showRecipeDetails:
        final recipeModel = argument as RecipeModel;
        return MaterialPageRoute(
          builder: (context) => RecipeDetailsScreen(recipeModel: recipeModel),
        );
      case Routes.marketIngredientsDetails:
        final args = argument as Map<String, dynamic>;
        final cartCubit = args['cartCubit'] as CartCubit;
        final ingredient = argument['ingredient'] as IngredientDataModel;
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: cartCubit,
            child: MarketIngredientDetailsScreen(
              ingredientDataModel: ingredient,
            ),
          ),
        );
      case Routes.reviewScreen:
        final args = argument as ReviewScreenArgs;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<ReviewsCubit>()
              ..getReviews(
                recipeId: args.recipeId,
                ingredientId: args.ingredientId,
              ),
            child: const UsersReview(),
          ),
        );
      case Routes.watchRecipeVideo:
        final recipeModel = argument as RecipeModel;
        return MaterialPageRoute(
          builder: (context) => YouTubeVideoScreen(recipeModel: recipeModel),
        );
      case Routes.categoryRecipes:
        final categoryModel = argument as CategoryModel;
        return MaterialPageRoute(
          builder: (context) => CategoryRecipes(category: categoryModel),
        );
      case Routes.chatScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<ChatBotCubit>(),
            child: const ChatScreen(),
          ),
        );
      case Routes.cart:
        final cartCubit = argument as CartCubit;
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: cartCubit,
            child: const CartScreen(),
          ),
        );
      case Routes.ordersScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<OrdersCubit>()..getOrders(),
            child: const OrdersScreen(),
          ),
        );
      case Routes.orderDetails:
        final orderDetails = argument as OrderDetailsArgument;
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: orderDetails.orderCubit,
            child: OrderDetails(order: orderDetails.order),
          ),
        );
      case Routes.checkout:
        final cartCubit = argument as CartCubit;
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<CheckoutCubit>()..getCartOverview(),
              ),
              BlocProvider.value(
                value: cartCubit,
              ),
            ],
            child: const CheckoutScreen(),
          ),
        );
      case Routes.paymentWebView:
        final paymentArg = argument as PaymentWebViewArgument;
        return MaterialPageRoute(
          builder: (context) => PaymentWebView(argument: paymentArg),
        );
      case Routes.allIngredients:
        final args = argument as Map<String, dynamic>;
        final homeMarketCubit = args['homeMarketCubit'] as HomeMarketCubit;
        final cartCubit = args['cartCubit'] as CartCubit;
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider.value(
                value: homeMarketCubit,
              ),
              BlocProvider.value(
                value: cartCubit,
              )
            ],
            child: const AllIngredientsScreen(),
          ),
        );
      case Routes.searchMarket:
        final cartCubit = argument as CartCubit;
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<SearchMarketCubit>(),
              ),
              BlocProvider.value(
                value: cartCubit,
              ),
            ],
            child: const SearchMarketScreen(),
          ),
        );
      case Routes.searchRecipeWithAi:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<SearchRecipesWithAiCubit>(),
            child: const SearchRecipesWithAiScreen(),
          ),
        );
      case Routes.aiRecommendedRecipeDetails:
        final recipeModel = argument as EnhancedRecipe;
        return MaterialPageRoute(
          builder: (context) =>
              AiRecommendedRecipeDetailsScreen(recipe: recipeModel),
        );
      case Routes.dietPlan:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<DietPlanCubit>(),
            child: const DietPlanScreen(),
          ),
        );
      case Routes.profile:
        return MaterialPageRoute(
          builder: (context) => const MyProfile(),
        );
      case Routes.updateProfileInfo:
        final userProfile = argument as UserProfileResponseModel;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<UpdateUserProfileCubit>(),
            child: UpdateProfileInfo(userProfile: userProfile),
          ),
        );
      case Routes.changePassword:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<ChangePasswordCubit>(),
            child: const ChangeUserPassword(),
          ),
        );
      case Routes.noInternet:
        return MaterialPageRoute(
          builder: (_) => const NoInternetConnection(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const NoRouteScreen(),
        );
    }
  }
}
