ARM_URL = "https://github.com/mentimeter/linkup/releases/download/1.2.0/linkup-1.2.0-aarch64-apple-darwin.tar.gz"
ARM_SHA = "ef4a526d922974b31462e149c970f06f9706523015a80e991ed440c501d5168e"
X86_URL = "https://github.com/mentimeter/linkup/releases/download/1.2.0/linkup-1.2.0-x86_64-apple-darwin.tar.gz"
X86_SHA = "a83a09d25c242a45ea4cb8eb98d37716dd98c69c16924086c7eef15df9be8b55"

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
