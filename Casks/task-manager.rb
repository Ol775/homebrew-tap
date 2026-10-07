cask "task-manager" do
  version "0.3.1"
  sha256 "f6e21fa9c3d8e8e7c621edbec641289aa880d9ae2156d9c294f9fe72ce2e55bb"

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
