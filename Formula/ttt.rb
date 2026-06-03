class Ttt < Formula
  desc "Terminal text editor"
  homepage "https://tttedit.dev"
  version "0.2.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/eugenioenko/ttt/releases/download/v0.2.4/ttt-darwin-arm64"
      sha256 "7d8b6a131c2e59dc86e7c2bfd39803598fb0ff6da39d04401f85f21ea18ee4de"
    else
      url "https://github.com/eugenioenko/ttt/releases/download/v0.2.4/ttt-darwin-amd64"
      sha256 "cc3d36544a9210be99804084549a4ccd29aa5460770d0e6d25a39033f17d7576"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/eugenioenko/ttt/releases/download/v0.2.4/ttt-linux-arm64"
      sha256 "20208abf7d29ebce1489e3a7fdf7ace6176ebb8794423f108ad0954f937d4cf6"
    else
      url "https://github.com/eugenioenko/ttt/releases/download/v0.2.4/ttt-linux-amd64"
      sha256 "295f1f94ae9dccf37ceca50ccd9827d5b8b8546ecdeca8ff0e427a3f049d559a"
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
