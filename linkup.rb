ARM_URL = "https://github.com/mentimeter/linkup/releases/download/0.2.5/linkup-0.2.5-aarch64-apple-darwin.tar.gz"
ARM_SHA = "e8570d6f7334040b38c25f9bfd65c6e26465f1f472a69a3335900d76ef86d250"
X86_URL = "https://github.com/mentimeter/linkup/releases/download/0.2.5/linkup-0.2.5-x86_64-apple-darwin.tar.gz"
X86_SHA = "feb1f2ce1b59c6e26d9b03287adf846856d296a03013a55b70ac244142862381"

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
