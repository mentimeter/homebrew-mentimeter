class Linkup < Formula
  desc "Link up preview environments"
  homepage "https://github.com/mentimeter/linkup"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    url "https://github.com/mentimeter/linkup/releases/download/0.1.4/linkup-0.1.4-aarch64-apple-darwin.tar.gz"
    sha256 "c80afce9bb6da1addd3082e82a8701fdf156a1f4cff41d3a822dfef3355fc5be"
  elsif Hardware::CPU.intel?
    url "https://github.com/mentimeter/linkup/releases/download/0.1.4/linkup-0.1.4-x86_64-apple-darwin.tar.gz"
    sha256 "165710ef7f54fd8689da19fd94124a3287a0f3276fba409a74517c5d0b418049"
  end

  depends_on "cloudflared"

  def install
    bin.install 'linkup'
    generate_completions_from_executable(bin/"linkup", "completion", shell_parameter_format: "--shell=", shells: [:bash, :zsh])
  end
end
