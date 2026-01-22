# My Voice to Text Mac Terminal Setup

Personal configuration notes for local voice transcription.

## Installation

```bash
cd ~
git clone https://github.com/manndmt-jpg/voice-to-text-mac-terminal.git
cd voice-to-text-mac-terminal
swift build
```

## Running

```bash
cd ~/voice-to-text-mac-terminal
.build/debug/SuperVoiceAssistant &
```

The app appears in the menu bar.

## Keyboard Shortcuts

| Shortcut | Action |
|----------|--------|
| **Ctrl+Opt+Space** | Start/stop voice recording |
| Cmd+Opt+A | Show transcription history |
| Escape | Cancel recording |

## Permissions Granted

In **System Settings > Privacy & Security**:

1. **Accessibility** - Added iTerm (required for global hotkeys and auto-paste)
2. **Microphone** - Added iTerm (required for voice recording)

## Model

Using **Distil Large V3** (WhisperKit) - downloaded via Settings menu on first launch.

Model location: `~/Library/Caches/com.argmax.whisperkit/`

## How It Works

1. Press **Ctrl+Opt+Space** to start recording
2. Speak
3. Press **Ctrl+Opt+Space** again to stop and transcribe
4. Text automatically pastes at cursor position

All transcription happens locally via WhisperKit - no internet required, no API costs.

## Customization

### Text Replacements
Edit `config.json` to auto-correct common mistranscriptions:

```json
{
  "textReplacements": {
    "cloud code": "claude code",
    "Cloud Code": "Claude Code"
  }
}
```

### Change Keyboard Shortcut
Edit `Sources/main.swift` line 48:

```swift
KeyboardShortcuts.setShortcut(.init(.space, modifiers: [.control, .option]), for: .startRecording)
```

Then rebuild: `swift build`

## Troubleshooting

**Hotkey not working:**
- Check iTerm has Accessibility permission
- Restart the app after granting permissions

**No audio recorded:**
- Check iTerm has Microphone permission
- Look for the audio level bar in menu - it should move when you speak

**First press doesn't record:**
- Model may still be loading - wait a few seconds after app launch
- Check Settings to ensure a model is downloaded and loaded
