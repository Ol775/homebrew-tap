cask "claude-usage" do
  version "0.10.0"
  sha256 "505d3387402ca193cac721a93284ed8606624aeef6ba63372befcd70aeb1e078"

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
