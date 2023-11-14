ARM_URL = "https://github.com/mentimeter/linkup/releases/download/0.2.0/linkup-0.2.0-aarch64-apple-darwin.tar.gz"
ARM_SHA = "785c802507b61dc5bfa9576b1eecbf1df93c159214eb110e76a50be8705dbbd9"
X86_URL = "https://github.com/mentimeter/linkup/releases/download/0.2.0/linkup-0.2.0-x86_64-apple-darwin.tar.gz"
X86_SHA = "f02153a6cd3eade669b8729aacbc2e96c5a708c8271fcace483c6431347fc089"

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
