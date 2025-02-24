MAC_ARM_URL = "https://github.com/mentimeter/linkup/releases/download/2.1.1/linkup-2.1.1-aarch64-apple-darwin.tar.gz"
MAC_ARM_SHA = "6051c65f5f4f6cdedfcf29250c134a1ead1895a9a8a4b880204941bedef1b7dd"
MAC_X86_URL = "https://github.com/mentimeter/linkup/releases/download/2.1.1/linkup-2.1.1-x86_64-apple-darwin.tar.gz"
MAC_X86_SHA = "0a10736171b52710112f05f790c529250d191d2246efc429838f4cd4ea8b7970"

LINUX_ARM_URL = "https://github.com/mentimeter/linkup/releases/download/2.1.1/linkup-2.1.1-aarch64-unknown-linux-gnu.tar.gz"
LINUX_ARM_SHA = "6d332adad710178da0a1abc31237bb3316550eb8464716c8fe299adc3ae798ab"
LINUX_X86_URL = "https://github.com/mentimeter/linkup/releases/download/2.1.1/linkup-2.1.1-x86_64-unknown-linux-gnu.tar.gz"
LINUX_X86_SHA = "8431d592238753eca2582e393cf5156d6067139c10f027007cad8fbd078fdf8c"

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
