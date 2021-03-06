class Activemq < Formula
  desc "Apache ActiveMQ: powerful open source messaging server"
  homepage "https://activemq.apache.org/"
  url "https://www.apache.org/dyn/closer.cgi?path=/activemq/5.13.0/apache-activemq-5.13.0-bin.tar.gz"
  sha256 "6b460256a56c6e2c9e2575e90f6514c5239ec06e89ac9e8694b30bb5abbc7a8c"

  bottle :unneeded

  depends_on :java => "1.6+"

  def install
    rm_rf Dir["bin/linux-x86-*"] unless OS.linux?
    libexec.install Dir["*"]
    (bin/"activemq").write_env_script libexec/"bin/activemq", Language::Java.java_home_env("1.6+")
  end

  test do
    system "#{bin}/activemq", "browse", "-h"
  end
end
