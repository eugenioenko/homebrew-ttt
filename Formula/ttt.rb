class Ttt < Formula
  desc "Terminal text editor"
  homepage "https://tttedit.dev"
  version "1.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/eugenioenko/ttt/releases/download/v1.1.0/ttt-darwin-arm64"
      sha256 "67a1089f0301cbbfcfcb7849f6bafb4d69762280c86d307707a7bf9c11ed4c1c"
    else
      url "https://github.com/eugenioenko/ttt/releases/download/v1.1.0/ttt-darwin-amd64"
      sha256 "5b994e3e25a3a75bb8d30ba42df990447331f173cb2e085c99ca21382c1b066b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/eugenioenko/ttt/releases/download/v1.1.0/ttt-linux-arm64"
      sha256 "5094173c2ba075154c57071527b4ce5346b6e0c7536dcb40db217f9ea95b15ce"
    else
      url "https://github.com/eugenioenko/ttt/releases/download/v1.1.0/ttt-linux-amd64"
      sha256 "6b60312e6594a50812b65cf4e1d4cf210964ffa91536f2f6dce8439d758e7053"
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
