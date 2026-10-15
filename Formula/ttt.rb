class Ttt < Formula
  desc "Terminal text editor"
  homepage "https://tttedit.dev"
  version "1.8.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/eugenioenko/ttt/releases/download/v1.8.0/ttt-darwin-arm64"
      sha256 "c0f8d89a5b08905b3532d6aada1faa6ee14ced5d68a4c7b9bd43ec1bccaa627e"
    else
      url "https://github.com/eugenioenko/ttt/releases/download/v1.8.0/ttt-darwin-amd64"
      sha256 "c87e8743e7d1860a9460d4e354fb514f8b32012e3db66d233c5570e168c2e7f9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/eugenioenko/ttt/releases/download/v1.8.0/ttt-linux-arm64"
      sha256 "841c5b6f9e04d66254be241234100b12ac91173c8d5b2745f5712bcbbd85a7e3"
    else
      url "https://github.com/eugenioenko/ttt/releases/download/v1.8.0/ttt-linux-amd64"
      sha256 "9a48f8aa87542f77cc5f19082965e243ac21f06558950ebbc2241940a5f5af82"
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
