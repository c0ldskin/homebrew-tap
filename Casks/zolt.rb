cask "zolt" do
  version "0.3.0"
  sha256 "4a0af239f82b61cd5370198f848a8341ec8d11a401185fb2886f0cd6dcd6f86e"

  url "https://github.com/c0ldskin/zolt-bot/releases/download/v#{version}/Zolt-#{version}.zip"
  name "Zolt"
  desc "Pixel desktop pet and AI voice assistant"
  homepage "https://c0ldskin.github.io/zolt-bot/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :tahoe

  app "Zolt.app"

  zap trash: [
    "~/.zolt",
    "~/Library/Preferences/io.github.c0ldskin.zolt.plist",
  ]

  caveats <<~EOS
    Zolt needs Claude Code as its brain. Install it and sign in once:
      curl -fsSL https://claude.ai/install.sh | bash
      claude

    Zolt isn't notarized by Apple yet. If macOS blocks it on first launch, open
    System Settings → Privacy & Security and click "Open Anyway".
  EOS
end
