ARM_URL = "https://github.com/mentimeter/linkup/releases/download/1.0.4/linkup-1.0.4-aarch64-apple-darwin.tar.gz"
ARM_SHA = "0f5bf2ddd7d0b8afaaf12b2347a1402f3c2395a20478f19db33fd02b7facbfb8"
X86_URL = "https://github.com/mentimeter/linkup/releases/download/1.0.4/linkup-1.0.4-x86_64-apple-darwin.tar.gz"
X86_SHA = "c86742fffdbcd0f47a28a5f4108dc010c4367c3e6eb2a1ab789c5590ce5b9de1"

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
