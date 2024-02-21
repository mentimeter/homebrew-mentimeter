ARM_URL = "https://github.com/mentimeter/linkup/releases/download/0.2.8/linkup-0.2.8-aarch64-apple-darwin.tar.gz"
ARM_SHA = "18fcaf8e906a62b936cabf925e501b1b9dd6171c9d287d072e4822829044cab5"
X86_URL = "https://github.com/mentimeter/linkup/releases/download/0.2.8/linkup-0.2.8-x86_64-apple-darwin.tar.gz"
X86_SHA = "0684fc02329abe0f6b63272d84c9d38b01b9386c336d62fc58631d59477d925d"

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
