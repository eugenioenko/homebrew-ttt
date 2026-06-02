class Ttt < Formula
  desc "Terminal text editor"
  homepage "https://tttedit.dev"
  version "0.2.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/eugenioenko/ttt/releases/download/v0.2.3/ttt-darwin-arm64"
      sha256 "0bab8ce7eb8d8f1b0c55a0127c17017d74e1c277ddbd1fb473a6e17b7f67ab63"
    else
      url "https://github.com/eugenioenko/ttt/releases/download/v0.2.3/ttt-darwin-amd64"
      sha256 "a2bb30b5ac06594097e83a05a5ac6d3a879c79583f7d424b33902bba39752b67"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/eugenioenko/ttt/releases/download/v0.2.3/ttt-linux-arm64"
      sha256 "0a9142676cc48c2d73d85492b611064fcb9e270a77610d0417c5fa3eb1cef85c"
    else
      url "https://github.com/eugenioenko/ttt/releases/download/v0.2.3/ttt-linux-amd64"
      sha256 "8a2f8daabde692eeef3517dd64536e9dcacc4a9cc5763ecbb3f2c818ef819e27"
    end
  end

  def install
    binary = Dir.glob("ttt-*").first || "ttt"
    bin.install binary => "ttt"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ttt --version 2>&1", 0)
  end
end
