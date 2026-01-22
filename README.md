# Voice to Text Mac Terminal

Local voice-to-text for macOS. Transcribe speech offline using WhisperKit - no API keys, no cloud, no costs. Perfect for voice-controlling Claude Code or any terminal workflow.

## How It Works

1. Press **Ctrl+Option+Space** to start recording
2. Speak
3. Press **Ctrl+Option+Space** again to stop
4. Text automatically pastes at your cursor

All transcription happens locally via WhisperKit.

## Requirements

- macOS 14.0 or later
- Xcode Command Line Tools (`xcode-select --install`)

## Installation

```bash
git clone https://github.com/manndmt-jpg/voice-to-text-mac-terminal.git
cd voice-to-text-mac-terminal
swift build
```

## Running

```bash
.build/debug/SuperVoiceAssistant &
```

The app appears in your menu bar.

**First launch:** Click the menu bar icon → Settings → download a WhisperKit model (Distil Large V3 recommended).

## Permissions

Grant these in **System Settings > Privacy & Security**:

1. **Accessibility** - Add your terminal app (iTerm, Terminal, etc.)
2. **Microphone** - Add your terminal app

Without these, hotkeys won't work and audio won't record.

## Keyboard Shortcuts

| Shortcut | Action |
|----------|--------|
| **Ctrl+Option+Space** | Start/stop recording and transcribe |
| **Cmd+Option+A** | Show transcription history |
| **Escape** | Cancel recording |

## Text Replacements

Edit `config.json` to auto-correct common mistranscriptions:

```json
{
  "textReplacements": {
    "cloud code": "claude code",
    "Cloud Code": "Claude Code"
  }
}
```

## License

MIT - see [LICENSE](LICENSE).
