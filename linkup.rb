MAC_ARM_URL = "https://github.com/mentimeter/linkup/releases/download/4.0.0/linkup-aarch64-apple-darwin.tar.gz"
MAC_ARM_SHA = "7a1c886bbf02718cf0b56900fb5c09f800fe3805417cf5aa366978a6122a1c6a"
MAC_X86_URL = "https://github.com/mentimeter/linkup/releases/download/4.0.0/linkup-x86_64-apple-darwin.tar.gz"
MAC_X86_SHA = "ee1207ce2f0f1ce8913c0efbc04414abc344130f25a01aebc11b1db4df3858c2"

LINUX_ARM_URL = "https://github.com/mentimeter/linkup/releases/download/4.0.0/linkup-aarch64-unknown-linux-gnu.tar.gz"
LINUX_ARM_SHA = "83dd2951d271f209e098665605623e891929e7d1b78b5c1090f98a8eb0b42fc2"
LINUX_X86_URL = "https://github.com/mentimeter/linkup/releases/download/4.0.0/linkup-x86_64-unknown-linux-gnu.tar.gz"
LINUX_X86_SHA = "4cd1c77af36a0039c3afecf59635bd26705526d9dea57923db30a54f945c9f69"

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
