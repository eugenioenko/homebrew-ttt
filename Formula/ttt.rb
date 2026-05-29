class Ttt < Formula
  desc "Terminal text editor"
  homepage "https://tttedit.dev"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/eugenioenko/ttt/releases/download/v0.2.0/ttt-darwin-arm64"
      sha256 "dae30b4fbe76dbcd83bf35301a4d0b27f48b4b9cdde29e03da5aeb3caef5bf1f"
    else
      url "https://github.com/eugenioenko/ttt/releases/download/v0.2.0/ttt-darwin-amd64"
      sha256 "ffb963f97d7753d22841abd2f8aafce0014526064f76304c95559958fced26a1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/eugenioenko/ttt/releases/download/v0.2.0/ttt-linux-arm64"
      sha256 "b05d9b88520f94d83b1bd35aa63ba5491070ffeeac613e39ec798757a48bde84"
    else
      url "https://github.com/eugenioenko/ttt/releases/download/v0.2.0/ttt-linux-amd64"
      sha256 "e8fd7fdcc2534248624fe6f01f2c806593a4b491751546275ad5f5362289983d"
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
