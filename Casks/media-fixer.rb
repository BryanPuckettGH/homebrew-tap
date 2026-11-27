cask "media-fixer" do
  version "2.0.1"
  sha256 "c9beabbdc226e1e3a0cd57b00138eb6ae48475cb4c9c27a4ade36e07dff5d3fa"

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
