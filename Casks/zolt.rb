cask "zolt" do
  version "0.3.1"
  sha256 "42e53b97e5455d9bb536a60593adca16fbff57026b3697ca0b935eadc605bdc0"

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
