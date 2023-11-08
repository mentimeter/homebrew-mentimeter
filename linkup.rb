ARM_URL "https://github.com/mentimeter/linkup/releases/download/0.1.14/linkup-0.1.14-aarch64-apple-darwin.tar.gz"
ARM_SHA "384c1d461a34419456910cca2d1ef25ffe9288de583672c5a55fff48d80c009e"
X86_URL "https://github.com/mentimeter/linkup/releases/download/0.1.14/linkup-0.1.14-x86_64-apple-darwin.tar.gz"
X86_SHA "32fa5e6b651a08425955094e4769fcf371f9218c51738656998935754a938d8c"

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
