require 'formula'

class Jzmq < Formula
  homepage 'https://github.com/zeromq/jzmq/'
  head 'git://github.com/zeromq/jzmq.git'

  depends_on 'pkg-config' => :build
  depends_on 'autoconf' => :build
  depends_on 'automake' => :build
  depends_on 'libtool' => :build
  depends_on 'zeromq'

  def install
    #ENV['LIBTOOLIZE'] = 'glibtoolize'
    #inreplace 'autogen.sh', 'libtoolize', '$LIBTOOLIZE'
    system './autogen.sh'

    system './configure', "--prefix=#{prefix}"
    system "make -j1"
    system "make install"
  end
end
