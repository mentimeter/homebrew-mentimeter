ARM_URL = "https://github.com/mentimeter/linkup/releases/download/0.2.12/linkup-0.2.12-aarch64-apple-darwin.tar.gz"
ARM_SHA = "53a0d21d95ff1493a0c408a4a97acaf56c6f1b3799ad8921ca0355f02fb9c7cb"
X86_URL = "https://github.com/mentimeter/linkup/releases/download/0.2.12/linkup-0.2.12-x86_64-apple-darwin.tar.gz"
X86_SHA = "b50c37e6c41fca5c651bfa58833a9621114a992c3750606982f618b23fec4368"

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
