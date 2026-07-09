class Ttt < Formula
  desc "Terminal text editor"
  homepage "https://tttedit.dev"
  version "1.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/eugenioenko/ttt/releases/download/v1.0.0/ttt-darwin-arm64"
      sha256 "810637a095e8084f116f53d5db7576841e5a408dec475fea35cb5bfb0a21390e"
    else
      url "https://github.com/eugenioenko/ttt/releases/download/v1.0.0/ttt-darwin-amd64"
      sha256 "83685fd03cab8087342b4ce535561325e89512990c74e183c1dd5032d6db9d62"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/eugenioenko/ttt/releases/download/v1.0.0/ttt-linux-arm64"
      sha256 "1f6c7ca1be84b1a8e03d0b807ca007f6c9fe07b855468fb1e504d4adf74f4bfd"
    else
      url "https://github.com/eugenioenko/ttt/releases/download/v1.0.0/ttt-linux-amd64"
      sha256 "db51203e5ef6278eaaf19e880757e2f718e1dacef88974306cb2f9f3e36b696f"
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
