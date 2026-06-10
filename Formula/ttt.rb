class Ttt < Formula
  desc "Terminal text editor"
  homepage "https://tttedit.dev"
  version "0.2.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/eugenioenko/ttt/releases/download/v0.2.8/ttt-darwin-arm64"
      sha256 "44972f75e278dc8667d4d02dc268a5983af7edcb5958a8dce9c55d12a32904e7"
    else
      url "https://github.com/eugenioenko/ttt/releases/download/v0.2.8/ttt-darwin-amd64"
      sha256 "84e14f555900214f1953d2f89e19c203b2f3d96a6286c9ceb392e6306dc249ad"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/eugenioenko/ttt/releases/download/v0.2.8/ttt-linux-arm64"
      sha256 "c610c9d2e3a0fa5db111cd9ef0a15171afa569b3c855af011dff60980abf0500"
    else
      url "https://github.com/eugenioenko/ttt/releases/download/v0.2.8/ttt-linux-amd64"
      sha256 "7dc451ab0d9b3f95147dac2fa43b9edf9ba0fe541f6d3ccc7fcbe278893c5010"
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
