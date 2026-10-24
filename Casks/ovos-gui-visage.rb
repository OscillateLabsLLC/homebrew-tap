cask "ovos-gui-visage" do
  version "2.3.0"
  # The ovos-gui-visage release workflow rewrites version and sha256; all zeros until the first release.
  sha256 "3fa7a5e79608ea87f0cf8e497b5c0e6552907c8d03311c5821d6db66c0257d85"

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
