cask "media-fixer" do
  version "2.0.0"
  sha256 "8a7efef9c91cae4cc7c4d45e6e0e4f0796709c02849c915df364f6ccf5e1fd57"

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
