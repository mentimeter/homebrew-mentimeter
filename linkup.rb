ARM_URL = "https://github.com/mentimeter/linkup/releases/download/1.0.2/linkup-1.0.2-aarch64-apple-darwin.tar.gz"
ARM_SHA = "54cfeb16602b2ab47d0430cc0dd199b66f4ac280ea656d1b559ea2e88aed0d06"
X86_URL = "https://github.com/mentimeter/linkup/releases/download/1.0.2/linkup-1.0.2-x86_64-apple-darwin.tar.gz"
X86_SHA = "f6efe48b8a457e8488d0f4c43f923c6dffb565a61e29425299e7cd8de7c18322"

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
