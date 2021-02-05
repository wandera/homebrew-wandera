class Kubecrt < Formula
  desc "Convert Helm charts to Kubernetes resources"
  homepage "https://github.com/wandera/kubecrt"
  url "https://github.com/wandera/kubecrt.git",
      tag:      "v0.9.1",
      revision: "c8bc60b2cf3ebc9a9e4d07d5076733c3c5e40d1d"
  head "https://github.com/wandera/kubecrt.git"

  depends_on "dep" => :build
  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    buildpath.join("src/github.com/wandera/kubecrt").install buildpath.children
    cd "src/github.com/wandera/kubecrt" do
      system "make", "build"
      bin.install "bin/kubecrt"
    end
  end

  test do
    system "#{bin}/kubecrt", "--version"
  end
end
