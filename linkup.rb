ARM_URL = "https://github.com/mentimeter/linkup/releases/download/1.0.3/linkup-1.0.3-aarch64-apple-darwin.tar.gz"
ARM_SHA = "ce8f6426bc3392dc2ef32df66326606a6d50946482afcde1e3952f18260eaef8"
X86_URL = "https://github.com/mentimeter/linkup/releases/download/1.0.3/linkup-1.0.3-x86_64-apple-darwin.tar.gz"
X86_SHA = "242d76660515c93a4dae82ed642c90fe97366b4162ae28a3d94f912298a06b16"

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
