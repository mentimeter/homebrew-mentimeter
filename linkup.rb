class Linkup < Formula
  desc "Link up preview environments"
  homepage "https://github.com/mentimeter/linkup"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    url "https://github.com/mentimeter/linkup/releases/download/0.0.4/linkup-0.0.4-aarch64-apple-darwin.tar.gz"
    sha256 "b4b669c18a1932ff3c24fe6c00fed1dc1d8e60ca0908dca3c2cadaff0e869959"
  elsif Hardware::CPU.intel?
    url "https://github.com/mentimeter/linkup/releases/download/0.0.4/linkup-0.0.4-x86_64-apple-darwin.tar.gz"
    sha256 "3d3471c5af24e4c244cce2c6edce4b0f3c9281addcf0a95970ef7f5ab60b2f8b"
  end

  depends_on "cloudflared"

  def install
    bin.install 'linkup'
  end
end
