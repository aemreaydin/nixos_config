{ pkgs, ... }:

{
  programs.zen-browser = {
    enable = true;
    policies = {
      AutofillAddressEnabled = false;
      AutofillCreditCardEnabled = false;
      DisableAppUpdate = true;
      DisableFeedbackCommands = true;
      DisableFirefoxStudies = true;
      DisableTelemetry = true;
      OfferToSaveLogins = false;
      OfferToSaveLoginsDefault = false;
      DisableProfileImport = true;
      DisablePocket = true;
      DisableFirefoxAccounts = true;
      CaptivePortal = false;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
    };

    profiles."default" = {
      name = "default";
      id = 0;
      isDefault = true;

      extensions = {
        packages = with pkgs.nur.repos.rycee.firefox-addons; [
          ublock-origin
          material-icons-for-github
          clearurls
          sponsorblock
          privacy-badger
          istilldontcareaboutcookies
        ];
      };
    };
  };

  stylix.targets.zen-browser.profileNames = [ "default" ];
}
