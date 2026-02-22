class Fluxterm < Formula
  desc "GPU-accelerated macOS terminal emulator built with Swift and Metal"
  homepage "https://github.com/faizal97/flux-term"
  version "0.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/faizal97/flux-term/releases/download/v0.1.2/FluxTerm-macos-arm64.zip"
      sha256 "f76c5c13503ec28d4503c83e745fa5a65f2dc072fd78118c6c3cae4363d9189e"
    else
      url "https://github.com/faizal97/flux-term/releases/download/v0.1.2/FluxTerm-macos-x86_64.zip"
      sha256 "8c82910d2a660168bc61d56444d483034a8dc29207bf433d7c0d4b5e2097c343"
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
