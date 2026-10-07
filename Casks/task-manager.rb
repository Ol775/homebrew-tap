cask "task-manager" do
  version "0.4.3"
  sha256 "fb4e89e44c3cb9992e966746031f449b79751da1deeaf8c56ffd3cd5d94744c5"

  url "https://github.com/Ol775/macos-task-manager/releases/download/v#{version}/Task-Manager-#{version}.dmg"
  name "Task Manager"
  desc "Windows-style task manager with CPU, memory, GPU, disk and network graphs"
  homepage "https://github.com/Ol775/macos-task-manager"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sequoia

  app "TaskManager.app"

  # Ad-hoc signed (no paid Apple Developer ID): clear the quarantine flag to skip the Gatekeeper prompt.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/TaskManager.app"]
  end

  zap trash: [
    "~/Library/Caches/io.github.ol775.taskmanager",
    "~/Library/Preferences/io.github.ol775.taskmanager.plist",
    "~/Library/Saved Application State/io.github.ol775.taskmanager.savedState",
  ]
end
