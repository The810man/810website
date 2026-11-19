# 810 Studios

Flutter homepage for 810 Studios: hero, about, services, an open-source
project feed, platform links, and footer — with a background particle
animation and terminal-style text effects.

If you like you can clone this project and make your own homepage out of this :D

## Running

```sh
flutter pub get
flutter run -d chrome
```

## Adding a project to the feed

Edit `assets/config/projects.json` and append an entry — no code changes
needed. See the top-level `_schema` note in that file for the field list.
Drop any accompanying image into `assets/images/projects/`.

## Fonts

| Font | Used for | License | In this repo? |
| --- | --- | --- | --- |
| [Archive](https://www.fontfabric.com/) by Fontfabric | big titles | Fontfabric Free Font EULA: free for commercial use; web use requires a link to fontfabric.com (in the footer); **no redistribution** | no |
| [Saira Semi Condensed](https://fonts.google.com/specimen/Saira+Semi+Condensed) | everything else | SIL Open Font License 1.1 (`assets/fonts/SairaSemiCondensed/OFL.txt`) | yes |

Only fonts whose license allows redistribution are committed; everything
else in `assets/fonts/` is git-ignored.

`Archive.otf` is therefore missing after a clone. To build locally, get it
from fontfabric.com and put it at `assets/fonts/Archive.otf`. The deploy
workflow restores it from the `ARCHIVE_FONT_B64` repository secret, which is
set with:

```sh
base64 -w0 assets/fonts/Archive.otf | gh secret set ARCHIVE_FONT_B64
```

If you clone this project for your own site, either get Archive yourself
under its license or swap it for another font in `pubspec.yaml` and
`lib/app/theme.dart`.
