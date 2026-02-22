class Fluxterm < Formula
  desc "GPU-accelerated macOS terminal emulator built with Swift and Metal"
  homepage "https://github.com/faizal97/flux-term"
  version "0.1.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/faizal97/flux-term/releases/download/v0.1.3/FluxTerm-macos-arm64.zip"
      sha256 "62019e31c1d5250b10131a9d7d85271e7b2bdd0f67a4b79643b54538e021cbb3"
    else
      url "https://github.com/faizal97/flux-term/releases/download/v0.1.3/FluxTerm-macos-x86_64.zip"
      sha256 "d914ce398af4d28af58f53d016ff4b736dc7198cecdddd1e8d96b06c7de906d8"
    end
  end

  depends_on :macos
  depends_on macos: :sonoma

  def install
    bin.install "FluxTerm-arm64" => "fluxterm" if Hardware::CPU.arm?
    bin.install "FluxTerm-x86_64" => "fluxterm" unless Hardware::CPU.arm?
    bin.install "FluxTerm_FluxTerm.bundle"
  end

  test do
    assert_predicate bin/"fluxterm", :executable?
    assert_predicate bin/"FluxTerm_FluxTerm.bundle", :exist?
  end
end
