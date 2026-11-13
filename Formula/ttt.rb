class Ttt < Formula
  desc "Terminal text editor"
  homepage "https://tttedit.dev"
  version "1.12.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/eugenioenko/ttt/releases/download/v1.12.0/ttt-darwin-arm64"
      sha256 "08e40ce7e701740412b4886975badd07745f00451aee20f8ae17d67dae030527"
    else
      url "https://github.com/eugenioenko/ttt/releases/download/v1.12.0/ttt-darwin-amd64"
      sha256 "c59663e07d95bed9134c9ea2dbf95a59683b7b505a0796a4797ec066cbda1927"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/eugenioenko/ttt/releases/download/v1.12.0/ttt-linux-arm64"
      sha256 "dbf19a023157969579f0edf9014b866dfdff924eb8560f89012c1cfb96d03bf3"
    else
      url "https://github.com/eugenioenko/ttt/releases/download/v1.12.0/ttt-linux-amd64"
      sha256 "de6d186c723fae925d7d5297d7262e6985cc87c144cffc9692086e5a53d1dde7"
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
