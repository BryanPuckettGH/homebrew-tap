cask "media-fixer" do
  version "2.0.2"
  sha256 "08351a94717b7f3b9904e9f260ad64c2660756055cf0c3c205b7d12426d720e2"

  url "https://github.com/BryanPuckettGH/media-fixer/releases/download/v#{version}/Media-Fixer.dmg"
  name "Media Fixer"
  desc "Tidies messy movie and TV folders for Plex, Jellyfin, Emby, Kodi and Infuse"
  homepage "https://github.com/BryanPuckettGH/media-fixer"

  depends_on macos: ">= :sonoma"

  app "Media Fixer.app"

  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/Media Fixer.app"], sudo: false
  end

  zap trash: [
    "~/Library/Application Support/Media Fixer",
    "~/Library/Preferences/com.southfloridamedia.mediafixer.plist",
  ]
end
