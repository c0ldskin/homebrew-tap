cask "zamil" do
  version "0.3.2"
  sha256 "ea562269833dca00aa3715e841f70800ec0d792400fafd883e06565599bd351f"

  url "https://github.com/c0ldskin/zolt-bot/releases/download/v#{version}/Zamil-#{version}.zip"
  name "Zamil"
  desc "Arabic-speaking pixel desktop pet and AI voice assistant"
  homepage "https://c0ldskin.github.io/zolt-bot/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :tahoe

  app "Zamil.app"

  zap trash: [
    "~/.zamil",
    "~/Library/Preferences/io.github.c0ldskin.zamil.plist",
  ]

  caveats <<~EOS
    Zamil needs Claude Code as its brain. Install it and sign in once:
      curl -fsSL https://claude.ai/install.sh | bash
      claude

    Zamil isn't notarized by Apple yet. If macOS blocks it on first launch, open
    System Settings → Privacy & Security and click "Open Anyway".
  EOS
end
