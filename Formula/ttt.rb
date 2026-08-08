class Ttt < Formula
  desc "Terminal text editor"
  homepage "https://tttedit.dev"
  version "1.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/eugenioenko/ttt/releases/download/v1.2.1/ttt-darwin-arm64"
      sha256 "5192fcbccf4cdac0b1f4fb8c91ee0cba2195824b858da2fc9db617e5f36e5cc9"
    else
      url "https://github.com/eugenioenko/ttt/releases/download/v1.2.1/ttt-darwin-amd64"
      sha256 "8183b2b533f2238cfb67ad7ef52f15488e2c1034f689d6e7907c0412352edbf4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/eugenioenko/ttt/releases/download/v1.2.1/ttt-linux-arm64"
      sha256 "03331fbbe2e5e97b53dbd0203f8e8e78f731213f75c43650528b8c6333d930bb"
    else
      url "https://github.com/eugenioenko/ttt/releases/download/v1.2.1/ttt-linux-amd64"
      sha256 "9d0d1b8bbd7b6d22fe8854ee5fc1beda4ff3b5e86213d4c62e2b6a78c0191d87"
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
