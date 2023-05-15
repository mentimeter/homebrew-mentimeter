class Linkup < Formula
  desc "Link up preview environments"
  homepage "https://github.com/mentimeter/linkup"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    url "https://github.com/mentimeter/linkup/releases/download/0.0.6/linkup-0.0.6-aarch64-apple-darwin.tar.gz"
    sha256 "6c69e0e0a3329dd7a4112b1e1816422b9b684ef2a4bc54b60c46c387b7ddd036"
  elsif Hardware::CPU.intel?
    url "https://github.com/mentimeter/linkup/releases/download/0.0.6/linkup-0.0.6-x86_64-apple-darwin.tar.gz"
    sha256 "36372190188c1dab4d2725af34ce7d12f4139bc3aca9eef388cead0ab6969af7"
  end

  depends_on "cloudflared"

  def install
    bin.install 'linkup'
  end
end
