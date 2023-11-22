import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/auth/base_auth_user_provider.dart';

import '/index.dart';
import '/flutter_flow/flutter_flow_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) => appStateNotifier.loggedIn
          ? const HomePageWidget()
          : const WelcomescreenWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.loggedIn
              ? const HomePageWidget()
              : const WelcomescreenWidget(),
        ),
        FFRoute(
          name: 'LoginPage',
          path: '/loginPage',
          builder: (context, params) => const LoginPageWidget(),
        ),
        FFRoute(
          name: 'Welcomescreen',
          path: '/welcomescreen',
          builder: (context, params) => const WelcomescreenWidget(),
        ),
        FFRoute(
          name: 'HomePage',
          path: '/homePage',
          builder: (context, params) => const HomePageWidget(),
        ),
        FFRoute(
          name: 'StudentProfile',
          path: '/studentProfile',
          builder: (context, params) => const StudentProfileWidget(),
        ),
        FFRoute(
          name: 'ContactMedlink',
          path: '/contactMedlink',
          builder: (context, params) => const ContactMedlinkWidget(),
        ),
        FFRoute(
          name: 'Medicineyear',
          path: '/medicineyear',
          requireAuth: true,
          builder: (context, params) => const MedicineyearWidget(),
        ),
        FFRoute(
          name: 'Dentistryyear',
          path: '/dentistryyear',
          builder: (context, params) => const DentistryyearWidget(),
        ),
        FFRoute(
          name: 'Pharmacyyear',
          path: '/pharmacyyear',
          requireAuth: true,
          builder: (context, params) => const PharmacyyearWidget(),
        ),
        FFRoute(
          name: 'Veterinaryyear',
          path: '/veterinaryyear',
          requireAuth: true,
          builder: (context, params) => const VeterinaryyearWidget(),
        ),
        FFRoute(
          name: 'Passed',
          path: '/passed',
          builder: (context, params) => PassedWidget(
            score: params.getParam('score', ParamType.int),
          ),
        ),
        FFRoute(
          name: 'Failed',
          path: '/failed',
          builder: (context, params) => FailedWidget(
            score: params.getParam('score', ParamType.int),
          ),
        ),
        FFRoute(
          name: 'QuestionsPage0',
          path: '/questionsPage0',
          requireAuth: true,
          builder: (context, params) => const QuestionsPage0Widget(),
        ),
        FFRoute(
          name: 'PrivacyAndPolicy',
          path: '/privacyAndPolicy',
          builder: (context, params) => const PrivacyAndPolicyWidget(),
        ),
        FFRoute(
          name: 'WrongQuestion',
          path: '/wrongQuestion',
          builder: (context, params) => WrongQuestionWidget(
            question: params.getParam('question', ParamType.String),
            answer: params.getParam('answer', ParamType.String),
            index: params.getParam('index', ParamType.int),
          ),
        ),
        FFRoute(
          name: 'CorrectQuestion',
          path: '/correctQuestion',
          builder: (context, params) => CorrectQuestionWidget(
            question: params.getParam('question', ParamType.String),
            answer: params.getParam('answer', ParamType.String),
            index: params.getParam('index', ParamType.int),
          ),
        ),
        FFRoute(
          name: 'checkResult',
          path: '/checkResult',
          builder: (context, params) => const CheckResultWidget(),
        ),
        FFRoute(
          name: 'universityMaterials',
          path: '/universityMaterials',
          builder: (context, params) => const UniversityMaterialsWidget(),
        ),
        FFRoute(
          name: 'materilasPreview',
          path: '/materilasPreview',
          builder: (context, params) => MaterilasPreviewWidget(
            iFrame: params.getParam('iFrame', ParamType.String),
          ),
        ),
        FFRoute(
          name: 'loadingPage',
          path: '/loadingPage',
          builder: (context, params) => const LoadingPageWidget(),
        ),
        FFRoute(
          name: 'additionalNotObligatory',
          path: '/additionalNotObligatory',
          builder: (context, params) => const AdditionalNotObligatoryWidget(),
        ),
        FFRoute(
          name: 'additionalNotObligatory_2',
          path: '/additionalNotObligatory2',
          builder: (context, params) => const AdditionalNotObligatory2Widget(),
        ),
        FFRoute(
          name: 'Bulgaria',
          path: '/bulgaria',
          builder: (context, params) => const BulgariaWidget(),
        ),
        FFRoute(
          name: 'coratia_ukraine',
          path: '/coratiaUkraine',
          builder: (context, params) => const CoratiaUkraineWidget(),
        ),
        FFRoute(
          name: 'Serbia',
          path: '/serbia',
          builder: (context, params) => const SerbiaWidget(),
        ),
        FFRoute(
          name: 'Italy',
          path: '/italy',
          builder: (context, params) => const ItalyWidget(),
        ),
        FFRoute(
          name: 'HUNGARY',
          path: '/hungary',
          builder: (context, params) => const HungaryWidget(),
        ),
        FFRoute(
          name: 'SLOVAKIA',
          path: '/slovakia',
          builder: (context, params) => const SlovakiaWidget(),
        ),
        FFRoute(
          name: 'Poland',
          path: '/poland',
          builder: (context, params) => const PolandWidget(),
        ),
        FFRoute(
          name: 'ContactMedlinkOUT',
          path: '/contactMedlinkOUT',
          builder: (context, params) => const ContactMedlinkOUTWidget(),
        ),
        FFRoute(
          name: 'QuestionsPage1',
          path: '/questionsPage1',
          requireAuth: true,
          builder: (context, params) => const QuestionsPage1Widget(),
        ),
        FFRoute(
          name: 'QuestionsPage2',
          path: '/questionsPage2',
          requireAuth: true,
          builder: (context, params) => const QuestionsPage2Widget(),
        ),
        FFRoute(
          name: 'QuestionsPage3',
          path: '/questionsPage3',
          requireAuth: true,
          builder: (context, params) => const QuestionsPage3Widget(),
        ),
        FFRoute(
          name: 'ChemQA',
          path: '/chemQA',
          requireAuth: true,
          builder: (context, params) => const ChemQAWidget(),
        ),
        FFRoute(
          name: 'ChemQA1',
          path: '/chemQA1',
          requireAuth: true,
          builder: (context, params) => const ChemQA1Widget(),
        ),
        FFRoute(
          name: 'ChemQA3',
          path: '/chemQA3',
          requireAuth: true,
          builder: (context, params) => const ChemQA3Widget(),
        ),
        FFRoute(
          name: 'ChemQA2',
          path: '/chemQA2',
          requireAuth: true,
          builder: (context, params) => const ChemQA2Widget(),
        ),
        FFRoute(
          name: 'CorrectChem',
          path: '/correctChem',
          builder: (context, params) => CorrectChemWidget(
            question: params.getParam('question', ParamType.String),
            answer: params.getParam('answer', ParamType.String),
            index: params.getParam('index', ParamType.int),
          ),
        ),
        FFRoute(
          name: 'WrongChem',
          path: '/wrongChem',
          builder: (context, params) => WrongChemWidget(
            question: params.getParam('question', ParamType.String),
            answer: params.getParam('answer', ParamType.String),
            index: params.getParam('index', ParamType.int),
          ),
        ),
        FFRoute(
          name: 'PhyQA',
          path: '/phyQA',
          requireAuth: true,
          builder: (context, params) => const PhyQAWidget(),
        ),
        FFRoute(
          name: 'WrongPhy',
          path: '/wrongPhy',
          requireAuth: true,
          builder: (context, params) => WrongPhyWidget(
            question: params.getParam('question', ParamType.String),
            answer: params.getParam('answer', ParamType.String),
            index: params.getParam('index', ParamType.int),
          ),
        ),
        FFRoute(
          name: 'CorrectPhy',
          path: '/correctPhy',
          requireAuth: true,
          builder: (context, params) => CorrectPhyWidget(
            question: params.getParam('question', ParamType.String),
            answer: params.getParam('answer', ParamType.String),
            index: params.getParam('index', ParamType.int),
          ),
        ),
        FFRoute(
          name: 'PhyQA1',
          path: '/phyQA1',
          requireAuth: true,
          builder: (context, params) => const PhyQA1Widget(),
        ),
        FFRoute(
          name: 'PhyQA2',
          path: '/phyQA2',
          requireAuth: true,
          builder: (context, params) => const PhyQA2Widget(),
        ),
        FFRoute(
          name: 'PhyQA3',
          path: '/phyQA3',
          requireAuth: true,
          builder: (context, params) => const PhyQA3Widget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
    List<String>? collectionNamePath,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(param, type, isList,
        collectionNamePath: collectionNamePath);
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.location);
            return '/welcomescreen';
          }
          return null;
        },
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Colors.white,
                  child: Image.asset(
                    'assets/images/Medlink-App.png',
                    fit: BoxFit.contain,
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder: PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).transitionsBuilder,
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() =>
      const TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouter.of(context).location;
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}
