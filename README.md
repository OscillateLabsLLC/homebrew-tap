# Oscillate Labs Homebrew tap

Homebrew casks for Oscillate Labs apps.

```bash
brew tap oscillatelabsllc/tap
brew install --cask ovos-gui-visage
```

| Cask | App |
|---|---|
| `ovos-gui-visage` | [OVOS Visage](https://github.com/OscillateLabsLLC/ovos-gui-visage), a desktop face and display for OpenVoiceOS. Signed with a Developer ID and notarised. |

The release workflow in each app's repository updates its cask's `version` and `sha256` after it
publishes a signed, notarised build, and pushes that change straight to `main`. Other changes go
through a pull request.

To remove an app and its settings: `brew uninstall --zap --cask ovos-gui-visage`.
