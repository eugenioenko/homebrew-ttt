class Ttt < Formula
  desc "Terminal text editor"
  homepage "https://tttedit.dev"
  version "1.2.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/eugenioenko/ttt/releases/download/v1.2.2/ttt-darwin-arm64"
      sha256 "88aba0d6824eb49af6528315e388bd8d51ca9cab23b2800f037e621d7cff6db9"
    else
      url "https://github.com/eugenioenko/ttt/releases/download/v1.2.2/ttt-darwin-amd64"
      sha256 "34a4d785321799787b5f610a4a605af32966596f9c25db624f57ab2a43491304"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/eugenioenko/ttt/releases/download/v1.2.2/ttt-linux-arm64"
      sha256 "8ff283eba8e841b4e06f3e3576dab0a26748738c52f5645e263a885d34d36736"
    else
      url "https://github.com/eugenioenko/ttt/releases/download/v1.2.2/ttt-linux-amd64"
      sha256 "6c0a95c26bc228fa37137da317918fc5b35d147070b53671028815228ede7578"
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
