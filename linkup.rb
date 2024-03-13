ARM_URL = "https://github.com/mentimeter/linkup/releases/download/0.2.10/linkup-0.2.10-aarch64-apple-darwin.tar.gz"
ARM_SHA = "500c01a412ca0c8cc3a7315bb9faf375ca9aa4ec6798bd3d6aeed7c9b30389fa"
X86_URL = "https://github.com/mentimeter/linkup/releases/download/0.2.10/linkup-0.2.10-x86_64-apple-darwin.tar.gz"
X86_SHA = "d25b80ec1e6c3f674fd526d6c22fb1d5a7d427bb4be12f59866ffeb870a7891c"

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
