class Ttt < Formula
  desc "Terminal text editor"
  homepage "https://tttedit.dev"
  version "1.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/eugenioenko/ttt/releases/download/v1.5.0/ttt-darwin-arm64"
      sha256 "44c21e27eccf026c332f6987bbd945878c280e026d8319d2e731e74c949a1c9e"
    else
      url "https://github.com/eugenioenko/ttt/releases/download/v1.5.0/ttt-darwin-amd64"
      sha256 "5ca96a4cda73b71c5f3f5efdb18ba56f3f6ef28268d4ceb35ec2479ff14c355e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/eugenioenko/ttt/releases/download/v1.5.0/ttt-linux-arm64"
      sha256 "667ace6b7288ffbd7724a82335e68fe1dcb9c03fe526c9df8da77ab9f811a1c3"
    else
      url "https://github.com/eugenioenko/ttt/releases/download/v1.5.0/ttt-linux-amd64"
      sha256 "d5b5e3ef0c3c8c834360c7506628c23c2a61c00c006e402490ad4f336cacbe5f"
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
