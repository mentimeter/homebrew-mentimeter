MAC_ARM_URL = "https://github.com/mentimeter/linkup/releases/download/1.6.0/linkup-1.6.0-aarch64-apple-darwin.tar.gz"
MAC_ARM_SHA = "9f5fdb89b322b166124d5971bead9a2db8ca7b514c567c2617c2110552608903"
MAC_X86_URL = "https://github.com/mentimeter/linkup/releases/download/1.6.0/linkup-1.6.0-x86_64-apple-darwin.tar.gz"
MAC_X86_SHA = "3dcc99f38a3a0cb9b613096585f47117b341439093f85389ca0a915da486fe61"

LINUX_ARM_URL = "https://github.com/mentimeter/linkup/releases/download/1.6.0/linkup-1.6.0-aarch64-unknown-linux-gnu.tar.gz"
LINUX_ARM_SHA = "10362fc7c68adf69e12c4a6141a8782fb76df11f1ea2598cd17001134511321d"
LINUX_X86_URL = "https://github.com/mentimeter/linkup/releases/download/1.6.0/linkup-1.6.0-x86_64-unknown-linux-gnu.tar.gz"
LINUX_X86_SHA = "61a0d890fc0c84729c308f45a978d6cdca04beca6539c42d9bafb1abd23847cf"

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
