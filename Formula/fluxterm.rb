class Fluxterm < Formula
  desc "GPU-accelerated macOS terminal emulator built with Swift and Metal"
  homepage "https://github.com/faizal97/flux-term"
  version "0.1.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/faizal97/flux-term/releases/download/v0.1.5/FluxTerm-macos-arm64.zip"
      sha256 "7a1ae8197c6010673e85803b4e9e9749aec404a0c3c1ffc226e9383bc1969a90"
    else
      url "https://github.com/faizal97/flux-term/releases/download/v0.1.5/FluxTerm-macos-x86_64.zip"
      sha256 "d0b57555a8517cffe9b65e4dd170a974a7731b0869459b34c303f97f200999cd"
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
