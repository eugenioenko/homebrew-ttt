class Ttt < Formula
  desc "Terminal text editor"
  homepage "https://tttedit.dev"
  version "1.10.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/eugenioenko/ttt/releases/download/v1.10.0/ttt-darwin-arm64"
      sha256 "4f14e11e123c0b25611e8c6ac4890ced77495f568d24e92638198821181b0de0"
    else
      url "https://github.com/eugenioenko/ttt/releases/download/v1.10.0/ttt-darwin-amd64"
      sha256 "84d8c54d9fb9e0ffe59b3029d90cc3079c98ab45a77a6477dbeb3ebfb358908a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/eugenioenko/ttt/releases/download/v1.10.0/ttt-linux-arm64"
      sha256 "a8019bb62205dd631664bf563bb1a00c2a735ba69405840e9c84ae7757365978"
    else
      url "https://github.com/eugenioenko/ttt/releases/download/v1.10.0/ttt-linux-amd64"
      sha256 "0e9344c396a783eaf4fc60f1d6f76b85de2b2c303bba2cb07e563a09950097a0"
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
