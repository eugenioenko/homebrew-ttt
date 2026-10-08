class Ttt < Formula
  desc "Terminal text editor"
  homepage "https://tttedit.dev"
  version "1.7.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/eugenioenko/ttt/releases/download/v1.7.0/ttt-darwin-arm64"
      sha256 "b54efea36b9094263682ced2f8cbdf3bf7b129b5fd2eaca17557a9d0c951debe"
    else
      url "https://github.com/eugenioenko/ttt/releases/download/v1.7.0/ttt-darwin-amd64"
      sha256 "fe2caf188141fab98915fd44ef6354bdc9055ec07a41f767fd91b84a92489557"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/eugenioenko/ttt/releases/download/v1.7.0/ttt-linux-arm64"
      sha256 "91b2520ce2089e5e4200d4c6b1979621001c3dfe78ba7a38a993ccf9d99b7c78"
    else
      url "https://github.com/eugenioenko/ttt/releases/download/v1.7.0/ttt-linux-amd64"
      sha256 "67eeb244b8e8cc6a996d09715a91abaa370d883aae6b43ebc3707b9dec75e4fd"
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
