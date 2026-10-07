cask "task-manager" do
  version "0.4.2"
  sha256 "e64b451867b5f03a2e1c4e72a1d6cca5a4ec6dcab5797fc74c933d2a535397e0"

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
