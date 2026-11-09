class OvosMacControl < Formula
  desc "On/off control, menubar switch, and upgrade-safe config for OVOS on macOS"
  homepage "https://github.com/OscillateLabsLLC/ovos-mac-control"
  url "https://github.com/OscillateLabsLLC/ovos-mac-control/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "6bfc8ddb2434eb2857e395a8042aa3ba842a1e58199b4edbd1bf3a4a4a46a0dd"
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
