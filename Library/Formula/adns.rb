require "formula"

class Adns < Formula
  homepage "http://www.chiark.greenend.org.uk/~ian/adns/"
  url "http://www.chiark.greenend.org.uk/~ian/adns/ftp/adns-1.5.0.tar.gz"
  sha1 "38306b8030c61a78bee85e33f34de876392ca4f8"
  head "git://git.chiark.greenend.org.uk/~ianmdlvl/adns.git"

  bottle do
    cellar :any
    sha1 "c06199054fc9cbffc10f0cc3fe9068e6f67bf0f7" => :yosemite
    sha1 "e448d98d144e981dc37ff926637d834997197170" => :mavericks
    sha1 "cb85701fcdfc8c2ef2de0486b0df57111bf99f38" => :mountain_lion
  end

  def install
    system "./configure", "--prefix=#{prefix}", "--disable-dynamic"
    system "make"
    system "make", "install"
  end

  test do
    system "#{bin}/adnsheloex", "--version"
  end
end
