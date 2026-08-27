class Ttt < Formula
  desc "Terminal text editor"
  homepage "https://tttedit.dev"
  version "1.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/eugenioenko/ttt/releases/download/v1.4.0/ttt-darwin-arm64"
      sha256 "fd0f854a6b490ad45211bfe9bee9acfb3a10dc5d89167bb2d3129727debbc490"
    else
      url "https://github.com/eugenioenko/ttt/releases/download/v1.4.0/ttt-darwin-amd64"
      sha256 "e1fc16a3750a48a606a4a9528de975adfacfb23688eaa23b56042d7680a839ea"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/eugenioenko/ttt/releases/download/v1.4.0/ttt-linux-arm64"
      sha256 "fc5c89627f8ea518873f16666191c88a12158ad149352ce60d0e9634694b38dd"
    else
      url "https://github.com/eugenioenko/ttt/releases/download/v1.4.0/ttt-linux-amd64"
      sha256 "511fb66d8e708f467ef70bd75dae72789bd211d8d5c38a005496ea955e1841bc"
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
