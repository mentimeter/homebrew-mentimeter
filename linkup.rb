MAC_ARM_URL = "https://github.com/mentimeter/linkup/releases/download/4.1.1/linkup-aarch64-apple-darwin.tar.gz"
MAC_ARM_SHA = "3764c60c3acc2d1af6cb45a83dec5c101c9beb5392b212e547888df37663c613"
MAC_X86_URL = "https://github.com/mentimeter/linkup/releases/download/4.1.1/linkup-x86_64-apple-darwin.tar.gz"
MAC_X86_SHA = "8992b9d9ff03b854450a743507ce38acd98741d46a17c9e7bf1f15a20b17ec23"

LINUX_ARM_URL = "https://github.com/mentimeter/linkup/releases/download/4.1.1/linkup-aarch64-unknown-linux-gnu.tar.gz"
LINUX_ARM_SHA = "e008f8186728c5b5d588ad3839d0b0fc7470a0a1017294f288c816eb0af896f7"
LINUX_X86_URL = "https://github.com/mentimeter/linkup/releases/download/4.1.1/linkup-x86_64-unknown-linux-gnu.tar.gz"
LINUX_X86_SHA = "eaad1295f5e9ed09cef86e0bf22a5619b33681d9df2a05344d50050aecd5f7ce"

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

  def install
    bin.install 'linkup'

    if OS.mac?
      generate_completions_from_executable(bin/"linkup", "completion", shell_parameter_format: "--shell=", shells: [:bash, :zsh])
    end
  end
end
