cask "zolt" do
  version "0.2.1"
  sha256 "fe4be6636851ca97afcc5ce9620c897226325ed459d1129e220794f45659e7d2"

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
