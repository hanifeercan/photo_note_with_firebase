import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:photo_note_with_firebase/config/router/router_names.dart';
import 'package:photo_note_with_firebase/pages/content/photo_note_detail/photo_note_detail_page.dart';
import 'package:photo_note_with_firebase/pages/content/new/new_photo_note_page.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../constants/firebase_constants.dart';
import '../../pages/auth/reset_password/reset_password_page.dart';
import '../../pages/auth/signin/signin_page.dart';
import '../../pages/auth/signup/signup_page.dart';
import '../../pages/auth/verify_email/verify_email_page.dart';
import '../../pages/content/change_password/change_password_page.dart';
import '../../pages/content/home/home_page.dart';
import '../../pages/page_not_found.dart';
import '../../pages/splash/firebase_error_page.dart';
import '../../pages/splash/splash_page.dart';
import '../../repositories/auth_repository_provider.dart';

part 'router_provider.g.dart';

@riverpod
GoRouter router(RouterRef ref) {
  final authState = ref.watch(authStateStreamProvider);

  return GoRouter(
    initialLocation: '/splash',
    redirect: (context, state) {
      if (authState is AsyncLoading<User?>) {
        return '/splash';
      }

      if (authState is AsyncError<User?>) {
        return '/firebaseError';
      }

      final authenticated = authState.valueOrNull != null;

      final authenticating =
          (state.matchedLocation == '/signin') ||
          (state.matchedLocation == '/signup') ||
          (state.matchedLocation == '/resetPassword');

      if (authenticated == false) {
        return authenticating ? null : '/signin';
      }

      if (!fbAuth.currentUser!.emailVerified) {
        return '/verifyEmail';
      }

      final verifyingEmail = state.matchedLocation == '/verifyEmail';
      final splashing = state.matchedLocation == '/splash';

      return (authenticating || verifyingEmail || splashing) ? '/home' : null;
    },
    routes: [
      GoRoute(
        path: '/splash',
        name: RouteNames.splash,
        builder: (context, state) {
          print('##### Splash #####');
          return const SplashPage();
        },
      ),
      GoRoute(
        path: '/firebaseError',
        name: RouteNames.firebaseError,
        builder: (context, state) {
          return const FirebaseErrorPage();
        },
      ),
      GoRoute(
        path: '/signin',
        name: RouteNames.signin,
        builder: (context, state) {
          return const SigninPage();
        },
      ),
      GoRoute(
        path: '/signup',
        name: RouteNames.signup,
        builder: (context, state) {
          return const SignupPage();
        },
      ),
      GoRoute(
        path: '/resetPassword',
        name: RouteNames.resetPassword,
        builder: (context, state) {
          return const ResetPasswordPage();
        },
      ),
      GoRoute(
        path: '/verifyEmail',
        name: RouteNames.verifyEmail,
        builder: (context, state) {
          return const VerifyEmailPage();
        },
      ),
      GoRoute(
        path: '/home',
        name: RouteNames.home,
        builder: (context, state) {
          return const HomePage();
        },
        routes: [
          GoRoute(
            path: 'changePassword',
            name: RouteNames.changePassword,
            builder: (context, state) {
              return const ChangePasswordPage();
            },
          ),
          GoRoute(
            path: 'newPhotoNote',
            name: RouteNames.newPhotoNote,
            builder: (context, state) {
              return const NewPhotoNotePage();
            },
          ),
          GoRoute(
            path: 'detalPhotoNote/:id',
            name: RouteNames.detailPhotoNote,
            builder: (context, state) {
              final id = state.pathParameters['id']!;
              return PhotoNotesDetailPage(id: id);
            },
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) {
      return PageNotFound(errorMessage: state.error.toString());
    },
  );
}
