class Ttt < Formula
  desc "Terminal text editor"
  homepage "https://tttedit.dev"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/eugenioenko/ttt/releases/download/v0.1.0/ttt-darwin-arm64"
      sha256 "8d8c9f14af30ffe088c9c38df8fe5d4d2003b634fef4ee32b8baf56c291a37c9"
    else
      url "https://github.com/eugenioenko/ttt/releases/download/v0.1.0/ttt-darwin-amd64"
      sha256 "068b207be2c6cc4345af334270fa0470269d40760cbf7c9e7aa5a61ff36aa214"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/eugenioenko/ttt/releases/download/v0.1.0/ttt-linux-arm64"
      sha256 "90f95d15ba1aba6a2ebe3dbf0827eb703cbcd6a8786579ed441921f51118809d"
    else
      url "https://github.com/eugenioenko/ttt/releases/download/v0.1.0/ttt-linux-amd64"
      sha256 "c7914267668c1531f59cb80529dcf939932c0338b39d9c9ea7946af42617e523"
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
