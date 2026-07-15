class Ttt < Formula
  desc "Terminal text editor"
  homepage "https://tttedit.dev"
  version "1.0.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/eugenioenko/ttt/releases/download/v1.0.1/ttt-darwin-arm64"
      sha256 "067a0967381c0787a28263ac1ea379a726c37ef94c40e37aa923b84a9ed5740a"
    else
      url "https://github.com/eugenioenko/ttt/releases/download/v1.0.1/ttt-darwin-amd64"
      sha256 "b4c78187aade8bbfde49c99bee3ad94ad0387395a9f1682a3a8c9af6b66cc85a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/eugenioenko/ttt/releases/download/v1.0.1/ttt-linux-arm64"
      sha256 "5d7430fda4424d8aa3a72a77c968035aa1e699526956dac3fd3d5b3a1b816e62"
    else
      url "https://github.com/eugenioenko/ttt/releases/download/v1.0.1/ttt-linux-amd64"
      sha256 "84ab6284e5969a7cbd899e99d98bef465220f655e4afef1b2fd1dfe54bf8c30f"
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
