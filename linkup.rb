MAC_ARM_URL = "https://github.com/mentimeter/linkup/releases/download/3.5.0/linkup-3.5.0-aarch64-apple-darwin.tar.gz"
MAC_ARM_SHA = "7e6009104562317b3d93de19d5944a17a40deaf725a9384cab54f0cf436c9e81"
MAC_X86_URL = "https://github.com/mentimeter/linkup/releases/download/3.5.0/linkup-3.5.0-x86_64-apple-darwin.tar.gz"
MAC_X86_SHA = "858d1a3dd26ea4c7c55cf07e12a10fde832d7bf5a2ad02741e012d013b380838"

LINUX_ARM_URL = "https://github.com/mentimeter/linkup/releases/download/3.5.0/linkup-3.5.0-aarch64-unknown-linux-gnu.tar.gz"
LINUX_ARM_SHA = "878abc24cd02397f4e7e9ed09ccbee828987a0d8117ef57ba80c89ab64c6d458"
LINUX_X86_URL = "https://github.com/mentimeter/linkup/releases/download/3.5.0/linkup-3.5.0-x86_64-unknown-linux-gnu.tar.gz"
LINUX_X86_SHA = "bb582ef6b02d668d9b9f81d781eaf2cd306444ed3b02c68d03a8bc5a94fa82ef"

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
