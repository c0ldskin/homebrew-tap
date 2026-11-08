cask "zolt" do
  version "0.3.2"
  sha256 "010cb57c3b18d3acf70a1ee649d021a7f0c8e8576594b04b167c8ffbf8117e48"

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
