class Ttt < Formula
  desc "Terminal text editor"
  homepage "https://tttedit.dev"
  version "0.3.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/eugenioenko/ttt/releases/download/v0.3.3/ttt-darwin-arm64"
      sha256 "4acb3f50eb6e6f9c08452b590f038f62666bffa4521bd09d178e61cf28ab0ba7"
    else
      url "https://github.com/eugenioenko/ttt/releases/download/v0.3.3/ttt-darwin-amd64"
      sha256 "c1435605fc5ab591f2d543bd535bbd1c2ef1e4d024cf8282d5f19ea90a079fa1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/eugenioenko/ttt/releases/download/v0.3.3/ttt-linux-arm64"
      sha256 "618192f493246cb1d8fdfff799f6d7a3a5b4c61f3e36b2da591f2c6b30d1b505"
    else
      url "https://github.com/eugenioenko/ttt/releases/download/v0.3.3/ttt-linux-amd64"
      sha256 "62e371aaf39dba20112dd13816f82c7001fbd742d8d17fdccaa010b640a16520"
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
