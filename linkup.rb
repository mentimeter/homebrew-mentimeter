MAC_ARM_URL = "https://github.com/mentimeter/linkup/releases/download/2.2.0/linkup-2.2.0-aarch64-apple-darwin.tar.gz"
MAC_ARM_SHA = "32f70f4884ec337109446701632ffef859f77d53cb794671b5784dd7f5cfa0b1"
MAC_X86_URL = "https://github.com/mentimeter/linkup/releases/download/2.2.0/linkup-2.2.0-x86_64-apple-darwin.tar.gz"
MAC_X86_SHA = "12594be9a7019602916c2df0e271824c2dae9aac2d4fb7abcd3f9b09b26ebf6a"

LINUX_ARM_URL = "https://github.com/mentimeter/linkup/releases/download/2.2.0/linkup-2.2.0-aarch64-unknown-linux-gnu.tar.gz"
LINUX_ARM_SHA = "f53b2a4b1ec44b0540a8ad626cf41f1ea69da3aa2e67a5886852ee9f3e01afe6"
LINUX_X86_URL = "https://github.com/mentimeter/linkup/releases/download/2.2.0/linkup-2.2.0-x86_64-unknown-linux-gnu.tar.gz"
LINUX_X86_SHA = "323a0acb5f97174c5d36f9e19a8edc76a3f4a658d2ed44ae546f90e130cb9a11"

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
