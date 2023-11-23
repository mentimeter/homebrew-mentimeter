ARM_URL = "https://github.com/mentimeter/linkup/releases/download/0.2.1/linkup-0.2.1-aarch64-apple-darwin.tar.gz"
ARM_SHA = "4aeb7f129bebcc47d2c9d8b526fd3976ec671b8ef67e5043debcaf1bc77db198"
X86_URL = "https://github.com/mentimeter/linkup/releases/download/0.2.1/linkup-0.2.1-x86_64-apple-darwin.tar.gz"
X86_SHA = "813d0556537c67e742ee437e532c504f8091db39775d8a8412750c17c638df29"

class Linkup < Formula
  desc "Link up preview environments"
  homepage "https://github.com/mentimeter/linkup"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    url ARM_URL
    sha256 ARM_SHA
  elsif Hardware::CPU.intel?
    url X86_URL
    sha256 X86_SHA
  end

  depends_on "cloudflared"
  depends_on "dnsmasq"
  depends_on "caddy"

  def install
    bin.install 'linkup'
    generate_completions_from_executable(bin/"linkup", "completion", shell_parameter_format: "--shell=", shells: [:bash, :zsh])
  end
end
