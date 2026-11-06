class Ttt < Formula
  desc "Terminal text editor"
  homepage "https://tttedit.dev"
  version "1.11.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/eugenioenko/ttt/releases/download/v1.11.0/ttt-darwin-arm64"
      sha256 "375153ca6a4164be1914bf6c4430a72f1e60d25135357790410c3310946f835c"
    else
      url "https://github.com/eugenioenko/ttt/releases/download/v1.11.0/ttt-darwin-amd64"
      sha256 "1372fce01057a3104b5fab4750aa05083d6e8abd2d59987cbec8139288dd4503"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/eugenioenko/ttt/releases/download/v1.11.0/ttt-linux-arm64"
      sha256 "0997ae503c138ec6d12c027726deaefe57b67c4194e1aada13011a2d56f28544"
    else
      url "https://github.com/eugenioenko/ttt/releases/download/v1.11.0/ttt-linux-amd64"
      sha256 "c3c4a382c99b8e291d83a1b527db1b40b8607de8d7373d341bd3e0e926258584"
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
