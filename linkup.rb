MAC_ARM_URL = "https://github.com/mentimeter/linkup/releases/download/1.7.1/linkup-1.7.1-aarch64-apple-darwin.tar.gz"
MAC_ARM_SHA = "60a35612d7d3eb8da55f624ebb0315203ebb50a54541743087ef5cc72ce578c9"
MAC_X86_URL = "https://github.com/mentimeter/linkup/releases/download/1.7.1/linkup-1.7.1-x86_64-apple-darwin.tar.gz"
MAC_X86_SHA = "f653690e23296eb04b370cc81b7b66d44d95c0a126eb0b2ef5cd2192a080b10c"

LINUX_ARM_URL = "https://github.com/mentimeter/linkup/releases/download/1.7.1/linkup-1.7.1-aarch64-unknown-linux-gnu.tar.gz"
LINUX_ARM_SHA = "65b00ffeae41ccc2f5b8ae86f19afea0f8e6b5e080239efa2e3e5e693bf078b3"
LINUX_X86_URL = "https://github.com/mentimeter/linkup/releases/download/1.7.1/linkup-1.7.1-x86_64-unknown-linux-gnu.tar.gz"
LINUX_X86_SHA = "0eb4c8d8c6c341ba7e74484b63688907e03ac796499fc61f6c05f7cb11cae81b"

class Linkup < Formula
  desc "Link up preview environments"
  homepage "https://github.com/mentimeter/linkup"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url MAC_ARM_URL
      sha256 MAC_ARM_SHA
    elsif Hardware::CPU.intel?
      url MAC_X86_URL
      sha256 MAC_X86_SHA
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url LINUX_ARM_URL
      sha256 LINUX_ARM_SHA
    elsif Hardware::CPU.intel?
      url LINUX_X86_URL
      sha256 LINUX_X86_SHA
    end
  end

  depends_on "cloudflared"
  depends_on "dnsmasq"
  depends_on "caddy"

  def install
    bin.install 'linkup'

    if OS.mac?
      generate_completions_from_executable(bin/"linkup", "completion", shell_parameter_format: "--shell=", shells: [:bash, :zsh])
    end
  end
end
