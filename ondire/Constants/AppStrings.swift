//
//  AppStrings.swift
//  ondire
//
//  Created by ruizvi | VIDAL RUIZ VARGAS on 09/05/25.
//

import Foundation

enum AppStrings {
    //Welcome
    static let welcomeTitle = NSLocalizedString("welcome_title", comment: "")
    static let welcomeSubtitle = NSLocalizedString("welcome_subtitle", comment: "")
    static let startButton = NSLocalizedString("start_button", comment: "")
    //Role
    static let roleSelectionTitle = NSLocalizedString("role_selection_title", comment: "")
    static let roleProviderTitle = NSLocalizedString("role_provider_title", comment: "")
    static let roleProviderDescription = NSLocalizedString("role_provider_description", comment: "")
    static let roleClientTitle = NSLocalizedString("role_client_title", comment: "")
    static let roleClientDescription = NSLocalizedString("role_client_description", comment: "")
    static let loginButton = NSLocalizedString("login_button", comment: "")
    //Login
    static let loginTitle = NSLocalizedString("login_title", comment: "")
    static let emailField = NSLocalizedString("email_field", comment: "")
    static let passwordField = NSLocalizedString("password_field", comment: "")
    static let forgotPassword = NSLocalizedString("forgot_password_button", comment: "")
    static let loginAction = NSLocalizedString("login_action", comment: "")
    static let loginOr = NSLocalizedString("divider_or", comment: "")
    static let loginWithGoogle = NSLocalizedString("login_google", comment: "")
    static let loginWithApple = NSLocalizedString("login_apple", comment: "")
    static let noAccount = NSLocalizedString("no_account_button", comment: "")
    
    //Register
    
    static let registerTitle = NSLocalizedString("register_title", comment: "")
    static let registerWithApple = NSLocalizedString("register_apple", comment: "")
    static let registerWithGoogle = NSLocalizedString("register_google", comment: "")
    static let dividerOr = NSLocalizedString("divider_or", comment: "")
    static let fullNameField = NSLocalizedString("field_full_name", comment: "")
    static let termsAcceptance = NSLocalizedString("terms_acceptance", comment: "")
    static let registerAction = NSLocalizedString("register_action", comment: "")
    static let alreadyHaveAccount = NSLocalizedString("already_have_account", comment: "")
    
    static let accountCreatedTitle = NSLocalizedString("register.success.title", comment: "")
    static let accountCreatedMessage = NSLocalizedString("register.success.message", comment: "")
    static let goToLoginButton = NSLocalizedString("register.success.goToLogin", comment: "")
    
    // Register Validation Errors
    static let errorEmptyFullName = NSLocalizedString("register.error.emptyFullName", comment: "")
    static let errorEmptyEmail = NSLocalizedString("register.error.emptyEmail", comment: "")
    static let errorInvalidEmail = NSLocalizedString("register.error.invalidEmail", comment: "")
    static let errorWeakPassword = NSLocalizedString("register.error.weakPassword", comment: "")
    static let errorTermsNotAccepted = NSLocalizedString("register.error.termsNotAccepted", comment: "")
    static let errorDuplicateEmail = NSLocalizedString("register.error.duplicateEmail", comment: "")
    static let errorDuplicateProvider = NSLocalizedString("register.error.duplicateProvider", comment: "")
    static let errorMissingPassword = NSLocalizedString("register.error.missingPassword", comment: "")
    static let registerErrorGeneric = NSLocalizedString("register.error.generic", comment: "")

    // Login Validation Errors
    static let loginErrorUserNotFound = NSLocalizedString("login.error.user_not_found", comment: "")
    static let loginErrorInvalidPassword = NSLocalizedString("login.error.invalid_password", comment: "")
    static let loginErrorUserInactive = NSLocalizedString("login.error.user_inactive", comment: "")
    static let loginErrorGeneric = NSLocalizedString("login.error.generic", comment: "")
    
    static let appStatus = NSLocalizedString("app_status", comment: "")
    static let offlineStatus = NSLocalizedString("offline_status", comment: "")

    static let loadingCreatingAccount = NSLocalizedString("loading_creating_account", comment: "")
    
    
}
