class Ttt < Formula
  desc "Terminal text editor"
  homepage "https://tttedit.dev"
  version "0.3.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/eugenioenko/ttt/releases/download/v0.3.1/ttt-darwin-arm64"
      sha256 "cf8e6eb8c5f51cb4fca521e3a6ce364c4dd0b9b11caf7ba82cc9480ee0e0c16a"
    else
      url "https://github.com/eugenioenko/ttt/releases/download/v0.3.1/ttt-darwin-amd64"
      sha256 "694442080b53ec453058f3fe4b680c1daa11d06dbb291be3706cb64ad58d307e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/eugenioenko/ttt/releases/download/v0.3.1/ttt-linux-arm64"
      sha256 "8cd43631011c920805fe668034d4b23770ff1102f833936689d16ac2729f5a64"
    else
      url "https://github.com/eugenioenko/ttt/releases/download/v0.3.1/ttt-linux-amd64"
      sha256 "10c3e9efa8a39159e2c8394c88a8d7f2849a806dc9228b3195d716f1a7db5b67"
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
