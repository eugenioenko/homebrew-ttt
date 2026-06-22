class Ttt < Formula
  desc "Terminal text editor"
  homepage "https://tttedit.dev"
  version "0.3.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/eugenioenko/ttt/releases/download/v0.3.2/ttt-darwin-arm64"
      sha256 "d28b2b0c4c41273440f8ffad6d359b075aa6b7f28f95ef227c748a052541bebd"
    else
      url "https://github.com/eugenioenko/ttt/releases/download/v0.3.2/ttt-darwin-amd64"
      sha256 "60debe9c438c83718f6731e62dad15a1dbb4a9a97377f855f508a59450bd50f7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/eugenioenko/ttt/releases/download/v0.3.2/ttt-linux-arm64"
      sha256 "8d82c303d15bbdf58d937a8f54489d455589f4e183eb2d43b84060c4b1ac9f7f"
    else
      url "https://github.com/eugenioenko/ttt/releases/download/v0.3.2/ttt-linux-amd64"
      sha256 "0bbe21096ed4ddf00ba8c20e449ec2d46f38717acb3f72f45751fabf69c6cdb4"
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
