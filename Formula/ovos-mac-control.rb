class OvosMacControl < Formula
  desc "On/off control, menubar switch, and upgrade-safe config for OVOS on macOS"
  homepage "https://github.com/OscillateLabsLLC/ovos-mac-control"
  url "https://github.com/OscillateLabsLLC/ovos-mac-control/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "552096d7809b221f3e7b4f88312f29b8314c67a81960b898b1605e0bd57eaf83"
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
