MAC_ARM_URL = "https://github.com/mentimeter/linkup/releases/download/1.7.2/linkup-1.7.2-aarch64-apple-darwin.tar.gz"
MAC_ARM_SHA = "607c70bd0d42e352ebba2fd1379cb069576d5541a0278273fda88b10f07d0674"
MAC_X86_URL = "https://github.com/mentimeter/linkup/releases/download/1.7.2/linkup-1.7.2-x86_64-apple-darwin.tar.gz"
MAC_X86_SHA = "a7a1db00d280ab75b5c7d45cf9549933bc9bfeea2965d855d48bb8ffc2bd8d23"

LINUX_ARM_URL = "https://github.com/mentimeter/linkup/releases/download/1.7.2/linkup-1.7.2-aarch64-unknown-linux-gnu.tar.gz"
LINUX_ARM_SHA = "d4e815b5052a419ffab6beaab6630b5dbe507987e5b2bcc5afe7cecb4d2048c8"
LINUX_X86_URL = "https://github.com/mentimeter/linkup/releases/download/1.7.2/linkup-1.7.2-x86_64-unknown-linux-gnu.tar.gz"
LINUX_X86_SHA = "6bf266028fd88484072a4ee750ebce580d3d97e602466805184b601e88db671c"

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
