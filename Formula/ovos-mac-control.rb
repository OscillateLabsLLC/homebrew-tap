class OvosMacControl < Formula
  desc "On/off control, menubar switch, and upgrade-safe config for OVOS on macOS"
  homepage "https://github.com/OscillateLabsLLC/ovos-mac-control"
  url "https://github.com/OscillateLabsLLC/ovos-mac-control/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "7493ad2393605094d3d7c213f87886b7b6d15f47845f3c1bd48ca75deb606211"
  license "Apache-2.0"

  depends_on :macos

  def install
    bin.install "bin/ovosctl", "bin/ovos-conf-merge"
    pkgshare.install "swiftbar/ovos.5s.sh"
  end

  def caveats
    <<~EOS
      ovosctl needs a native OVOS install from ovos-installer:
        https://github.com/OpenVoiceOS/ovos-installer

      To add the menubar switch, install SwiftBar and link the plugin:
        brew install --cask swiftbar
        ln -sf "#{opt_pkgshare}/ovos.5s.sh" "$(defaults read com.ameba.SwiftBar PluginDirectory)/ovos.5s.sh"
    EOS
  end

  test do
    assert_match "ovos-installer helper not found", shell_output("#{bin}/ovosctl status 2>&1", 1)
    assert_match "usage: ovos-conf-merge", shell_output("#{bin}/ovos-conf-merge --help")
  end
end
