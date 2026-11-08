# Oscillate Labs Homebrew tap

Homebrew formulae and casks for Oscillate Labs apps.

```bash
brew tap oscillatelabsllc/tap
brew install --cask ovos-gui-visage
brew install ovos-mac-control
```

| Cask | App |
|---|---|
| `ovos-gui-visage` | [OVOS Visage](https://github.com/OscillateLabsLLC/ovos-gui-visage), a desktop face and display for OpenVoiceOS. Signed with a Developer ID and notarised. |

| Formula | Tool |
|---|---|
| `ovos-mac-control` | [ovos-mac-control](https://github.com/OscillateLabsLLC/ovos-mac-control): `ovosctl` on/off control, a SwiftBar menubar switch, and upgrade-safe config for a native OVOS install on macOS. |

The release workflow in each app's repository updates its cask's `version` and `sha256` after it
publishes a signed, notarised build, and pushes that change straight to `main`. Other changes go
through a pull request.

To remove an app and its settings: `brew uninstall --zap --cask ovos-gui-visage`.
