class Ttt < Formula
  desc "Terminal text editor"
  homepage "https://tttedit.dev"
  version "1.7.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/eugenioenko/ttt/releases/download/v1.7.1/ttt-darwin-arm64"
      sha256 "06a9e249895c382f9db33d037391ad919275f411296240640d83fcde42882759"
    else
      url "https://github.com/eugenioenko/ttt/releases/download/v1.7.1/ttt-darwin-amd64"
      sha256 "bfac9dfc1791706f33202e7760551a89a2c3fe9bedca9cd4dc598e1a4a4a32a1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/eugenioenko/ttt/releases/download/v1.7.1/ttt-linux-arm64"
      sha256 "230eddd40b46d0b868c3842add7d87abcf16e0c5a16ac876b14f26ba8064a2e2"
    else
      url "https://github.com/eugenioenko/ttt/releases/download/v1.7.1/ttt-linux-amd64"
      sha256 "a80101bb27e6b788c1d0d766dce9866750ab5fc1b310cc0c0e2937a36778d210"
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
