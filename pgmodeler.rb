require "formula"

class Pgmodeler < Formula
  homepage 'https://www.pgmodeler.com.br/'
  head 'https://github.com/pgmodeler/pgmodeler.git', :revision => 'e8ec35929f2f26688201d0d5d27d4369ec151ec7'

  depends_on 'qt5'
  depends_on 'postgresql'

  patch DATA

  def install
    system "/usr/local/opt/qt5/bin/qmake PREFIX+=#{prefix}/pgmodeler.app/Contents pgmodeler.pro"
    system "make"
    system "make install"
  end
end

__END__
diff --git a/pgmodeler.pri b/pgmodeler.pri
index 27fa651..8d879c3 100644
--- a/pgmodeler.pri
+++ b/pgmodeler.pri
@@ -146,9 +146,9 @@ unix:!macx {
 }

 macx {
-  PGSQL_LIB = /Library/PostgreSQL/9.6/lib/libpq.dylib
-  PGSQL_INC = /Library/PostgreSQL/9.6/include
-  XML_INC = /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/libxml2
+  PGSQL_LIB = /usr/local/opt/postgresql/lib/libpq.dylib
+  PGSQL_INC =  /usr/local/opt/postgresql/include
+  XML_INC = /usr/include/libxml2
   XML_LIB = /usr/lib/libxml2.dylib
   INCLUDEPATH += $$PGSQL_INC $$XML_INC
 }
