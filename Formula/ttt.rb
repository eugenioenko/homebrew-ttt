class Ttt < Formula
  desc "Terminal text editor"
  homepage "https://tttedit.dev"
  version "1.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/eugenioenko/ttt/releases/download/v1.6.0/ttt-darwin-arm64"
      sha256 "7db2d0c280d5d910e2e2441e78368eeaab0a33690179266863c294a7361f7079"
    else
      url "https://github.com/eugenioenko/ttt/releases/download/v1.6.0/ttt-darwin-amd64"
      sha256 "3df0a00430e7ca8f659e1183448938eb453594fb0928172cc9f97ac2c5065ce2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/eugenioenko/ttt/releases/download/v1.6.0/ttt-linux-arm64"
      sha256 "7a2d93a70beb6c4f10e35d8ef708bee121912430417fcf0c3648c96084245c02"
    else
      url "https://github.com/eugenioenko/ttt/releases/download/v1.6.0/ttt-linux-amd64"
      sha256 "3dc9003fa91b6430480f42588c9027cf9f106d318e20d77a7f7b13a01eef98e3"
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
