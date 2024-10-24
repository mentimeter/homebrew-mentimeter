ARM_URL = "https://github.com/mentimeter/linkup/releases/download/1.1.1/linkup-1.1.1-aarch64-apple-darwin.tar.gz"
ARM_SHA = "2066b840425199f98871505cdd28bea8b2dc1143a11314911d0616245b7ab8da"
X86_URL = "https://github.com/mentimeter/linkup/releases/download/1.1.1/linkup-1.1.1-x86_64-apple-darwin.tar.gz"
X86_SHA = "417af3a61887053c437e4897a80216f8039616fb579a86aa43622430bb68251f"

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
