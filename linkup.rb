ARM_URL = "https://github.com/mentimeter/linkup/releases/download/0.2.15/linkup-0.2.15-aarch64-apple-darwin.tar.gz"
ARM_SHA = "04e764162bbdc4994a3d4ad79556cd3c1b63c067d06f973b06db19aea9df3474"
X86_URL = "https://github.com/mentimeter/linkup/releases/download/0.2.15/linkup-0.2.15-x86_64-apple-darwin.tar.gz"
X86_SHA = "0072a4e720c907246c8bcc3ead93e1088f881d895c531579af2147f1e7350d1d"

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
