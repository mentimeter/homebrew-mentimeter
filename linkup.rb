class Linkup < Formula
  desc "Link up preview environments"
  homepage "https://github.com/mentimeter/linkup"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    url "https://github.com/mentimeter/linkup/releases/download/0.0.12/linkup-0.0.12-aarch64-apple-darwin.tar.gz"
    sha256 "139d4f449384aeb259ada51ce739dd504c0728d1a287ec71696223bb6e4ab4e5"
  elsif Hardware::CPU.intel?
    url "https://github.com/mentimeter/linkup/releases/download/0.0.12/linkup-0.0.12-x86_64-apple-darwin.tar.gz"
    sha256 "6776cd11a83616f71f4bf40ad7cab84102e6f82d797f09d936d3a390d73cdbdf"
  end

  depends_on "cloudflared"

  def install
    bin.install 'linkup'
  end
end
