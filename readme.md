# Rainmeter Music Player Widget

A dark-themed, rounded card-style music player widget for [Rainmeter](https://www.rainmeter.net/). Displays currently playing song information with full playback controls, powered by the **WebNowPlaying** plugin.

![Preview](preview.jpg)

---

## Features

| Feature | Description |
|---|---|
| Album cover art | Automatic display with rounded corners |
| Song title & artist | Real-time track information |
| Progress bar | Elapsed / total time display |
| Playback controls | Play / Pause / Previous / Next |
| Dark card design | Subtle gradient with customizable border |
| Draggable | Reposition anywhere on desktop |
| Dual source | Local media player + browser streaming (Spotify, YouTube Music, etc.) |
| Cover gallery | 81 built-in covers with right-click navigation |
| Customizable | Colors, sizes, fonts via `Variables.inc` |

---

## Requirements

1. **Rainmeter** — [rainmeter.net](https://www.rainmeter.net/)
2. **WebNowPlaying Plugin** — [GitHub Releases](https://github.com/keifufu/WebNowPlaying-Rainmeter/releases/latest)
   - Download and run the `.rmskin` to install
   - Windows 10 22H2 / Windows 11: use **v3 alpha**
3. **WebNowPlaying Browser Extension** — [wnp.keifufu.dev](https://wnp.keifufu.dev)
   - Chrome Web Store (Chrome / Edge)
   - Firefox Addons (Firefox)

---

## Installation

1. Copy `MusicPlayerWidget` to:
   ```
   Documents\Rainmeter\Skins\
   ```
2. Right-click Rainmeter tray icon → **Refresh skin**
3. Right-click again → **Skins** → **MusicPlayerWidget** → **MusicPlayer.ini**

---

## File Structure

```
MusicPlayerWidget/
├── MusicPlayer.ini              # Main skin (measures + meters)
└── @Resources/
    ├── Variables.inc            # Config: colors, sizes, paths
    ├── Hybrid.lua               # Local / web player switching
    ├── LoadFolder.ps1           # Media folder loader (lyrics)
    ├── Fonts/                   # Allura, Great Vibes, Brittany
    ├── Images/                  # Icons: play, pause, prev, next, etc.
    └── DefaultCovers/           # 81 built-in cover images
```

---

## Configuration

Edit `@Resources/Variables.inc`:

| Variable | Description | Default |
|---|---|---|
| `CardBgColorTop` | Card top color (R,G,B,A) | `4,0,1,255` |
| `CardBgColorBottom` | Card bottom color | `4,0,1,255` |
| `BorderColor` | Border color | `255,59,48,255` |
| `BorderAlpha` | Border opacity | `255` |
| `BorderWidth` | Border thickness (px) | `4` |
| `CardRadius` | Corner radius (px) | `33` |
| `CoverRadius` | Cover radius (px) | `20` |
| `SkinWidth` | Widget width (px) | `260` |
| `SkinHeight` | Widget height (px) | `360` |
| `CoverSize` | Cover size (px) | `240` |
| `FontFamily` | Font name | `Segoe UI` |
| `MusicFolder` | Local music path (for lyrics) | `%USERPROFILE%\Music` |
| `DefaultCoverIndex` | Starting cover (1–81) | `1` |
| `CoverStatic` | `0` = follow music, `1` = static | `0` |

---

## Right-Click Context Menu

| Menu Item | Action |
|---|---|
| Next Cover | Cycle to next default cover |
| Previous Cover | Cycle to previous default cover |
| Random Cover | Jump to random cover |
| Cover Folder | Open covers folder in Explorer |
| Change The Cover Go to N° | Enter specific cover number (1–81) |
| Music\|Load Folder | Load local media folder for lyrics |
| Cover\|Static | Lock cover to selected image |
| Cover\|Dynamic | Resume following album art |

---

## How It Works

1. **WebNowPlaying** browser extension detects playing media (Spotify, YouTube Music, etc.)
2. Plugin sends data (title, artist, cover, state, progress) to Rainmeter
3. **Hybrid.lua** picks the best source — local player or web player
4. Skin updates in real-time: cover art, title, progress bar, play/pause icon
5. Right-click cover gallery to browse 81 default covers when idle

---

## Known Limitations

- Requires WebNowPlaying browser extension active for web streaming
- Local player support depends on Rainmeter's MediaPlayer plugin
- Lyrics require `.lrc` files in your music folder

---

## Credits

- Built for [Rainmeter](https://www.rainmeter.net/)
- [WebNowPlaying](https://github.com/keifufu/WebNowPlaying-Rainmeter) plugin by keifufu
- Fonts: Allura, Great Vibes, Brittany Signature

---

## License

[MIT](LICENSE) — Free to use, modify, and distribute.
