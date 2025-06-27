MAC_ARM_URL = "https://github.com/mentimeter/linkup/releases/download/3.4.1/linkup-3.4.1-aarch64-apple-darwin.tar.gz"
MAC_ARM_SHA = "cb1ae4646a6d3cae9e1f5469afe0e89bdbabbd7b8823da55c8659ac7d4ecec81"
MAC_X86_URL = "https://github.com/mentimeter/linkup/releases/download/3.4.1/linkup-3.4.1-x86_64-apple-darwin.tar.gz"
MAC_X86_SHA = "6f6987b30cc3dfb90af2241a6607fcb06d2d7f02019a674e0e1d74f0533333d6"

LINUX_ARM_URL = "https://github.com/mentimeter/linkup/releases/download/3.4.1/linkup-3.4.1-aarch64-unknown-linux-gnu.tar.gz"
LINUX_ARM_SHA = "c8e6edb67aab9cada9f8c3667cf8c80863ac330052a1397ba16fbef2d1f835eb"
LINUX_X86_URL = "https://github.com/mentimeter/linkup/releases/download/3.4.1/linkup-3.4.1-x86_64-unknown-linux-gnu.tar.gz"
LINUX_X86_SHA = "da370bcc0dd750eb56ee8acc38f41b1af03e9ce3d7cfb06d5867d03bfa0e6b7c"

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
