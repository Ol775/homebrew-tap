cask "claude-usage" do
  version "0.16.1"
  sha256 "d47f0689d424ef27f8a0d33985b9ce912f10747d606f37526b42d2d5b627a1a5"

  url "https://github.com/Ol775/Claude-Usage/releases/download/v#{version}/Claude-Usage-#{version}.dmg"
  name "Claude Usage"
  desc "Menu bar app showing your Claude session and weekly limits with forecasts"
  homepage "https://github.com/Ol775/Claude-Usage"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "Claude Usage.app"

  # The app is ad-hoc signed (no paid Apple Developer ID), so clear the download quarantine flag to skip the Gatekeeper prompt.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/Claude Usage.app"]
  end

  zap trash: [
    "~/Library/Application Support/ClaudeUsage",
    "~/Library/Caches/ClaudeUsage",
    "~/Library/Preferences/local.claudeusage.plist",
  ]
end
