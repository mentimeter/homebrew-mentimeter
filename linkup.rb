ARM_URL = "https://github.com/mentimeter/linkup/releases/download/1.5.0/linkup-1.5.0-aarch64-apple-darwin.tar.gz"
ARM_SHA = "5ad369da4e356e64770eb221db3d22c65c22804670a4ea1219a12daed2081aeb"
X86_URL = "https://github.com/mentimeter/linkup/releases/download/1.5.0/linkup-1.5.0-x86_64-apple-darwin.tar.gz"
X86_SHA = "58c95a750a80c42a65bed994b919a219d75a6ddded5ef9e6d7feafaae239a264"

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
