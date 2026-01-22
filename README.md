# Voice to Text Mac Terminal

Local voice-to-text for macOS. Transcribe speech offline using WhisperKit - no API keys, no cloud, no costs.

Works with any app - Cursor, VS Code, Claude Code, browsers, Slack, or anywhere you type.

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

Grant these in **System Settings > Privacy & Security** to the terminal app that launches the executable (iTerm, Terminal, etc.):

1. **Accessibility** - Required for global hotkeys
2. **Microphone** - Required for voice recording

Once running, the app works globally in any application.

## Keyboard Shortcuts

| Shortcut | Action |
|----------|--------|
| **Ctrl+Option+Space** | Start/stop recording and transcribe |
| **Cmd+Option+A** | Show transcription history |
| **Escape** | Cancel recording |

## Models

Uses [WhisperKit](https://github.com/argmaxinc/WhisperKit) with CoreML models from [Hugging Face](https://huggingface.co/argmaxinc/whisperkit-coreml). Models download on first use via Settings and run entirely on-device.

Available models:
- **Distil Large V3** - Fast, English-optimized (recommended)
- **Large V3 Turbo** - Balanced speed/accuracy
- **Large V3** - Highest accuracy, slower

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
