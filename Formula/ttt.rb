class Ttt < Formula
  desc "Terminal text editor"
  homepage "https://tttedit.dev"
  version "0.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/eugenioenko/ttt/releases/download/v0.2.1/ttt-darwin-arm64"
      sha256 "bdd0d1f869c6e1b729d23e097341197d92b0baf72b1f97dd3a05fd2c7d302e3a"
    else
      url "https://github.com/eugenioenko/ttt/releases/download/v0.2.1/ttt-darwin-amd64"
      sha256 "2017eb833e36837cf2b0347805deed287622fd57731f1af1761deb124149be51"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/eugenioenko/ttt/releases/download/v0.2.1/ttt-linux-arm64"
      sha256 "3345dcc4c12adaa7950fe06bc3a0888fed99930470cbc5d7b3bfb29e3823dfaa"
    else
      url "https://github.com/eugenioenko/ttt/releases/download/v0.2.1/ttt-linux-amd64"
      sha256 "197b3b6820014a2de1990bab162a4d775672ba4fca5625f1b53983ec6df0fb50"
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
