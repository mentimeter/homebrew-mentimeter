ARM_URL = "https://github.com/mentimeter/linkup/releases/download/1.0.4/linkup-1.0.4-aarch64-apple-darwin.tar.gz"
ARM_SHA = "148fa7ebf9a99acb06e2ebcc37893e546ef9f8fe173c214d0bc581eb43fda46b"
X86_URL = "https://github.com/mentimeter/linkup/releases/download/1.0.4/linkup-1.0.4-x86_64-apple-darwin.tar.gz"
X86_SHA = "28306f32bdc5877624de2e61b609f9f01f923224a45c2831cf150f3f64081434"

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
