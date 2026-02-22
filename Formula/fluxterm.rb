class Fluxterm < Formula
  desc "GPU-accelerated macOS terminal emulator built with Swift and Metal"
  homepage "https://github.com/faizal97/flux-term"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/faizal97/flux-term/releases/download/v0.1.0/FluxTerm-macos-arm64.zip"
      sha256 "18cb9dd14e607fc573e9e9e6f060e95689d8e8ac79e86aac8a6c25dc3d0a3eb0"
    else
      url "https://github.com/faizal97/flux-term/releases/download/v0.1.0/FluxTerm-macos-x86_64.zip"
      sha256 "f563890dd3a48632b36bca502f8008cb6da7aa707af0e3a9486d360aacb98ce1"
    end
  end

  depends_on :macos
  depends_on macos: :sonoma

  def install
    bin.install "FluxTerm-arm64" => "fluxterm" if Hardware::CPU.arm?
    bin.install "FluxTerm-x86_64" => "fluxterm" unless Hardware::CPU.arm?
  end

  test do
    assert_predicate bin/"fluxterm", :executable?
  end
end
