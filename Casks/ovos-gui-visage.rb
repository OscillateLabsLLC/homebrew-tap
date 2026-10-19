cask "ovos-gui-visage" do
  version "1.0.1"
  # The ovos-gui-visage release workflow rewrites version and sha256; all zeros until the first release.
  sha256 "bc5dc659d8b57f88d8a7ccf8caa8533e027f1202057e69ee24614305aedba4df"

  url "https://github.com/OscillateLabsLLC/ovos-gui-visage/releases/download/v#{version}/ovos-gui-visage-#{version}-macos.zip"
  name "OVOS Visage"
  desc "Desktop face and display for OpenVoiceOS"
  homepage "https://github.com/OscillateLabsLLC/ovos-gui-visage"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :monterey

  app "ovos_gui_visage.app", target: "OVOS Visage.app"

  zap trash: [
    "~/.config/ovos-gui-visage",
    "~/Library/Preferences/net.oscillatelabs.ovosGuiVisage.plist",
    "~/Library/Saved Application State/net.oscillatelabs.ovosGuiVisage.savedState",
  ]
end
