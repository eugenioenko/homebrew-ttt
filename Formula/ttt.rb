class Ttt < Formula
  desc "Terminal text editor"
  homepage "https://tttedit.dev"
  version "0.3.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/eugenioenko/ttt/releases/download/v0.3.5/ttt-darwin-arm64"
      sha256 "f40955db781cc6cc23ac681b46e6f9642948d9cf99547d0d577168ce59eecca4"
    else
      url "https://github.com/eugenioenko/ttt/releases/download/v0.3.5/ttt-darwin-amd64"
      sha256 "e1be1b134dcc1b3c34e71f3f14c6c72aa42c00b18514af1164c0786a6071c06f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/eugenioenko/ttt/releases/download/v0.3.5/ttt-linux-arm64"
      sha256 "88915dcdad364fbd829f69e12eb001f8085251c715b4aac363664baf55edbf40"
    else
      url "https://github.com/eugenioenko/ttt/releases/download/v0.3.5/ttt-linux-amd64"
      sha256 "946b9c46f415e4926ecd9b0eb4984bc6274ca16b7b6236db6399d612b2b657ab"
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
