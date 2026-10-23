cask "ovos-gui-visage" do
  version "2.1.0"
  # The ovos-gui-visage release workflow rewrites version and sha256; all zeros until the first release.
  sha256 "929c5dfaba145c29ff79ba3739f095ad0123660827f1f12c2889fb1fd76577ef"

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
