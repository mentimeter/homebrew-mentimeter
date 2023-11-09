ARM_URL = "https://github.com/mentimeter/linkup/releases/download/0.1.14/linkup-0.1.14-aarch64-apple-darwin.tar.gz"
ARM_SHA = "38a6b003cb78c3fade4f88a563452b3865241667a22b29cebf4a633a7f2406d1"
X86_URL = "https://github.com/mentimeter/linkup/releases/download/0.1.14/linkup-0.1.14-x86_64-apple-darwin.tar.gz"
X86_SHA = "276dc2a56b0d0ce32089d4fd433dc06409bdf2d785c07c4478483ad7bf5bfe52"

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
