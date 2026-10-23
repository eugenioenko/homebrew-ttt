class Ttt < Formula
  desc "Terminal text editor"
  homepage "https://tttedit.dev"
  version "1.9.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/eugenioenko/ttt/releases/download/v1.9.0/ttt-darwin-arm64"
      sha256 "c10ca5f4d41286f752e8e046df2a0b7fa49c5ef723194f76547cd07b68b89e49"
    else
      url "https://github.com/eugenioenko/ttt/releases/download/v1.9.0/ttt-darwin-amd64"
      sha256 "0f0e58821c560b50420147bf3bc67a14b54a5684507b3876f3681082427faf60"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/eugenioenko/ttt/releases/download/v1.9.0/ttt-linux-arm64"
      sha256 "6a97d68982d0b984f855e483d3649c0edbbc9080b8b1912c7dd9a1773ecc644e"
    else
      url "https://github.com/eugenioenko/ttt/releases/download/v1.9.0/ttt-linux-amd64"
      sha256 "6dfa4252a6d6fd17c17fdcc32cee051801bc09cf6e955d215456019357936ccb"
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
