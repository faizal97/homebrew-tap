class Fluxterm < Formula
  desc "GPU-accelerated macOS terminal emulator built with Swift and Metal"
  homepage "https://github.com/faizal97/flux-term"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/faizal97/flux-term/releases/download/v0.1.1/FluxTerm-macos-arm64.zip"
      sha256 "03bad4e5e83571da65c36e36097ddc670eb8b417482cc9bb22f1f70bd85d67cb"
    else
      url "https://github.com/faizal97/flux-term/releases/download/v0.1.1/FluxTerm-macos-x86_64.zip"
      sha256 "6b48d01ff692104ee1b6646e96d13bdf627a6c0cedffcaa1b9608a6ce47f137b"
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
