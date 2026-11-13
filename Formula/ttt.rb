class Ttt < Formula
  desc "Terminal text editor"
  homepage "https://tttedit.dev"
  version "1.12.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/eugenioenko/ttt/releases/download/v1.12.1/ttt-darwin-arm64"
      sha256 "bff1d6cd8329c9a81719cf870fed4de047d6432e90db3fb4421d4dc9987dda1c"
    else
      url "https://github.com/eugenioenko/ttt/releases/download/v1.12.1/ttt-darwin-amd64"
      sha256 "2e9a21deefd44d86aa0d713c7f47a558ecdfd19c00810639e95f5baf317162d4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/eugenioenko/ttt/releases/download/v1.12.1/ttt-linux-arm64"
      sha256 "f88c3f38b726efb1ce35dede745e6a0f3d7083c15fd6f75f17dc8fb68c7c857b"
    else
      url "https://github.com/eugenioenko/ttt/releases/download/v1.12.1/ttt-linux-amd64"
      sha256 "e6b5bb64b897810349fb46f8319559f65c6e5f1a40e26a93bd6860b6f7f7b6de"
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
