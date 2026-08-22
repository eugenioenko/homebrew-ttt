class Ttt < Formula
  desc "Terminal text editor"
  homepage "https://tttedit.dev"
  version "1.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/eugenioenko/ttt/releases/download/v1.3.0/ttt-darwin-arm64"
      sha256 "f54dca7f38480c17db0999903112e20ae6b07324981a9b44077bdb62329fbf5d"
    else
      url "https://github.com/eugenioenko/ttt/releases/download/v1.3.0/ttt-darwin-amd64"
      sha256 "f1a03c72d2e719771e5503f6cc60536d754825491c4eb1b6b9a38f88b80a5249"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/eugenioenko/ttt/releases/download/v1.3.0/ttt-linux-arm64"
      sha256 "6b241065e633f7e66deddfef556a1108087ba87d82e8b17cb92873a53d29fb64"
    else
      url "https://github.com/eugenioenko/ttt/releases/download/v1.3.0/ttt-linux-amd64"
      sha256 "830b7547ce9a6a16326131cdd133f50de420cbf8d4084fd699d42861f5086809"
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
