ARM_URL = "https://github.com/mentimeter/linkup/releases/download/1.2.1/linkup-1.2.1-aarch64-apple-darwin.tar.gz"
ARM_SHA = "5a7beff5a5b25f2f0c5114a52f25a09f4080cbe68ecbf672097ccf27738fc495"
X86_URL = "https://github.com/mentimeter/linkup/releases/download/1.2.1/linkup-1.2.1-x86_64-apple-darwin.tar.gz"
X86_SHA = "48e81e7137fcfa325c59d56ade63ed30d9c2d31ffec57fc9b68eecd115aece5d"

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
