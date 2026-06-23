class Ttt < Formula
  desc "Terminal text editor"
  homepage "https://tttedit.dev"
  version "0.3.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/eugenioenko/ttt/releases/download/v0.3.4/ttt-darwin-arm64"
      sha256 "045cc32fe348140e2ed870b9990f1a477b414b8e27d8691f555fc9ddc32cf9d7"
    else
      url "https://github.com/eugenioenko/ttt/releases/download/v0.3.4/ttt-darwin-amd64"
      sha256 "d83703092c971561ea77eba807b02f96abe9971ff4ad1b1bc84793d6d0bb4b60"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/eugenioenko/ttt/releases/download/v0.3.4/ttt-linux-arm64"
      sha256 "90c87157c43bf2bd3a299ffbc158c4c1d74187fa9e076c8e06a81f35f7cff326"
    else
      url "https://github.com/eugenioenko/ttt/releases/download/v0.3.4/ttt-linux-amd64"
      sha256 "be8f486a4df507c1481a3ccb125ff026a7197a692861e2c5973e160cb61deca0"
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
