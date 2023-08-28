class Linkup < Formula
  desc "Link up preview environments"
  homepage "https://github.com/mentimeter/linkup"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    url "https://github.com/mentimeter/linkup/releases/download/0.1.3/linkup-0.1.3-aarch64-apple-darwin.tar.gz"
    sha256 "db309426362b3f81b9833e028404a671b50fd64c188e00033123c2a70b60094c"
  elsif Hardware::CPU.intel?
    url "https://github.com/mentimeter/linkup/releases/download/0.1.3/linkup-0.1.3-x86_64-apple-darwin.tar.gz"
    sha256 "40be4462dbca257045029535831cd85184ddbecec241a017e40e16dc7de14e28"
  end

  depends_on "cloudflared"

  def install
    bin.install 'linkup'
    generate_completions_from_executable(bin/"linkup", "completion", shell_parameter_format: "--shell=", shells: [:bash, :zsh])
  end
end
