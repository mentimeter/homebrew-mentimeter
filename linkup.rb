class Linkup < Formula
  desc "Link up preview environments"
  homepage "https://github.com/mentimeter/linkup"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    url "https://github.com/mentimeter/linkup/releases/download/0.0.5/linkup-0.0.5-aarch64-apple-darwin.tar.gz"
    sha256 "87211a3e949f27c88eae2099367ee2dcb66cb74add845b67ad4a622dd0179319"
  elsif Hardware::CPU.intel?
    url "https://github.com/mentimeter/linkup/releases/download/0.0.5/linkup-0.0.5-x86_64-apple-darwin.tar.gz"
    sha256 "01205cb993f55209e0a17df81eadc834896c8f1fbce94088b3941ac3f53f5e18"
  end

  depends_on "cloudflared"

  def install
    bin.install 'linkup'
  end
end
