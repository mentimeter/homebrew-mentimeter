class Linkup < Formula
  desc "Link up preview environments"
  homepage "https://github.com/mentimeter/linkup"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    url "https://github.com/mentimeter/linkup/releases/download/0.1.2/linkup-0.1.2-aarch64-apple-darwin.tar.gz"
    sha256 "ee85e3476852025a55a7852cae8f724e6b7dfa264f92efb1d5029fdd9da6e90d"
  elsif Hardware::CPU.intel?
    url "https://github.com/mentimeter/linkup/releases/download/0.1.2/linkup-0.1.2-x86_64-apple-darwin.tar.gz"
    sha256 "36eee2589f48ec4db2c8953906d1868eb243dbdd2ad3cdac2a5a573281aaf45f"
  end

  depends_on "cloudflared"

  def install
    bin.install 'linkup'
  end
end
