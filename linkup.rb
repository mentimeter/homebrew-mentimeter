class Linkup < Formula
  desc "Link up preview environments"
  homepage "https://github.com/mentimeter/linkup"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    url "https://github.com/mentimeter/linkup/releases/download/0.1.12/linkup-0.1.12-aarch64-apple-darwin.tar.gz"
    sha256 "3f53f6d598ea7ded00fcc8f4bbfc5becb5608fceb952372e31d3e63e2c0c48ef"
  elsif Hardware::CPU.intel?
    url "https://github.com/mentimeter/linkup/releases/download/0.1.12/linkup-0.1.12-x86_64-apple-darwin.tar.gz"
    sha256 "4a75cf581cd612e54aeef34ba00a076a413d681ef848823eb4ffe64acee12746"
  end

  depends_on "cloudflared"
  depends_on "dnsmasq"
  depends_on "caddy"

  def install
    bin.install 'linkup'
    generate_completions_from_executable(bin/"linkup", "completion", shell_parameter_format: "--shell=", shells: [:bash, :zsh])
  end
end
