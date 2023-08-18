class Linkup < Formula
  desc "Link up preview environments"
  homepage "https://github.com/mentimeter/linkup"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    url "https://github.com/mentimeter/linkup/releases/download/0.1.1/linkup-0.1.1-aarch64-apple-darwin.tar.gz"
    sha256 "b9707d698a81881cd79cec5d0f740ffe2b41a0fc9a43cabe2ed72d4c167dbf49"
  elsif Hardware::CPU.intel?
    url "https://github.com/mentimeter/linkup/releases/download/0.1.1/linkup-0.1.1-x86_64-apple-darwin.tar.gz"
    sha256 "531f3403fca80cc67cef233944e51c2acde6a13254f21ea7c3191fcec9252759"
  end

  depends_on "cloudflared"

  def install
    bin.install 'linkup'
  end
end
